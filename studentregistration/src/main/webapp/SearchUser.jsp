<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Course Registration</title>
<link rel="stylesheet" href="test.css">
<!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<!-- Font Awesome CSS -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<!-- DataTables CSS -->
<link rel="stylesheet" type="text/css"
	href="https://cdn.datatables.net/1.11.5/css/jquery.dataTables.css">
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
	background-color: transparent;
	border: none;
	color: #fff;
	cursor: pointer;
	font-size: 1.1rem;
}

.btn-basic:hover {
	text-decoration: underline;
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

					<a href="AdminHome.jsp"
						class="admin-dashboard-link text-white text-decoration-none">
						<h4>Admin Dashboard</h4>
					</a>

				</div>
			
				<div class="col-md-6">
					<p>Main Admin</p>
					<p>
						Current Date: <span id="currentDate"></span>
					</p>
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
					<input type="button" class="btn-basic" id="lgnout-button"
						value="Log Out" onclick="location.href='Login.jsp'">
				</div>
			</div>
		</div>
	</div>


	<div class="col-md-5 ">


		<div class="main_contents">
			<div id="sub_content" style="width: 70%;">
				<div>
				<a href="addUser" class="btn btn-primary col-md-2 mb-3" style="background-color: #223d7d; border-color: #223d7d;">Add User</a>
				
					<table class="table table-striped" id="userTable">
						<thead>
							<tr>
								<th scope="col">No.</th>
								<th scope="col">Email</th>
								<th scope="col">Details</th>
								<th scope="col">Actions</th>
							</tr>
						</thead>
						<tbody>
							<% int counter = 1; %>
							<c:forEach items="${users}" var="user">
								<tr>
									<td><%= counter++ %></td>
									<td>${user.email}</td>
									<td><a href="editUser?email=${user.email}"
										class="btn btn-secondary mb-3">Update</a></td>
									<td><a href="deleteUser?email=${user.email}"
										class="btn btn-secondary mb-3"
										onclick="return confirm('Are you sure you want to delete this user?');">Delete</a>
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
	<script>
            /* Loop through all dropdown buttons to toggle between hiding and showing its dropdown content - This allows the user to have multiple dropdowns without any conflict */
            var dropdown = document.getElementsByClassName("dropdown-btn");
            var i;
            
            for (i = 0; i < dropdown.length; i++) {
              dropdown[i].addEventListener("click", function() {
              this.classList.toggle("active");
              var dropdownContent = this.nextElementSibling;
              if (dropdownContent.style.display === "block") {
              dropdownContent.style.display = "none";
              } else {
              dropdownContent.style.display = "block";
              }
              });
            }
            </script>

	<!-- jQuery -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<!-- Bootstrap JS -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
	<!-- DataTables JS -->
	<script type="text/javascript" charset="utf8"
		src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.js"></script>

	<script>
    $(document).ready(function () {
        $('#userTable').DataTable();
    });
</script>
</body>
</html>
