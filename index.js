function Inventory() {
    window.location.href = "inventory.php";
  }
  
  function Dashboard() {
    window.location.href = "dashboard.php";
  }

  function Products() {
    window.location.href = "products.php";
  }


  function StorageF() {
    window.location.href = "storage.php";
  }


  function Parking() {
    window.location.href = "parking.php";
  }

  function Employees() {
    window.location.href = "employees.php";
}

let slideIndex = 0;
showSlides();

function showSlides() {
  let i;
  let slides = document.getElementsByClassName("slideshow-content");
  let dots = document.getElementsByClassName("dot");
  for (i = 0; i < slides.length; i++) {
    slides[i].style.display = "none";  
  }
  slideIndex++;
  if (slideIndex > slides.length) {slideIndex = 1}    
  for (i = 0; i < dots.length; i++) {
    dots[i].className = dots[i].className.replace(" active", "");
  }
  slides[slideIndex-1].style.display = "block";  
  dots[slideIndex-1].className += " active";
  setTimeout(showSlides, 5000); // Change image every 2 seconds
}