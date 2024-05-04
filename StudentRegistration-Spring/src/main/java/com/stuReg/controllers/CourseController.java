package com.stuReg.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.stuReg.models.CourseDTO;
import com.stuReg.persistence.CourseDAO;

@Controller
@RequestMapping("/courses")
public class CourseController {

    @Autowired
    private CourseDAO courseDAO;

    // Display the form for adding a new course
    @GetMapping("/addCourse")
    public String showAddCourseForm(Model model) {
        model.addAttribute("course", new CourseDTO());
        return "ViewCourse"; 
    }

   
    @PostMapping("/addCourse")
    public String addCourse(CourseDTO course, RedirectAttributes redirectAttributes) {
        try {
            // Check if the course name already exists
            boolean courseNameExists = courseDAO.isCourseNameExists(course.getName());

            if (courseNameExists) {
                // If the course name exists, display an error message and redirect
                redirectAttributes.addFlashAttribute("errorMessage", "Course name already exists. Please choose a different name.");
                return "redirect:/courses/addCourse";
            }

            // If the course name does not exist, proceed with adding the course
            int result = courseDAO.addCourse(course);

            if (result > 0) {
                // Course added successfully
                redirectAttributes.addFlashAttribute("successMessage", "Course added successfully.");
                return "redirect:/courses/allCourses";
            } else {
                // Failed to add course
                redirectAttributes.addFlashAttribute("errorMessage", "Failed to add course.");
                return "redirect:/courses/addCourse";
            }
        } catch (Exception e) {
            // Handle any exceptions
            redirectAttributes.addFlashAttribute("errorMessage", "An error occurred while adding the course.");
            return "redirect:/courses/addCourse";
        }
    }

    @GetMapping("/editCourse/{id}")
    public String showEditCourseForm(@PathVariable int id, Model model) {
        CourseDTO course = courseDAO.getCourseById(id);
        model.addAttribute("course", course);
        return "EditCourse";
    }


   
    @PostMapping("/editCourse/{id}")
    public String editCourse(@PathVariable int id, @ModelAttribute CourseDTO course, RedirectAttributes redirectAttributes) {
        try {
            // Ensure the course ID from the URL matches the course ID in the form
            if (id != course.getId()) {
                redirectAttributes.addFlashAttribute("errorMessage", "Invalid course ID.");
                return "redirect:/courses/allCourses";
            }
            
            // Update the course in the database
            int result = courseDAO.updateCourse(course);
            
            if (result > 0) {
                redirectAttributes.addFlashAttribute("successMessage", "Course updated successfully.");
                return "redirect:/courses/allCourses";
            } else {
                redirectAttributes.addFlashAttribute("errorMessage", "Failed to update course.");
                return "redirect:/courses/editCourse/" + id;
            }
        } catch (NumberFormatException e) {
            // Handle number format exceptions
            redirectAttributes.addFlashAttribute("errorMessage", "Invalid input for course ID.");
            return "redirect:/courses/editCourse/" + id;
        } catch (Exception e) {
           
            redirectAttributes.addFlashAttribute("errorMessage", "An error occurred while updating the course.");
            return "redirect:/courses/editCourse/" + id;
        }
    }

    
    @PostMapping("/deleteCourse")
    public String deleteCourse(@RequestParam int id, RedirectAttributes redirectAttributes) {
        try {
            int result = courseDAO.softDeleteCourse(id);

            if (result > 0) {
                redirectAttributes.addFlashAttribute("successMessage", "Course deleted successfully.");
                return "redirect:/courses/allCourses";
            } else {
                redirectAttributes.addFlashAttribute("errorMessage", "Failed to delete course.");
                return "redirect:/courses/allCourses";
            }
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("errorMessage", "An error occurred while deleting the course.");
            return "redirect:/courses/allCourses";
        }
    }

    // View all courses
    @GetMapping("/allCourses")
    public String getAllCourses(Model model) {
        List<CourseDTO> courses = courseDAO.getAllCourses();

        model.addAttribute("courses", courses); 

        return "SearchCourse"; 
    }
}
