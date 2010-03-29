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
        $dba = Zend_Registry::get('dbaBs');
        $langIt   = new Bs_Language_Iterator($dba);
        $counIt   = new Bs_Country_Iterator($dba);
        $rankIt    = new Bs_Taxon_Rank_Iterator($dba);
        $uriSchIt = new Bs_Uri_Scheme_Iterator($dba);
        
        echo $langIt->get('isoCode', 'spa') . '<br/>';
        echo $counIt->get('name', 'Netherlands') . '<br/>';
        echo $rankIt->get('name', 'kingdom') . '<br/>';
        echo $uriSchIt->get('scheme', 'lsid') . '<br/>';
        
        /*$cn = new Bs_CommonName(
            'Truita', null,
            $langIt->get('name', 'Catalan'),
            $counIt->get('name', 'Spain')
        );
        $cn->store($dba);*/
    }
}