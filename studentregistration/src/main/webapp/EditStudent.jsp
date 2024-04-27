<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="test.css">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	>

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
	></script>

<title>Course Registration</title>
</head>

<body>
	<div id="testheader">
		<div class="container">
			<div class=row>
				<div class="col-md-5 ">
					<a href="MNU001.html"><h3>Student Registration</h3></a>
				</div>
				<div class="col-md-6">
					<p>User: USR001 Harry</p>
					<p>Current Date : YY.MM.DD</p>
				</div>
				<div class="col-md-1">
					<input type="button" class="btn-basic" id="lgnout-button"
						value="Log Out" onclick="location.href='login.jsp'">
				</div>
			</div>
		</div>

	</div>

	<div class="container">
		<div class="sidenav">

			<button class="dropdown-btn">
				Class Management <i class="fa fa-caret-down"></i>
			</button>

			<div class="dropdown-container">
				<a href="BUD003.html">Course Registration </a> <a href="STU001.html">Student
					Registration </a> <a href="USR003.html">Student Search </a>
			</div>
			<a href="USR003.html">Users Management</a>
		</div>
		<div class="main_contents">
			<div id="sub_content">
				<form action="editStudent" method="post">

					<h2 class="col-md-6 offset-md-2 mb-5 mt-4">Student Update</h2>
					<div class="row mb-4">
						<div class="col-md-2"></div>
						<label class="col-md-2 col-form-label">Student ID</label>
						<div class="col-md-4">
							<input type="text" class="form-control" name="id"
								value="${student.id}" readonly>
						</div>
					</div>
					<div class="row mb-4">
						<div class="col-md-2"></div>
						<label for="name" class="col-md-2 col-form-label">Name</label>
						<div class="col-md-4">
							<input type="text" class="form-control" name="name"
								value="${student.name}">
						</div>
					</div>
					<div class="row mb-4">
						<div class="col-md-2"></div>
						<label for="dob" class="col-md-2 col-form-label">DOB</label>
						<div class="col-md-4">
							<input type="date" class="form-control" name="dob"
								value="${student.dob}">
						</div>
					</div>
					<fieldset class="row mb-4">
						<div class="col-md-2"></div>
						<legend class="col-form-label col-md-2 pt-0">Gender</legend>
						<div class="col-md-4">
							<div class="form-check-inline">
								<input class="form-check-input" type="radio" name="gender"
									value="Male" ${student.gender == 'Male' ? 'selected' : ''}
									checked> <label class="form-check-label"
									for="gridRadios1"> Male </label>
							</div>
							<div class="form-check-inline">
								<input class="form-check-input" type="radio" name="gender"
									value="Female" ${student.gender == 'Female' ? 'selected' : ''}>
								<label class="form-check-label" for="gridRadios2">
									Female </label>
							</div>

						</div>
					</fieldset>

					<div class="row mb-4">
						<div class="col-md-2"></div>
						<label for="phone" class="col-md-2 col-form-label">Phone</label>
						<div class="col-md-4">
							<input type="text" class="form-control" name="phone"
								value="${student.phone}">
						</div>
					</div>
				<div class="row mb-4">
    <div class="col-md-2"></div>
    <label for="education" class="col-md-2 col-form-label">Education</label>
    <div class="col-md-4">
        <select class="form-select" aria-label="Education" name="education">
            <option value="Bachelor of Information Technology" ${student.education == 'Bachelor of Information Technology' ? 'selected' : ''}>Bachelor of Information Technology</option>
            <option value="Diploma in IT" ${student.education == 'Diploma in IT' ? 'selected' : ''}>Diploma in IT</option>
            <option value="Bachelor of Computer Science" ${student.education == 'Bachelor of Computer Science' ? 'selected' : ''}>Bachelor of Computer Science</option>
        </select>
    </div>
</div>
				
		<div class="row mb-4">
						<div class="col-md-2"></div>
						<label for="education" class="col-md-2 col-form-label">Courses</label>
						<div class="col-md-4">
							<c:forEach items="${courses}" var="course">
								<div class="form-check">
									<input type="checkbox" class="form-check-input"
										id="course_${course.id}" name="courses" value="${course.id}"
										<c:forEach items="${student.courses}" var="c">
                        <c:if test="${c.id eq course.id}">
                            checked
                        </c:if>
                    </c:forEach>>
									<label class="form-check-label" for="course_${course.id}">${course.name}</label>
								</div>
							</c:forEach>
						</div>
						</div>
		
>


		<div class="row mb-4">
			<div class="col-md-4"></div>

			<div class="col-md-4">
			<input type="submit" class="btn btn-success" value="Update">
			

				
				<button type="button" class="btn btn-danger" data-bs-toggle="modal"
					data-bs-target="#exampleModal">

					<span>Back</span>
				</button>

				<!-- Modal -->
				<div class="modal fade" id="exampleModal" tabindex="-1"
					aria-labelledby="exampleModalLabel" aria-hidden="true">
					<div class="modal-dialog modal-dialog modal-dialog-centered">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title" id="exampleModalLabel">Student
									Deletion</h5>
								<button type="button" class="btn-close" data-bs-dismiss="modal"
									aria-label="Close"></button>
							</div>
							<div class="modal-body">

								<h5 style="color: rgb(127, 209, 131);">Succesfully Updated
									!</h5>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-success col-md-2"
									data-bs-dismiss="modal">Ok</button>

							</div>
							<div class="modal-body">Are you sure you want to delete?</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-secondary"
									data-bs-dismiss="modal">Ok</button>
								<button type="button" class="btn btn-danger">Cancel</button>
							</div>
						</div>
					</div>
				</div>
			</div>

		</div>

		</form>
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
</body>

</html>

