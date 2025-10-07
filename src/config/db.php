<?php

function create_connection(){
    $host = 'localhost';
    $user = 'postgres';
    $password = '123456';
    $port = '5432';
    $db_name = 'scholar';


    $db = new PDO('pgsql:host=' . $host . ';port=' . $port . ';dbname=' . $db_name, $user, $password);

    $db->setAttribute(
        PDO::ATTR_ERRMODE,
        PDO::ERRMODE_EXCEPTION,
        PDO::FETCH_ASSOC
    );

    return $db;
}