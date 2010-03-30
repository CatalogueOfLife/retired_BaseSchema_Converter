<?php
class Bs_Uri implements Bs_Storable
{
    protected $_scheme;
    protected $_resource;
    protected $_description;
    
    public function __construct(Bs_Uri_Scheme $scheme, $resource,
        $description = null)
    {
        $this->_scheme = $scheme;
        $this->_resource = $resource;
        $this->_description = $description;
    }
    
    public function getScheme()
    {
        return $this->_scheme;
    }
    
    public function getResource()
    {
        return $this->_resource;
    }
    
    public function getDescription()
    {
        return $this->_description;
    }
   
    public function store(Zend_Db_Adapter_Abstract $dba)
    {
        //check if it already exists before inserting
        $id = $this->search(
            $dba, $this->_resource, $this->_scheme, $this->_description
        );
        if($id) {
            $this->_id = $id;
        }
        else {
            $stmt = $dba->prepare(
                'INSERT INTO uri ' .
                '(id, resource_identifier, description, uri_scheme_id) ' .
                'VALUES(:id, :resource_identifier, :description, :uri_scheme_id)'
            );
            $stmt->bindParam('id', $this->_id, is_null($this->_id) ?
                Zend_Db::PARAM_NULL : Zend_Db::PARAM_INT
            );
            $stmt->bindParam('resource_identifier', $this->_resource,
                Zend_Db::PARAM_STR);
            $stmt->bindParam('description', $this->_description,
                is_null($this->_description) ?
                    Zend_Db::PARAM_NULL : Zend_Db::PARAM_STR);
            $schemeId = $this->_scheme->getId();
            $stmt->bindParam('uri_scheme_id', $schemeId, Zend_Db::PARAM_INT);
            $stmt->execute();
            // save insert id
            $this->_id = $dba->lastInsertId();
        }
        return $this->_id;
    }
    
    public function search(Zend_Db_Adapter_Abstract $dba, $resource,
        Bs_Uri_Scheme $scheme, $description)
    {
        $select = new Zend_Db_Select($dba);
        $select
            ->from('uri', array('id'))
            ->where('resource_identifier = ?', $resource)
            ->where('uri_scheme_id = ?', $scheme->getId());
        if(is_null($description)) {
            $select->where('description IS NULL');
        }
        else {
            $select->where('description = ?', $description);
        }
        $id = $select->query()->fetchColumn(0);
        return $id;
    }
    
    public function __toString()
    {
        return $this->getScheme()->getScheme() . ':' . $this->_resource;
    }
}