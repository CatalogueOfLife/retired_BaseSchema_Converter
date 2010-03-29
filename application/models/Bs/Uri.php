<?php
class Bs_Uri implements Bs_Storable
{
    protected $scheme;
    protected $resourceIdentifier;
    protected $description;
   
    public function store(Zend_Db_Adapter_Abstract $dba)
    {
        //check if it already exists before inserting
        $id = $this->search(
            $dba, $this->_resourceIdentifier, $this->_scheme,
            $this->_description
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
            $stmt->bindParam('resource_identifier', $this->_resourceIdentifier,
                Zend_Db::PARAM_STR);
            $stmt->bindParam('description', $this->_description,
                is_null($this->_description) ?
                    Zend_Db::PARAM_NULL : Zend_Db::PARAM_STR);
            $stmt->bindParam('uri_scheme_id', $this->_scheme->getId(),
                Zend_Db::PARAM_INT);
            $stmt->execute();
            // save insert id
            $this->_id = $dba->lastInsertId();
        }
        return $this->_id;
    }
    
    public function search(Zend_Db_Adapter_Abstract $dba, $resourceIdentifier,
        Bs_Uri_Scheme $scheme, $description)
    {
        $select = new Zend_Db_Select($dba);
        $select
            ->from('uri', array('id'))
            ->where('resource_identifier = ?', $resourceIdentifier)
            ->where('description = ?', $description)
            ->where('uri_scheme_id = ?', $scheme->getId());
        $id = $select->query()->fetchColumn(0);
        return $id;
    }
}