package studentregistration.persistant.DAO;

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

import studentregistration.persistant.DTO.CourseDTO;
import studentregistration.persistant.DTO.StudentRequestDTO;
import studentregistration.persistant.DTO.StudentResponseDTO;

public class StudentDAO {
    public static Connection con = null;

    static {
        con = MyConnection.getConnection();
    }

    public int addStudent(StudentRequestDTO studentDTO) {
        int result = 0;
        String studentSql = "INSERT INTO student(name, dob, gender, phone, education, photo) VALUES (?, ?, ?, ?, ?, ?)";

        try {
            PreparedStatement studentPs = con.prepareStatement(studentSql, Statement.RETURN_GENERATED_KEYS);
            studentPs.setString(1, studentDTO.getName());
            studentPs.setString(2, studentDTO.getDob());
            studentPs.setString(3, studentDTO.getGender());
            studentPs.setString(4, studentDTO.getPhone());
            studentPs.setString(5, studentDTO.getEducation());

            SerialBlob blob = new javax.sql.rowset.serial.SerialBlob(studentDTO.getPhoto());
            studentPs.setBlob(6, blob);

            result = studentPs.executeUpdate();

            ResultSet generatedKeys = studentPs.getGeneratedKeys();
            int studentId = 0;
            if (generatedKeys.next()) {
                studentId = generatedKeys.getInt(1);
            }

            if (result != 0) {
                for (String courseId : studentDTO.getCourse_ids()) {
                    String courseSql = "INSERT INTO student_has_course( student_id,course_id) VALUES(?, ?)";
                    PreparedStatement psCourse = con.prepareStatement(courseSql);
                    psCourse.setInt(1, studentId);
                 
                    int id = Integer.parseInt(courseId);
                    psCourse.setInt(2, id);
                    System.out.println("Course ID: " + id);

                    result = psCourse.executeUpdate();
                }
            }
        } catch (SQLException e) {
            System.out.println("Insert error: " + e);
        }
        return result;
    }

    public int editStudent(StudentRequestDTO studentDTO) {
        int result = 0;
        String sql = "UPDATE student SET name=?,dob=?,gender=?,phone=?,education=? WHERE id=?";
        try {
            PreparedStatement ps = con.prepareStatement(sql);

            ps.setString(1, studentDTO.getName());
            ps.setString(2, studentDTO.getDob());
            ps.setString(3, studentDTO.getGender());
            ps.setString(4, studentDTO.getPhone());
            ps.setString(5, studentDTO.getEducation());
            ps.setInt(6, studentDTO.getId());

            result = ps.executeUpdate();
            sql = "DELETE FROM student_has_course WHERE student_id=?";
            ps = con.prepareStatement(sql);
            ps.setInt(1, studentDTO.getId());
            result = ps.executeUpdate();

            for (String courseId : studentDTO.getCourse_ids()) {
                sql = "INSERT INTO student_has_course(student_id,course_id) VALUES(?, ?)";
                ps = con.prepareStatement(sql);
                ps.setInt(1, studentDTO.getId());
                int id = Integer.parseInt(courseId);
                ps.setInt(2, id);
                result = ps.executeUpdate();
            }
        } catch (SQLException | NumberFormatException e) {
            System.out.println("Update error!!! " + e);
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
