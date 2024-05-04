<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Edit Course</title>

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
						Admin Dashboard </a>
				</div>

				<div class="col-md-6">
					<p>Main Admin</p>
					<p>
						Current Date: <span id="currentDate"></span>
					</p>
					<script>
						document.getElementById("currentDate").innerText = new Date()
								.toLocaleDateString('en-GB', {
									year : '2-digit',
									month : '2-digit',
									day : '2-digit'
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
<body>
<div >
        <button type="button" class="btn btn-secondary" onclick="window.history.back()">
            <i class="bi bi-arrow-left"></i> Back
        </button>
    </div>
	<div class="main_contents">
		<div id="sub_content">
			<form action="/StudentRegistration-Spring/courses/editCourse/${course.id}" method="post">
			

				<h2 class="col-md-6 offset-md-2 mb-5 mt-4">Edit Course</h2>

				
				<div class="row mb-4">
					<div class="col-md-2"></div>
					<label for="courseName" class="col-md-2 col-form-label">Course
						Name</label>
					<div class="col-md-4">
						<input type="text" class="form-control" name="name"
							value="${course.name}" required>
					</div>
				</div>
			<div class="btn-container">
                    <button type="submit" class="btn btn-success" style="margin-left:34% ; background-color: #223d7d; border-color: #223d7d;"  data-bs-toggle="modal" data-bs-target="#exampleModal">Save</button>
                    <a href="../allCourses" class="btn btn-secondary" onclick='window.history.back'>Back</a>
                </div>
						
				</div>
			</form>
			</div>

	<div id="testfooter">
		<span>Copyright &#169; ACE Inspiration 2022</span>
	</div>
</body>
</html>
