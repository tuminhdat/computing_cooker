package com.csis3275.controller_computingcooker;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.csis3275.dao_computingcooker.userDAOImpl;
import com.csis3275.model_computingcooker.user_model;

@Controller
public class user_controller {
	@Autowired
	userDAOImpl userDAO;

	@GetMapping("/userInfo")
	public String showUser(Model model, HttpSession session) {
		
		String userName = (String) session.getAttribute("userName");
		String password = (String) session.getAttribute("password");
		
		if (userName.equals("") || password.equals("")) {
			return "redirect:/login";
		} 
		else {
			user_model user = userDAO.getUserByUserName(userName);
			if (user != null) {
				ArrayList<user_model> users = new ArrayList<user_model>();
				users.add(user);
				model.addAttribute("users", users);
				return "userInfo";
			}
			else {
				return "redirect:/login";
			}
		}
	}
	
	@RequestMapping("/")
	public String home(@ModelAttribute("user") user_model createStudent, Model model, HttpSession session) {
		return "login";
	}
	
	@PostMapping("/login")
	public String login(@ModelAttribute("user") user_model createStudent, HttpSession session) {
		session.setAttribute("userName", createStudent.getUserName());
		session.setAttribute("password", createStudent.getUserPassword());
		return "redirect:/userInfo";
	}

	@PostMapping("/invalidate/session")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/login";
	}
}
