<?php
class Bs_Uri_Scheme
{
    protected $_id;
    protected $_scheme;
    protected $_name;
    
    public function __construct($id, $scheme, $name)
    {
        $this->_id = (int)$id;
        $this->_scheme = $scheme;
        $this->_name = $name;
    }
    
    public function getScheme()
    {
        return $this->_scheme;
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
        return $this->getId() . ':' . $this->getScheme() . ':' .
            $this->getName();
    }
}