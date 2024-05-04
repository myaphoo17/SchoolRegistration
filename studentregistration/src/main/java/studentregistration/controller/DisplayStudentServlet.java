package studentregistration.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import studentregistration.models.StudentBean;
import studentregistration.persistant.DAO.CourseDAO;
import studentregistration.persistant.DAO.StudentDAO;
import studentregistration.persistant.DTO.CourseDTO;
import studentregistration.persistant.DTO.StudentResponseDTO;

@WebServlet("/displayStudent")
public class DisplayStudentServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private StudentDAO studentDAO = new StudentDAO();
    private CourseDAO courseDAO = new CourseDAO();

    public DisplayStudentServlet() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<StudentBean> students = new ArrayList<>();
        
        List<StudentResponseDTO> studentDTOs = studentDAO.getAllStudents();
        request.setAttribute("studentDTOs", studentDTOs);
    
        List<CourseDTO> courses = courseDAO.getAllCourses();
        System.out.println("Number of courses retrieved from displayStudent: " + courses.size());
        request.setAttribute("students", students);
        request.setAttribute("courses", courses);
//        request.getRequestDispatcher("ViewStudent.jsp").forward(request, response);
        request.getRequestDispatcher("SearchStudent.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
