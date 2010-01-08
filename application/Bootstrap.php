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
        $resourceLoader->addResourceType('model', 'models/', 'Model')
                       ->addResourceType('form', 'forms/', 'Form');
        $autoloader = Zend_Loader_Autoloader::getInstance();
    }
    
    public function _initDoctrine()
    {
        // Set the autoloader
        spl_autoload_register(array('Doctrine', 'autoload'));
        $manager = Doctrine_Manager::getInstance();
        $manager->setAttribute(Doctrine::ATTR_AUTO_ACCESSOR_OVERRIDE, true);
        $manager->setAttribute(
            Doctrine::ATTR_MODEL_LOADING,
            Doctrine::MODEL_LOADING_CONSERVATIVE
        );
        $manager->setAttribute(
            Doctrine::ATTR_AUTOLOAD_TABLE_CLASSES,
            true
        );
        $config = Zend_Registry::get('config');
        $dbp = $config->database->params;
        $dsn = $dbp->dbtype . '://' .
               $dbp->username . ':' . $dbp->password .'@' .
               $dbp->host . ':' . $dbp->dbport . '/' .
               $dbp->dbname;
        $conn = Doctrine_Manager::connection($dsn, 'BscConn');
        $conn->setAttribute(Doctrine::ATTR_USE_NATIVE_ENUM, true);
        return $conn;
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