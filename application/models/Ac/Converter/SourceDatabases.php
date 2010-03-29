<?php
class Ac_Converter_SourceDatabases extends Ac_Converter
{
    public function getAll()
    {
        $res = $this->_selectAll();
        $items = array();
        foreach($res as $row)
        {
            $sdb = new Bs_SourceDatabase();
            array_push($items, $sdb);
        }
    }
    
    private function _selectAll()
    {
        $select = new Zend_Db_Select($this->_dba);
        $select->from(
            'databases',
            array(
                'record_id',
                'database_name',
                'database_full_name',
                'web_site',
                'organization',
                'contact_person',
                'taxa',
                'abstract',
                'version',
                'release_date',
                'authors_editors'
            )
        );
        return $select->query()->fetchAll();
    }
}