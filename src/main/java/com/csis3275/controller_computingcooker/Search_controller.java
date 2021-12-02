package com.csis3275.controller_computingcooker;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.csis3275.dao_computingcooker.MenuDAOImpl;
import com.csis3275.dao_computingcooker.RecipeDAOImpl;
import com.csis3275.model_computingcooker.Recipe_model;

@Controller
public class Search_controller {
	@Autowired
	public RecipeDAOImpl recipeDAOImpl;

	@Autowired
	public MenuDAOImpl menuDAO;
	
	public Search_controller setupAddForm() {
		return new Search_controller();
	}
	
	@GetMapping("/searching")
	public String doSearch(@RequestParam(name="item", required = true) String item, Model model, HttpSession session) {
		String userName = (String) session.getAttribute("userName");
		model.addAttribute("user", userName);
		if (item.length() == 0) {
			model.addAttribute("allRecipes", null);
			model.addAttribute("numResult", 0);
		} else {
			model.addAttribute("allRecipes", implementSearch(item));
			model.addAttribute("numResult", implementSearch(item).size());
		}

		return "searchPage";
	}
	
	public ArrayList<Recipe_model> implementSearch(String input){
		
		if (input.length() == 0) {
			return null;
		}
		
		ArrayList<Recipe_model> recipes = recipeDAOImpl.getAllRecipes();
		
		ArrayList<Recipe_model> searchedRecipes = new ArrayList<Recipe_model>();
		
		String[] splited = input.split("\\s+");
		
		for (int i = 0; i < recipes.size(); i++) {
			for (int j = 0; j < splited.length; j++) {
				boolean isFoundIngredient = recipes.get(i).getIngredient().toLowerCase().contains(splited[j].toLowerCase());
				boolean isFoundTitle = recipes.get(i).getRecipeTitle().toLowerCase().contains(splited[j].toLowerCase());

				if (isFoundIngredient || isFoundTitle) {
					searchedRecipes.add(recipes.get(i));
				}
			}
		}
		
		return searchedRecipes;
	}
}