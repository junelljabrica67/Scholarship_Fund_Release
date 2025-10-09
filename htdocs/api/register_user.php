<?php

require_once __DIR__ . "/../../src/util/user/signup.php";

$username = $_POST["username"];
$password = $_POST["password"];
$role = $_POST["role"];

try {
    $last_id = signup($username, $password, $role);
    if ($last_id >= 0){
        echo "Success";
        exit(200);
    }

    echo "Failed";
    exit(400);

} catch (Exception $error) {
    echo $error->getMessage();
    exit(500);
}