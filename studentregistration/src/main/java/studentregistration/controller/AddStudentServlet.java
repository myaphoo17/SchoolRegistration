package studentregistration.controller;


import java.io.IOException;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import studentregistration.persistant.DAO.CourseDAO;
import studentregistration.persistant.DAO.StudentDAO;
import studentregistration.persistant.DTO.CourseDTO;
import studentregistration.persistant.DTO.StudentRequestDTO;


@WebServlet("/addStudent")
@MultipartConfig
public class AddStudentServlet extends HttpServlet {
    
    /**
   * 
   */
  private static final long serialVersionUID = -4336789803086595707L;
  private StudentDAO studentDAO = new StudentDAO();
    private CourseDAO courseDAO = new CourseDAO();


    public AddStudentServlet() {
        super();
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
      
        
      

        List<CourseDTO> courses = courseDAO.getAllCourses();
        System.out.println("Number of courses retrieved from addStudent: " + courses.size());
       
        request.setAttribute("courses", courses);
        request.getRequestDispatcher("ViewStudent.jsp").forward(request, response);
    }



    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String name = request.getParameter("name");
        String dob = request.getParameter("dob");
        String gender = request.getParameter("gender");
        String phone = request.getParameter("phone");
        System.out.println(phone);
        String education = request.getParameter("education");

        Part filePart = request.getPart("photo");
        byte[] imageData = null;
        if (filePart != null) {
            long fileSize = filePart.getSize();
            if (fileSize > 0 && fileSize <= Integer.MAX_VALUE) {
                imageData = new byte[(int) fileSize];
                filePart.getInputStream().read(imageData);
            } else {
             
                response.getWriter().println("File size exceeds maximum allowed size");
                return;
            }
        } else {
           
            response.getWriter().println("No file uploaded");
            return; // Stop further processing
        }

        StudentRequestDTO student = new StudentRequestDTO();

        String[] courseIds = request.getParameterValues("courses");

        student.setName(name);
        student.setDob(dob);
        student.setGender(gender);
        student.setPhone(phone);
        student.setEducation(education);
        student.setPhoto(imageData);
        // student.setCourse_ids(Arrays.asList(courseIds));

        try {
            List<String> courseIdsList = new ArrayList<>();
            if (courseIds != null) {
                courseIdsList = Arrays.asList(courseIds);
            }
            student.setCourse_ids(courseIdsList);

            int result = studentDAO.addStudent(student);

            if (result > 0) {
                response.sendRedirect("Home.jsp");
            } else {
                response.getWriter().println("Error adding student: Result is 0");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("An error occurred: " + e.getMessage());
        }
    }

   
  
}