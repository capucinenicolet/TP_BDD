<?php
include 'db.php'; // Make sure this path points correctly to your db.php file

// Check if the form data is set and not empty
if(isset($_POST['orderId'], $_POST['newStatus'])) {
    $orderId = $_POST['orderId'];
    $newStatus = $_POST['newStatus'];
    $sql = "";

    // Translate form status to database status
    switch ($newStatus) {
        case 'waiting':
            $dbStatus = 'not_started';
            break;
        case 'in production':
            $dbStatus = 'ongoing';
            break;
        case 'completed':
            $dbStatus = 'done';
            break;
        default:
            echo "Invalid status";
            exit; // Stop script execution if status is invalid
    }

    // Prepare SQL statement to update the order status
    $sql = "UPDATE `order` SET order_status = ? WHERE order_id = ?";

    // Prepare statement
    if($stmt = $link->prepare($sql)) {
        // Bind parameters
        $stmt->bind_param("si", $dbStatus, $orderId);

        // Execute the query
        if($stmt->execute()) {
            echo "Order status updated successfully.";
        } else {
            echo "Error updating order: " . $stmt->error;
        }

        // Close statement
        $stmt->close();
    } else {
        echo "Error preparing statement: " . $link->error;
    }
} else {
    echo "Invalid request";
}

$link->close();
?>
