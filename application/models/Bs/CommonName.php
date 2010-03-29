<?php
class Bs_CommonName implements Bs_Storable
{
    protected $_id;
    protected $_taxonId;
    protected $_nameElement;
    protected $_language;
    protected $_country;
    protected $_references;
    
    public function __construct($name, $transliteration,
        Bs_Language $language = null, Bs_Country $country = null)
    {
        $this->_nameElement =
            new Bs_CommonName_Element($name, $transliteration);
        $this->_language = $language;
        $this->_country = $country;
    }
    
    public function store(Zend_Db_Adapter_Abstract $dba)
    {
        $this->_nameElement->store($dba);
        $nameElementId = $this->_nameElement->getId();
        
        $stmt = $dba->prepare(
            'INSERT INTO common_name ' .
            '(id, taxon_id, common_name_element_id, language_iso, country_iso) ' .
            'VALUES(:id, :taxon_id, :common_name_element_id, :language_iso, ' .
            ':country_iso)'
        );
        $stmt->bindParam('id', $this->_id, is_null($this->_id) ?
            Zend_Db::PARAM_NULL : Zend_Db::PARAM_INT
        );
        $stmt->bindParam('taxon_id', $this->_taxonId, Zend_Db::PARAM_INT);
        $stmt->bindParam('common_name_element_id', $nameElementId,
            Zend_Db::PARAM_INT
        );
        $stmt->bindParam(
            'language_iso', $this->_language->getIsoCode(), Zend_Db::PARAM_STR
        );
        $stmt->bindParam(
            'country_iso', $this->_country->getIsoCode(), Zend_Db::PARAM_STR
        );
        $stmt->execute();
        // save insert id
        if(is_null($this->_id)) {
            $this->_id = $dba->lastInsertId();
        }
    }
    
    public function setId($id)
    {
        $this->_id = (int)$id;
    }
    
    public function setTaxonId($taxonId)
    {
        $this->_taxonId = (int)$taxonId;
    }
    
    public function setName($name)
    {
        $this->_nameElement->setName($name);
    }
    
    public function setTransliteration($transliteration)
    {
        $this->_nameElement->setTransliteration($transliteration);
    }
    
    public function setLanguage(Bs_Language $language)
    {
        $this->_language = $language;
    }
    
    public function setCountry(Bs_Country $country)
    {
        $this->_country = $country;
    }
    
    public function getId()
    {
        return $this->_id;
    }
    
    public function getName()
    {
        return $this->_name;
    }
    
    public function getTransliteration()
    {
        return $this->_transliteration;
    }
    
    public function getLanguage()
    {
        return $this->_language;
    }
    
    public function getCountry()
    {
        return $this->_country;
    }
}