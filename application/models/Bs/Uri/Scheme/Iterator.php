<?php
class Bs_Uri_Scheme_Iterator extends Bs_Iterator
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
                    new Bs_Uri_Scheme($row['id'], $row['scheme'], $row['name'])
                );
            }
            self::$_itemsArray = $items;
        }
        $this->_init(self::$_itemsArray);
    }
    
    private function _getSelect()
    {
        $select = new Zend_Db_Select($this->_dba);
        $select->from('uri_scheme', array('id', 'scheme', 'name'));
        return $select;
    }
}