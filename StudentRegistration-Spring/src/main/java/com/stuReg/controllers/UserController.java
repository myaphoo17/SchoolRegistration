package com.stuReg.controllers;

import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;


import com.stuReg.models.UserRequestDTO;
import com.stuReg.models.UserResponseDTO;
import com.stuReg.persistence.UserDAO;

@Controller
@RequestMapping("/users")
public class UserController {

    @Autowired
    private UserDAO userDAO;

    @RequestMapping(value = "/addUser", method = RequestMethod.GET)
    public String showAddUserForm(UserRequestDTO user) {
        return "ViewUser"; 
    }
    @PostMapping("/addUser")
    public String addUser(@Valid @ModelAttribute("user") UserRequestDTO user, BindingResult bindingResult, RedirectAttributes redirectAttributes) throws SQLException {
        
        if (bindingResult.hasErrors()) {
            return "ViewUser"; 
        }

        // Check if the email already exists
        if (userDAO.isEmailExists(user.getEmail())) {
            redirectAttributes.addFlashAttribute("errorMessage", "Email already exists.");
            return "redirect:/users/addUser";
        }

      
        userDAO.addUser(user);
        redirectAttributes.addFlashAttribute("successMessage", "User added successfully.");
        return "redirect:/";
    }

    @RequestMapping(value = "/editUser", method = RequestMethod.GET)
    public String showEditUserForm(@RequestParam String email, Model model) {
        UserResponseDTO user = userDAO.getUserByEmail(email);
        model.addAttribute("user", user);
        return "EditUser"; 
    }
    
    @RequestMapping(value = "/editUser", method = RequestMethod.POST)
    public String editUser(@Validated @ModelAttribute("user") UserRequestDTO user, BindingResult bindingResult, RedirectAttributes redirectAttributes, HttpServletRequest request) {
        
        if (bindingResult.hasErrors()) {
            return "EditUser"; 
        }
        
        String newPassword = request.getParameter("newPassword");
        String confirmPassword = request.getParameter("confirmPassword");

        if (!newPassword.equals(confirmPassword)) {
            redirectAttributes.addFlashAttribute("errorMessage", "Passwords do not match.");
            return "redirect:/editUser?email=" + user.getEmail();
        }

        try {
            // Proceed with editing the user
            user.setPassword(newPassword);
            userDAO.editUser(user);
            return "redirect:/userhome";
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("errorMessage", "An error occurred while updating the user.");
            return "redirect:/editUser?email=" + user.getEmail();
        }
    }




    @GetMapping("/deleteUser")
    public String deleteUser(@RequestParam String email, RedirectAttributes redirectAttributes) {
        try {
            userDAO.deleteUser(email);
            redirectAttributes.addFlashAttribute("successMessage", "User deleted successfully.");
            return "redirect:/users/allUsers";
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("errorMessage", "An error occurred while deleting the user.");
            return "redirect:/deleteUser";
        }
    }

	
    @GetMapping("/allUsers")
    public String getAllUsers(Model model) {
        
        List<UserResponseDTO> users= userDAO.getAllusers();

       
        model.addAttribute("users", users);

        
        return "SearchUser"; 
    }
}
