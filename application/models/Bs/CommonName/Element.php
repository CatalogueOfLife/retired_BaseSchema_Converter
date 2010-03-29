<?php
class Bs_CommonName_Element implements Bs_Storable
{
    protected $_id;
    protected $_name;
    protected $_transliteration;
    
    public function __construct($name, $transliteration = null)
    {
        $this->_name = $name;
        $this->_transliteration = $transliteration;
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
    
    public function setTransliteration($transliteration)
    {
        $this->_transliteration = (string)$transliteration;
    }
    
    public function getTransliteration()
    {
        return $this->_transliteration;
    }
    
    public function store(Zend_Db_Adapter_Abstract $dba)
    {
        //check if it already exists before inserting
        $id = $this->search($dba, $this->_name, $this->_transliteration);
        if($id) {
            $this->_id = $id;
        }
        else {
            $stmt = $dba->prepare(
                'INSERT INTO common_name_element (id, name, transliteration) ' .
                'VALUES(:id, :name, :transliteration)'
            );
            $stmt->bindParam('id', $this->_id, is_null($this->_id) ?
                Zend_Db::PARAM_NULL : Zend_Db::PARAM_INT
            );
            $stmt->bindParam('name', $this->_name, Zend_Db::PARAM_STR);
            $stmt->bindParam('transliteration', $this->_transliteration,
                is_null($this->_transliteration) ?
                    Zend_Db::PARAM_NULL : Zend_Db::PARAM_STR
            );
            $stmt->execute();
            // save insert id
            $this->_id = $dba->lastInsertId();
        }
        return $this->_id;
    }
    
    public function search(Zend_Db_Adapter_Abstract $dba, $name,
        $transliteration)
    {
        $select = new Zend_Db_Select($dba);
        $select
            ->from('common_name_element', array('id'))
            ->where('name = ?', (string)$name);
        if (is_null($this->_transliteration)) {
            $select->where('transliteration IS NULL');
        } else {
            $select->where('transliteration = ?', (string)$transliteration);
        }
        $id = $select->query()->fetchColumn(0);
        return $id;
    }
}