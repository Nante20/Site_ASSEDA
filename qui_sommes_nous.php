<?php include 'includes/db.php'; ?> 
<!DOCTYPE html>
<html lang="fr">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="css/qui_sommes_nous.css">
    <link rel="stylesheet" href="css/style.css">
    <title>Asseda</title>
   
</head>

<body>
<?php include 'includes/header.php'; ?>
    <div class="resume">
    <?php
    // Requête pour récupérer les données
$sql = "SELECT * FROM contenu_2";
$result = $link->query($sql);

        // Vérifier s'il y a des résultats
        if ($result->num_rows > 0) {
            // Boucler à travers les résultats
            while($row = $result->fetch_assoc()) {
                // Si c'est le titre principal, l'afficher en tant que h1
                if (!empty($row["titre"])) {
                    echo "<h1>" . $row["titre"] . "</h1>";
                    echo "<p>" . $row["paragraphe"] . "</p>";
                }

                // Si c'est un sous titre, l'afficher avec le sous-titre et le paragraphe
                if (!empty($row["sous_titre"])) {
                    echo "<h2>" . $row["sous_titre"] . "</h2>";
                    echo "<p>" . $row["sous_paragraphe"] . "</p>";
                }
            }
        } else {
            echo "Aucun contenu trouvé.";
        }

        // Fermer la connexion
        $link->close();
        ?>
        
    </div>
    <?php include 'includes/footer.php'; ?>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>