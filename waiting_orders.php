<?php
include 'db.php'; // Include database connection setup

// SQL query to select waiting orders
$sql = "SELECT * FROM `order` WHERE order_status = 'not_started' OR order_status = 'ongoing'";
$result = $link->query($sql);

if ($result->num_rows > 0) {
    echo "<ul>";
    // Output each waiting order with a form to mark it as completed
    while($row = $result->fetch_assoc()) {
        echo "<li>Order ID: " . $row["order_id"]. " - Status: " . $row["order_status"];
        // Include a form with a "Mark as Completed" button for each order
        echo "<form action='update_order_status.php' method='post' style='display:inline;'>";
        echo "<input type='hidden' name='orderId' value='" . $row["order_id"] . "'>";
        echo "<input type='hidden' name='newStatus' value='completed'>";
        echo "<button type='submit'>Completed</button>";
        echo "</form></li>";
    }
    echo "</ul>";
} else {
    echo "No waiting orders.";
}

$link->close();
?>
