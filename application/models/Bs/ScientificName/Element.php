<?php
class Bs_ScientificName_Element implements Bs_Storable
{
    protected $_id;
    protected $_name;
    
    public function __construct($name)
    {
        $this->_name = $name;
    }
    
    public function setId($id)
    {
        $this->_id = (int)$id;
    }
    
    public function getId()
    {
        return $this->_id;
    }
    
    public function setName($name)
    {
        $this->_name = (string)$name;
    }
    
    public function getName()
    {
        return $this->_name;
    }
    
    public function store(Zend_Db_Adapter_Abstract $dba)
    {
        //check if it already exists before inserting
        $id = $this->search($dba, $this->_name);
        if($id) {
            $this->_id = $id;
        }
        else {
            $stmt = $dba->prepare(
                'INSERT INTO scientific_name_element (id, name_element) ' .
                'VALUES(:id, :name_element)'
            );
            $stmt->bindParam('id', $this->_id, is_null($this->_id) ?
                Zend_Db::PARAM_NULL : Zend_Db::PARAM_INT
            );
            $stmt->bindParam('name_element', $this->_name, Zend_Db::PARAM_STR);
            $stmt->execute();
            // save insert id
            $this->_id = $dba->lastInsertId();
        }
        return $this->_id;
    }
    
    public function search(Zend_Db_Adapter_Abstract $dba, $name)
    {
        $select = new Zend_Db_Select($dba);
        $select
            ->from('scientific_name_element', array('id'))
            ->where('name = ?', $name);
        $id = $select->query()->fetchColumn(0);
        return $id;
    }
}