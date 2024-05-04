package com.stuReg.controllers;

import java.util.List;
import java.util.stream.Collectors;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.stuReg.models.CourseDTO;
import com.stuReg.models.StudentBean;
import com.stuReg.models.StudentRequestDTO;
import com.stuReg.models.StudentResponseDTO;
import com.stuReg.persistence.CourseDAO;
import com.stuReg.persistence.StudentDAO;

@Controller
@RequestMapping("/students")
public class StudentController {

	@Autowired
	private StudentDAO studentDAO;

	@Autowired
	private CourseDAO courseDAO;

	private List<Integer> convertCoursesToCourseIds(List<CourseDTO> courses) {
		return courses.stream().map(CourseDTO::getId).collect(Collectors.toList());
	}

	@GetMapping("/addStudent")
	public String showAddStudentForm(Model model) {

		StudentBean studentBean = new StudentBean();

		model.addAttribute("student", studentBean);
		List<CourseDTO> courses = courseDAO.getAllCourses();
		model.addAttribute("courses", courses);

		return "ViewStudent";
	}

	@PostMapping("/addStudent")
	public String addStudent(@Valid @ModelAttribute("student") StudentBean studentBean,
			RedirectAttributes redirectAttributes, BindingResult result) {
		try {

			StudentRequestDTO studentRequest = new StudentRequestDTO();
			studentRequest.setName(studentBean.getName());
			studentRequest.setDob(studentBean.getDob());
			studentRequest.setGender(studentBean.getGender());
			studentRequest.setPhone(studentBean.getPhone());
			studentRequest.setEducation(studentBean.getEducation());
			studentRequest.setAttend(studentBean.getAttend());

			MultipartFile photoFile = studentBean.getPhoto();
			if (!photoFile.isEmpty()) {

				byte[] photoData = photoFile.getBytes();
				studentRequest.setPhoto(photoData);
			}

			List<Integer> courseIds = studentBean.getCourses();
			//System.out.println("Course IDs from `StudentBean`: " + courseIds);
			List<String> courseIdsString = courseIds.stream().map(String::valueOf) 
					.collect(Collectors.toList());

			//System.out.println("Course IDs for `StudentRequestDTO`: " + courseIdsString);
			
			studentRequest.setCourse_ids(courseIdsString);

			studentDAO.addStudent(studentRequest);

			return "redirect:/userhome";

		} catch (Exception e) {
			redirectAttributes.addFlashAttribute("errorMessage", "An error occurred while adding the student.");
			return "redirect:/students/addStudent";
		}
	}

	@GetMapping("/editStudent")
	public String showEditStudentForm(@RequestParam int id, Model model) {

		StudentResponseDTO student = studentDAO.getStudentById(id);

		StudentBean studentBean = new StudentBean();
		studentBean.setId(student.getId());
		studentBean.setName(student.getName());
		studentBean.setDob(student.getDob());
		studentBean.setGender(student.getGender());
		studentBean.setPhone(student.getPhone());
		studentBean.setEducation(student.getEducation());
		studentBean.setAttend(student.getAttend());

		List<Integer> courseIds = convertCoursesToCourseIds(student.getCourses());
		studentBean.setCourses(courseIds);

		model.addAttribute("student", studentBean);

		List<CourseDTO> courses = courseDAO.getAllCourses();
		model.addAttribute("courses", courses);

		return "EditStudent";
	}

	@PostMapping("/editStudent")
	public String editStudent(@ModelAttribute("student") StudentBean studentBean,
			RedirectAttributes redirectAttributes) {
		try {

			StudentRequestDTO studentRequest = new StudentRequestDTO();
			studentRequest.setId(studentBean.getId());
			studentRequest.setName(studentBean.getName());
			studentRequest.setDob(studentBean.getDob());
			studentRequest.setGender(studentBean.getGender());
			studentRequest.setPhone(studentBean.getPhone());
			studentRequest.setEducation(studentBean.getEducation());
			studentRequest.setAttend(studentBean.getAttend());

			MultipartFile photoFile = studentBean.getPhoto();
			if (!photoFile.isEmpty()) {

				byte[] photoData = photoFile.getBytes();
				studentRequest.setPhoto(photoData);
			}

			List<Integer> courseIds = studentBean.getCourses();
			List<String> courseIdsString = courseIds.stream().map(String::valueOf).collect(Collectors.toList());
			studentRequest.setCourse_ids(courseIdsString);

			studentDAO.editStudent(studentRequest);

			redirectAttributes.addFlashAttribute("successMessage", "Student updated successfully.");
			return "redirect:/students/allStudents";
		} catch (Exception e) {

			redirectAttributes.addFlashAttribute("errorMessage", "An error occurred while updating the student.");
			return "redirect:/students/editStudent?id=" + studentBean.getId();
		}
	}

	@GetMapping("/deleteStudent")
	public String deleteStudent(@RequestParam int id, RedirectAttributes redirectAttributes) {

		studentDAO.deleteStudent(id);

		redirectAttributes.addFlashAttribute("successMessage", "Student deleted successfully.");
		return "redirect:/students/allStudents";
	}

	@GetMapping("/allStudents")
	public String getAllStudents(Model model) {
		
		List<StudentResponseDTO> students = studentDAO.getAllStudents();
		model.addAttribute("students", students);

		return "SearchStudent";
	}

}
