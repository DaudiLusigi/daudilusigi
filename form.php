<?php
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "web_programming_project";

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Sanitize inputs
$firstname = $conn->real_escape_string($_POST['firstname']);
$lastname = $conn->real_escape_string($_POST['lastname']);
$gender = $conn->real_escape_string($_POST['gender']);
$foods = implode(", ", $_POST['foods']);
$quote = $conn->real_escape_string($_POST['quote']);
$education = $conn->real_escape_string($_POST['education']);
$time = $conn->real_escape_string($_POST['time']);

$sql = "INSERT INTO users (first_name, last_name, gender, favorite_foods, favorite_quote, education_level, favorite_time)
        VALUES ('$firstname', '$lastname', '$gender', '$foods', '$quote', '$education', '$time')";

if ($conn->query($sql) {
    header("Location: form.html?success=1");
} else {
    echo "Error: " . $sql . "<br>" . $conn->error;
}

$conn->close();
?>