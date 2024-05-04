<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Student Registration</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css">
	 <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css" rel="stylesheet">
<style>
body {
	background-color: #18392B;
}

.container {
	padding-top: 50px;
	width: 700px;
}

.main_contents {
	margin-left: 40px;
	background-color: #FAF9F6;
	border-radius: 10px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
	padding: 20px;
}

.main_contents h2 {
	text-align: center;
}

.form-label {
	font-weight: bold;
}

.form-check-label {
	font-weight: normal;
}
</style>
</head>

<body>
 <div >
        <button type="button" class="btn btn-secondary" onclick="window.history.back()">
            <i class="bi bi-arrow-left"></i> Back
        </button>
    </div>

	<div class="container">
		<div class="main_contents">
			<div id="sub_content">
				<form:form action="/StudentRegistration-Spring/students/addStudent"
					method="post" modelAttribute="student"
					enctype="multipart/form-data">
					<h2 class="col-md-6 offset-md-2 mb-5 mt-4">Student
						Registration</h2>

					<!-- Name Input -->
			<div class="row mb-4">
    <div class="col-md-2"></div>
    <label for="name" class="col-md-2 col-form-label">Name</label>
    <div class="col-md-4">
        <input type="text" id="name" class="form-control" name="name" pattern="[\p{L}]+" title="Name must only contain letters in any language" required>
        <!-- Error message container -->
        <div id="nameError" class="text-danger"></div>
    </div>
</div>
			
				

					<!-- DOB Input -->
					<div class="row mb-4">
						<div class="col-md-2"></div>
						<label for="dob" class="col-md-2 col-form-label">DOB</label>
						<div class="col-md-4">
							<input type="date" class="form-control" id="dob" name="dob"
								max="2009-12-31" required>
							<div id="dobError" class="text-danger"></div>
						</div>
					</div>


					<!-- Gender Radio Buttons -->
					<fieldset class="row mb-4">
						<div class="col-md-2"></div>
						<legend class="col-form-label col-md-2 pt-0">Gender</legend>
						<div class="col-md-4">
							<form:radiobutton path="gender" value="Male" label="Male"
								class="form-check-input" />
							<form:radiobutton path="gender" value="Female" label="Female"
								class="form-check-input" />
						</div>
					</fieldset>

					<!-- Phone Input -->
					<div class="row mb-4">
    <div class="col-md-2"></div>
    <label for="phone" class="col-md-2 col-form-label">Phone</label>
    <div class="col-md-4">
        <!-- Phone input field -->
        <input type="tel" id="phone" class="form-control" />
        <!-- Span element to display error messages -->
        <span id="phoneError" class="text-danger"></span>
    </div>
</div>
					<!-- Education Dropdown -->
					<div class="row mb-4">
						<div class="col-md-2"></div>
						<label for="education" class="col-md-2 col-form-label">Education</label>
						<div class="col-md-4">
							<form:select path="education" class="form-select" required="true">
								<option value="Bachelor of Information Technology" selected>Bachelor
									of Information Technology</option>
								<option value="Diploma in IT">Diploma in IT</option>
								<option value="Bachelor of Computer Science">Bachelor
									of Computer Science</option>
							</form:select>
						</div>
					</div>

					<!-- Attend Checkboxes -->
					<div class="row mb-4">
						<div class="col-md-2"></div>
						<label class="col-form-label col-md-2 pt-0">Attend</label>
						<div class="col-md-4">
							<div class="form-check">
								<c:forEach items="${courses}" var="course">
									<div class="form-check" style="margin-left: -25px;">
										<form:checkbox path="courses" value="${course.id}"
											label="${course.name}" class="form-check-input" />
									</div>
								</c:forEach>

							</div>
						</div>
					</div>

                  
            -     <div class="row mb-4">
						<div class="col-md-2"></div>
						<label for="photo" class="col-md-2 col-form-label">Photo</label>
						<div class="col-md-4">
							<input type="file" name="photo" accept="image/*">
						</div>
					</div>
			</div>

			<!-- Form Buttons -->
			<div class="row mb-4">
				<div class="col-md-4"></div>
				<div class="col-md-4">

					<button type="submit" class="btn btn-secondary col-md-4">Add</button>
					<button type="reset" class="btn btn-danger">Reset</button>
				</div>
			</div>

			</form:form>
		</div>
	</div>

	<footer id="testfooter" class="text-center mt-3" style="color: white">
		<span>Copyright &#169; ACE Inspiration 2022</span>
	</footer>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>

	<script>
	document.getElementById("name").addEventListener("input", function() {
	    const nameInput = this.value;
	    const nameError = document.getElementById("nameError");

	    // Clear any previous error message
	    nameError.textContent = "";

	   
	    const regex = /^[\p{L}\s]+$/u;

	    // Validate the input against the regular expression
	    if (!regex.test(nameInput)) {
	        // Display an error message if the input contains numbers or special characters
	        nameError.textContent = "Name must only contain letters and spaces (no numbers or special characters).";
	    }
	});

	document.getElementById("phone").addEventListener("input", function() {
	    const phoneInput = this.value;
	    const phoneError = document.getElementById("phoneError");

	    // Clear any previous error message
	    phoneError.textContent = "";

	    // Define a regular expression to validate phone numbers
	    const phoneRegex = /^\+?[0-9]{10,15}$/; // Customize the regex as needed for your requirements

	    // Validate the phone input against the regular expression
	    if (!phoneRegex.test(phoneInput)) {
	        // Display an error message if the phone number is invalid
	        phoneError.textContent = "Invalid phone number. Please enter a valid phone number with 10-15 digits.";
	    }
	});

	</script>
</body>

</html>
