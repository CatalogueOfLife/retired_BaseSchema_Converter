<?php
interface Bs_Loadable
{
    public function __construct(Zend_Db_Adapter_Abstract $dba, $autoload = true);
    public function load();
}