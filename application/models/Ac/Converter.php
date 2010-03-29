<?php
abstract class Ac_Converter
{
    protected $_dba;
    
    public function __construct(Zend_Db_Adapter_Abstract $dba)
    {
        $this->_dba = $dba;
    }
}