package com.csis3275.controller_computingcooker;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.csis3275.dao_computingcooker.MenuDAOImpl;
import com.csis3275.dao_computingcooker.RecipeDAOImpl;
import com.csis3275.model_computingcooker.Recipe_model;

public class Search_controller {
	@Autowired
	public RecipeDAOImpl recipeDAOImpl;

	@Autowired
	public MenuDAOImpl menuDAO;
	
	public Search_controller setupAddForm() {
		return new Search_controller();
	}
	
	@GetMapping("/search")
	public String doSearch(@RequestParam(required = true) String searchitem, Model model, HttpSession session) {
		
		System.out.println("******************");
		System.out.println(searchitem);
		System.out.println("******************");

		model.addAttribute("allRecipes", implementSearch(searchitem));
		model.addAttribute("userLogin", session.getAttribute("userid"));
		
		return "index";
	}
	
	public ArrayList<Recipe_model> implementSearch(String input){
		ArrayList<Recipe_model> recipes = recipeDAOImpl.getAllRecipes();
		
		ArrayList<Recipe_model> searchedRecipes = new ArrayList<Recipe_model>();
		
		String[] splited = input.split("\\s+");
		
		for (int i = 0; i < recipes.size(); i++) {
			for (int j = 0; j < splited.length; j++) {
				boolean isFound = recipes.get(i).getIngredient().contains(splited[j]);
				if (isFound) {
					searchedRecipes.add(recipes.get(i));
				}
			}
		}
		
		return searchedRecipes;
	}
}
