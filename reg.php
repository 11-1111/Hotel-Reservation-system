<?php
session_start();

$dbhost = "localhost";
$dbuser = "root";
$dbpass = "";
$dbname = "venture";

$con = mysqli_connect($dbhost, $dbuser, $dbpass, $dbname);

if (!$con) {
    die("Failed to connect: " . mysqli_connect_error());
}

if ($_SERVER['REQUEST_METHOD'] == "POST") {
    // something was posted
    $cname = $_POST["name"];
    $cphone = $_POST["phonenum"];
    $cmail = $_POST["email"];
    $cprofile = $_FILES["profile"]["name"]; // File name
    $ctmp_name = $_FILES["profile"]["tmp_name"]; // Temporary file name
    $caddress = $_POST["address"];
    $cpincode = $_POST["pincode"];
    $cdob = $_POST["dob"];
    $password = $_POST['pass'];
    $cpass = $_POST['cpass'];

    // Check if passwords match
    if ($password != $cpass) {
        echo "Passwords do not match!";
        exit();
    }

    // Save uploaded profile picture
    $upload_dir = "profile_pictures/"; // Directory where to save the uploaded file
    move_uploaded_file($ctmp_name, $upload_dir.$cprofile);

    // Insert data into the database
    $sql = "INSERT INTO `user_cred` (`name`, `email`, `phonenum`, `profile`, `address`, `pincode`, `dob`, `password`) 
            VALUES ('$cname', '$cmail', '$cphone', '$cprofile', '$caddress', '$cpincode', '$cdob', '$password')";
    echo $sql;
    exit();
    if (mysqli_query($con, $sql)) {
        // Redirect to index.php after successful insertion
        header("Location: index.php");
        die;
    } else {
        echo "Error: " . $sql . "<br>" . mysqli_error($con);
    }
}
?>
