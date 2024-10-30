<?php
include '../includes/db.php'; // Inclure la connexion à la base de données

// Vérifier si l'exécution du script a déjà été faite
$sql_check = "SELECT * FROM admins WHERE username = 'Nantenaina'";
$result_check = mysqli_query($link, $sql_check);

if (mysqli_num_rows($result_check) == 0) {
    // Hash du mot de passe
    $password = password_hash('Andrianina020415', PASSWORD_BCRYPT); // Hachage du mot de passe

    // Insertion dans la table admins
    $sql = "INSERT INTO admins (username, password) VALUES ('Nantenaina', '$password')";
    
    if (mysqli_query($link, $sql)) {
        echo "Admin créé avec succès !";
    } else {
        echo "Erreur lors de la création de l'admin : " . mysqli_error($link);
    }
} else {
    echo "L'utilisateur 'admin' existe déjà.";
}

// Fermeture de la connexion
mysqli_close($link);
?>
