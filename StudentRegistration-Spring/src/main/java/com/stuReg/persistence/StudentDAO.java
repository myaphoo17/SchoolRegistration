package com.stuReg.persistence;

import java.io.UnsupportedEncodingException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.sql.rowset.serial.SerialBlob;

import org.apache.tomcat.util.codec.binary.Base64;

import com.mysql.cj.jdbc.Blob;
import com.stuReg.models.CourseDTO;
import com.stuReg.models.StudentRequestDTO;
import com.stuReg.models.StudentResponseDTO;


public class StudentDAO {
    public static Connection con = null;

    static {
        con = MyConnection.getConnection();
    }
    public int addStudent(StudentRequestDTO studentDTO) {
        int result = 0;
        String studentSql = "INSERT INTO student(name, dob, gender, phone, education, photo) VALUES (?, ?, ?, ?, ?, ?)";
        Connection con = null;

        try {
            // Begin transaction
            con = MyConnection.getConnection();
            con.setAutoCommit(false);
            System.out.println("Transaction started");

            // Insert student record
            PreparedStatement studentPs = con.prepareStatement(studentSql, Statement.RETURN_GENERATED_KEYS);
            studentPs.setString(1, studentDTO.getName());
            studentPs.setString(2, studentDTO.getDob());
            studentPs.setString(3, studentDTO.getGender());
            studentPs.setString(4, studentDTO.getPhone());
            studentPs.setString(5, studentDTO.getEducation());
            
            // Set photo as a blob
            SerialBlob blob = new javax.sql.rowset.serial.SerialBlob(studentDTO.getPhoto());
            studentPs.setBlob(6, blob);
            System.out.println("Prepared statement executed for student insert");

        
            
            result = studentPs.executeUpdate();
          
            ResultSet generatedKeys = studentPs.getGeneratedKeys();
            int studentId = 0;
            if (generatedKeys.next()) {
                studentId = generatedKeys.getInt(1);
                System.out.println("Generated student ID: " + studentId);
            }


            // Insert into student_has_course table if student was added successfully
            if (result != 0 && studentDTO.getCourse_ids() != null && !studentDTO.getCourse_ids().isEmpty()) {
                System.out.println("Attempting to insert into student_has_course");
                System.out.println("Course IDs: " + studentDTO.getCourse_ids());
                System.out.println("Number of courses: " + studentDTO.getCourse_ids().size());
                String courseSql = "INSERT INTO student_has_course (student_id, course_id) VALUES (?, ?)";
                PreparedStatement psCourse = con.prepareStatement(courseSql);

                for (String courseId : studentDTO.getCourse_ids()) {
                    int id = Integer.parseInt(courseId);
                    psCourse.setInt(1, studentId);
                    psCourse.setInt(2, id);
                    
                  
                    System.out.println("Inserting student_has_course record: student_id=" + studentId + ", course_id=" + id);
                
                    
                    int courseResult = psCourse.executeUpdate();
                    
                    
                    System.out.println("Result after inserting course: " + courseResult);
                }
            } else {
                System.out.println("No courses to insert or student insert failed");
            }
          
            con.commit();
            System.out.println("Transaction committed");
        } catch (SQLException e) {
           
            System.out.println("SQL Exception: " + e.getMessage());
            if (con != null) {
                try {
                    con.rollback();
                    System.out.println("Transaction rolled back");
                } catch (SQLException ex) {
                    System.out.println("Rollback error: " + ex.getMessage());
                }
            }
        } finally {
            // Ensure the connection is closed
            if (con != null) {
                try {
                    con.setAutoCommit(true);
                    con.close();
                    System.out.println("Connection closed");
                } catch (SQLException e) {
                    System.out.println("Connection close error: " + e.getMessage());
                }
            }
        }
        return result;
    }


    public int editStudent(StudentRequestDTO studentDTO) {
        int result = 0;
        String studentSql = "UPDATE student SET name=?, dob=?, gender=?, phone=?, education=?, photo=? WHERE id=?";
        Connection con = null;

        try {
            // Begin transaction
            con = MyConnection.getConnection();
            con.setAutoCommit(false);
            System.out.println("Transaction started");

            // Update student record
            PreparedStatement studentPs = con.prepareStatement(studentSql);
            studentPs.setString(1, studentDTO.getName());
            studentPs.setString(2, studentDTO.getDob());
            studentPs.setString(3, studentDTO.getGender());
            studentPs.setString(4, studentDTO.getPhone());
            studentPs.setString(5, studentDTO.getEducation());
            
            // Set photo as a blob
            if (studentDTO.getPhoto() != null) {
                java.sql.Blob photoBlob = con.createBlob();
                photoBlob.setBytes(1, studentDTO.getPhoto());
                studentPs.setBlob(6, photoBlob);
            } else {
                studentPs.setNull(6, java.sql.Types.BLOB);
            }
            
            studentPs.setInt(7, studentDTO.getId()); // Set the student ID in the WHERE clause
            result = studentPs.executeUpdate();
            
            if (result > 0 && studentDTO.getCourse_ids() != null && !studentDTO.getCourse_ids().isEmpty()) {
                // Update the student_has_course table if the student update was successful and there are course IDs to process
                String deleteCourseSql = "DELETE FROM student_has_course WHERE student_id=?";
                PreparedStatement deletePs = con.prepareStatement(deleteCourseSql);
                deletePs.setInt(1, studentDTO.getId());
                deletePs.executeUpdate();
                
                String courseSql = "INSERT INTO student_has_course (student_id, course_id) VALUES (?, ?)";
                PreparedStatement coursePs = con.prepareStatement(courseSql);
                for (String courseId : studentDTO.getCourse_ids()) {
                    int id = Integer.parseInt(courseId);
                    coursePs.setInt(1, studentDTO.getId());
                    coursePs.setInt(2, id);
                    
                    System.out.println("Inserting student_has_course record: student_id=" + studentDTO.getId() + ", course_id=" + id);
                    
                    coursePs.executeUpdate();
                }
            } else {
                System.out.println("No courses to update or student update failed");
            }

            // Commit transaction if everything is successful
            con.commit();
            System.out.println("Transaction committed");
        } catch (SQLException e) {
            System.out.println("SQL Exception: " + e.getMessage());
            if (con != null) {
                try {
                    con.rollback();
                    System.out.println("Transaction rolled back");
                } catch (SQLException ex) {
                    System.out.println("Rollback error: " + ex.getMessage());
                }
            }
        } finally {
            // Ensure the connection is closed
            if (con != null) {
                try {
                    con.setAutoCommit(true);
                    con.close();
                    System.out.println("Connection closed");
                } catch (SQLException e) {
                    System.out.println("Connection close error: " + e.getMessage());
                }
            }
        }
        return result;
    }


    public int deleteStudent(int studentId) {
        int result = 0;
        try {
            String deleteCoursesSql = "DELETE FROM student_has_course WHERE student_id=?";
            PreparedStatement ps = con.prepareStatement(deleteCoursesSql);
            ps.setInt(1, studentId);
            result = ps.executeUpdate();

            String deleteStudentSql = "DELETE FROM student WHERE id=?";
            PreparedStatement ps1 = con.prepareStatement(deleteStudentSql);
            ps1.setInt(1, studentId);
            result += ps1.executeUpdate();
        } catch (SQLException e) {
            System.out.print("Delete error!!! " + e);
        }
        return result;
    }

    public StudentResponseDTO getStudentById(int id) {
        StudentResponseDTO student = new StudentResponseDTO();
        String sql = "SELECT * FROM student WHERE id=?";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                student.setId(rs.getInt("id"));
                student.setName(rs.getString("name"));
                student.setDob(rs.getString("dob"));
                student.setGender(rs.getString("gender"));
                student.setPhone(rs.getString("phone"));
                student.setEducation(rs.getString("education"));
                Blob blob = (Blob) rs.getBlob("photo");
                byte [] bytes  =  blob.getBytes(1,(int) blob.length());
                byte[] encodeBase64 = Base64.encodeBase64(bytes);
                try {
                  student.setPhoto(new String(encodeBase64, "UTF-8"));
                  } catch (UnsupportedEncodingException e) {
                    e.printStackTrace();
                  }    
          
          sql="SELECT c.* FROM student_has_course sc inner join course c on sc.course_id=c.id WHERE sc.student_id=?";
          ps=con.prepareStatement(sql);
          ps.setInt(1, id);
          ResultSet join_rs=ps.executeQuery();
          List<CourseDTO> courses=new ArrayList<CourseDTO>();
          while(join_rs.next()) {
            CourseDTO course=new CourseDTO();
            course.setId(join_rs.getInt("id"));
            System.out.println("get student by id"+ join_rs.getInt("id"));
            course.setName(join_rs.getString("name"));
            System.out.println("get student by id"+ join_rs.getString("name"));
            courses.add(course);
          }
          
          student.setCourses(courses);
            }        
          }catch(SQLException e) {
            System.out.println("select all error: "+e);
          }
          return student;}

    public List<StudentResponseDTO> getAllStudents() {
        List<StudentResponseDTO> students = new ArrayList<>();
        String sql = "SELECT s.*, c.name AS course_name FROM student s LEFT JOIN student_has_course shc ON s.id = shc.student_id LEFT JOIN course c ON shc.course_id = c.id";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            Map<Integer, StudentResponseDTO> studentMap = new HashMap<>();
            while (rs.next()) {
                int studentId = rs.getInt("id");
                if (!studentMap.containsKey(studentId)) {
                    StudentResponseDTO student = new StudentResponseDTO();
                    student.setId(studentId);
                    student.setName(rs.getString("name"));
                    student.setDob(rs.getString("dob"));
                    student.setGender(rs.getString("gender"));
                    student.setPhone(rs.getString("phone"));
                    student.setEducation(rs.getString("education"));
                    Blob blob = (Blob) rs.getBlob("photo");
                    byte [] bytes  =  blob.getBytes(1,(int) blob.length());
                    byte[] encodeBase64 = Base64.encodeBase64(bytes);
                    try {
                        student.setPhoto(new String(encodeBase64, "UTF-8"));
                    } catch (UnsupportedEncodingException e) {
                        e.printStackTrace();
                    }
                    
                    student.setCourses(new ArrayList<>());
                    students.add(student);
                    studentMap.put(studentId, student);
                }
                String courseName = rs.getString("course_name");
                if (courseName != null) {
                    CourseDTO course = new CourseDTO();
                    course.setName(courseName);
                    studentMap.get(studentId).getCourses().add(course);
                }
            }
        } catch (SQLException e) {
            System.out.println("SQL Error: " + e);
        }
        return students;
    }

}
