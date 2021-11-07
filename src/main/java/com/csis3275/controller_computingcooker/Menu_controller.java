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

import com.csis3275.dao_computingcooker.MenuDAOImpl;
import com.csis3275.model_computingcooker.MenuRecipe_model;
import com.csis3275.model_computingcooker.Menu_model;
import com.csis3275.model_computingcooker.Recipe_model;

@Controller
public class Menu_controller {

	@Autowired
	public MenuDAOImpl menuDAO;

	public Menu_model setupAddForm() {
		return new Menu_model();
	}

	@GetMapping("/menu/create/menuform")
	public String getMenuCreateForm(Model model, HttpSession session) {
		model.addAttribute("menu", new Menu_model());
		return "createmenuform";
	}

	@RequestMapping("/menu/create/addmenu")
	public String doAddMenu(@ModelAttribute("menu") Menu_model menu, Model model, HttpSession session) {
		Integer userID = (Integer) session.getAttribute("userid");
		menu.setUserID(userID);
		menuDAO.createMenu(menu);
		Integer menuID = menuDAO.getMenuByUserIDAndTitle(userID, menu.getMenuTitle()).getMenuID();
		session.setAttribute("currentMenuID", menuID);
		return "redirect:/menu/create/recipe";
	}

	@RequestMapping("/menu/create/recipe/add")
	public String doAddRecipeToMenu(@RequestParam(required = true) int recipeid,
			@RequestParam(required = true) String recipetitle, Model model, HttpSession session) {
		Integer menuid = (Integer) session.getAttribute("currentMenuID");
		menuDAO.addRecipeToMenu(recipeid, menuid, recipetitle);
		return "redirect:/menu/create/recipe";
	}

	@GetMapping("/menu/create/recipe")
	public String getAllRecipeInMenu(Model model, HttpSession session) {
		Integer menuID = (Integer) session.getAttribute("currentMenuID");

		ArrayList<Recipe_model> notAddedRecipe = new ArrayList<Recipe_model>();

		ArrayList<Recipe_model> allRecipes = menuDAO.getAllRecipe();
		ArrayList<MenuRecipe_model> allAddedRecipes = menuDAO.getAllMenuRecipeByMenuID(menuID);

		for (int i = 0; i < allRecipes.size(); i++) {
			int count = 0;
			for (int j = 0; j < allAddedRecipes.size(); j++) {
				if (allRecipes.get(i).getRecipeID() == allAddedRecipes.get(j).getRecipeID()) {
					count++;
				}
			}
			if (count == 0) {
				notAddedRecipe.add(allRecipes.get(i));
			}
		}

		model.addAttribute("allRecipes", notAddedRecipe);
		model.addAttribute("allAddedRecipes", allAddedRecipes);
		return "addrecipetomenuform";
	}

	@GetMapping("/menu/view")
	public String getMenuView(@RequestParam(required = true) int menuid, Model model, HttpSession session) {
		Menu_model menu = menuDAO.getMenuByID(menuid);		
		ArrayList<MenuRecipe_model> menuRecipes = menuDAO.getMenuRecipeByMenuID(menuid);
		
		for (int i = 0; i < menuRecipes.size(); i++) {
			System.out.println(menuRecipes.get(i).getRecipeTitle());
		}
		
		model.addAttribute("menu", menu);
		model.addAttribute("menuRecipes", menuRecipes);
		return "viewMenu";
	}

}
