<?php
class Bs_SourceDatabase implements Bs_Storable
{
    protected $_id;
    protected $_name;
    protected $_abbreviatedName;
    protected $_organization;
    protected $_contactPerson;
    protected $_groupNameInEnglish;
    protected $_authorsAndEditors;
    
    public function store(Zend_Db_Adapter_Abstract $dba)
    {
    }
}