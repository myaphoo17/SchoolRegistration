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
 * Servlet implementation class CourseServlet
 */
@WebServlet("/addCourse")
public class AddCourseServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	CourseDAO courseDAO = new CourseDAO();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddCourseServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("ViewCourse.jsp").forward(request,response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	  CourseBean course = new CourseBean();
	
	  course.setName(request.getParameter("name"));
	  CourseDTO dto = new CourseDTO();
	
	  dto.setName(course.getName());
	  courseDAO.addCourse(dto);
	  request.getRequestDispatcher("ViewCourse.jsp").forward(request,response);
	  } 
	}
