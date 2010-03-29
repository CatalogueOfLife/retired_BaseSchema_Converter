<?php
class Bs_Reference implements Bs_Storable
{
    protected $_id;
    protected $_title;
    protected $_details;
    protected $_authors;
    protected $_year;
    
    public function store(Zend_Db_Adapter $dba)
    {
    }
}