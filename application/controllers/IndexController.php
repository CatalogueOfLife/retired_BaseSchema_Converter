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
        $langIt   = new Bs_Language_Iterator($dba);
        $counIt   = new Bs_Country_Iterator($dba);
        $rankIt    = new Bs_Taxon_Rank_Iterator($dba);
        $uriSchIt = new Bs_Uri_Scheme_Iterator($dba);
        
        var_dump ($langIt->get('isoCode', 'spa'));
        var_dump ($counIt->get('name', 'Netherlands'));
        var_dump ($rankIt->get('name', 'kingdom'));
        var_dump ($uriSchIt->get('scheme', 'lsid'));
        
        /*$cn = new Bs_CommonName(
            'Truita', null,
            $langIt->get('name', 'Catalan'),
            $counIt->get('name', 'Spain')
        );
        $cn->store($dba);*/
    }
}