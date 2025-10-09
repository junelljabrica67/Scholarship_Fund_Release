<?php

function getConnection(){
    $username = "postgres";
    $password = "1261";
    $host = "localhost";
    $dbname = "Scholar_Fund_Release";
    $port = 5432;
    
    $dsn = "pgsql:host=$host;port=$port;dbname=$dbname";
    $pdo = new PDO($dsn, $username, $password);
    
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

    return $pdo;
}