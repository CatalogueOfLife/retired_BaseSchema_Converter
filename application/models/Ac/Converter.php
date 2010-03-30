<?php
abstract class Ac_Converter
{
    protected $_dbAc;
    protected $_dbBs;
    
    public function __construct(Zend_Db_Adapter_Abstract $dbAc,
        Zend_Db_Adapter_Abstract $dbBs)
    {
        $this->_dbAc = $dbAc;
        $this->_dbBs = $dbBs;
    }
}