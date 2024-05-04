package studentregistration.persistant.DTO;

import java.util.ArrayList;
import java.util.*;

public class CourseDTO {
	private int id;
	 private String name;
	 
	 private List<StudentRequestDTO>students=new ArrayList<StudentRequestDTO>();
	 
	 public CourseDTO() {

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

	public List<StudentRequestDTO> getStudents() {
		return students;
	}

	public void setStudents(List<StudentRequestDTO> students) {
		this.students = students;
	}
	
}

