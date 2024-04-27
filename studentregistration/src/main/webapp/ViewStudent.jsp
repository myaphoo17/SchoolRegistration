<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student Registration</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css">
</head>
<body>
    <%@ include file="Home.jsp"%>
    <div class="container">
        <div class="main_contents">
            <div id="sub_content">
                <form action="addStudent" method="post" enctype="multipart/form-data">
                    <h2 class="col-md-6 offset-md-2 mb-5 mt-4">Student Registration</h2>
                    <div class="row mb-4">
                        <div class="col-md-2"></div>
                        <label for="name" class="col-md-2 col-form-label">Name</label>
                        <div class="col-md-4">
                            <input type="text" class="form-control" id="name" name="name" required>
                        </div>
                    </div>
                    <div class="row mb-4">
                        <div class="col-md-2"></div>
                        <label for="dob" class="col-md-2 col-form-label">DOB</label>
                        <div class="col-md-4">
                            <input type="date" class="form-control" id="dob" name="dob" required>
                        </div>
                    </div>
                    <fieldset class="row mb-4">
                        <div class="col-md-2"></div>
                        <legend class="col-form-label col-md-2 pt-0">Gender</legend>
                        <div class="col-md-4">
                            <div class="form-check-inline">
                                <input class="form-check-input" type="radio" name="gender" id="male" value="Male" required>
                                <label class="form-check-label" for="male">Male</label>
                            </div>
                            <div class="form-check-inline">
                                <input class="form-check-input" type="radio" name="gender" id="female" value="Female" required>
                                <label class="form-check-label" for="female">Female</label>
                            </div>
                        </div>
                    </fieldset>
                    <div class="row mb-4">
                        <div class="col-md-2"></div>
                        <label for="phone" class="col-md-2 col-form-label">Phone</label>
                        <div class="col-md-4">
                            <input type="tel" class="form-control" name="phone" value="+95 "   required>
                        </div>
                    </div>
                    <div class="row mb-4">
                        <div class="col-md-2"></div>
                        <label for="education" class="col-md-2 col-form-label">Education</label>
                        <div class="col-md-4">
                            <select class="form-select" aria-label="Education" name="education" required>
                                <option selected>Bachelor of Information Technology</option>
                                <option value="Diploma in IT">Diploma in IT</option>
                                <option value="Bachelor of Computer Science">Bachelor of Computer Science</option>
                            </select>
                        </div>
                    </div>
                    <div class="row mb-4"> <div class="col-md-2"></div>
                        <label class="col-form-label col-md-2 pt-0">Attend</label>
                        <div class="col-md-4">
                            <div class="form-check">
                                <c:forEach items="${courses}" var="course">
                                    <div class="form-check">
                                        <input class="form-check-input" type="checkbox" name="courses" id="course_${course.id}" value="${course.id}">
                                        <label class="form-check-label" for="course_${course.id}">
                                            ${course.name}
                                        </label>
                                    
                                    </div>
                                </c:forEach>
                            </div>
                        </div>
                    </div>
                    <div class="row mb-4">
                        <div class="col-md-2"></div>
                        <label for="photo" class="col-md-2 col-form-label">Photo</label>
                        <div class="col-md-4">
                            <input type="file" name="photo" accept="image/*" required>
                        </div>
                    </div>
                    <div class="row mb-4">
                        <div class="col-md-4"></div>
                        <div class="col-md-4">
                            <button type="reset" class="btn btn-danger">Reset</button>
                            <button type="submit" class="btn btn-secondary col-md-2" data-bs-toggle="modal" data-bs-target="#exampleModal">Add</button>
                            <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                <div class="modal-dialog modal-dialog-centered">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h5 class="modal-title" id="exampleModalLabel">Student Registration</h5>
                                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                        </div>
                                        <div class="modal-body">
                                            <h5 style="color: rgb(127, 209, 131);">Registered Successfully!</h5>
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-success col-md-2" data-bs-dismiss="modal">Ok</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <footer id="testfooter" class="text-center">
        <span>Copyright &#169; ACE Inspiration 2022</span>
    </footer>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    
   
</body>
</html>
