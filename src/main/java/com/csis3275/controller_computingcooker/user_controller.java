package com.csis3275.controller_computingcooker;

import java.math.BigInteger;
import java.security.NoSuchAlgorithmException;
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

// for key

import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

@Controller
public class user_controller {
	@Autowired
	userDAOImpl userDAOImpl;

	public user_model setupAddForm() {

		return new user_model();
	}

	@RequestMapping("/")
	public String showUsers(Model model, HttpSession session) {
		model.addAttribute("user", new user_model());
		model.addAttribute("loginmessage", session.getAttribute("loginmessage"));
		model.addAttribute("passwordmessage", session.getAttribute("passwordmessage"));
		model.addAttribute("usernamemessage", session.getAttribute("usernamemessage"));
		session.removeAttribute("loginmessage");
		session.removeAttribute("passwordmessage");
		session.removeAttribute("usernamemessage");
		return "registration";
	}

	@PostMapping("/users/create")
	public String createUsers(@ModelAttribute("user") user_model createUser, Model model, HttpSession session) {

		// to make key as hashing key
		
		// Add the student

		if (userDAOImpl.checkExistUser(createUser.getUserName()) > 0) {
			session.setAttribute("loginmessage", "UserName is already exist.");
			
			
			return "redirect:/";
		}
		if (createUser.getUserPassword() == null || createUser.getUserPassword().isEmpty()) {
			session.setAttribute("passwordmessage", "Your password cannot be empty");
			return "redirect:/";
		}
		if (createUser.getUserName() == null || createUser.getUserName().isEmpty()) {
			session.setAttribute("usernamemessage", "Your UserName cannot be empty");
			return "redirect:/";
		}
		createUser.setUserPassword(getMd5(createUser.getUserPassword()));
		userDAOImpl.createUser(createUser);
		session.removeAttribute("loginmessage");

		return "index";
	}

	// hashing key
	public static String getMd5(String input) {
		try {

			// Static getInstance method is called with hashing MD5
			MessageDigest md = MessageDigest.getInstance("MD5");

			// digest() method is called to calculate message digest
			// of an input digest() return array of byte
			byte[] messageDigest = md.digest(input.getBytes());

			// Convert byte array into signum representation
			BigInteger no = new BigInteger(1, messageDigest);

			// Convert message digest into hex value
			String hashtext = no.toString(16);
			while (hashtext.length() < 32) {
				hashtext = "0" + hashtext;
			}
			return hashtext;
		}

		// For specifying wrong message digest algorithms
		catch (NoSuchAlgorithmException e) {
			throw new RuntimeException(e);
		}
	}

}
