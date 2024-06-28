package com.decoders.gymManagementSystem.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.decoders.gymManagementSystem.bean.GymUser;
import com.decoders.gymManagementSystem.service.GymUserService;

@RestController
public class LoginController {
	@Autowired
	private BCryptPasswordEncoder bcrypt;
	
	@Autowired
	private GymUserService gymUserService;
	
	@GetMapping("/register")
	public ModelAndView showUserRegisterPage() {
		GymUser user=new GymUser();
		ModelAndView mv=new ModelAndView("newUserRegistration");
		mv.addObject("userRecord", user);
		return mv;
		
	}
	
	@PostMapping("/register")
    public ModelAndView saveUserRegisterPage(@ModelAttribute("userRecord") GymUser user) {
		GymUser gymUser=new GymUser();
		String encodedPassword=bcrypt.encode(user.getPassword());
		gymUser.setFirstName(user.getFirstName());
		gymUser.setLastName(user.getLastName());
		gymUser.setType(user.getType());
		gymUser.setEmail(user.getEmail());
		gymUser.setFirstName(user.getFirstName());
		gymUser.setUsername(user.getUsername());
		gymUser.setPassword(encodedPassword); 
		gymUserService.save(gymUser);
		return new ModelAndView("loginPage");
	
	}
	@GetMapping("/loginpage")
	 public ModelAndView showLoginPage() {
		return new  ModelAndView("loginPage");
	}
	
	@GetMapping("/loginerror")
	 public ModelAndView showLoginErrorPage() {
		return new  ModelAndView("loginErrorPage");
	}

	

	
}
