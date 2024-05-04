package studentregistration.persistant.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import studentregistration.persistant.DTO.CourseDTO;

public class CourseDAO {
    public static Connection con = null;

    static {
        con = MyConnection.getConnection();
    }


    public int addCourse(CourseDTO courseDTO) {
        int result = 0;
        String sql = "INSERT INTO course(id,name) VALUES(?,?)";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, courseDTO.getId());
            ps.setString(2, courseDTO.getName());
            result = ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println("Insert error!!! " + e);
        }
        return result;
    }

    public List<CourseDTO> getAllCourses() {
        List<CourseDTO> courses = new ArrayList<CourseDTO>();
        String sql = "SELECT * FROM course";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                CourseDTO course = new CourseDTO();
                course.setId(rs.getInt("id"));
                course.setName(rs.getString("name"));
                courses.add(course);
            }
        } catch (SQLException e) {
            System.out.println("Select all error!!! " + e);
        }
        return courses;
    }

    public CourseDTO getCourseById(int id) {
        CourseDTO course = new CourseDTO();
        String sql = "SELECT * FROM course WHERE id = ?";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                course.setId(rs.getInt("id"));
                course.setName(rs.getString("name"));
            }
        } catch (SQLException e) {
            System.out.println("Select error!!! " + e);
        }
        return course;
    }

    public int updateCourse(CourseDTO course) {
        int result = 0;
        String sql = "UPDATE course SET name = ? WHERE id = ?";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, course.getName());
            ps.setInt(2, course.getId());
            result = ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println("Update error!!! " + e);
        }
        return result;
    }


    public int deleteCourse(int courseId) {
        int rowsAffected = 0;
        try {
            
            String sqlDeleteStudentCourse = "DELETE FROM student_has_course WHERE course_id = ?";
            PreparedStatement psDeleteStudentCourse = con.prepareStatement(sqlDeleteStudentCourse);
            psDeleteStudentCourse.setInt(1, courseId);
            rowsAffected += psDeleteStudentCourse.executeUpdate();
            
         
            String sqlDeleteCourse = "DELETE FROM course WHERE id = ?";
            PreparedStatement psDeleteCourse = con.prepareStatement(sqlDeleteCourse);
            psDeleteCourse.setInt(1, courseId);
            rowsAffected += psDeleteCourse.executeUpdate();
        } catch (SQLException e) {
            System.out.println("Delete error!!! " + e);
        }
        return rowsAffected;
    }

}
