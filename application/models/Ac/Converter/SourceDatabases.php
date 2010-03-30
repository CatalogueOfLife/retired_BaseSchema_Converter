<?php
class Ac_Converter_SourceDatabases extends Ac_Converter
{
    public function getAll()
    {
        $res = $this->_selectAll();
        $items = array();
        
        foreach($res as $row)
        {
            $sdb = new Bs_SourceDatabase(
                $row['id'], $row['name'], $row['abstract']
            );
            $sdb->setAbbreviatedName($row['abbreviated_name']);
            $sdb->setOrganisation($row['organisation']);
            $sdb->setContactPerson($row['contact_person']);
            $sdb->setGroupNameInEnglish($row['group_name_in_english']);
            $sdb->setAuthorsAndEditors($row['authors_and_editors']);
            $sdb->setVersion(
                $row['version'],
                new Zend_Date($row['release_date'], 'yyyy-mm-dd')
            );
            $uris = $this->_splitUri($row['web_site']);
            foreach ($uris as $uri) {
                $sdb->addUri($uri);
            }
            array_push($items, $sdb);
        }
        return $items;
    }
    
    private function _splitUri($uriStr)
    {
        // split by ; and #
        $uris = preg_split('[;|#]', $uriStr);
        $pattern = '/([http|https]:\/\/)(.*)/i';
        $replace = '$1$2';
        $uriSchemeIt = new Bs_Uri_Scheme_Iterator($this->_dbBs);
        $uriObjs = array();
        foreach ($uris as $k => &$uri) {
            // clean url
            $uri = preg_replace($pattern, $replace, trim(strtolower($uri)));
            // remove html tags
            $uri = preg_replace('/\\<.*?\\>/', '', $uri);
            // delete if it doesn't start with http
            if(preg_match('/^https.*/i', $uri)) {
                $scheme = $uriSchemeIt->get('scheme', 'https');
            } else if(preg_match('/^http.*/i', $uri)) {
                $scheme = $uriSchemeIt->get('scheme', 'http');
            } else {
                unset($uris[$k]);
                continue;
            }
            array_push($uriObjs, new Bs_Uri($scheme, $uri));
        }
        // remove duplicates and return
        return array_unique($uriObjs);
    }
    
    private function _selectAll()
    {
        $select = new Zend_Db_Select($this->_dbAc);
        $select->from(
            'databases',
            array(
                'id' => 'record_id',
                'abbreviated_name' => 'database_name',
                'name' => 'database_full_name',
                'web_site',
                'organisation' => 'organization',
                'contact_person',
                'group_name_in_english' => 'taxa',
                'abstract',
                'version',
                'release_date',
                'authors_and_editors' => 'authors_editors'
            )
        );
        return $select->query()->fetchAll();
    }
}