package studentregistration.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import studentregistration.persistant.DAO.UserDAO;
import studentregistration.persistant.DTO.UserRequestDTO;
import studentregistration.persistant.DTO.UserResponseDTO;

/**
 * Servlet implementation class EditUserServlet
 */
@WebServlet("/editUser")
public class EditUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	UserDAO dao = new UserDAO();

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public EditUserServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		  String email = request.getParameter("email");
	        UserDAO dao = new UserDAO();
	        UserResponseDTO user = dao.getUserByEmail(email);

	        request.setAttribute("user", user);
	        request.getRequestDispatcher("EditUser.jsp").forward(request, response);
	    }

//	 *//**
//		 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
//		 *      response)
//		 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		String role = request.getParameter("role");

		
		UserRequestDTO user = new UserRequestDTO();
		user.setEmail(email);
		user.setPassword(password);
		user.setRole(role);

		
		UserDAO dao = new UserDAO();
		dao.editUser(user);

		
		response.sendRedirect("Home.jsp");
	}
}
