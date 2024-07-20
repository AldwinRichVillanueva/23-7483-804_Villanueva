<?php
$servername = "localhost";
$username = "root";
$password = "";

// create connection 
$conn = new mysqli($servername, $username, $password);

// check connection
if ($conn->connect_error) {
	die("Connection faield: " . $conn->connect_error);
}
echo "Connected succesfully";
?>
