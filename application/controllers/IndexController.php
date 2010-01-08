<?php
/**
 * Base Schema Converter
 *
 * Class IndexController
 * Main controller class
 */
class IndexController extends Zend_Controller_Action
{
    public function indexAction()
    {
        $conn = Doctrine_Manager::connection();
        $res = $conn->execute('SHOW TABLES');
        //var_dump($res->fetchAll(PDO::FETCH_NUM));
    }
}