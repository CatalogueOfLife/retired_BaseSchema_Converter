<?php
interface Bs_Storable
{
    public function store(Zend_Db_Adapter_Abstract $dba);
}