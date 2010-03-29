<?php
class Bs_Uri_Scheme_Iterator extends Bs_Iterator
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
            array_push(
                $items,
                new Bs_Uri_Scheme($row['id'], $row['scheme'], $row['name'])
            );
        }
        $this->_init($items);
    }
    
    private function _getSelect()
    {
        $select = new Zend_Db_Select($this->_dba);
        $select->from('uri_scheme', array('id', 'scheme', 'name'));
        return $select;
    }
}