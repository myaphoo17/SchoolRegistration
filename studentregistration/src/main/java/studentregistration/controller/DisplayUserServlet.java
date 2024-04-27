package studentregistration.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import studentregistration.models.UserBean;
import studentregistration.persistant.DAO.UserDAO;
import studentregistration.persistant.DTO.UserResponseDTO;

/**
 * Servlet implementation class DisplayUserServlet
 */
@WebServlet("/displayUser")
public class DisplayUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DisplayUserServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		UserDAO userDAO = new UserDAO();
		List<UserBean> users = new ArrayList<UserBean>();
		
		List<UserResponseDTO> userDTOs = userDAO.getAllusers();
		for(UserResponseDTO dto:userDTOs) {
			UserBean bean = new UserBean();
			bean.setEmail(dto.getEmail());
			bean.setPassword(dto.getPassword());
			bean.setRole(dto.getRole());
			
			users.add(bean);
		}
		
		request.setAttribute("users", users);
		
		request.getRequestDispatcher("SearchUser.jsp").forward(request,response);
	}


	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
