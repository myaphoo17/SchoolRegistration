<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.text.SimpleDateFormat"%>
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

<link rel="stylesheet"
    href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<script
    src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
    integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
    crossorigin="anonymous"></script>

<title>Course Registration</title>
<script>
        function validateForm() {
            var password = document.getElementById("password").value;
            var confirmPassword = document.getElementById("confirmpassword").value;

            if (password !== confirmPassword) {
                alert("Passwords do not match!");
                return false;
            }
            // If passwords match, return true to submit the form
            return true;
        }
    </script>
</head>

<body>

    <div class="main_contents">
        <div id="sub_content">
            <form action="addUser" method="post" onsubmit="return validateForm()">

                <h2 class="col-md-6 offset-md-2 mb-5 mt-4">User Registration</h2>
                <div class="row mb-4">
                    <div class="col-md-2"></div>
                    <label for="email" class="col-md-2 col-form-label">Email</label>
                    <div class="col-md-4">
                        <input type="email" class="form-control" name="email" value="">
                    </div>
                </div>
                <div class="row mb-4">
                    <div class="col-md-2"></div>
                    <label for="Passowrd" class="col-md-2 col-form-label">Password</label>
                    <div class="col-md-4">
                        <input type="password" class="form-control" id="password"
                            name="password" value="">
                    </div>
                </div>
                <div class="row mb-4">
                    <div class="col-md-2"></div>
                    <label for="confirmpassword" class="col-md-2 col-form-label">Confirm
                        Password</label>
                    <div class="col-md-4">
                        <input type="password" class="form-control" id="confirmpassword"
                            name="confirmpassword" value="">
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
                        <button type="submit" class="btn btn-secondary col-md-2">Add</button>
                    </div>
                </div>
            </form>
        </div>
    </div>

    <div id="testfooter">
        <span>&#169; ACE Inspiration 2022</span>
    </div>


</body>
</html>
