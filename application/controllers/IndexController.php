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
        $dba = Zend_Registry::get('dba');
        $langIt = new Bs_Language_Iterator($dba);
        $counIt = new Bs_Country_Iterator($dba);
        var_dump ($langIt->get('isoCode', 'aae'));
        var_dump ($langIt->get('name', 'Netherlands'));
        
        $cn = new Bs_CommonName(
            'Truita',
            $langIt->get('name', 'Catalan'),
            $counIt->get('name', 'Spain')
        );
        $cn->store($dba);
    }
}