<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dzagli & Co</title>
    <link rel="stylesheet" href="dashboard.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="stylesheet" href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css"/>
    <link href="https://fonts.googleapis.com/css2?family=Fraunces:ital,opsz,wght@1,9..144,500&family=Montserrat:wght@200&display=swap" rel="stylesheet"> 
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
  </head>
</head>
<body>
    <nav class="navbar" id="navbar">
        <div class="container-fluid">
            <a class="navbar-brand" style="font-family: 'Fraunces', serif;margin-left: 120px;">Dzagli & Co</a>
            <form class="d-flex" role="search" style="margin: 0 auto;" >
            <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search" style="border-color: #35A5E4;">
            <button class="btn btn-outline-success" type="submit" style="background-color: #35A5E4;color: white;">Go</button>
            <a  href = "./myAccount.php" class="navbar-brand" id = "navbar-account" style="padding-left: 250px;">View account</a>
            <span class="icon" style="padding-top:8px;color:#35A5E4"><i class="fa fa-user" aria-hidden="true"></i></span>
                <a href = "index.php" class="navbar-brand" id = "navbar-logout" style="padding-left: 70px;">Logout</a>
                <span class="icon" style="padding-top:8px;left: 5px;color:#35A5E4;"><i class="fa fa-external-link" aria-hidden="true"></i></span>
            </form>
        </div>
    </nav>


    <div class="left-side">
        <p class="lSide" style="background-color: #35A5E4;color: white;padding: 3px;  border-radius: 5px;" id="dashboard" onclick="Dashboard()">Dashboard</p> <br>
        <p class="lSide" id="inventory" onclick="Inventory()" >Inventory</p> <br>
        <p class="lSide" id="products" onclick="Products()">Products</p> <br>
        <p class="lSide" id="storage" onclick="StorageF()">Storage</p> <br>
        <p class="lSide" id="parking"  onclick="Parking()">Parking</p> <br>
        <p class="lSide" id="employees" onclick="Employees()">Employees</p> <br>
    </div>


    <?php

    include "configuration.php";
    // Vehicles sold
    $vehicle_query = mysqli_query($conn, 
    "SELECT * from customercar, payment where customercar.receiptID = payment.receiptID and payment.paymentDate = NOW()");
    $vehicles_sold = mysqli_num_rows($vehicle_query);

    // amount made for the day
    $amount_query = mysqli_query($conn, "SELECT SUM(amount) from payment WHERE payment.paymentDate = NOW()");
    $money_made = mysqli_num_rows($amount_query);

    
    // number of employees
    $employee_query = mysqli_query($conn, "SELECT * FROM employee");
    $employee_number = mysqli_num_rows($employee_query);


    ?>

    <!-- SLIDE SHOW-->
    <div class = "slideshow-container">
        <div class = "slideshow-content fade">
            <img class = "images" src="./photos/vehicle.png" style="width:100%">
            <div class = "slides-queries"><?php echo "" .$vehicles_sold. " Vehicles Sold Today"; ?></div>
        </div>

    
        <div class = "slideshow-content fade">
            <img class = "images" src="./photos/money.jpg" width = "774" height = "347px" style="width:100%">
            <div class = "slides-queries"><?php echo "$" .$money_made. " Made Today"; ?></div>
        </div>
    
        <div class = "slideshow-content fade">
            <img class = "images" src="./photos/clipboard.jpg" width = "774" height = "347" style="width:100%">
            <div class = "slides-queries">Dashboard queries (Pending payments)</div>
        </div>

        <div class = "slideshow-content fade">
            <img src="./photos/helmet.jpg.webp" width = "774" height = "347" style="width:100%">
            <div class = "slides-queries"><?php echo "" .$employee_number. " Active Employees"; ?></div>
        </div>

        <!--NEXT AND PREVIOUS BUTTONS-->
        <!-- <a class = "previous-slide">&#10094;</a>
        <a class = "next-slide">&#10095;</a>  -->
    </div>
    <br />

    <!-- The dots/circles -->
    <div  class = "transition-dots" style="text-align:center">
        <span class="dot" onclick="currentSlide(1)"></span> 
        <span class="dot" onclick="currentSlide(2)"></span> 
        <span class="dot" onclick="currentSlide(3)"></span> 
        <span class="dot" onclick="currentSlide(4)"></span> 
    </div>

    <div class = "query-section">
        <div class = "content">
            <select name="devices">
                <option value = "total-sales" selected>total sales</option> 
                <option value = "not-paid">pending payment</option> 
                <option value = "deliveries">deliveries made</option>
            </select>
        </div>
    </div>

    <div id="footer">
        <footer> Built by Dzagli & Co</footer> 
    </div>


    <script src="index.js"></script>
    </body>
</html>