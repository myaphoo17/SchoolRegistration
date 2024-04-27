package studentregistration.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import studentregistration.models.CourseBean;
import studentregistration.persistant.DAO.CourseDAO;
import studentregistration.persistant.DTO.CourseDTO;

@WebServlet("/displayCourse")
public class DisplayCourseServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        CourseDAO courseDAO = new CourseDAO();
        List<CourseBean> courses = new ArrayList<CourseBean>();

        List<CourseDTO> courseDTOs = courseDAO.getAllCourses();
        for (CourseDTO dto : courseDTOs) {
            CourseBean bean = new CourseBean();
            bean.setId(dto.getId());
            bean.setName(dto.getName());
            courses.add(bean);
        }

        request.setAttribute("courses", courses);

        request.getRequestDispatcher("SearchCourse.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
