<?php
class Bs_SourceDatabase implements Bs_Storable
{
    protected $_id;
    protected $_name;
    protected $_abbreviatedName;
    protected $_abstract;
    protected $_organisation;
    protected $_contactPerson;
    protected $_groupNameInEnglish;
    protected $_authorsAndEditors;
    protected $_version;
    protected $_releaseDate;
    protected $_uris = array();
    
    public function __construct($id, $name, $abstract = null)
    {
        $this->_id = (int)$id;
        $this->_name = $name;
        $this->_abstract = $abstract;
    }
    
    public function setAbbreviatedName($name)
    {
        $this->_abbreviatedName = $name;
    }
    
    public function setOrganisation($org)
    {
        $this->_organisation = $org;
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
    
    public function setVersion($version, Zend_Date $releaseDate = null)
    {
        $this->_version = $version;
        $this->_releaseDate = $releaseDate;
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
            $stmt = $dba->prepare(
                'INSERT INTO source_database ' .
                '(id, name, abbreviated_name, group_name_in_english, ' .
                'authors_and_editors, organisation, contact_person, version, ' .
                'release_date, abstract) ' .
                'VALUES(:id, :name, :abbreviated_name, ' .
                ':group_name_in_english, :authors_and_editors, ' .
                ':organisation, :contact_person, :version, :release_date, ' .
                ':abstract)'
            );
            $stmt->bindParam('id', $this->_id, is_null($this->_id) ?
                Zend_Db::PARAM_NULL : Zend_Db::PARAM_INT
            );
            $stmt->bindParam('name', $this->_name, Zend_Db::PARAM_STR);
            $stmt->bindParam('abbreviated_name', $this->_abbreviatedName,
                is_null($this->_abbreviatedName) ?
                    Zend_Db::PARAM_NULL : Zend_Db::PARAM_STR
            );
            $stmt->bindParam('group_name_in_english', $this->_groupNameInEnglish,
                is_null($this->_groupNameInEnglish) ?
                    Zend_Db::PARAM_NULL : Zend_Db::PARAM_STR
            );
            $stmt->bindParam('authors_and_editors', $this->_authorsAndEditors,
                is_null($this->_authorsAndEditors) ?
                    Zend_Db::PARAM_NULL : Zend_Db::PARAM_STR
            );
            $stmt->bindParam('organisation', $this->_organisation,
                is_null($this->_organisation) ?
                    Zend_Db::PARAM_NULL : Zend_Db::PARAM_STR
            );
            $stmt->bindParam('contact_person', $this->_contactPerson,
                is_null($this->_contactPerson) ?
                    Zend_Db::PARAM_NULL : Zend_Db::PARAM_STR
            );
            $stmt->bindParam('version', $this->_version,
                is_null($this->_version) ?
                    Zend_Db::PARAM_NULL : Zend_Db::PARAM_STR
            );
            $releaseDateStr = $this->_releaseDate->toString('yyyy-mm-dd');
            $stmt->bindParam('release_date', $releaseDateStr,
                is_null($this->_releaseDate) ?
                    Zend_Db::PARAM_NULL : Zend_Db::PARAM_STR
            );
            $stmt->bindParam('abstract', $this->_abstract,
                is_null($this->_abstract) ?
                    Zend_Db::PARAM_NULL : Zend_Db::PARAM_STR
            );
            $stmt->execute();
            // save insert id
            if(is_null($this->_id)) {
                $this->_id = $dba->lastInsertId();
            }
            $stmt = $dba->prepare(
                'INSERT INTO uri_to_source_database ' .
                '(uri_id, source_database_id) ' .
                'VALUES (:uri_id, :source_database_id)'
            );
            $stmt->bindParam(
                'source_database_id', $this->_id, Zend_Db::PARAM_INT
            );
            // store uris
            foreach($this->_uris as $uri) {
                $uriId = $uri->store($dba);
                // store uri to source database relationship
                $stmt->bindParam('uri_id', $uriId, Zend_Db::PARAM_INT);
                $stmt->execute();
            }
        } catch (Exception $e) {
            $dba->rollBack();
            throw $e;
        }
        $dba->commit();
    }
}