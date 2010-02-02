<?php


/**
 * @author dseijts
 * @version 0.1
 * @created 26-jan-2010 3:00:00 PM
 */
class table
{
    
    private $table;
    private $colums;
    private $content;
    /**
     *
     * @param database
     * @param password
     * @param user
     * @param url
     */
    public function __construct($database, $table)
    {
        $this->table = mysql_escape_string($table);
        $colums = $database->getMultipleSelectQuery('
            DESCRIBE
                `' . $this->table .'`
        ;');
        foreach($colums as $colum)
        {
            $this->colums[$colum['Field']] = $colum;
        }
    }
    
    public function getColums()
    {
        $temp = '';
        foreach($this->colums as $colum)
        {
            $temp[] = $colum['Field'];
        }
        return $temp;
    }
    
    public function addContent($content)
    {
        $temp = '';
        foreach($content as $colum => $value)
        {
            $new_value = $this->checkInput($colum, $value);
            $temp[$colum] = mysql_escape_string($new_value);
        }
        $this->content[] = $temp;
    }
    
    public function countContent()
    {
        return count($this->content);
    }
    
    public function getInsertQuery()
    {
        $query = 'INSERT INTO
            ' . $this->table . '
        (
            ';
        $first = true;
        foreach($this->colums as $colum)
        {
            if($first == true)
            {
                $first = false;
            }
            else
            {
                $query .= ',
                ';
            }
            $query .= '`' . $colum['Field'] . '`';
        }
        $query .= ')
        VALUES
        ';
        $first = true;
        foreach($this->content as $contentRow)
        {
            if($first == true)
            {
                $first = false;
            }
            else
            {
                $query .= ',
                ';
            }
            $query .= '(
                ';
            $first_content = true;
            foreach($contentRow as $key => $content)
            {
                if($first_content == true)
                {
                    $first_content = false;
                }
                else
                {
                    $query .= ',
                    ';
                }
                $query .= (is_numeric($content) ? $content : ($content == '' && $this->getType($key) == 'int' ? 'NULL' : '"' . $content . '"'));
            }
            $query .= '
            )';
        }
        return $query;
    }
    
    private function checkInput($colum, $value)
    {
        $columDetails = $this->checkColumExist($colum);
        if($this->checkColumExist($colum) &&
            $this->checkType($columDetails, $value) &&
            $this->checkChars($columDetails, $value) &&
            $this->checkNullable($columDetails, $value)
        )
        {
            return $value;
        }
        else
        {
            return false;
        }
    } 
    
    private function checkColumExist($colum)
    {
        foreach($this->colums as $columDetails)
        {
            if($columDetails['Field'] == $colum)
            {
                return $columDetails;
            }
        }
        echo 'colum:' . $colum . ' doens\'t exsist.<br />';
        return false;
    }
    
    private function checkType($colum, $value)
    {
        $temp = explode('(',$colum['Type']);
        if($temp[0] == 'int')
        {
            if(is_numeric($value) || is_null($value))
            {
                return true;
            }
            else
            {
                echo 'type is int, but no int given for this value:' . $value . ' on this colum:' . $colum['Type'] . '.<br />';
                return false;
            }
        }
        if($temp[0] == 'varchar')
        {
            return true;
        }
        else
        {
            echo 'unknown type: ' . $temp[0] . ' for this value:' . $value . ' on this colum:' . $colum['Field'] . '.<br />';
            return false;
        }
    }
    
    private function getType($columField)
    {
        $temp = explode('(',$this->colums[$columField]['Type']);
        return $temp[0];
    }
    
    private function checkChars($colum, $value)
    {
        $temp = explode('(',$colum['Type']);
        $temp = explode(')',$temp[1]);
        if(strlen($value) <= $temp[0])
        {
            return true;
        }
        else
        {
            echo 'too many characters: ' . $temp[0] . ' max, this value:' . strlen($value) . ' on this colum:' . $colum['Field'] . '.<br />';
            return false;
        }
    }
    
    private function checkNullable($colum, $value)
    {
        if(($colum['Null'] == 'YES') ||
            ($colum['Null'] == 'NO' && ($value != '' || !is_null($value))) ||
            ($colum['Null'] == 'NO' && ($value == '' || is_null($value)) &&
            $colum['Extra'] == 'auto_increment')
        )
        {
            return true;
        }
        else
        {
            echo 'value may not be nullable: ' . $value . ' on this colum:' . $colum['Field'] . ' Nullability: ' . $colum['Null'] . ' Extra ' . $colum['Extra'] . '.<br />';
            return false;
        }
    }
    
    private function makeNullable($colum, $value)
    {
        if($value == '')
        {
            if($colum['Null'] == 'YES' || $colum['Extra'] == 'auto_increment')
            {
                echo 'ik ben null.., :( nullable: ' . $colum['Null'] . ' extra: ' . $colum['Extra'] . ' field: ' . $colum['Field'] . '<br />';
                $value = NULL;
            }
        }
        return $value;
    }
}
?>