<?php
/**
 * Base Schema Converter
 *
 * bootstrap.php
 * Test bootstrapper
 *
 */
// Define path to application directory
define('APPLICATION_PATH', realpath(dirname(__FILE__) . '/../application'));

// Define application environment
define ('APPLICATION_ENV', 'commandline');

// Ensure library/ is on include_path
$library = realpath(APPLICATION_PATH . '/../library');
set_include_path(
    implode(
        PATH_SEPARATOR,
        array($library, $library . '/orm', get_include_path())
    )
);

// Incude classes required for the initialitzation of the app
require_once 'Doctrine.php';
require_once 'Zend/Application.php';
require_once 'Zend/Config/Xml.php';
require_once 'Zend/Config/Ini.php';

// Load configuration
$config = new Zend_Config_Xml(
    APPLICATION_PATH . '/configs/application.xml',
    APPLICATION_ENV,
    true
);
$config->merge(
    new Zend_Config_Ini(
        APPLICATION_PATH . '/configs/config.ini',
        APPLICATION_ENV
    )
);
// Init application
$application = new Zend_Application(APPLICATION_ENV, $config);
$front = Zend_Controller_Front::getInstance();
$front->throwExceptions(true);
$front->returnResponse(true);
// Store config
Zend_Registry::set('config', $config);
// Run bootstrap
$application->bootstrap()->run();