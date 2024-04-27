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

@WebServlet("/editUser")
public class EditUserServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private UserDAO userDAO = new UserDAO();

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      
        String email = request.getParameter("email");
        
        
        UserResponseDTO user = userDAO.getUserByEmail(email);

     
        request.setAttribute("user", user);
        
      
        request.getRequestDispatcher("EditUser.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String role = request.getParameter("role");

      
        UserRequestDTO updatedUser = new UserRequestDTO();
        updatedUser.setEmail(email);
        updatedUser.setPassword(password);
        updatedUser.setRole(role);

       
        userDAO.editUser(updatedUser);

        
        response.sendRedirect("Home.jsp");
    }
}
