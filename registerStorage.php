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
	<title>Add Storage</title>
</head>
<body>
	<?php
	include "configuration.php";

if (isset($_POST['register'])) {
   
    $storage_id = $_POST['storageID'];

    $warehouse_id = $_POST['warehouseID'];

    $storage_area = $_POST['storageArea'];

    $shelf = $_POST['shelf'];

    $rack = $_POST['rack'];

    $storage_bin = $_POST['storageBin'];

    $storage_sql = "SELECT * FROM companystorage WHERE companystorage.storageID = '$storage_id'";

    $result = mysqli_query($conn, $storage_sql);

     if(mysqli_num_rows($result) > 0) {
          echo "<script>
            alert('Storage Already Exists');
            window.location.href = 'registerStorage.php';
          </script>";
     }
     else { 
      
      $new_storage = "INSERT INTO companystorage(storageID, warehouseID, storageArea, shelf, rack, storageBin) 
      VALUES('$storage_id','$warehouse_id','$storage_area', '$shelf', '$rack','$storage_bin')";

      $added_storage = mysqli_query($conn, $new_storage);

      echo "<script>
      alert('Successfuly Added New Storage');
        window.location.href = 'storage.php';
      </script>";  
   }
  }

	?>
	<!-- register form -->
	<form class = "add-packing-form" action="" method="POST">
		<h1>Add Storage</h1>
	  <input class = "input-fields" type = "number" name = "storageID" placeholder="Storage ID"><br>
	  
	  <input class = "input-fields" type = "number" name = "warehouseID" placeholder="Warehouse ID"><br>
      
	  <input class = "input-fields" type = "text"  name = "storageArea" placeholder="Storage Area"><br>
      
	  <input class = "input-fields" type = "number"  name = "shelf" placeholder="Shelf"><br>

      <input class = "input-fields" type = "number"  name = "rack" placeholder="Rack"><br>

      <input class = "input-fields" type = "text"  name = "storageBin" placeholder="Storage Bin"><br>


	  <a href="storage.php"><button class = "btn btn-primary back-button" type = "button" name = "register" >Back</button>
	  
	  <button class = "btn btn-primary submit-form" type = "submit" name = "register" >Add Storage</button></a>
	
    </form>
</body>
</html>