<?php

require_once __DIR__ . '/../../db/connect.php';

/**
 * This function is nsdkjf fsf 
 * @param string $user - the username
 */
function signup(
    string $username,
    string $password,
    string $role
):int
{
    $conn = getConnection();
    
    $q = "INSERT INTO users
        (username, password, role)
        VALUES (:username, :password, :role)
    ";

    $stment = $conn->prepare($q);
    $stment->execute([
        "username" => $username,
        "password" => $password,
        "role"  => $role
    ]);

    return $conn->lastInsertId();
}