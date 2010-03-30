<?php
class Bs_Taxon_Rank_Iterator extends Bs_Iterator implements BS_Loadable
{
    protected $_dba;
    protected static $_itemsArray;
    
    public function __construct(Zend_Db_Adapter_Abstract $dba, $autoload = true)
    {
        $this->_dba = $dba;
        if($autoload) {
            $this->load();
        }
    }
    
    public function load()
    {
        if(is_null(self::$_itemsArray)) {
            $stmt = $this->_dba->query($this->_getSelect());
            $items = array();
            while ($row = $stmt->fetch()) {
                array_push($items, new Bs_Taxon_Rank($row['id'], $row['rank']));
            }
            self::$_itemsArray = $items;
        }
        $this->_init(self::$_itemsArray);
    }
    
    private function _getSelect()
    {
        $select = new Zend_Db_Select($this->_dba);
        $select->from('taxonomic_rank', array('id', 'rank'));
        return $select;
    }
}