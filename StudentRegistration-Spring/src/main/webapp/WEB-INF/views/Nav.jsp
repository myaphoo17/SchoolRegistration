<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <title>admin home</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome CSS -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <!-- DataTables CSS -->
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.11.5/css/jquery.dataTables.css">

    <style>
        /* Custom styles */
        body {
            font-family: Arial, sans-serif;
            background-color: white;
            color: #333;
        }

        td a.btn {
            background-color: #223d7d;
            color: #fff;
        }

        td a.btn:hover {
            background-color: #1a305d;
        }

        #testheader {
            background-color: #09084a;
            padding: 10px 0;
            color: #fff;
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

        /* Additional styles for layout */
        .container-cards {
            margin-top: 70px;
        }

        .btn-basic {
            background-color: transparent;
            border: none;
            color: #fff;
            cursor: pointer;
            font-size: 1.1rem;
        }

        .btn-basic:hover {
            text-decoration: underline;
        }
    </style>
</head>

<body>
    <div id="testheader">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-md-4 mt-2">
                    
                        <h3>Admin Dashboard</h3>
                
                </div>

            

                <div class="col-md-4">
                    <span id="currentDate"></span><br>
                    <span id="currentTime"></span>
                </div>

                <div class="col-md-13 mt-1 text-end">
                    <input type="button" class="btn-basic" id="logout-button" value="Back" onclick="window.history.back()">
                    
                    
                    <input type="button" class="btn-basic" id="logout-button" value="Log Out" onclick="location.href='/StudentRegistration-Spring'">
                </div>
            </div>
        </div>
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

    <!-- Additional content and footer can go here -->
</body>

</html>
