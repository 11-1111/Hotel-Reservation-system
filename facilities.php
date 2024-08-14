<!DOCTYPE html>
<html lang="en">
 <head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name ="viewport" content="device-width, initial-scale=1.0">
    <title>CAANAN HOTEL-FACILITIES</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@8/swiper-bundle.min.css"/>
    <?php require('inc/links.php'); ?>
 </head>
  <style>
    .pop:hover{
      border-top-color: var(--teal) !important;
      transform: scale(1.03s);
      transition: all 0.3s;
    }
  </style>
  <body class="bg-light">

    <?php require('inc/header.php'); ?>
    <div class="my-5 px-4">
      <h2 class="fw-bold h-font text-center">OUR FACILITIES</h2>
      <div class="h-line bg-dark"></div>
      <p class="text-center mt-3">
        We are geared towards the fulfillment of the needs of any discerning guest. <br>
        Here You can find the most-commonly used services and facilities offered by our Hotel.
      </p>
    </div>


    <div class="container">
      <div class="row">
        <?php
          $res = selectAll('facilities');
          $path = FACILITIES_IMG_PATH;

          while ($row=mysqli_fetch_assoc($res)) {
            echo<<<data
            <div class="col-lg-4 col-md-6 mb-5 px-4">
              <div class="bg-white shadow p-4 border-top border-4 border-dark pop">
                <div class="d-flex align-items-center mb-2">
                  <img src="$path$row[icon]" width="40px">
                  <h5 class="m-0 ms-3">$row[name]</h5>
              </div>
                <p>$row[description]</p>
              </div>
            </div>
            data;
          }
        ?>

    
      </div>
    </div>

    <?php require('chatbot.php'); ?>
   <?php require('inc/footer.php'); ?>

  </body>
</html> 