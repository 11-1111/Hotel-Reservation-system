<!DOCTYPE html>
<html lang="en">
 <head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name ="viewport" content="device-width, initial-scale=1.0">
    <title>SD HOTEL-ABOUT</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@8/swiper-bundle.min.css"/>
    <?php require('inc/links.php'); ?>
    <style>
      .box{
        border-top-color: var(--teal) !important;
      }
    </style>
 </head>
  <body class="bg-light">

    <?php require('inc/header.php'); ?>
    <div class="my-5 px-4">
      <h2 class="fw-bold h-font text-center">ABOUT US</h2>
      <div class="h-line bg-dark"></div>
      <p class="text-center mt-3">
      From humble beginnings, our Founders built a dream imbibed with a deep respect for nature and community
       that lives in our DNA.</br> Behind the company is a beautiful history of 
       uniting to create </br>Kenya's leading, independently owned, exceptional breed of hotels and resorts.
      </p>
    </div>


    <div class="container">
      <div class="row justify-content-between align-items-center">
        <div class="col-lg-6 col-md-5 mb-4 order-2">
          <h3 class="mb-2">Word from the Director</h3>
          <p>
          Our Experiences are built to bring you the marvels of Africa,
           the wonders of nature, exquisite cuisine and 
           our undeniably refreshing hospitality
          </p>
        </div>
      <div class="col-lg-5 col-md-5 mb-4 order-1">
   
        <img src="images/about/a (4).jpg" class="w-100" style="border-radius: 40%;">
      </div>
      </div>
    </div>



    <div class="container mt-5">
      <div class="row">
        <div class="col-lg-3 md-6 mb-4 px-4">
          <div class="bg-white rounded shadow p-4 border-top border-4 text-center box">
            <img src="about/hotel.png" width="70px">
            <h4class="mt-3">100+ ROOMS</h4>
          </div>
        </div>
        <div class="col-lg-3 md-6 mb-4 px-4">
          <div class="bg-white rounded shadow p-4 border-top border-4 text-center box">
            <img src="about/customers.png" width="70px">
            <h4class="mt-3">700+ CUSTOMERS</h4>
          </div>
        </div>
        <div class="col-lg-3 md-6 mb-4 px-4">
          <div class="bg-white rounded shadow p-4 border-top border-4 text-center box">
            <img src="about/rating.png" width="70px">
            <h4class="mt-3">500+ REVIEWS</h4>
          </div>
        </div>
        <div class="col-lg-3 md-6 mb-4 px-4">
          <div class="bg-white rounded shadow p-4 border-top border-4 text-center box">
            <img src="about/staff.png" width="70px">
            <h4class="mt-3">150+ STAFFS</h4>
          </div>
        </div>
      </div>
    </div>

    <h3 class="my-5 fw-bold h-font text-center">MANAGEMENT TEAM</h3>

    <div class="container px-4">
      <div class="swiper mySwiper">
        <div class="swiper-wrapper mb-5">
          <div class="swiper-slide bg-white text-center overflow-hidden rounded">
            <img src="images/about/a (1).jpg" class="w-100">
            <h5 class="mt-2">Staff</h5>
          </div>
          
          <div class="swiper-slide bg-white text-center overflow-hidden rounded">
            <img src="images/about/a (4).jpg" class="w-100">
            <h5 class="mt-2">Staff</h5>
          </div>
          <div class="swiper-slide bg-white text-center overflow-hidden rounded">
            <img src="images/about/a (4).jpg" class="w-100">
            <h5 class="mt-2">Directors</h5>
          </div>
          <div class="swiper-slide bg-white text-center overflow-hidden rounded">
            <img src="images/about/a (2).jpg" class="w-100">
            <h5 class="mt-2">Staff</h5>
          </div>
        </div>
        <div class="swiper-pagination"></div>
      </div>
    </div>

   <?php require('chatbot.php'); ?>
   <?php require('inc/footer.php'); ?>

    <script src="https:unpkg.com/swiper/swiper-bundle.min.js"></script>
      
    <script>
      var swiper = new Swiper(".mySwiper",{
        spaceBetween: 40,
        pagination: {
          el: ".swiper-pagination",
        },
        breakpoints: {
          320:{
            slidesPerView: 1,
          },
          640:{
            slidesPerView: 1,
          },
          768:{
            slidesPerView: 3,
          },
          1024:{
            slidesPerView: 3,
          },
      }
      });
    </script>
  </body>
</html> 