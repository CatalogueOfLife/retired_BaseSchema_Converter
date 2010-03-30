<?php
class Bs_ScientificName_Status
{
    protected $_id;
    protected $_name;
    
    public function __construct($id, $name)
    {
        $this->_id = (int)$id;
        $this->_name = $name;
    }
    
    public function getName()
    {
        return $this->_name;
    }
    
    public function getId()
    {
        return $this->_id;
    }
    
    public function __toString()
    {
        return $this->getId() . ':' . $this->getName();
    }
}