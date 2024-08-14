function getBotResponse(input) {
    if (input == "hello") {
        return "Hello there!";
    } else if (input == "goodbye") {
        return "Talk to you later!";
    } else if (input == "where is the receipt") {
        return "Do not worry, You will receive the receipt once you report to Hotel after payments!";
    }
    else if (input == "yes") {
        return "Respond with the options <br>1.Room Bookings<br> 2.Contact Us<br> 3.Hotel Facilities<br> 4.About Hotel";
    } else if (input == "1") {
        return "To visit our rooms click on the heart button below";
    } 
    else if (input == "2") {
        return "Sure! Hit the send button below to Contact us";
    }
    else if (input == "3"){
        return "To visit our Room facilities hit the spade button below!";
    }
    else if (input == "4"){
        return "To Know more about the Hotel hit the plane button below!!";
    }
    else if (input == "5"){
        return "Why did the hotel manager bring a ladder to work?<br>  Because he wanted to reach new heights!";
    }
    else if (input == "no"){
        return "Reply 5 for a joke";
    }
    else{
        return "Try asking something else! Maybe type 5 for a joke";
    }
}