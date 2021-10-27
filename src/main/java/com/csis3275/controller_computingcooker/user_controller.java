package com.csis3275.controller_computingcooker;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.web.servlet.server.Session;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.csis3275.dao_computingcooker.userDAOImpl;
import com.csis3275.model_computingcooker.user_model;

@Controller
public class user_controller {
	
	@Autowired
	public userDAOImpl userDAO;
	
	public user_model setupAddForm()	{
		return new user_model();
	}
	
	@GetMapping("/loginform")
	public String loginPage(Model model, HttpSession session) {
		model.addAttribute("message", session.getAttribute("loginmessage"));
		System.out.println(session.getAttribute("loginmessage"));
		model.addAttribute("user", new user_model());
		return "login";
	}
	
	@PostMapping("/login")
	public String doLogin(@ModelAttribute("user") user_model findUser, Model model, HttpSession session) {
		
		user_model currentUser = userDAO.getUserByUserNamePassword(findUser.getUserName(), findUser.getUserPassword());

		if (currentUser == null) {
			model.addAttribute("user", new user_model());
			session.setAttribute("loginmessage", "Your's username or password is invalid");
			return "redirect:/loginform";
		} else {
			session.removeAttribute("loginmessage");
			session.setAttribute("userid", currentUser.getUserID());
			model.addAttribute("message", "Hello " + currentUser.getFirstName() + " " + currentUser.getLastName());
			return "index";
		}
	}
}
