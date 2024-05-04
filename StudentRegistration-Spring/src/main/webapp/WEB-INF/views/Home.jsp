<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link
    href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
    rel="stylesheet"
    >

<link rel="stylesheet"
    href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<title>User Home</title>

<style>

body {
    font-family: Arial, sans-serif;
    background-color: #f8f9fa;
    color: #333;
}

h4 {
    margin-top: 1rem;
}

#testheader {
    background-color: #18392B;
    padding: 20px 0;
    color: #fff;
    text-align: center;
}

#testfooter {
    background-color: #1b1b21;
    padding: 10px 0;
    color: #fff;
    text-align: center;
    position: absolute;
    bottom: 0;
    width: 100%;
}

.card {
    box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
    transition: 0.3s;
}

.card:hover {
    box-shadow: 0 8px 16px 0 rgba(0, 0, 0, 0.2);
}

.card-body {
    text-align: center;
}

.card-title {
    font-size: 1.5rem;
    font-weight: bold;
}

.card-text {
    font-size: 1.1rem;
}

.btn-basic {
 
    color: #fff;
    cursor: pointer;
    font-size: 1.1rem;
}



/* Additional styles */
.container-cards {
    margin-top: 70px; /* Adjust the margin-top as needed */
}
</style>

</head>

<body>
    <div id="testheader">
        <div class="container">
            <div class=row>
                <div class="col-md-5 ">
                    <a href="AdminHome.jsp" class="admin-dashboard-link text-white text-decoration-none">
                        User Dashboard
                    </a>
                </div>
                <div class="col-md-6">

                    <div class="col-md-4">
                    <span id="currentDate"></span><br>
                    <span id="currentTime"></span>
                </div>
                  <script>
        function updateDateTime() {
            const now = new Date();
            const dateOptions = { year: '2-digit', month: '2-digit', day: '2-digit' };
            const formattedDate = now.toLocaleDateString('en-GB', dateOptions).replace(/\//g, '.');

         
            const timeOptions = {
                hour: '2-digit',
                minute: '2-digit',
                second: '2-digit',
                hour12: true // Enable 12-hour clock and AM/PM format
            };
            const formattedTime = now.toLocaleTimeString('en-GB', timeOptions);

            // Update the elements on the page with the current date and time
            document.getElementById("currentDate").innerText = formattedDate;
            document.getElementById("currentTime").innerText = formattedTime;
        }

        // Call updateDateTime every 1000 milliseconds (1 second) to keep the date and time live
        setInterval(updateDateTime, 1000);
    </script>
                </div>
                <div class="col-md-1">
                  <input type="button" class="btn  text-white" id="lgnout-button"
       value="Log Out" onclick="window.location.href='/StudentRegistration-Spring/';">
                   
                </div>
            </div>
        </div>
    </div>
    <br>
    <div class="container container-cards">
        <div class="row justify-content-center row-cols-1 row-cols-md-3 g-4">
            <div class="col mb-2">
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">Update User </h5>
                        <p class="card-text">Manage User Information</p>
                       <a href="/StudentRegistration-Spring/users/editUser?email=${user.email}" class="btn" style="background-color:  #18392B; color:white;">Go to Update User Info</a>
                       
                    </div>
                </div>
            </div>
            <div class="col mb-2">
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">Student Register</h5>
                        <p class="card-text">Register as a Student</p>
                        <a href="students/addStudent" class="btn "
                            style="background-color: #18392B; color:white;">Go to Student Register</a>
                    </div>
                </div>
            </div>
           
   
            
     
        </div>
    </div>

    <div id="testfooter">
        <span>Copyright &#169; ACE Inspiration 2022</span>
    </div>

</body>

</html>
