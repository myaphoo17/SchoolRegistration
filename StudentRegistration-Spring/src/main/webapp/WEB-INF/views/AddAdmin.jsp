<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<title>Admin Registration</title>

<style>
body {
    background-color: #18392B; /* Set background color */
    color: #ffffff; /* Set text color */
}

.container {
    padding-top: 3rem;
    width: 600px;
}

.card {
    margin-top: 0.5rem;
    background-color: #fff; /* Card background color */
    color: black;
    border-radius: 15px; /* Rounded corners */
    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1); /* Add box shadow */
}

.card-body {
    padding: 30px;
    border-radius: 15px; /* Rounded corners */
}


.form-label {
    font-weight: bold;
}



.btn-block {
    width: 100%; /* Full-width button */
}

.text-center span {
    color: #ffffff; /* Footer text color */
}
</style>

<script>
function validateForm() {
    var password = document.getElementById("password").value;
    var confirmPassword = document.getElementById("confirmpassword").value;

    if (password !== confirmPassword) {
        alert("Passwords do not match!");
        return false;
    }

    return true;
}
</script>
</head>
<body>
	<div class="container mt-1">
		<div class="card mx-auto" style="max-width: 500px;">
			<div class="card-body">
				<form action="/StudentRegistration-Spring/admin/addAdmin"
					method="post" onsubmit="return validateForm()">
					<h4 class="text-center mb-3">Admin Registration</h4>
					<div class=" mb-3">
						<label for="email" class="form-label">Email</label> <input
							type="email" class="form-control" name="email">
					</div>
					<div class="mb-3">
						<label for="password" class="form-label">Password</label> <input
							type="password" class="form-control" id="password"
							name="password">
					</div>
					<div class="mb-3">
						<label for="confirmpassword" class="form-label">Confirm
							Password</label> <input type="password" class="form-control"
							id="confirmpassword" name="confirmpassword">
					</div>


					<input type="hidden" name="role" value="Admin">
					<button type="submit" class="btn btn-success btn-block">Register</button>
				</form>

			</div>
		</div>
	</div>

	<div class="text-center mt-3">
		<span>&#169; ACE Inspiration 2022</span>
	</div>
</body>
</html>
