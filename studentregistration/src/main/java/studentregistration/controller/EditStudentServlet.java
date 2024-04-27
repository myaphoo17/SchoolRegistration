package studentregistration.controller;


import java.io.IOException;
import java.util.Arrays;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import studentregistration.models.StudentBean;
import studentregistration.persistant.DAO.StudentDAO;
import studentregistration.persistant.DAO.CourseDAO;
import studentregistration.persistant.DTO.CourseDTO;
import studentregistration.persistant.DTO.StudentResponseDTO;
import studentregistration.persistant.DTO.StudentRequestDTO;

/**
 * Servlet implementation class EditStudentServlet
 */
@WebServlet("/editStudent")
@MultipartConfig
public class EditStudentServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private StudentDAO studentDAO = new StudentDAO();
    private CourseDAO courseDAO = new CourseDAO();

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            int id = Integer.parseInt(request.getParameter("id"));
            System.out.println(" id "+ id);
            StudentResponseDTO student = studentDAO.getStudentById(id);
            if (student != null) {
                StudentBean studentBean = new StudentBean();
                studentBean.setId(student.getId());
                studentBean.setName(student.getName());
                studentBean.setDob(student.getDob());
                studentBean.setGender(student.getGender());
                studentBean.setPhone(student.getPhone());
                studentBean.setEducation(student.getEducation());
                
                List<CourseDTO> allCourses = courseDAO.getAllCourses();
                
                request.setAttribute("student", student);
                request.setAttribute("courses", allCourses);
                request.getRequestDispatcher("EditStudent.jsp").forward(request, response);
            } else {
                response.sendRedirect("displayStudent");
            }
        } catch (NumberFormatException e) {
            response.sendRedirect("displayStudent"); 
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String dob = request.getParameter("dob");
        String gender = request.getParameter("gender");
        String phone = request.getParameter("phone");
        String education = request.getParameter("education");
        String[] courseIds = request.getParameterValues("courses");

        StudentRequestDTO dto = new StudentRequestDTO();
        dto.setId(id);
        dto.setName(name);
        dto.setDob(dob);
        dto.setGender(gender);
        dto.setPhone(phone);
        dto.setEducation(education);
        dto.setCourse_ids(Arrays.asList(courseIds));

        studentDAO.editStudent(dto);
        response.sendRedirect("editStudent");
    }
}
