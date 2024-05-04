package com.stuReg.controllers;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.stuReg.models.UserRequestDTO;
import com.stuReg.models.UserResponseDTO;
import com.stuReg.persistence.UserDAO;


@Controller
@RequestMapping("/admin")
public class AdminController {

    @Autowired
    private UserDAO userDAO;

    @GetMapping("/addAdmin")
    public String showAddAdminForm(@ModelAttribute UserRequestDTO admin) {
        return "AddAdmin";
    }

    @PostMapping("/addAdmin")
    public String addAdmin(@ModelAttribute UserRequestDTO admin, RedirectAttributes redirectAttributes) {
        try {
          
            userDAO.addUser(admin);
            redirectAttributes.addFlashAttribute("successMessage", "Admin added successfully.");
            return "redirect:/admin/allAdmins";
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("errorMessage", "An error occurred while adding the admin.");
            return "redirect:/admin/addAdmins";
        }
    }

    @GetMapping("/deleteAdmin")
    public String deleteAdmin(@RequestParam String email, RedirectAttributes redirectAttributes) {
        try {
            userDAO.deleteUser(email);
            redirectAttributes.addFlashAttribute("successMessage", "Admin deleted successfully.");
            return "redirect:/admin/allAdmins";
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("errorMessage", "An error occurred while deleting the admin.");
            return "redirect:/admin/allAdmins";
        }
    }

    @GetMapping("/allAdmins")
    public String getAllAdmins(Model model) {
        List<UserResponseDTO> admins = userDAO.getAllAdmins();
        model.addAttribute("admins", admins);
        return "SearchAdmin";
    }
}
