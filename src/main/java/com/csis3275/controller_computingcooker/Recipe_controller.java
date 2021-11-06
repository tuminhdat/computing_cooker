package com.csis3275.controller_computingcooker;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

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
	public String listRequests(@ModelAttribute("request") Recipe_model createRequest, Model model,
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

}
