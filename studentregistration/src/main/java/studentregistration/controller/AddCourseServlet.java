package studentregistration.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import studentregistration.models.CourseBean;
import studentregistration.persistant.DAO.CourseDAO;
import studentregistration.persistant.DTO.CourseDTO;

/**
 * Servlet implementation class AddCourseServlet
 */
@WebServlet("/addCourse")
public class AddCourseServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private final CourseDAO courseDAO = new CourseDAO();

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("ViewCourse.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       
        String courseName = request.getParameter("name");
      
        if (courseDAO.isCourseNameExists(courseName)) {
            
            response.sendRedirect(request.getContextPath() + "/ViewCourse.jsp?error=courseNameExists");
            return;  
        }
        
     
        CourseBean course = new CourseBean();
        course.setName(courseName);
        
        CourseDTO dto = new CourseDTO();
        dto.setName(course.getName());
        
    
        courseDAO.addCourse(dto);
        
       
        request.getRequestDispatcher("ViewCourse.jsp").forward(request, response);
    }
}
