<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Course Registration</title>
    <link rel="stylesheet" href="test.css">
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome CSS -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <!-- DataTables CSS -->
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.11.5/css/jquery.dataTables.css">
</head>
<body>

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

        h4 {
            margin-top: 1rem;
        }

        #testheader {
            background-color: #09084a;
            padding: 10px 0;
            color: #fff;
            text-align: center;
        }

        #testfooter {
            background-color: #1b1b21;
            padding: 4px 0px;
            color: #fff;
            text-align: center;
            position: absolute;
            bottom: 0;
            width: 100%;
            height:2rem;
            
        }

        /* Additional styles */
        .container-cards {
            margin-top: 70px; /* Adjust the margin-top as needed */
        }
    </style>

    <div id="testheader">
        <div class="container">
            <div class=row>
                <div class="col-md-5 ">
                   
					<a href="AdminHome.jsp" class="admin-dashboard-link text-white text-decoration-none">
    <h4>Admin Dashboard</h4>
</a>
</div>
                <div class="col-md-6">
                    <p>Main Admin</p>
                    <p>Current Date: <span id="currentDate"></span></p>
                    <script>
                        document.getElementById("currentDate").innerText = new Date()
                            .toLocaleDateString('en-GB', {
                                year: '2-digit',
                                month: '2-digit',
                                day: '2-digit'
                            }).replace(/\//g, '.');
                    </script>
                </div>
                <div class="col-md-1">
                    <input type="button" class="btn-basic" id="lgnout-button" value="Log Out"
                        onclick="location.href='Login.jsp'">
                </div>
            </div>
        </div>
    </div>

    <div class="col-md-5">
        <div class="main_contents">
            <div id="sub_content" style="width: 80%;">
                <div>
              <a href="addCourse" class="btn btn-primary col-md-2 mb-3" style="background-color: #223d7d; border-color: #223d7d;">Add Course</a>
              
                    <table class="table table-striped" id="userTable">
    <thead>
        <tr>
            <th scope="col">Course ID</th>
            <th scope="col">Course Name</th>
            <th scope="col">Actions</th>
        </tr>
    </thead>
    <tbody>
       <c:forEach items="${courses}" var="course">
    <tr>
        <td>${course.id}</td>
        <td>${course.name}</td>
        <td>
          <div class="row">
    <div class="col">
        <a href="EditCourseServlet?id=${course.id}" class="btn btn-secondary mb-3">Update</a>
    </div>
    <div class="col">
        <form action="DeleteCourseServlet" method="post" onsubmit="return confirm('Are you sure you want to delete this course?');">
            <input type="hidden" name="courseId" value="${course.id}">
            <button type="submit" class="btn btn-secondary mb-3">Delete</button>
        </form>
    </div>
</div>
          
          
        </td>
    </tr>
</c:forEach>
       
    </tbody>
</table>
                    
                </div>
            </div>
        </div>
    </div>

    <div id="testfooter">
        <span>Copyright &#169; ACE Inspiration 2022</span>
    </div>

    <!-- jQuery -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <!-- DataTables JS -->
    <script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.js"></script>

    <script>
        $(document).ready(function () {
            $('#userTable').DataTable();
        });
    </script>
</body>
</html>

