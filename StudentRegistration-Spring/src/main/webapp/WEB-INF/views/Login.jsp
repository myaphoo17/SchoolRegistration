<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    <!-- Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Roboto', sans-serif; /* Use Roboto font */
            background-color:#0b3b2f; /* Dark green background */
            color: #000; /* Black text */
        }
/* Override the btn-success class */
.btn-success {
    background-color: #0d4436; /* Change the background color */
    border-color: #0d4436; /* Change the border color to match the background */
}

/* Optionally, you can customize the hover effect */
.btn-success:hover {
    background-color: #0b3b2f; /* Slightly darker color on hover */
}

        .card {
            margin-top: 1rem;
            background-color: #ffffff;
            border-radius: 15px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1); /* Add box shadow */
        }

        .card-body {
            padding: 30px;
            border-radius: 15px; /* Rounded corners */
        }

        .form-control {
            background-color: #f2f2f2; /* Light grey input background */
            color: #333; /* Dark gray text */
            border: none;
        }

        .btn-primary {
            background-color: #18392B; /* Dark green button background */
            border: none;
        }

        .btn-primary:hover {
            background-color: #0d4436; /* Darker green on hover */
        }
    </style>
</head>

<body>
    <div class="container mt-5">
        <div class="row justify-content-center">
            <div class="col-md-6">
                <div class="card">
                    <div class="card-body">
                        <form:form method="post" modelAttribute="user">
                            <div class="form-group">
                                <form:label path="email">Email</form:label>
                                <form:input path="email" class="form-control" id="email"  />
                                <form:errors path="email" cssClass="text-danger" />
                            </div>
                            <div class="form-group">
                                <form:label path="password">Password</form:label>
                                <form:input path="password" type="password" class="form-control" id="password" />
                                <form:errors path="password" cssClass="text-danger" />
                            </div>
                            <button type="submit" class="btn btn-success btn-block">Sign in</button>
                        </form:form>

                        <p class="mt-3 text-center">
                            Not registered? <a href="users/addUser">Sign Up</a>
                        </p>

                        
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Scripts -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>

</html>
