<?php
class Bs_SourceDatabase implements Bs_Storable
{
    protected $_id;
    protected $_name;
    protected $_abbreviatedName;
    protected $_organization;
    protected $_contactPerson;
    protected $_groupNameInEnglish;
    protected $_authorsAndEditors;
    protected $_uris = array();
    
    public function __construct($id, $name)
    {
        $this->_id = (int)$id;
        $this->_name = $name;
    }
    
    public function setAbbreviatedName($name)
    {
        $this->_abbreviatedName = $name;
    }
    
    public function setOrganization($org)
    {
        $this->_organization = $org;
    }
    
    public function setContactPerson($contactPerson)
    {
        $this->_contactPerson = $contactPerson;
    }
    
    public function setGroupNameInEnglish($groupName)
    {
        $this->_groupNameInEnglish = $groupName;
    }
    
    public function setAuthorsAndEditors($authorsAndEditors)
    {
        $this->_authorsAndEditors = $authorsAndEditors;
    }
    
    public function addUri(Bs_Uri $uri)
    {
        array_push($this->_uris, $uri);
    }
    
    public function store(Zend_Db_Adapter_Abstract $dba)
    {
        $dba->beginTransaction();
        try {
            // TODO: store source database
            // store uris
            foreach($this->_uris as $uri) {
                $uriId = $uri->store($dba);
                
            }
            // TODO: store source database - uri relationship
        } catch (Exception $e) {
            $dba->rollBack();
            throw $e;
        }
        $dba->commit();
    }
}