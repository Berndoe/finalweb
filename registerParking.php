<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel = "stylesheet" href = "forms.css" />
    <link href="https://fonts.googleapis.com/css2?family=Fraunces:ital,opsz,wght@1,9..144,500&family=Montserrat:wght@200&display=swap" rel="stylesheet"> 
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css"/>
	<title>Add Parking</title>
</head>
<body>
	<?php
	include "configuration.php";

if (isset($_POST['register'])) {
   
    $parking_id = $_POST['packingID'];

    $warehouse_id = $_POST['warehouseID'];

    $parking_area = $_POST['packingArea'];

    $parking_zone = $_POST['packingZone'];

    $parking_sql = "SELECT * FROM packing WHERE packing.packingID = '$parking_id'";

    $result = mysqli_query($conn, $parking_sql);

     if(mysqli_num_rows($result) > 0) {
          echo "<script>
            alert('Parking Already Exists');
            window.location.href = 'registerParking.php';
          </script>";
     }
     else { 
      
      $new_parking = "INSERT INTO packing(packingID,warehouseID, packingArea, packingZone) 
      VALUES('$parking_id','$warehouse_id','$parking_area','$parking_zone')";

      $added_parking = mysqli_query($conn, $new_parking);

      echo "<script>
      alert('Successfuly Added New Parking');
        window.location.href = 'parking.php';
      </script>";  
   }
  }


	?>
	<!-- register form -->
	<form class = "add-packing-form" action="" method="POST">
		<h1>Add Parking</h1><br>
	  <input class = "input-fields" type = "number" id = "uname" name = "packingID" placeholder="Parking ID"><br>
	  
	  <input class = "input-fields" type = "number" id = "pID" name = "warehouseID" placeholder="Warehouse ID"><br>
      
	  <input class = "input-fields" type = "text" id = "pID" name = "packingArea" placeholder="Parking Area"><br>
      
	  <input class = "input-fields" type = "text" id = "plot" name = "packingZone" placeholder="Parking Zone"><br>

	  <a href="parking.php"><button class = "btn btn-primary back-button" type = "button" name = "register" >Back</button>
	  
	  <button class = "btn btn-primary submit-form" type = "submit" name = "register" >Add Parking</button></a>
	
    </form>
</body>
</html>