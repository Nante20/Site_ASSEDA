<?php include 'includes/db.php'; ?> 
<!DOCTYPE html>
<html lang="fr">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="css/nous_soutenir.css">
    <link rel="stylesheet" href="css/style.css">
    <title>Asseda</title>
    
</head>

<body>
<?php include 'includes/header.php'; ?>
    <div class="container">
        <!-- Conteneur des colonnes -->
        <div class="columns">
            <!-- Première colonne -->
            <div class="column">
                <h1>Nous avons besoin de vous et de vos participations</h1>
                <p>Vous pouvez nous aider :</p>
                <ul>
                    <?php
                    // Requête pour récupérer les données
                    $sql = "SELECT * FROM contenu_3";
                    $result = $link->query($sql);
                    // Vérifier s'il y a des résultats
                    if ($result->num_rows > 0) {
                        // Boucler à travers les résultats
                        while($row = $result->fetch_assoc()) {
                            // Afficher les éléments de la liste
                            if (!empty($row["liste"])) {
                                echo "<li>" . $row["liste"] . "</li>";
                            }
                        }
                    } else {
                        echo "Aucun contenu trouvé.";
                    }
                    ?>
                </ul>
            </div>

            <!-- Deuxième colonne -->
            <div class="column">
                <?php
                // Requête pour récupérer les autres données
                $sql = "SELECT * FROM contenu_3";
                $result = $link->query($sql);
                // Vérifier s'il y a des résultats
                if ($result->num_rows > 0) {
                    while($row = $result->fetch_assoc()) {
                        // Afficher le sous-titre et paragraphe
                        if (!empty($row["sous_titre"])) {
                            echo "<h2>" . $row["sous_titre"] . "</h2>";
                            echo "<p>" . $row["sous_paragraphe"] . "</p>";
                        }
                        // Afficher les liens
                        if (!empty($row["lien_texte"]) && !empty($row["lien_url"])) {
                            echo "<p><a href='" . $row["lien_url"] . "' target='_blank'>" . $row["lien_texte"] . "</a></p>";
                        }
                        // Afficher l'image
                        if (!empty($row["image"])) {
                            echo "<img src='" . $row["image"] . "' class='img-thumbnail' alt='image'>";
                        }
                    }
                } else {
                    echo "Aucun contenu trouvé.";
                }
                // Fermer la connexion
                $link->close();
                ?>
            </div>
        </div>
    </div>
    <?php include 'includes/footer.php'; ?>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>

