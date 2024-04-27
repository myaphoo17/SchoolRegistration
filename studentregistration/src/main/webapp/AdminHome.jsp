
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
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

<title>Admin Home</title>

<style>
/* Custom styles */
body {
	font-family: Arial, sans-serif;
	background-color: #f8f9fa;
	color: #333;
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
					<a href="AdminHome.jsp" class="admin-dashboard-link text-white text-decoration-none">
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
	<br>
	<div class="container container-cards">
		<div class="row justify-content-center row-cols-1 row-cols-md-5 g-4">
			<div class="col mb-2  visually-hidden">
				<div class="card">
					<div class="card-body">
						<h5 class="card-title">Admin</h5>
						<p class="card-text">Manage Student Information</p>
						<a href="displayStudent" class="btn btn-primary"
							style="background-color: #09084a;">Go to Admin</a>

					</div>
				</div>
			</div>
			<div class="col mb-2">
				<div class="card">
					<div class="card-body">
						<h5 class="card-title">Student</h5>
						<p class="card-text">Manage Student Information</p>
						<a href="displayStudent" class="btn btn-primary"
							style="background-color: #09084a;">Go to Students</a>
					</div>
				</div>
			</div>
			<div class="col mb-2">
				<div class="card">
					<div class="card-body">
						<h5 class="card-title">Course</h5>
						<p class="card-text">Manage Course Information</p>
						<a href="displayCourse" class="btn btn-primary"
							style="background-color: #09084a;">Go to Courses</a>
					</div>
				</div>
			</div>
			<div class="col mb-2">
				<div class="card">
					<div class="card-body">
						<h5 class="card-title">User</h5>
						<p class="card-text">Manage User Information</p>
						<a href="displayUser" class="btn btn-primary"
							style="background-color: #09084a;">Go to Users</a>
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

