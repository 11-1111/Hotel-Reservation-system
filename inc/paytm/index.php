<?php
// Define the absolute path to the db_config.php file
define('DB_CONFIG_PATH', __DIR__ . '/../../admin/inc/db_config.php');
define('ESSENTIALS_PATH', __DIR__ . '/../../admin/inc/essentials.php');

// Require the db_config.php file
require_once DB_CONFIG_PATH;
require_once ESSENTIALS_PATH;

date_default_timezone_set("Africa/Nairobi");

session_start();

if(!(isset($_SESSION['login']) && $_SESSION['login']==true)){
    redirect('index.php');
}

$ORDER_ID = $_SESSION['uId'].random_int(11111,99999999);
$CUST_ID = $_SESSION['uId'];
$TXN_AMOUNT = $_SESSION['room']['payment'];
$TXNID = $_SESSION['uId'] . '_' . uniqid();
$RESPMSG = "Your Transaction has been confirmed";
$STATUS = "TNX_SUCCESS";
$booked = "booked";
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>mpesa stk push</title>
</head>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.2/css/all.css">
<link rel="stylesheet" href="assets/style.css">
<script src="https://code.jquery.com/jquery-3.6.1.js" integrity="sha256-3zlB5s2uwoUzrXK3BT7AX3FyvojsraNFxCc2vC/7pNI=" crossorigin="anonymous"></script>
<body>

<div class="container-fluid">
	<div class="row d-flex justify-content-center">
		<div class="col-sm-12">
			<div class="card mx-auto">
				<img src="./assets/mpesa.png" width="64px" height="80px" /></br>
                <div class="feedback" id="feedback"></div>
				<p class="heading">PAYMENT DETAILS</p>
					<form class="card-details " method="POST" action="./mpesa.php" id="form" name="form">
                        <table border="1">
                            <tbody>
                                <tr>
                                    <th>S.No</th>
                                    <th>Label</th>
                                    <th>Value</th>
                                </tr>
                                <tr>
                                    <td>1</td>
                                    <td><label>ORDER_ID::*</label></td>
                                    <td><input id="ORDER_ID" tabindex="1" maxlength="20" size="20"
                                        name="ORDER_ID" autocomplete="off"
                                        value="<?php echo $ORDER_ID?>">
                                    </td>
                                </tr>
                                <tr>
                                    <td>2</td>
                                    <td><label>CUSTID ::*</label></td>
                                    <td><input id="CUST_ID" tabindex="2" maxlength="12" size="12" name="CUST_ID" autocomplete="off" value="CUST001"></td>
                                </tr>
                                <tr>
                                    <td>3</td>
                                    <td><label>INDUSTRY_TYPE_ID ::*</label></td>
                                    <td><input id="INDUSTRY_TYPE_ID" tabindex="4" maxlength="12" size="12" name="INDUSTRY_TYPE_ID" autocomplete="off" value="Retail"></td>
                                </tr>
                                <tr>
                                    <td>4</td>
                                    <td><label>Channel ::*</label></td>
                                    <td><input id="CHANNEL_ID" tabindex="4" maxlength="12"
                                        size="12" name="CHANNEL_ID" autocomplete="off" value="WEB">
                                    </td>
                                </tr>
                                <tr>
                                    <td>5</td>
                                    <td><label>txnAmount*</label></td>
                                    <td><input title="TXN_AMOUNT" id="TXN_AMOUNT" tabindex="10"
                                        type="text" name="TXN_AMOUNT" value="<?php echo $TXN_AMOUNT ?>"></input>
                                    </td>
                                </tr>
                                <tr>
                                    <td></td>
                                    <td></td>
                                    <td><input value="CheckOut" type="submit"	onclick=""></td>
                                </tr>
                            </tbody>
                        </table>
						<div class="form-group mt-2">
                                <p class="text-warning mb-2">Phone Number</p> 
                            <input type="text" name="phone-num" placeholder="254" size="17" id="cno" minlength="12" maxlength="12" id="phone">
                        </div>
                        <div class="form-group pt-2">
                            <div class="row">
                                <div class="col-md-6">
                                    <button type="submit" class="btn btn-primary" value="1" id="pay" class="pay-button" name="pay">Pay<i class="fas fa-arrow-right px-3 py-2"></i></button>   
                                </div>
                                <div class="col-md-6 d-flex justify-content-end">
                                    <button type="button" name="get_receipt" value="1" id="get-receipt-btn" class="btn btn-outline-success"> <a href="../../pay_status.php?order=<?php echo '.$_POST["ORDERID"];' ?>">Check Status and Receipt</a> </button> 
                                </div>
                            </div>
                        </div>		
					</form>
                    
			</div>
		</div>
	</div>
</div>

<script>
   $(() => {
        $("#pay").on('click', async (e) => {
            e.preventDefault()

            $("#pay").text('Please wait...').attr('disabled', true)
            const form = $('#form').serializeArray()

            var indexed_array = {};
            $.map(form, function(n, i) {
                indexed_array[n['name']] = n['value'];
            });

            const _response = await fetch('./mpesa.php', {
                method: 'post',
                body: JSON.stringify(indexed_array),
                mode: 'no-cors',
            })

            const response = await _response.json()
            $("#pay").text('Pay').attr('disabled', false)
            $("#pay").html(`Pay <i class="fas fa-arrow-right px-3 py-2"></i>`).attr('disabled', false)

            if (response && response.ResponseCode == 0) {
                $('#feedback').html(`
                <p class='alert alert-success'>${response.CustomerMessage}</br>
                 Enter M-PESA Pin Prompted on your phone 
                </p>
                `)
            } 
            else {
                $('#feedback').html(`<p class='alert alert-danger'>Error! ${response.errorMessage}</p>`)
            }
        })
    })
</script>
<?php


   
$frm_data = filteration($_POST);

$query1 = "INSERT INTO `booking_order`(`user_id`, `room_id`, `check_in`, `check_out`,`booking_status`, `order_id`,`trans_id`,`trans_amt`,`trans_status`,`trans_msg` ) VALUES (?,?,?,?,?,?,?,?,?,?)";

insert($query1,[$CUST_ID,$_SESSION['room']['id'],$frm_data['checkin'],
 $frm_data['checkout'],$booked,$ORDER_ID,$TXNID,$TXN_AMOUNT,$STATUS,$RESPMSG],'isssssssss');

$query2 = "INSERT INTO `booking_details`(`booking_id`, `room_name`, `price`, `total_pay`,
 `user_name`, `phonenum`, `address`) VALUES (?,?,?,?,?,?,?)";

insert($query2,['booking_id',$_SESSION['room']['name'],$_SESSION['room']['price'],
 $TXN_AMOUNT,$frm_data['name'],$frm_data['phonenum'],$frm_data['address']],'issssss');

  
?>


<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.bundle.min.js"></script>
</body>
</html>


