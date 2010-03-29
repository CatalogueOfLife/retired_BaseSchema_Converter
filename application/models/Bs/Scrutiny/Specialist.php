<?php
class Bs_Scrutiny_Specialist
{
    protected $_id;
    protected $_name;
    
    public function __construct($id, $name)
    {
        $this->_id = $id;
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