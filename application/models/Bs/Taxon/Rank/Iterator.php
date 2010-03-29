<?php
class Bs_Taxon_Rank_Iterator extends Bs_Iterator implements BS_Loadable
{
    protected $_dba;
    
    public function __construct(Zend_Db_Adapter_Abstract $dba, $autoload = true)
    {
        $this->_dba = $dba;
        if($autoload) {
            $this->load();
        }
    }
    
    public function load()
    {
        $stmt = $this->_dba->query($this->_getSelect());
        $items = array();
        while ($row = $stmt->fetch()) {
            array_push($items, new Bs_Taxon_Rank($row['id'], $row['rank']));
        }
        $this->_init($items);
    }
    
    private function _getSelect()
    {
        $select = new Zend_Db_Select($this->_dba);
        $select->from('taxonomic_rank', array('id', 'rank'));
        return $select;
    }
}