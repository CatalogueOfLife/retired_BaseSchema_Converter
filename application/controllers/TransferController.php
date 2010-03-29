<?php
/**
 * Base Schema Converter
 *
 * Class IndexController
 * Main controller class
 */
class IndexController extends Zend_Controller_Action
{
    public function sourceDatabasesAction()
    {
        $dbaAc = Zend_Registry::get('dbaAc');
        $acCsdb = new Ac_Converter_SourceDatabases($dbaAc);
    }
}