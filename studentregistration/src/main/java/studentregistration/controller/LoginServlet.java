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
    UserDAO userDAO = new UserDAO();

    public LoginServlet() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.getWriter().append("Served at: ").append(request.getContextPath());
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        HttpSession session = request.getSession();

        // Check if email or password is empty
        if (email == null || email.isEmpty() || password == null || password.isEmpty()) {
            request.setAttribute("error", "Email and password cannot be empty");
            request.getRequestDispatcher("Login.jsp").forward(request, response);
            return;
        }

        UserRequestDTO user = new UserRequestDTO();
        user.setEmail(email);
        user.setPassword(password);
        ResultMessage rm = userDAO.login(user);

        if (rm.getResult() == 0) {
            request.setAttribute("error", rm.getMessage());
            request.getRequestDispatcher("Login.jsp").forward(request, response);
        } else {
            if (rm.getRole().equalsIgnoreCase("admin")) {
                session.setAttribute("user", user);
                request.getRequestDispatcher("AdminHome.jsp").forward(request, response);
            }
            if (rm.getRole().equalsIgnoreCase("user")) {
                session.setAttribute("user", user);
                request.getRequestDispatcher("Home.jsp").forward(request, response);
            }
        }
    }
}
