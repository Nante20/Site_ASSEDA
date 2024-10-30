<?php
session_start();

if (!isset($_SESSION['username'])) {
    header("Location: login.php"); // Redirige vers la page de connexion si non authentifié
    exit();
}
$username = isset($_SESSION['username']) ? htmlspecialchars($_SESSION['username']) : 'Utilisateur inconnu';
echo "Bienvenue sur votre tableau de bord, " . $username . "!";
?>


<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Tableau de bord</title>
    <link rel="stylesheet" href="../css/dashboard.css"> <!-- Lien vers votre CSS -->
</head>
<body>
       
    <!-- Liens pour gérer le contenu -->
    <nav>
        <ul>
            <li><a href="manage_pages.php">Gérer les pages</a></li>
            <li><a href="logout.php">Se déconnecter</a></li>
        </ul>
    </nav>
</body>
</html>
