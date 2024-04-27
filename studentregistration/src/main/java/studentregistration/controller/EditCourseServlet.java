package studentregistration.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import studentregistration.persistant.DAO.CourseDAO;
import studentregistration.persistant.DTO.CourseDTO;

@WebServlet("/EditCourseServlet")
public class EditCourseServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    private CourseDAO courseDAO;

    public void init() {
        courseDAO = new CourseDAO();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String idParam = request.getParameter("id");
        if(idParam != null && !idParam.isEmpty()) {
            int courseId = Integer.parseInt(idParam);
           
            CourseDTO course = courseDAO.getCourseById(courseId);
         
            request.setAttribute("course", course);
            
            request.getRequestDispatcher("EditCourse.jsp").forward(request, response);
        } else {
          
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       
        String idParam = request.getParameter("courseId");
        if(idParam != null && !idParam.isEmpty()) {
            int courseId = Integer.parseInt(idParam);
            String courseName = request.getParameter("courseName");

            // Create CourseDTO object with updated details
            CourseDTO course = new CourseDTO();
            course.setId(courseId);
            course.setName(courseName);

            // Update course details in the database
            int result = courseDAO.updateCourse(course);

         
            if (result > 0) {
                response.sendRedirect(request.getContextPath() + "/displayCourse");
            } else {
                response.sendRedirect(request.getContextPath() + "/EditCourseServlet?id=" + courseId + "&error=1");
            }
        } 
    }

    
}
