<?php
include 'db.php'; // Include database connection setup


// Sélection des commandes terminées
$sql = "SELECT * FROM `order` WHERE order_status = 'done' ";
$result = $link->query($sql);
if ($result->num_rows > 0) {
    echo "<ul>";
    // Affichage de chaque commande terminée
    while($row = $result->fetch_assoc()) {

        echo "<li>Commande ID: " . $row["order_id"]. " - Statut: " . $row["order_status"]." - Order Time: " . $row["order_time"] ."</li>";
    }
    echo "</ul>";
} else {
    echo "Aucune commande terminée";
}
$link->close();
?>
