<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>

<head>
<jsp:include page="Nav.jsp" />
 </head>
<body>


	<div style="width: 80%; margin-left: 10%; margin-top: 0.51%;">

		<div>
			<table class="table table-striped" id="studentTable">
			<a href="addStudent" class="btn btn-primary col-md-2 mb-2" style="background-color: #223d7d; border-color: #223d7d;">Add Student</a>
			
				<thead>
					<tr>
						<th scope="col">Student ID</th>
						<th scope="col">Name</th>
						<th scope="col">Course Name</th>
						<th scope="col">Photo</th>
						<th scope="col">Details</th>
						<th scope="col">Actions</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${students}" var="student">
    <tr>
        <td>${student.id}</td>
        <td>${student.name}</td>
        <td>
            <c:forEach items="${student.courses}" var="course">
                ${course.name}<br>
            </c:forEach>
        </td>
        <td>
            <img src="data:image/jpeg;base64,${student.photo}" alt="StudentImage" style="max-width: 100px; max-height: 100px;">
        </td>
        <td><a href="editStudent?id=${student.id}" class="btn btn-secondary mb-3">Update</a></td>
        <td><a href="deleteStudent?id=${student.id}" class="btn btn-secondary mb-3" onclick="return confirm('Are you sure you want to delete this user?');">Delete</a></td>
    </tr>
</c:forEach>
					

				</tbody>
			</table>
		</div>
	</div>

	<!-- jQuery -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<!-- Bootstrap JS -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
	<!-- DataTables JS -->
	<script type="text/javascript" charset="utf8"
		src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.js"></script>


</body>

<script>
        $(document).ready(function () {
            $('#studentTable').DataTable();
        });
    </script>
</html>
