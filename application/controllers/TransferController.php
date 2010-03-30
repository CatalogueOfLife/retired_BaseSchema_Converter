<?php
/**
 * Base Schema Converter
 *
 * Class IndexController
 * Main controller class
 */
class TransferController extends Zend_Controller_Action
{
    protected $_dbaAc;
    protected $_dbaBs;
    
    public function init()
    {
        $this->_dbaAc = Zend_Registry::get('dbaAc');
        $this->_dbaBs = Zend_Registry::get('dbaBs');
    }
    
    public function databasesAction()
    {
        $acCsdb = new Ac_Converter_SourceDatabases(
            $this->_dbaAc, $this->_dbaBs
        );
        $sdbs = $acCsdb->getAll();
        foreach($sdbs as $sdb) {
            $sdb->store($this->_dbaBs);
        }
        $this->view->res = 'Source databases transferred';
        $this->renderScript('index/index.phtml');
    }
}