<?php
session_start(); // Démarrage de la session
include '../includes/db.php';

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $username = $_POST['username']; // Nom d'utilisateur
    $password = $_POST['password']; // Mot de passe

    // Préparation de la requête pour éviter les injections SQL
    $username = $link->real_escape_string($username); // Utiliser le lien mysqli pour échapper les chaînes

    // Exécution de la requête pour obtenir l'utilisateur
    $sql = "SELECT * FROM admins WHERE username = '$username'";
    $result = $link->query($sql); // Utilisation de la méthode query

    // Vérification si l'utilisateur existe
    if ($result && $result->num_rows > 0) {
        $row = $result->fetch_assoc(); // Récupération des données de l'utilisateur

        // Vérifie le mot de passe
        if (password_verify($password, $row['password'])) {
            // Authentification réussie
            $_SESSION['username'] = $username; // Stocker le nom d'utilisateur dans la session
            header("Location: dashboard.php"); // Rediriger vers le tableau de bord
            exit();
        } else {
            echo "Mot de passe incorrect."; // Message d'erreur pour mot de passe incorrect
        }
    } else {
        echo "Nom d'utilisateur incorrect."; // Message d'erreur pour nom d'utilisateur incorrect
    }
}

$link->close(); // Fermeture de la connexion à la base de données
?>

<!-- Formulaire de connexion -->
<html lang="fr">

<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="../css/login.css"> 
    <title>Login</title>
    
</head>
<body>
<form method="post" action="">
    <div class="form-group">
        <input type="text" name="username" placeholder="Nom d'utilisateur" required>
    </div>
    <div class="form-group">
        <input type="password" name="password" placeholder="Mot de passe" required>
    </div>
    <button type="submit">Se connecter</button>
</form>

</body>
</html>