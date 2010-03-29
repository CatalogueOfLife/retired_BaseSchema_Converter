<?php
class Bs_Language_Iterator extends Bs_Iterator implements Bs_Loadable
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
            array_push($items, new Bs_Language($row['iso'], $row['name']));
        }
        $this->_init($items);
    }
    
    private function _getSelect()
    {
        $select = new Zend_Db_Select($this->_dba);
        $select->from('language', array('iso', 'name'))->order('iso');
        return $select;
    }
}