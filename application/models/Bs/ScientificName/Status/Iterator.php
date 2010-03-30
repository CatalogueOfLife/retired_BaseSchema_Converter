<?php
class Bs_ScientificName_Status_Iterator extends Bs_Iterator
    implements Bs_Loadable
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
                array_push(
                    $items,
                    new Bs_ScientificName_Status($row['id'], $row['name'])
                );
            }
            self::$_itemsArray = $items;
        }
        $this->_init(self::$_itemsArray);
    }
    
    private function _getSelect()
    {
        $select = new Zend_Db_Select($this->_dba);
        $select->from(
            'scientific_name_status',
            array('id', 'name' => 'name_status')
        );
        return $select;
    }
}