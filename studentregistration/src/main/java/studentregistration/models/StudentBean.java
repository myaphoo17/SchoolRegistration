package studentregistration.models;

import java.util.List;

import studentregistration.persistant.DTO.CourseDTO;

public class StudentBean {
	private int id;
	private String name;
	private String dob;
	private String gender;
	private String phone;
	private String education;
	private String attend;
	//private String course_name;
	private List<CourseDTO>courses;
	 private String photo;
	
	
	public StudentBean() {
		
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


	public String getPhoto() {
		return photo;
	}

	public void setPhoto(String photo) {
		this.photo = photo;
	}

	public List<CourseDTO> getCourses() {
		return courses;
	}

	public void setCourses(List<CourseDTO> courses) {
		this.courses = courses;
	}

	/*
	 * public String getCourse_name() { return course_name; }
	 * 
	 * public void setCourse_name(String course_name) { this.course_name =
	 * course_name; }
	 */

	public String getAttend() {
		return attend;
	}

	public void setAttend(String attend) {
		this.attend = attend;
	}
	


	

}

