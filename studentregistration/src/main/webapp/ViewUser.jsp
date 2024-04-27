<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="test.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

    <title>User Registration</title>

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

    <!-- Main content container -->
    <div class="container my-5">
        <div class="row justify-content-center">
            <div class="col-md-8">

                <!-- User registration form -->
                <form action="addUser" method="post" onsubmit="return validateForm()">

                    <h2 class="mb-4">User Registration</h2>

                    <!-- Error message for duplicate email -->
                    <%
                        // Declare and initialize the 'error' variable
                        String error = request.getParameter("error");
                        // Check for lowercase error parameter: emailExists
                        if ("emailExists".equals(error)) {
                    %>
                        <div class="alert alert-danger">
                            The email you provided already exists. Please use a different email address.
                        </div>
                    <%
                        }
                    %>

                    <!-- Email input -->
                    <div class="mb-3">
                        <label for="email" class="form-label">Email</label>
                        <input type="email" class="form-control" id="email" name="email" required>
                    </div>

                    <!-- Password input -->
                    <div class="mb-3">
                        <label for="password" class="form-label">Password</label>
                        <input type="password" class="form-control" id="password" name="password" required>
                    </div>

                    <!-- Confirm password input -->
                    <div class="mb-3">
                        <label for="confirmpassword" class="form-label">Confirm Password</label>
                        <input type="password" class="form-control" id="confirmpassword" name="confirmpassword" required>
                    </div>

                    <!-- User role selection (hidden from user) -->
                    <input type="hidden" name="role" value="User">

                    <!-- Submit button -->
                    <button type="submit" class="btn btn-primary">Add</button>

                </form>

            </div>
        </div>
    </div>

    <!-- Footer -->
    <footer class="footer mt-5">
        <div class="container text-center">
            <span>&#169; ACE Inspiration 2022</span>
        </div>
    </footer>

</body>
</html>
