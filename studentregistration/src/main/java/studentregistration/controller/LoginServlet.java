package studentregistration.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import studentregistration.persistant.DAO.UserDAO;
import studentregistration.persistant.DTO.UserRequestDTO;
import studentregistration.utils.ResultMessage;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private final UserDAO userDAO = new UserDAO();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        HttpSession session = request.getSession();

        if (email == null || email.isEmpty() || password == null || password.isEmpty()) {
            request.setAttribute("error", "Both email and password are required.");
            request.getRequestDispatcher("Login.jsp").forward(request, response);
            return;
        }

        UserRequestDTO user = new UserRequestDTO();
        user.setEmail(email);
        user.setPassword(password);

        // Call the login method in UserDAO
        ResultMessage rm = userDAO.login(user);

        if (rm.getResult() == 0) {
            // If the result is 0, there was an error in login
            request.setAttribute("error", rm.getMessage());
            request.getRequestDispatcher("Login.jsp").forward(request, response);
        } else {
            // If the login is successful, handle roles
            session.setAttribute("user", user);
            if (rm.getRole().equalsIgnoreCase("admin")) {
                request.getRequestDispatcher("AdminHome.jsp").forward(request, response);
            } else {
                request.getRequestDispatcher("Home.jsp").forward(request, response);
            }
        }
    }
}
