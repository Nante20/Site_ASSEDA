<?php

$host = 'localhost';
$user = 'root';
$password = '';
$dbn = 'asseda_db';
// Création de la connexion
$link = new mysqli($host, $user, $password, $dbn);

// Vérification de la connexion
if ($link->connect_error) {
    die("Connexion échouée : " . $link->connect_error);
}
