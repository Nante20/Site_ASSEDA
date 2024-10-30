<?php
session_start();

include '../includes/db.php';

// Vérifier si l'utilisateur est connecté
if (!isset($_SESSION['username'])) {
    // Si l'utilisateur n'est pas connecté, rediriger vers login.php
    header('Location: login.php');
    exit();
}

// Requête pour récupérer toutes les pages
$result = $link->query("SELECT * FROM pages ORDER BY id DESC");

?>

<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Gérer les pages</title>
    <link rel="stylesheet" href="../css/manage_pages.css">
</head>
<body>
    <h1>Gérer les pages</h1>
    
    <a href="add_page.php" class="btn-add">Ajouter une nouvelle page</a>

    <table>
        <thead>
            <tr>
                <th>Titre</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
            <?php while ($page = $result->fetch_assoc()) { ?>
                <tr>
                    <td><?php echo htmlspecialchars($page['title']); ?></td>
                    <td>
                        <a href="edit_page.php?id=<?php echo $page['id']; ?>" class="btn-edit">Modifier</a>
                        <a href="delete_page.php?id=<?php echo $page['id']; ?>" class="btn-delete" onclick="return confirm('Êtes-vous sûr de vouloir supprimer cette page ?');">Supprimer</a>
                    </td>
                </tr>
            <?php } ?>
        </tbody>
    </table>
</body>

</html>
