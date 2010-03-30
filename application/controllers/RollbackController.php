<?php
/**
 * Base Schema Converter
 *
 * Class IndexController
 * Main controller class
 */
class RollbackController extends Zend_Controller_Action
{
    protected $_dbaBs;
    
    public function init()
    {
        $this->_dbaBs = Zend_Registry::get('dbaBs');
    }
    
    public function databasesAction()
    {
        $this->_dbaBs->beginTransaction();
        try {
            $this->_dbaBs->query('DELETE FROM uri_to_source_database WHERE 1');
            $this->_dbaBs->query('DELETE FROM uri WHERE 1');
            $this->_dbaBs->query('DELETE FROM source_database WHERE 1');
        } catch(Exception $e) {
            $this->_dbaBs->rollBack();
            throw $e;
        }
        $this->_dbaBs->commit();
        $this->view->res = 'Source databases deleted';
        $this->renderScript('index/index.phtml');
    }
}