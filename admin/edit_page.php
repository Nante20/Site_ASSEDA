<?php
include '../includes/db.php'; // Inclusion du fichier de connexion à la base de données


// Vérifier si une page ID est fournie via l'URL
if (isset($_GET['id'])) {
    $page_id = $_GET['id'];

    // Récupérer les informations de la page depuis la base de données
    $sql = "SELECT * FROM pages WHERE id = ?";
    $stmt = $link->prepare($sql);
    $stmt->bind_param("i", $page_id);
    $stmt->execute();
    $result = $stmt->get_result();

    if ($result->num_rows > 0) {
        $page = $result->fetch_assoc(); // Récupérer les données de la page
    } else {
        echo "Page non trouvée.";
        exit();
    }
} else {
    echo "Aucune page spécifiée.";
    exit();
}

// Si le formulaire est soumis
if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $title = $_POST['title'];
    $content = $_POST['content'];

    // Mettre à jour les informations de la page dans la base de données
    $sql = "UPDATE pages SET title = ?, content = ? WHERE id = ?";
    $stmt = $link->prepare($sql);
    $stmt->bind_param("ssi", $title, $content, $page_id);

    if ($stmt->execute()) {
        echo "La page a été mise à jour avec succès.";
        header("Location: dashboard.php"); // Rediriger vers le tableau de bord après mise à jour
        exit();
    } else {
        echo "Erreur lors de la mise à jour de la page.";
    }
}
?>

<!-- Formulaire pour modifier une page -->
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Ajouter une nouvelle page</title>
    <link rel="stylesheet" href="../css/edit_page.css">
</head>

<body>
    <h1>Modifier la page</h1>
    <form method="post" class="form-edit-page">
        <label for="title">Titre de la page :</label>
        <input type="text" id="title" name="title" value="<?php echo htmlspecialchars($page['title']); ?>" required><br><br>
        
        <label for="content">Contenu :</label>
        <textarea id="content" name="content" rows="10" cols="50" required><?php echo htmlspecialchars($page['content']); ?></textarea><br><br>
        
        <button type="submit">Mettre à jour</button>
    </form>
</body>


</html>