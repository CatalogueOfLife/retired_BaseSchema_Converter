<?php
interface Bs_Validatable
{
    public function isValid();
    public function addValidator(Zend_Validate $validator);
}