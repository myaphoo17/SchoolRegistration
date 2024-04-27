package studentregistration.controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import studentregistration.persistant.DAO.UserDAO;
import studentregistration.persistant.DTO.UserRequestDTO;

@WebServlet("/addUser")
public class AddUserServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private UserDAO userDAO = new UserDAO();

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("ViewUser.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String role = request.getParameter("role");

        try {
        	if (userDAO.EmailExists(email)) {
        	    System.out.println("Redirecting due to duplicate email...");
        	    response.sendRedirect(request.getContextPath() + "/ViewUser.jsp?error=emailExists");
        	    return; // Exit the method to avoid adding the user
        	}

		} catch (SQLException | IOException e) {
			
			e.printStackTrace();
		}

     
        UserRequestDTO newUser = new UserRequestDTO();
        newUser.setEmail(email);
        newUser.setPassword(password);
        newUser.setRole(role);

        userDAO.addUser(newUser);

        
        response.sendRedirect("Login.jsp");
    }
}
