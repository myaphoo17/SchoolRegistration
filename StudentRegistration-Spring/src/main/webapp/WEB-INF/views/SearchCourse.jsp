<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>

<head> 
<jsp:include page="Nav.jsp" />

</head>
<body>
<div class="main_contents">
    <div id="sub_content" style="width: 70%;  margin-left: 15%; margin-top: 0.51%;">
        <div>
        
            <a href="addCourse" class="btn btn-primary col-md-2 mb-4 mt-2" style="background-color: #09084a; border-color: #223d7d;">
                Add Course
            </a>
            <table class="table table-striped" id="userTable">
                <thead>
                    <tr>
                        <th scope="col">Course ID</th>
                        <th scope="col">Course Name</th>
                        <th scope="col">Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${courses}" var="course">
                        <tr>
                            <td>${course.id}</td>
                            <td>${course.name}</td>
                            <td>
                                <div class="row">
                                    <div class="col">
                                        <a href="/StudentRegistration-Spring/courses/editCourse/${course.id}" class="btn btn-secondary px-3  mb-3">
                                       Edit
                                        </a>
                                    </div>
                                    <div class="col">
                                        <form action="/StudentRegistration-Spring/courses/deleteCourse" method="post" onsubmit="return confirm('Are you sure you want to delete this course?');">
                                            <input type="hidden" name="id" value="${course.id}">
                                            <button type="submit" class="btn btn-danger mb-3">Delete</button>
                                        </form>
                                    </div>
                                </div>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</div>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.js"></script>
<script>
    $(document).ready(function () {
        $('#userTable').DataTable();
    });
    function updateDateTime() {
        const now = new Date();
        const dateOptions = { year: '2-digit', month: '2-digit', day: '2-digit' };
        const formattedDate = now.toLocaleDateString('en-GB', dateOptions).replace(/\//g, '.');
        const timeOptions = { hour: '2-digit', minute: '2-digit', second: '2-digit' };
        const formattedTime = now.toLocaleTimeString('en-GB', timeOptions);
        document.getElementById("currentDate").innerText = formattedDate;
        document.getElementById("currentTime").innerText = formattedTime;
    }
    setInterval(updateDateTime, 1000);
</script>
</body>
</html>
