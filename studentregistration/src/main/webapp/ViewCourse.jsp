
    <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
       >

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

    <title>Add course</title>

    <style>
        /* Custom styles */
        body {
            font-family: Arial, sans-serif;
            background-color: #f8f9fa;
            color: #333;
        }
h4{
margin-top: 1rem;}
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
                    <h4>Admin Dashboard</h4>
                </div>
                <div class="col-md-6">
                    <p>Main Admin</p>
                    <p>Current Date: <span id="currentDate"></span></p>
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
                    <input type="button" class="btn-basic" id="lgnout-button" value="Log Out"
                        onclick="location.href='Login.jsp'">
                </div>
            </div>
        </div>
    </div>

<body>

	<div id="sub_content">

		<form action="addCourse" method="post" onsubmit="return validateForm()">

			<h2 class="col-md-6 offset-md-2 mb-5 mt-4">Course Registration</h2>


			<div class="row mb-4">
<%
String error = request.getParameter("error");
System.out.println("Error parameter: " + error);
if ("courseNameExists".equals(error)) {
%>
<p style="color: red; margin-left:30%;">The course name you provided already exists.
	Please use a different course name.</p>
<br>
<%
}
%>
				<div class="col-md-2"></div>
				<label for="name" class="col-md-2 col-form-label">Name</label>
				<div class="col-md-4">
					<input type="text" class="form-control" name="name">
					 <small id="nameError" class="text-danger"></small>
				</div>
			</div>


			<div class="row mb-4">
				<div class="col-md-4"></div>

				<div class="col-md-6">


					<button type="submit" class="btn btn-secondary col-md-2"
						data-bs-toggle="modal" data-bs-target="#exampleModal">Add</button>
					<div class="modal fade" id="exampleModal" tabindex="-1"
						aria-labelledby="exampleModalLabel" aria-hidden="true">
						<div class="modal-dialog modal-dialog-centered">
							<div class="modal-content">
								<div class="modal-header">
									<h5 class="modal-title" id="exampleModalLabel">Course
										Registration</h5>
									<button type="button" class="btn-close" data-bs-dismiss="modal"
										aria-label="Close"></button>
								</div>
								<div class="modal-body">
									<h5 style="color: rgb(127, 209, 131);">Registered
										Succesfully !</h5>
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-success col-md-2"
										data-bs-dismiss="modal">Ok</button>

								</div>
							</div>
						</div>
					</div>

				</div>
			</div>
		</form>
	</div>
  <script>
    function validateForm() {
        var name = document.getElementById("name").value;
        var nameError = document.getElementById("nameError");

        
        nameError.innerText = "";

        if (name.trim() == "") {
            nameError.innerText = "Name is required";
            return false;
        }
        else if (!/^[a-zA-Z\s]*$/.test(name)) {
            nameError.innerText = "Name must not contain numbers";
            return false;
        }
        return true;
    }
</script>
  
  
	<div id="testfooter">
		<span>Copyright &#169; ACE Inspiration 2022</span>
	</div>

</body>

</html>