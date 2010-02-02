<?php


/**
 * @author dseijts
 * @version 0.1
 * @created 18-jan-2010 5:21:00 PM
 */
class database
{

    private $connect;
    private $db_selected;
    private $debugging = false;

    /**
     *
     * @param database
     * @param password
     * @param user
     * @param url
     */
    public function __construct($database, $username, $password, $url="localhost")
    {
        if(!$this->setConnectDatabase($username, $password, $url)) {
            throw new Exception('Could not connect to the database server');
        }
        if(!$this->setSelectDatabase($database)) {
            throw new Exception('Could not select the database');
        }
    }
    
    /**
     * Turns debug on/off
     *
     * @param bool $debug
     */
    public function setDebug($debug)
    {
        $this->debugging = (bool)$debug;
    }

    public function setSingleQuery($query)
    {
        $this->debugQuery($query);
        return mysql_query($query,$this->connect);
    }
    
    public function getSingleSelectQuery($query)
    {
        $this->debugQuery($query);

        $result = mysql_query($query,$this->connect);
        $row = mysql_fetch_array($result,MYSQL_ASSOC);
        
        $this->debugResults($row);

        return $row;
    }
    
    public function preparedSingleQuery($query, array $params)
    {
        return $this->setSingleQuery(
            $this->_prepareStatement($query, $params));
    }
    
    public function preparedSingleSelect($query, array $params)
    {
        return $this->getSingleSelectQuery(
            $this->_prepareStatement($query, $params));
    }
    
    public function preparedMultipleSelect($query, array $params)
    {
        return $this->getMultipleSelectQuery(
            $this->_prepareStatement($query, $params));
    }

    public function getMultipleSelectQuery($query)
    {
        $this->debugQuery($query);

        $return = "";
        $result = mysql_query($query,$this->connect);
        while($row = mysql_fetch_array($result,MYSQL_ASSOC))
            $return[] = $row;
        
        $this->debugResults($return);

        return $return;
    }
    
    public function getLastInsertId()
    {
        return mysql_insert_id($this->connect);
    }
    
    public function getLastError()
    {
        return @mysql_error($this->connect);
    }

    private function debugQuery($query)
    {
        if($this->checkDebuggingMode() == true)
        {
            echo "<hr>".$query."<hr>";
        }
    }
    
    private function debugResults($query)
    {
        if($this->checkDebuggingMode() == true)
        {
            echo"<pre>";
            print_r($query);
            echo"</pre>";
        }
    }
    
    private function checkDebuggingMode()
    {
        if($this->debugging == true)
            return true;
        else
            return false;
    }

    /**
     *
     * @param password
     * @param user
     * @param url
     */
    private function setConnectDatabase($username, $password, $host)
    {
        $this->connect = @mysql_connect($host, $username, $password, true);
        if(!$this->connect) {
            return false;
        }
        mysql_query("SET NAMES 'UTF8'");
        return true;
    }

    /**
     *
     * @param database
     */
    private function setSelectDatabase($database)
    {
        $this->db_selected = @mysql_select_db($database, $this->connect);
        if(!$this->db_selected) {
            return false;
        }
        return true;
    }
    
    private function _prepareStatement($statement, array $params)
    {
        foreach($params as $k => $v) {
            $statement = str_replace(":$k", $v, $statement);
        }
        return $statement;
    }
    
    public function __destruct()
    {
        mysql_close($this->connect);
    }
}
?>