<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel = "stylesheet" href = "login.css">
        <link href="https://fonts.googleapis.com/css2?family=Fraunces:ital,opsz,wght@1,9..144,500&family=Montserrat:wght@200&display=swap" rel="stylesheet">

        <title>Login</title>
    </head>
   

    <body>
        <div class = "container">
        <p class = "logo" style = "font-family: 'Fraunces', serif; margin-left: 5rem;">Dzagli & Co</p>
        <form action = "" method = "POST">
            <label id = "label-email">Email</label>
            <br>
            <input id = "email" class = "login-form" type = "email" name = "admin-email"/>
            <br>
            <label id = "label-password">Password</label>
            <br>
            <input id = "password" class = "login-form" type = "password" name = "admin-password"/>
            <div class = "forgot-password">
                <a onclick = "clickHandler()">Forgot Password?</a> 
            </div>
            <br>
            <button class = "submit-form" type = "submit" name="login" >Login</button>
        </form>
        </div>

        <script type="text/javascript">
            const clickHandler = () => {
                alert("Please contact your system administrator");
            };
          </script>
    </body>
    
    <?php 
    include "configuration.php";

//check if login form was submited
//by checking if the submit button element name was sent as part of the request

if (isset($_POST['login'])) {
    
	//collection form data
	$admin_email =  $_POST['admin-email'];
	$admin_pass = $_POST['admin-password'];
	
	$login_sql = "SELECT * FROM administrator WHERE admin_email = '$admin_email' AND admin_password = '$admin_pass'";
    $login_result = mysqli_query($conn, $login_sql);

    if(mysqli_num_rows($login_result) === 1) {
        echo "<script>
            alert('You have successfully logged in!');
            window.location.href = 'dashboard.php';
        </script>";
    }

    else {
        echo "<script>
            alert('Incorrect email or password. Please try again.');
            window.location.href = 'index.php';
        </script>";
    }

}


?>
</html>