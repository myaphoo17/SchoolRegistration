package com.stuReg.controllers;

import org.springframework.beans.factory.annotation.Autowired; import org.springframework.stereotype.Controller; import org.springframework.ui.Model; import org.springframework.validation.BindingResult; import org.springframework.web.bind.annotation.GetMapping; import org.springframework.web.bind.annotation.ModelAttribute; import org.springframework.web.bind.annotation.PostMapping; import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.stuReg.models.UserRequestDTO; import com.stuReg.persistence.UserDAO; import com.stuReg.utils.ResultMessage;

import javax.servlet.http.HttpSession; import javax.validation.Valid;

@Controller public class LoginController {

	@Autowired
	private UserDAO userDAO;

	@GetMapping("/")
	public String showLoginForm(Model model) {
	    model.addAttribute("user", new UserRequestDTO());
	    return "Login"; 
	}

	@PostMapping("/")
	public String login(@Valid @ModelAttribute("user") UserRequestDTO user,
	                    BindingResult bindingResult,
	                    HttpSession session,
	                    RedirectAttributes redirectAttributes) {

	    
	    if (bindingResult.hasErrors()) {
	    	
	        return "Login";
	    }

	    ResultMessage rm = userDAO.login(user);

	    if (rm.getResult() == 0) {
	        return "redirect:/";
	    } else {
	       
	        session.setAttribute("user", user);

	     
	        if (rm.getRole().equalsIgnoreCase("admin")) {
	            return "redirect:/adminhome";
	        } else if (rm.getRole().equalsIgnoreCase("mainadmin")) {
	            return "redirect:/mainadminhome";
	        } else if (rm.getRole().equalsIgnoreCase("user")) {
	            return "redirect:/userhome";
	        }
	    }

	    
	    return "redirect:/";
	}}