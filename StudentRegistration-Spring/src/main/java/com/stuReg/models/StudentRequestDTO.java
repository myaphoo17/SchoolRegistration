package com.stuReg.models;

import java.util.ArrayList;
import java.util.List;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;


public class StudentRequestDTO {

	@NotNull(message = "ID cannot be null")
	private int id;

	@NotBlank(message = "Name cannot be blank")
	@Size(min = 2, max = 50, message = "Name must be between 2 and 50 characters")
	private String name;

	private String dob;

	private String gender;

	@NotBlank(message = "Phone number cannot be blank")
	@Size(min = 10, max = 15, message = "Phone number must be between 10 and 15 characters")
	@Pattern(regexp = "^[0-9]*$", message = "Phone number must contain only digits")
	private String phone;


	private String education;


	private String attend;

	@Size(min = 1, message = "Photo cannot be empty")
	private byte[] photo;

	@NotNull(message = "Courses cannot be null")
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
