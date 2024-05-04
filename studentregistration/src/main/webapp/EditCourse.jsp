<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Search Student</title>
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

<body>
	<div class="main_contents">
		<div id="sub_content">
			<form action="EditCourseServlet" method="post">
				<h2 class="col-md-6 offset-md-2 mb-5 mt-4">Edit Course</h2>
				<div class="row mb-4 visually-hidden">
					<div class="col-md-2 "></div>
					<label for="courseId" class="col-md-2 col-form-label ">Course ID</label>
					<div class="col-md-4">
					
					<input type="text" class="form-control" name="courseId" value="${course.id}" readonly>

					
					
					</div>
				</div>
				<div class="row mb-4">
					<div class="col-md-2"></div>
					<label for="courseName" class="col-md-2 col-form-label">Course Name</label>
					<div class="col-md-4">
						<input type="text" class="form-control" name="courseName" value="${course.name}" required>
					</div>
				</div>
				<div class="row mb-4">
					<div class="col-md-4"></div>
					<div class="col-md-6">
						<button type="submit" class="btn btn-success col-md-2" style="background-color: #223d7d;" data-bs-toggle="modal" data-bs-target="#exampleModal">Update</button>
						
						<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel"
							aria-hidden="true">
							<div class="modal-dialog modal-dialog-centered">
								<div class="modal-content">
									<div class="modal-header">
										<h5 class="modal-title" id="exampleModalLabel">Course Update</h5>
										<button type="button" class="btn-close" data-bs-dismiss="modal"
											aria-label="Close"></button>
									</div>
									<div class="modal-body">
										<h5 style="color: rgb(127, 209, 131);">Successfully Updated!</h5>
									</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-success col-md-2"
											data-bs-dismiss="modal">Ok</button>
									</div>
								</div>
							</div>
						</div>
						<button type="button" class="btn btn-secondary col-md-2 "
							onclick="location.href = 'U.html';">Back</button>
					</div>
				</div>
			</form>
		</div>
	</div>
	<div id="testfooter">
		<span>Copyright &#169; ACE Inspiration 2022</span>
	</div>
</body>
</html>
