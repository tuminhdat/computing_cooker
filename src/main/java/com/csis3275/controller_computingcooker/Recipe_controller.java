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

import com.csis3275.model_computingcooker.*;
import com.csis3275.dao_computingcooker.*;

@Controller
public class Recipe_controller {
	
	@Autowired
	RecipeDAOImpl recipeDAOImpl;
	
	public Recipe_model setupAddForm() {
		return new Recipe_model();
	}
	
	@RequestMapping("/recipe/list")
	public String listRecipes(@ModelAttribute("recipe") Recipe_model createRecipe, Model model,
			HttpSession session) {

		
		ArrayList<Recipe_model> allRecipes = new ArrayList<Recipe_model>();
		
		allRecipes = recipeDAOImpl.getAllRecipes();
		
		ArrayList<String> messages = (ArrayList<String>) session.getAttribute("messages");

		// Add in the messages, if the api is blank.
		model.addAttribute("messages", messages != null ? messages : new ArrayList<String>());

		model.addAttribute("allRecipes", allRecipes);
		// Clear the messages before the returning
		session.removeAttribute("messages");

		// Return the view
		return "allRecipes";
	}
	
	@PostMapping("/recipe/add")
	public String createStudent(@ModelAttribute("recipe") Recipe_model createRecipe, Model model,
			HttpSession session) {
		createRecipe.setAuthor((String) session.getAttribute("userName"));
		
		// Add the student
		recipeDAOImpl.createRecipe(createRecipe);

		// Populate the message into the sesession
		ArrayList<String> messages = new ArrayList<String>();
		messages = session.getAttribute("messages") != null ? (ArrayList<String>) session.getAttribute("messages")
				: new ArrayList<String>();
		
		messages.add("New recipe: " + createRecipe.getRecipeTitle() + ", added by " + createRecipe.getAuthor());
		
		session.setAttribute("messages", messages);

		return "redirect:/recipe/list";
	}
	
	@GetMapping("/recipe/edit/")
	public String editStudent(@RequestParam(required = true) int id, Model model) {

		// Get the student
		Recipe_model updatedRecipe = recipeDAOImpl.getRecipeById(id);
		model.addAttribute("recipe", updatedRecipe);

		return "editRecipe";
	}

	@PostMapping("/recipe/edit/")
	public String updateStudent(@ModelAttribute("recipe") Recipe_model updatedRecipe, Model model, HttpSession session) {

		// Populate the message into the session
		ArrayList<String> messages = new ArrayList<String>();
		messages = session.getAttribute("messages") != null ? (ArrayList<String>) session.getAttribute("messages")
				: new ArrayList<String>();
		messages.add("Updated recipe " + updatedRecipe.getRecipeTitle());
		session.setAttribute("messages", messages);


		recipeDAOImpl.updateRecipe(updatedRecipe);

		// Get a list of students from the controller
		List<Recipe_model> recipes = recipeDAOImpl.getAllRecipes();
		model.addAttribute("recipe", recipes);

		model.addAttribute("message", "Edited recipe " + updatedRecipe.getRecipeTitle() + ", by " + updatedRecipe.getAuthor());

		// We are redirecting to show students so that the GETMapping is executed again
		// because our edit did not add the list of students to the model
		return "redirect:/recipe/list";

	}
}
