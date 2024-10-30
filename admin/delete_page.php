<?php
include '../includes/db.php'; // Inclusion du fichier de connexion à la base de données

// Vérifier si une page ID est fournie via l'URL
if (isset($_GET['id'])) {
    $page_id = $_GET['id'];

    // Si l'administrateur confirme la suppression
    if (isset($_POST['confirm'])) {
        // Supprimer la page de la base de données
        $sql = "DELETE FROM pages WHERE id = ?";
        $stmt = $link->prepare($sql);
        $stmt->bind_param("i", $page_id);

        if ($stmt->execute()) {
            echo "La page a été supprimée avec succès.";
            header("Location: dashboard.php"); // Rediriger vers le tableau de bord après suppression
            exit();
        } else {
            echo "Erreur lors de la suppression de la page.";
        }
    }
} else {
    echo "Aucune page spécifiée.";
    exit();
}
?>

<!-- Formulaire de confirmation de suppression -->
<h2>Supprimer la page</h2>
<p>Êtes-vous sûr de vouloir supprimer cette page ?</p>
<form method="post">
    <input type="hidden" name="confirm" value="1">
    <button type="submit">Oui, supprimer</button>
    <a href="dashboard.php">Non, annuler</a>
</form>
