package com.csis3275.controller_computingcooker;

import java.util.ArrayList;
import java.util.List;

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
			return "redirect:/";
		} else {
			if (userDAO.checkExistUser(userName) > 0) {
				user_model user = userDAO.getUserByUserNamePassword(userName, password);
				model.addAttribute("user", user);
				return "userInfo";

			} else {
				return "redirect:/";
			}

		}
	}

	@RequestMapping("/")
	public String home(@ModelAttribute("user") user_model createStudent, Model model, HttpSession session) {
		return "login";
	}

	@PostMapping("/login")
	public String login(@ModelAttribute("user") user_model createUser, Model model, HttpSession session) {
		session.setAttribute("userName", createUser.getUserName());
		session.setAttribute("password", createUser.getUserPassword());
		session.setAttribute("email", createUser.getEmail());
		return "redirect:/userInfo";
	}

	@PostMapping("/userInfo/editform")
	public String getEditform(Model model, HttpSession session) {
		String userName = (String) session.getAttribute("userName");
		String password = (String) session.getAttribute("password");
		model.addAttribute("user", userDAO.getUserByUserNamePassword(userName, password));
		return "editform";
	}

	@PostMapping("/userInfo/edit")
	public String editUserInfo(@ModelAttribute("user") user_model user, Model model, HttpSession session) {
		String userName = (String) session.getAttribute("userName");
		String password = (String) session.getAttribute("password");

		user.setUserName(userName);
		user.setUserPassword(password);

		userDAO.updateUserInfo(user);

		model.addAttribute("user", user);

		return "redirect:/userInfo";
	}

	@PostMapping("/invalidate/session")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
}
