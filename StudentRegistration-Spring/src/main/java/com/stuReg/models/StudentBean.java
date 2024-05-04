package com.stuReg.models;
import java.util.List;
import org.springframework.web.multipart.MultipartFile;

public class StudentBean {
    private int id;
    private String name;
    private String dob;
    private String gender;
    private String phone;
    private String education;
    private String attend;
    private List<Integer> courses;
    private MultipartFile photo;
    
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

    public MultipartFile getPhoto() {
        return photo;
    }

    public void setPhoto(MultipartFile photo) {
        this.photo = photo;
    }

    public List<Integer> getCourses() { // Return List<Integer>
        return courses;
    }

    public void setCourses(List<Integer> list) { // Accept List<Integer>
        this.courses = list;
    }

    public String getAttend() {
        return attend;
    }

    public void setAttend(String attend) {
        this.attend = attend;
    }
}
