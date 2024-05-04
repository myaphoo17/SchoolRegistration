<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
     <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css" rel="stylesheet">
    <title>Edit Student</title>
</head>
<style>
body {
	background-color: #18392B;
}

.container {
	padding-top: 5px;

	}

.main_contents {
width:650px;
margin-left:25%;
	background-color:#FAF9F6;
	border-radius: 10px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
padding: 10px;
}

.sub_contents {

padding: 10px;
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
<body>
<div >
        <button type="button" class="btn btn-secondary" onclick="window.history.back()">
            <i class="bi bi-arrow-left"></i> Back
        </button>
    </div>
   
        <div class="main_contents">
            <div id="sub_content">
                <!-- Start the Spring form:form tag with modelAttribute and enctype -->
                <form:form action="editStudent" method="post" modelAttribute="student" enctype="multipart/form-data">
                    <h2 class="col-md-6 offset-md-2 mb-5 mt-4">Student Update</h2>
                    
                    <!-- Student ID -->
                    <div class="row mb-4">
                        <div class="col-md-2"></div>
                        <label class="col-md-2 col-form-label">Student ID</label>
                        <div class="col-md-4">
                            <input type="text" class="form-control" name="id" value="${student.id}" readonly aria-label="Student ID">
                        </div>
                    </div>
                    
                    <!-- Student Name -->
                    <div class="row mb-4">
                        <div class="col-md-2"></div>
                        <label for="name" class="col-md-2 col-form-label">Name</label>
                        <div class="col-md-4">
                            <input type="text" class="form-control" name="name" value="${student.name}" aria-label="Name" aria-required="true">
                        </div>
                    </div>
                    
                    <!-- Date of Birth -->
                    <div class="row mb-4">
                        <div class="col-md-2"></div>
                        <label for="dob" class="col-md-2 col-form-label">DOB</label>
                        <div class="col-md-4">
                            <input type="date" class="form-control" name="dob" 	max="2009-12-31" required value="${student.dob}" aria-label="Date of Birth">
                        </div>
                    </div>
                    
                    <!-- Gender -->
                    <fieldset class="row mb-4">
                        <div class="col-md-2"></div>
                        <legend class="col-form-label col-md-2 pt-0">Gender</legend>
                        <div class="col-md-4">
                            <div class="form-check-inline">
                                <input class="form-check-input" type="radio" name="gender" value="Male" ${student.gender == 'Male' ? 'checked' : ''}>
                                <label class="form-check-label" for="gridRadios1"> Male </label>
                            </div>
                            <div class="form-check-inline">
                                <input class="form-check-input" type="radio" name="gender" value="Female" ${student.gender == 'Female' ? 'checked' : ''}>
                                <label class="form-check-label" for="gridRadios2"> Female </label>
                            </div>
                        </div>
                    </fieldset>
                    
                    <!-- Phone -->
                    <div class="row mb-4">
                        <div class="col-md-2"></div>
                        <label for="phone" class="col-md-2 col-form-label">Phone</label>
                        <div class="col-md-4">
                            <input type="text" class="form-control" name="phone" value="${student.phone}" aria-label="Phone">
                        </div>
                    </div>
                    
                    <!-- Education -->
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
                    
                    <!-- Courses -->
                    <div class="row mb-4">
                        <div class="col-md-2"></div>
                        <label for="education" class="col-md-2 col-form-label">Courses</label>
                        <div class="col-md-4">
                            <c:forEach items="${courses}" var="course">
                                <div class="form-check">
                                    <input type="checkbox" class="form-check-input" id="course_${course.id}" name="courses" value="${course.id}" ${student.courses.contains(course.id) ? 'checked' : ''}>
                                    <label class="form-check-label" for="course_${course.id}">${course.name}</label>
                                </div>
                            </c:forEach>
                        </div>
                    </div>
                   
               <!-- Photo Upload -->
                    <div class="row mb-4">
                        <div class="col-md-2"></div>
                        <label for="photo" class="col-md-2 col-form-label">Photo</label>
                        <div class="col-md-4">
                            <form:input type="file" class="form-control" id="file" path="photo" accept="image/*" required="required" aria-label="Upload Photo" />
                        </div>
                    </div>
                    
                    <!-- Submit and Cancel Buttons -->
                    <div class="row mb-4">
                        <div class="col-md-4"></div>
                        <div class="col-md-4">
                            <input type="submit" class="btn btn-success" value="Update">
                            <button type="button" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#exampleModal">
                                <span>Back</span>
                            </button>

                            <!-- Modal -->
                            <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                <div class="modal-dialog modal-dialog modal-dialog-centered">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h5 class="modal-title" id="exampleModalLabel">Student Deletion</h5>
                                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                        </div>
                                        <div class="modal-body">
                                            <h5 style="color: rgb(127, 209, 131);">Successfully Updated!</h5>
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-success col-md-2" data-bs-dismiss="modal">Ok</button>
                                        </div>
                                        <div class="modal-body">Are you sure you want to delete?</div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Ok</button>
                                            <button type="button" class="btn btn-danger">Cancel</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </form:form>
            </div>
        </div>
  
    <div id="testfooter">
        <span>Copyright &#169; ACE Inspiration 2022</span>
    </div>
    
</body>
</html>
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
