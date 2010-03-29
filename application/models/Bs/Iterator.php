<?php
abstract class Bs_Iterator implements Iterator, Countable
{
    protected $_arrayObj;
    
    protected function _init(array $array)
    {
        $this->_arrayObj = new ArrayIterator($array);
    }
    
    public function get($needleKey, $needleVal)
    {
        $this->_check();
        $getMethod = 'get' . ucfirst($needleKey);
        $this->rewind();
        while ($this->valid())
        {
            if (is_object($this->current()) &&
                method_exists($this->current(), $getMethod)) {
                if($this->current()->{$getMethod}() === $needleVal) {
                    return $this->current();
                }
            }
            $this->next();
        }
        // no match found
        return false;
    }
    
    public function count()
    {
        $this->_check();
        return $this->_arrayObj->count();
    }
    
    public function current()
    {
        $this->_check();
        return $this->_arrayObj->current();
    }
    
    public function next()
    {
        $this->_check();
        return $this->_arrayObj->next();
    }
    
    public function valid()
    {
        $this->_check();
        return $this->_arrayObj->valid();
    }
    
    public function key()
    {
        $this->_check();
        return $this->_arrayObj->key();
    }
    
    public function rewind()
    {
        $this->_check();
        return $this->_arrayObj->rewind();
    }
    
    protected function _check()
    {
        if(!$this->_arrayObj instanceof ArrayIterator) {
            throw new IteratorException('The iterator is not initialized');
        }
        return true;
    }
}
class IteratorException extends Exception
{
}