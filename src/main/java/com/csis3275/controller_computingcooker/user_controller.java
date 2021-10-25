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
	userDAOImpl userDAOImpl;
	
	public user_model setupAddForm() {
		
		return new user_model();
	}
	
	@RequestMapping("/users/list")
	public String showUsers(@ModelAttribute("user")user_model createUser, Model model,HttpSession session) 
	{
		
		ArrayList<user_model> allUsers = userDAOImpl.getAllUsers();
		
		ArrayList<String> messages = (ArrayList<String>) session.getAttribute("messages");
		
		// Add in the messages, if the api is blank.
		model.addAttribute("messages", messages != null ? messages : new ArrayList<String>());
		
		model.addAttribute("allUsers", allUsers);
		
		// Clear the messages before the returning
		session.removeAttribute("messages");
		
		// Return the view
		return "index";
	}
	
	
	@PostMapping("/users/create")
	public String createUsers(@ModelAttribute("user")user_model createUser, Model model,HttpSession session) {
		
		// Add the student
		userDAOImpl.createUser(createUser);
		// Populate the message into the sesession
		ArrayList<String> messages = new ArrayList<String>();
		messages = session.getAttribute("messages") != null ? (ArrayList<String>) session.getAttribute("messages")
				: new ArrayList<String>();
		
		messages.add("Created User " + createUser.getFirstName());

		session.setAttribute("messages", messages);
		
		return "redirect:/users/list";
	}
	
	
	// Get the student and display the form
		@GetMapping("/students/delete/")
		public String deleteStudent(@RequestParam(required = true) int id, Model model, HttpSession session) {

			// Get the student
			userDAOImpl.deleteUser(id);

			// Populate the message into the sesession
			ArrayList<String> messages = new ArrayList<String>();
			messages = session.getAttribute("messages") != null ? (ArrayList<String>) session.getAttribute("messages")
					: new ArrayList<String>();
			messages.add("Deleted User " + id);
			session.setAttribute("messages", messages);

			return "redirect:/users/list";
		}
	
	
	
	
	
	
	
	
	
	
	
	
	
}
































