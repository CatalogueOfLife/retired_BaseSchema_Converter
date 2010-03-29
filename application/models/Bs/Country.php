<?php
class Bs_Country
{
    protected $_isoCode;
    protected $_name;
    
    public function __construct($isoCode, $name)
    {
        $this->_isoCode = $isoCode;
        $this->_name = $name;
    }
    
    public function getName()
    {
        return $this->_name;
    }
    
    public function getIsoCode()
    {
        return $this->_isoCode;
    }
    
    public function __toString()
    {
        return $this->getIsoCode() . ':' . $this->getName();
    }
}