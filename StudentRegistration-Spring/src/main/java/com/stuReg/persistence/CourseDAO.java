package com.stuReg.persistence;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.stuReg.models.CourseDTO;


public class CourseDAO {
    private static Connection con = null;

    static {
        con = MyConnection.getConnection();
    }


    public int addCourse(CourseDTO courseDTO) {
        int result = 0;
        String sql = "INSERT INTO course (id, name, isDeleted) VALUES (?, ?, false)";
        try (PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, courseDTO.getId());
            ps.setString(2, courseDTO.getName());
            result = ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println("Insert error: " + e);
        }
        return result;
    }

 
    public List<CourseDTO> getAllCourses() {
        List<CourseDTO> courses = new ArrayList<>();
        String sql = "SELECT * FROM course WHERE isDeleted = false";
        try (PreparedStatement ps = con.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                CourseDTO course = new CourseDTO();
                course.setId(rs.getInt("id"));
                course.setName(rs.getString("name"));
                courses.add(course);
            }
        } catch (SQLException e) {
            System.out.println("Select all error: " + e);
        }
        return courses;
    }

    // Retrieves a course by ID, ignoring soft-deleted ones
    public CourseDTO getCourseById(int id) {
        CourseDTO course = new CourseDTO();
        String sql = "SELECT * FROM course WHERE id = ? AND isDeleted = false";
        try (PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                course.setId(rs.getInt("id"));
                course.setName(rs.getString("name"));
            }
        } catch (SQLException e) {
            System.out.println("Select error: " + e);
        }
        return course;
    }

   
    public int updateCourse(CourseDTO course) {
        int result = 0;
        String sql = "UPDATE course SET name = ? WHERE id = ? AND isDeleted = false";
        try (PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, course.getName());
            ps.setInt(2, course.getId());
            result = ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println("Update error: " + e);
        }
        return result;
    }

    // Soft delete a course by setting isDeleted to true
    public int softDeleteCourse(int courseId) {
        int result = 0;
        String sql = "UPDATE course SET isDeleted = true WHERE id = ?";
        try (PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, courseId);
            result = ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println("Soft delete error: " + e);
        }
        return result;
    }

    public boolean isCourseNameExists(String courseName) {
        boolean isExists = false;
        String query = "SELECT COUNT(*) FROM course WHERE name = ? AND isDeleted = false";
        try (PreparedStatement ps = con.prepareStatement(query)) {
            ps.setString(1, courseName);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                isExists = rs.getInt(1) > 0;
            }
        } catch (SQLException e) {
            System.out.println("Check course name error: " + e);
        }
        return isExists;
    }


}
