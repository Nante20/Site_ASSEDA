<?php
include '../includes/db.php'; 

// Vérifier que les données sont reçues avec succès et non vides
if (isset($_POST['name'], $_POST['email'], $_POST['message'])) {
    $nom = trim($_POST['name']);
    $email = trim($_POST['email']);
    $message = trim($_POST['message']);

    // Validation de l'e-mail
    if (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
        echo "Adresse email invalide.";
        exit;
    }

    // Vérifier que les champs ne sont pas vides
    if (empty($nom) || empty($email) || empty($message)) {
        echo "Tous les champs sont obligatoires.";
        exit;
    }

    // Utilisation de requêtes préparées pour éviter les injections SQL
    $stmt = $link->prepare("INSERT INTO utilisateur (nom, email, message) VALUES (?, ?, ?)");
    
    // Vérification que la préparation a réussi
    if ($stmt) {
        // Lier les paramètres et exécuter la requête
        $stmt->bind_param("sss", $nom, $email, $message);

        // Exécuter la requête et vérifier si elle a réussi
        if ($stmt->execute()) {
            // Redirection vers la page de confirmation
            header("Location: ../handlers/confirmation.html");
            exit(); // S'assurer que le script s'arrête ici pour éviter toute exécution supplémentaire
        } else {
            echo "Erreur lors de l'envoi du message : " . $stmt->error;
        }

        // Fermer la requête préparée
        $stmt->close();
    } else {
        echo "Erreur lors de la préparation de la requête : " . $link->error;
    }

    // Fermeture de la connexion à la base de données
    mysqli_close($link);
} else {
    echo "Données manquantes dans le formulaire.";
}
?>
