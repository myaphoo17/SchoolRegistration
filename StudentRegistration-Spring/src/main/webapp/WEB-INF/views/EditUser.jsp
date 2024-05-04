<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>User Update</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<style>
body {
	background-color: #18392B; /*a Background color */
	/* Text color */
}

.container {
	padding-top: 20px;
	width: 500px;
}

.card {
	background-color: #fff; /* Card background color */
	border-radius: 10px; /* Rounded corners */
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1); /* Card shadow */
	padding: 20px;
}

.form-label {
	font-weight: bold; /* Bold font for labels */
}
</style>
</head>
<body>
	<div class="container">
		<div class="card">
			<form action="editUser" method="post"
				onsubmit="return validatePassword()">
				<h2 class="text-center mb-4">User Update</h2>

				<div class="mb-3">
					<label for="email" class="form-label">Email</label> <input
						type="email" class="form-control" name="email"
						value="${user.email}" readonly>
				</div>

				<div class="mb-3">
					<label for="password" class="form-label">Your Password</label> <input
						type="text" class="form-control" name="password"
						value="${user.password}" readonly>
				</div>

				<div class="mb-3">
					<label for="newPassword" class="form-label">Set New
						Password</label> <input type="password" id="newPassword"
						class="form-control" name="newPassword" required>
				</div>

				<div class="mb-3">
					<label for="confirmPassword" class="form-label">Confirm
						Password</label> <input type="password" id="confirmPassword"
						class="form-control" name="confirmPassword" required>
				</div>

				<div class="mb-3 visually-hidden">
					<label for="userRole" class="form-label">User Role</label> <select
						class="form-select" aria-label="User Role" name="role">
						<option selected>User</option>
						<option value="User">User</option>
					</select>
				</div>

				<div class="d-flex justify-content-between">
					<button type="submit" class="btn btn-success"
						data-bs-toggle="modal" data-bs-target="#exampleModal">Update</button>
					<button type="button" class="btn btn-secondary"
						onclick="window.location.href = '../userhome';">Back</button>
				</div>


			</form>
		</div>
	</div>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
	<script>
        function validatePassword() {
            const newPassword = document.getElementById("newPassword").value;
            const confirmPassword = document.getElementById("confirmPassword").value;
            if (newPassword !== confirmPassword) {
                alert("Passwords do not match.");
                return false;
            }
            return true;
        }
    </script>
</body>
</html>
