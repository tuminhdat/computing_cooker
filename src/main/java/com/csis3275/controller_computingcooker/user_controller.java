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

import com.csis3275.dao_computingcooker.MenuDAOImpl;
import com.csis3275.dao_computingcooker.userDAOImpl;
import com.csis3275.model_computingcooker.Menu_model;
import com.csis3275.model_computingcooker.user_model;
import com.csis3275.dao_computingcooker.*;
import java.security.MessageDigest;

import com.csis3275.model_computingcooker.*;

@Controller
public class user_controller {

	@Autowired
	public userDAOImpl userDAO;

	public user_model setupAddForm() {
		return new user_model();
	}

	@Autowired
	public MenuDAOImpl menuDAO;

	@Autowired
	public RecipeDAOImpl recipeDAO;

	public Recipe_model setupAddRecipeForm() {
		return new Recipe_model();
	}

	@GetMapping("/")
	public String startPage(Model model, HttpSession session) {
		ArrayList<Menu_model> allMenus = new ArrayList<Menu_model>();
		allMenus = menuDAO.getAllMenu();
		model.addAttribute("allMenus", allMenus);

		ArrayList<Recipe_model> allRecipes = new ArrayList<Recipe_model>();
		allRecipes = recipeDAO.getAllRecipes();
		model.addAttribute("allRecipes", allRecipes);

		String userName = (String) session.getAttribute("userName");
		model.addAttribute("user", userName);

		return "index";
	}

	@GetMapping("/loginform")
	public String loginPage(Model model, HttpSession session) {
		model.addAttribute("message", session.getAttribute("loginmessage"));
		model.addAttribute("user", new user_model());
		return "login";
	}

	@PostMapping("/login")
	public String doLogin(@ModelAttribute("user") user_model findUser, Model model, HttpSession session) {

		String password = getMd5(findUser.getUserPassword());

		user_model currentUser = userDAO.getUserByUserNamePassword(findUser.getUserName(), password);

		if (currentUser == null) {
			model.addAttribute("user", new user_model());
			session.setAttribute("loginmessage", "Your's username or password is invalid");
			return "redirect:/loginform";
		} else {
			session.removeAttribute("loginmessage");
			session.setAttribute("userid", currentUser.getUserID());
			session.setAttribute("userName", currentUser.getUserName());
			session.setAttribute("password", getMd5(findUser.getUserPassword()));
			model.addAttribute("message", "Hello " + currentUser.getFirstName() + " " + currentUser.getLastName());
			return "redirect:/";
		}
	}
	
	@GetMapping("/userProfile")
	public String showUser(Model model, HttpSession session) {
		String userName = (String) session.getAttribute("userName");
		String password = (String) session.getAttribute("password");

		if (userName.equals("") || password.equals("")) {
			return "redirect:/";
		} else {
			if (userDAO.checkExistUser(userName) > 0) {
				model.addAttribute("user", userName);
				return "userProfile";

			} else {
				return "redirect:/loginform";
			}

		}
	}
	
	@GetMapping("/userInfo")
	public String showUserInfo(Model model, HttpSession session) {

		String userName = (String) session.getAttribute("userName");
		String password = (String) session.getAttribute("password");

		if (userName.equals("") || password.equals("")) {
			return "redirect:/";
		} else {
			if (userDAO.checkExistUser(userName) > 0) {
				user_model user = userDAO.getUserByUserNamePassword(userName, password);
				model.addAttribute("user", user);

				Integer userID = (Integer) session.getAttribute("userid");

				ArrayList<Menu_model> userMenus = new ArrayList<Menu_model>();
				userMenus = menuDAO.getAllUserMenu(userID);
				model.addAttribute("userMenus", userMenus);
				session.removeAttribute("currentMenuID");

				ArrayList<Recipe_model> userRecipes = new ArrayList<Recipe_model>();
				userRecipes = recipeDAO.getAllUserRecipe(userID);
				model.addAttribute("userRecipes", userRecipes);

				return "userInfo";

			} else {
				return "redirect:/loginform";
			}

		}
	}

	@RequestMapping("/register")
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
		if (userDAO.checkExistUser(createUser.getUserName()) > 0) {
			session.setAttribute("loginmessage",
					"You indicated you are a new customer, but an account already exists with the userName "
							+ String.format("<b>%s</b>", createUser.getUserName()));
			return "redirect:/register";
		}

		createUser.setUserPassword(getMd5(createUser.getUserPassword()));
		userDAO.createUser(createUser);
		session.removeAttribute("loginmessage");
		return "redirect:/loginform";
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

	@GetMapping("/invalidate/session")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
}
