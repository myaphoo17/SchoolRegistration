<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">

<title>User Update</title>
<%@ include file="Home.jsp" %>



</head>
<body>
	<div class="main_contents">
		<div id="sub_content">
			<form action="editUser" method="post" onsubmit="return validatePassword()">
			
				<h2 class="col-md-6 offset-md-2 mb-5 mt-4">User Update</h2>
				<div class="row mb-4">
					<div class="col-md-2"></div>
					<label for="email" class="col-md-2 col-form-label">Email</label>
					<div class="col-md-4">
						<input type="email" class="form-control" name="email"
							value="${user.email}" readonly>
					</div>
				</div>
	
				<div class="row mb-4">
					<div class="col-md-2"></div>
					<label for="password" class="col-md-2 col-form-label">Set
						New Password</label>
					<div class="col-md-4">
						<input type="password" class="form-control" name="password"
							value="${user.password}" required>
					</div>
				</div>
				<div class="row mb-4">
					<div class="col-md-2"></div>
					<label for="confirmPassword" class="col-md-2 col-form-label">Confirm
						Password</label>
					<div class="col-md-4">
						<input type="password" class="form-control" name="confirmpassword"
							required>
					</div>
				</div>

				<div class="row mb-4 visually-hidden">
					<div class="col-md-2"></div>
					<label for="userRole" class="col-md-2 col-form-label">User
						Role</label>
					<div class="col-md-4">
						<select class="form-select" aria-label="Education" name="role">
							<option selected>User</option>
							<option value="User">User</option>
						</select>
					</div>
				</div>
				<div class="row mb-4">
					<div class="col-md-4"></div>
					<div class="col-md-6">
						<button type="submit" class="btn btn-success col-md-2"
							data-bs-toggle="modal" data-bs-target="#exampleModal">Update</button>
						
						</div>
						<button type="button" class="btn btn-secondary col-md-2 "
							onclick="location.href = 'EditUser.jsp';">Back</button>
					</div>
				</div>
			</form>
		</div>

	<div id="testfooter">
		<span>Copyright &#169; ACE Inspiration 2022</span>
	</div>
</body>
</html>
