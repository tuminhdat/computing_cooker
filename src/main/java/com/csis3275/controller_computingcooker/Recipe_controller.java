package com.csis3275.controller_computingcooker;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.csis3275.model_computingcooker.*;
import com.csis3275.dao_computingcooker.*;

@Controller
public class Recipe_controller {

	@Autowired
	RecipeDAOImpl recipeDAOImpl;

	@Autowired
	public MenuDAOImpl menuDAO;
	
	@Autowired
	public CommentDAOImpl commentDAO;
	
	public Recipe_model setupAddForm() {
		return new Recipe_model();
	}

	@RequestMapping("/recipe/list")
	public String listRecipes(@ModelAttribute("recipe") Recipe_model createRecipe, Model model, HttpSession session) {
		Object userName = session.getAttribute("userName");

		if (userName == null) {
			return "redirect:/loginform";
		} else {
			ArrayList<Recipe_model> allRecipes = new ArrayList<Recipe_model>();

			allRecipes = recipeDAOImpl.getAllRecipes();

			ArrayList<String> messages = (ArrayList<String>) session.getAttribute("messages");

			// Add in the messages, if the api is blank.
			model.addAttribute("messages", messages != null ? messages : new ArrayList<String>());

			model.addAttribute("allRecipes", allRecipes);
			// Clear the messages before the returning
			session.removeAttribute("messages");

			// Return the viewc
			return "allRecipes";
		}

	}

	@GetMapping("/recipe/add")
	public String addRecipe(Model model) {
		model.addAttribute("recipe", new Recipe_model());

		return "addRecipeForm";
	}

	@PostMapping("/recipe/add")
	public String createRecipe(@ModelAttribute("recipe") Recipe_model createRecipe, Model model, HttpSession session) {

		createRecipe.setAuthor((String) session.getAttribute("userName"));
		createRecipe.setUserID((int) session.getAttribute("userid"));

		// Add the recipe
		recipeDAOImpl.createRecipe(createRecipe);

		// Populate the message into the sesession
		ArrayList<String> messages = new ArrayList<String>();
		messages = session.getAttribute("messages") != null ? (ArrayList<String>) session.getAttribute("messages")
				: new ArrayList<String>();

		messages.add("New recipe: " + createRecipe.getRecipeTitle() + ", added by " + createRecipe.getAuthor());

		session.setAttribute("messages", messages);

		return "redirect:/userInfo";
	}

	@GetMapping("/recipe/edit/")
	public String editRecipeForm(@RequestParam(required = true) int id, Model model) {

		Recipe_model updatedRecipe = recipeDAOImpl.getRecipeById(id);
		model.addAttribute("recipe", updatedRecipe);

		return "editRecipe";
	}

	@PostMapping("/recipe/edit/")
	public String updateRecipe(@ModelAttribute("recipe") Recipe_model updatedRecipe, Model model, HttpSession session) {

		// Populate the message into the session
		ArrayList<String> messages = new ArrayList<String>();
		messages = session.getAttribute("messages") != null ? (ArrayList<String>) session.getAttribute("messages")
				: new ArrayList<String>();
		messages.add("Updated recipe " + updatedRecipe.getRecipeTitle());
		session.setAttribute("messages", messages);

		recipeDAOImpl.updateRecipe(updatedRecipe);
		menuDAO.editMenuRecipeTitle(updatedRecipe.getRecipeID(), updatedRecipe.getRecipeTitle());

		// Get a list of recipes from the controller
		List<Recipe_model> recipes = recipeDAOImpl.getAllRecipes();
		model.addAttribute("recipe", recipes);

		model.addAttribute("message",
				"Edited recipe " + updatedRecipe.getRecipeTitle() + ", by " + updatedRecipe.getAuthor());

		return "redirect:/userInfo";

	}

	@GetMapping("/recipe/delete/")
	public String deleteRecipe(@RequestParam(required = true) int id, Model model, HttpSession session) {

		Recipe_model recipe = recipeDAOImpl.getRecipeById(id);
		String recipeTitle = recipe.getRecipeTitle();
		recipeDAOImpl.deleteRecipe(id);
		menuDAO.deleteRecipe(id);

		// Populate the message into the sesession
		ArrayList<String> messages = new ArrayList<String>();
		messages = session.getAttribute("messages") != null ? (ArrayList<String>) session.getAttribute("messages")
				: new ArrayList<String>();
		messages.add("Deleted recipe " + recipeTitle);
		session.setAttribute("messages", messages);

		return "redirect:/userInfo";
	}

	@GetMapping("/recipe/view/")
	public String viewRecipe(@RequestParam(required = true) int id, Model model, HttpSession session) {

		Object userName = session.getAttribute("userName");

		if (userName == null) {
			return "redirect:/loginform";
		} else {
			session.setAttribute("recipeID", id);
			
			Recipe_model selectedRecipe = recipeDAOImpl.getRecipeById(id);
			model.addAttribute("selectedRecipe", selectedRecipe);
			
			Integer userID = (Integer) session.getAttribute("userid");
			
			ArrayList<Comment_model> allComments = new ArrayList<Comment_model>();
			allComments = commentDAO.getCommentByRecipeID(id);			
			model.addAttribute("allComments", allComments);
			
			model.addAttribute("comment", new Comment_model());
			
			return "viewRecipe";
		}

	}
}
