package studentregistration.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import studentregistration.persistant.DAO.CourseDAO;

@WebServlet("/DeleteCourseServlet")
public class DeleteCourseServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private CourseDAO courseDAO;

    public DeleteCourseServlet() {
        super();
        courseDAO = new CourseDAO();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
      
        int courseId = Integer.parseInt(request.getParameter("courseId"));
        
       
        int result = courseDAO.softDeleteCourse(courseId);
        
        if (result > 0) {
           
            response.sendRedirect(request.getContextPath() + "/displayCourse");
        } else {
          
            response.getWriter().println("Failed to soft delete course.");
        }
    }
}
