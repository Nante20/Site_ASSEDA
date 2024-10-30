<?php include 'includes/db.php'; ?> 
<!DOCTYPE html>
<html lang="fr">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="css/main.css"> 
    <link rel="stylesheet" href="css/style.css"> 
    <title>Asseda</title>
    
</head>

<body>
<?php include 'includes/header.php'; ?> 
    <div class="intro">
    <?php
        // Récupérer le contenu de la base de données
        $sql = "SELECT titre, paragraphe, image FROM contenu WHERE id = 1";  // On récupère l'enregistrement avec l'id 1
        $result = $link->query($sql);

        if ($result->num_rows > 0) {
            // Afficher les données de chaque ligne
            while($row = $result->fetch_assoc()) {
                echo "<h1>" . $row["titre"] . "</h1>";
                echo "<p>" . $row["paragraphe"] . "</p>";
                echo "<img src='" . $row["image"] . "' alt='Solidarite' class='responsive-image'>";
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