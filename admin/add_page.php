<?php

session_start();
include '../includes/db.php';
// Vérifier si l'utilisateur est connecté
if (!isset($_SESSION['username'])) {
    // Si l'utilisateur n'est pas connecté, rediriger vers login.php
    header('Location: login.php');
    exit();
}


if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $title = trim($_POST['title']);
    $slug = trim($_POST['slug']);
    $content = trim($_POST['content']);

    if (!empty($title) && !empty($slug) && !empty($content)) {
        // Insérer la page dans la base de données
        $stmt = $link->prepare("INSERT INTO pages (title, slug, content) VALUES (?, ?, ?)");
        $stmt->bind_param("sss", $title, $slug, $content);

        if ($stmt->execute()) {
            header('Location: ../admin/manage_pages.php');
            exit;
        } else {
            echo "Erreur lors de l'ajout de la page.";
        }

        $stmt->close();
    } else {
        echo "Tous les champs sont obligatoires.";
    }
}
?>

<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Ajouter une nouvelle page</title>
    <link rel="stylesheet" href="../css/add_page.css">
</head>
<body>
    <h1>Ajouter une nouvelle page</h1>

    <form action="add_page.php" method="POST" class="form-page">
        <label for="title">Titre :</label>
        <input type="text" name="title" required>
        <br>
        <label for="slug">Slug (URL) :</label>
        <input type="text" name="slug" required>
        <br>
        <label for="content">Contenu :</label>
        <textarea name="content" required></textarea>
        <br>
        <button type="submit">Ajouter la page</button>
    </form>
</body>

</html>
