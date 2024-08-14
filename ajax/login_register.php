<?php

    require('../admin/inc/db_config.php');
    require('../admin/inc/essentials.php');
    require("../inc/sendgrid/sendgrid-php.php");

    date_default_timezone_set("Africa/Nairobi");

    
  if(isset($_POST['register']))
  {
    $data = filteration($_POST);
    if($data['pass'] != $data['cpass']){
        echo 'pass-mismatch';
        exit;
    }
    $u_exist = select("SELECT * FROM `user_cred` WHERE `email`=? OR `phonenum`=? LIMIT 1",
    [$data['email'],$data['phonenum']],"ss");

    if(mysqli_num_rows($u_exist)!=0){
        $u_exist_fetch = mysqli_fetch_assoc($u_exist);
        echo ($u_exist_fetch['email'] == $data['email']) ? 'email_already' : 'phone_already';
        exit;
    }
    $img = uploadUserImage($_FILES['profile']);
    if($img =='inv_img'){
        echo 'inv_img';
        exit;
    } else if($img =='upd_failed'){
        echo 'upd_failed';
        exit;
    } 
    $token = bin2hex(random_bytes(16));
    $enc_pass = password_hash($data['pass'],PASSWORD_BCRYPT);

    $query = "INSERT INTO `user_cred`(`name`, `email`, `address`, `phonenum`, `pincode`, `dob`,
     `profile`, `password`, `token`) VALUES (?,?,?,?,?,?,?,?,?)";
    $values = [$data['name'],$data['email'],$data['address'],$data['phonenum'],$data['pincode'],$data['dob'],
    $img,$enc_pass,$token];     
    if(insert($query,$values,'sssssssss')){
        echo 1;
    }else{
        echo 'ins_failed';
    }   

  }

  if (isset($_POST['login'])) {
    $data = filteration($_POST);

    $u_exist = select("SELECT * FROM `user_cred` WHERE `email`=? OR `phonenum`=? LIMIT 1",
        [$data['email_mob'], $data['email_mob']], "ss");

    if (mysqli_num_rows($u_exist) == 0) {
        echo 'inv_email_mob';
    } else {
        $u_fetch = mysqli_fetch_assoc($u_exist);
        if ($u_fetch['status'] == 0) {
            echo 'inactive';
        } else {
            if (!password_verify($data['pass'], $u_fetch['password'])) {
                echo 'invalid_pass';
            } else {
                // Regenerate the session ID
                session_regenerate_id(true);

                // Start the session or resume the existing session
                session_start();

                // Set session variables
                $_SESSION['login'] = true;
                $_SESSION['uId'] = $u_fetch['id'];
                $_SESSION['uName'] = $u_fetch['name'];
                $_SESSION['uPic'] = $u_fetch['profile'];
                $_SESSION['uPhone'] = $u_fetch['phonenum'];
                echo 1;
            }
        }
    }
}

       
      
 
  
  if(isset($_POST['forgot_pass']))
  {
    $data = filteration($_POST);

    $u_exist = select("SELECT * FROM `user_cred` WHERE `email`=? LIMIT 1",[$data['email']],"s");

    if(mysqli_num_rows($u_exist)==0){
        echo 'inv_email';
    }
    else{
        $u_fetch = mysqli_fetch_assoc($u_exist);

        if($u_fetch['is_verified']==0){
            echo 'not verified';
        }
        else if($u_fetch['status']==0){
            echo 'inactive';
        }
        else{
            //send reset link to email
            $token = bin2hex(random_bytes(16));

            if(!send_mail($data['email'],$token,'account_recovery')){
                echo 'mail_failed';
            }
            else
            {
                $date = date("Y-m-d");

                $query = mysqli_query($con,"UPDATE `user_cred` SET `token`='$token', `t_expire`='$date'
                 WHERE `id`='$u_fetch[id]'");
     
                 if($query){
                     echo 1;
                 }
                 else{
                     echo 'upd_failed';
                 }
             }
        }
     
    }    
  }

  if(isset($_POST['recover_user']))
  {
    $data = filteration($_POST);

    $enc_pass = password_hash($data['pass'],PASSWORD_BCRYPT);

    $query = "UPDATE `user_cred` SET `password`=?, `token`=?, `t_expire`=?
      WHERE `email`=? AND `token`=?";
    
    $values = [$enc_pass,null,null,$data['email'],$data['token']];

    if(update($query,$values,'sssss'))
    {
        echo 1;
    }
    else{
        echo 'failed';
    }
  }

?>