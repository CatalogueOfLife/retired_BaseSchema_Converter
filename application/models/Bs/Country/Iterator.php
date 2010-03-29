<?php
class Bs_Country_Iterator extends Bs_Iterator implements Bs_Loadable
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
        $countries = array();
        while ($row = $stmt->fetch()) {
            array_push($countries, new Bs_Country($row['iso'], $row['name']));
        }
        $this->_init($countries);
    }
    
    private function _getSelect()
    {
        $select = new Zend_Db_Select($this->_dba);
        $select->from('country', array('iso', 'name'))->order('iso');
        return $select;
    }
}