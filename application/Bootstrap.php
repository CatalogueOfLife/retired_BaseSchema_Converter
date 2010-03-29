<?php
/**
 * Base Schema Converter
 *
 * Class Bootstrap
 * Handles the application initialization
 * All methods in this class that are prefixed by an underscore
 * are automatically loaded in the application init
 *
 */
class Bootstrap extends Zend_Application_Bootstrap_Bootstrap
{
    public function _initAutoload()
    {
        $resourceLoader = new Zend_Loader_Autoloader_Resource(
            array(
                'basePath'  => APPLICATION_PATH,
                'namespace' => 'Bsc'
            )
        );
        $resourceLoader/*->addResourceType('model', 'models/Bs/', 'Bs')*/
                       ->addResourceType('form', 'forms/', 'Form');
        $autoloader = Zend_Loader_Autoloader::getInstance();
        // Bs model
        $autoloader->registerNamespace('Bs_'); // Base Schema model
        $autoloader->registerNamespace('Ac_'); // Annual Checklist model
    }
    
    /**
     * Database initialization based on the application config file
     */
    public function _initDatabase()
    {
        $config = Zend_Registry::get('config');
        // Base Schema Database
        $dbaBs = Zend_Db::factory($config->database->Bs);
        //Zend_Db_Table_Abstract::setDefaultAdapter($dba);
        $dbaBs->setFetchMode(Zend_Db::FETCH_ASSOC);
        $dbaBs->query('SET NAMES utf8');
        Zend_Registry::set('dbaBs', $dbaBs);
        // Annual Checklist Database
        $dbaAc = Zend_Db::factory($config->database->Ac);
        $dbaAc->setFetchMode(Zend_Db::FETCH_ASSOC);
        $dbaAc->query('SET NAMES utf8');
        Zend_Registry::set('dbaAc', $dbaAc);
    }
    
    /**
     * View initialization
     *
     * @return Zend_View $view
     */
    public function _initView ()
    {
        if('commandline' == APPLICATION_ENV) {
            return;
        }
        $config = Zend_Registry::get('config');
        $view = new Zend_View();
        $view->doctype('XHTML1_STRICT');
        $view->encoding = 'UTF-8';
        $view->setEncoding($view->encoding);
        $view->headMeta()->appendHttpEquiv(
            'Content-Type', 'text/html;charset=' . $view->encoding
        );
        $view->headTitle(
            $config->eti->application->name .
            ' v' . $config->eti->application->version
        );
        $view->headTitle()->setSeparator(' :: ');
        // View renderer
        $viewRenderer = new Zend_Controller_Action_Helper_ViewRenderer();
        $viewRenderer->setView($view);
        Zend_Controller_Action_HelperBroker::addHelper($viewRenderer);
        Zend_Controller_Action_HelperBroker::addPath(
            APPLICATION_PATH . '/controllers/helpers', 'Bsc_Helper'
        );
        return $view;
    }
    
    public function _initLayout()
    {
        if('commandline' == APPLICATION_ENV) {
            return;
        }
        Zend_Layout::startMvc();
    }
}