<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>SearchAdmin</title>
<!-- Bootstrap CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<!-- Font Awesome CSS -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<!-- DataTables CSS -->
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.11.5/css/jquery.dataTables.css">
</head>
<body>

<nav class="navbar navbar-expand-lg navbar-dark" style="background-color: #0B2545;">

    <div class="container">
        <a class="navbar-brand" href="#">Admin Dashboard</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav"
            aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ms-auto">
                <li class="nav-item">
                    <a class="nav-link" href="#">Main Admin</a>
                </li>
                <li class="nav-item">
                    <p class="nav-link" id="currentDate"></p>
                </li>
                <li class="nav-item">
                   <input type="button" class="btn-basic" id="logout-button" value="Log Out" onclick="location.href='/StudentRegistration-Spring'">
                  
                </li>
                 <li class="nav-item">
<input type="button" class="btn-basic" id="logout-button" value="Back" onclick="window.history.back()">
                  
                </li>
            </ul>
        </div>
    </div>
</nav>

<div class="container mt-2">
    <div class="row justify-content-center">
        <div class="col-md-9">
            <div class="card">
                <div class="card-body">
                    <h2 class="card-title">Admins</h2>
                    <a href="addAdmin" class="btn btn-primary col-md-2 mb-3" style="background-color: #223d7d; border-color: #223d7d;">
                Add Admin
            </a>
                    <table class="table table-striped" id="userTable">
                        <thead>
                            <tr>
                                <th scope="col">No.</th>
                                <th scope="col">Email</th>
                              
                                <th scope="col">Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            <% int counter = 1; %>
                            <c:forEach items="${admins}" var="admin">
                                <tr>
                                    <td><%= counter++ %></td>
                                    <td>${admin.email}</td>
                                  <%--   <td><a href="editAdmin?email=${admin.email}" class="btn btn-primary mb-3"  style="background-color: #223d7d; border-color: #223d7d;">Update</a></td> --%>
                                    <td><a href="deleteAdmin?email=${admin.email}" class="btn btn-danger mb-3" onclick="return confirm('Are you sure you want to remove this admin?');">Remove</a></td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
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

<script>
    document.getElementById("currentDate").innerText = new Date().toLocaleDateString('en-GB', {
        year: '2-digit',
        month: '2-digit',
        day: '2-digit'
    }).replace(/\//g, '.');
</script>

</body>
</html>
