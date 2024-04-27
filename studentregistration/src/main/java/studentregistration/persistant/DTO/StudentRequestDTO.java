package studentregistration.persistant.DTO;

import java.util.ArrayList;
import java.util.List;

public class StudentRequestDTO {
    private int id;
    private String name;
    private String dob;
    private String gender;
    private String phone;
    private String education;
    private String attend;
    private byte[] photo;
    private List<CourseDTO> courses = new ArrayList<>();
    private List<String> course_ids;

    public List<String> getCourse_ids() {
        return course_ids;
    }

    public void setCourse_ids(List<String> course_ids) {
        this.course_ids = course_ids;
    }

    public StudentRequestDTO() {

    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDob() {
        return dob;
    }

    public void setDob(String dob) {
        this.dob = dob;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getEducation() {
        return education;
    }

    public void setEducation(String education) {
        this.education = education;
    }

 
    public byte[] getPhoto() {
		return photo;
	}

	public void setPhoto(byte[] photo) {
		this.photo = photo;
	}

	public List<CourseDTO> getCourses() {
        return courses;
    }

    public void setCourses(List<CourseDTO> courses) {
        this.courses = courses;
    }

    public String getAttend() {
        return attend;
    }

    public void setAttend(String attend) {
        this.attend = attend;
    }
}
