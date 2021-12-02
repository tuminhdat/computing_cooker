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
		Object userName = session.getAttribute("userName");

		if (userName == null) {
			return "redirect:/loginform";
		}
		model.addAttribute("menu", new Menu_model());
		model.addAttribute("titlemessage", session.getAttribute("errorMenuTitle"));
		model.addAttribute("descriptionmessage", session.getAttribute("errorMenuDescription"));
		return "createmenuform";
	}

	@RequestMapping("/menu/create/addmenu")
	public String doAddMenu(@ModelAttribute("menu") Menu_model menu, Model model, HttpSession session) {
		Object userName = session.getAttribute("userName");

		if (userName == null) {
			return "redirect:/loginform";
		}
		boolean error = false;
		if (menu.getMenuTitle().length() == 0) {
			String message = "Please enter Menu Title";
			session.setAttribute("errorMenuTitle", message);
			error = true;
		}
		
		if (menu.getDescription().length() == 0) {
			String message = "Please enter Description";
			session.setAttribute("errorMenuDescription", message);
			error = true;
		}
		
		if (error) {
			return "redirect:/menu/create/menuform";
		}
		
		Integer userID = (Integer) session.getAttribute("userid");
		menu.setUserID(userID);
		menuDAO.createMenu(menu);
		Integer menuID = menuDAO.getMenuByUserIDAndTitle(userID, menu.getMenuTitle()).getMenuID();
		session.setAttribute("currentMenuID", menuID);
		
		session.removeAttribute("errorMenuTitle");
		session.removeAttribute("errorMenuDescription");
		
		return "redirect:/menu/recipe";
	}

	@RequestMapping("/menu/create/recipe/add")
	public String doAddRecipeToMenu(@RequestParam(required = true) int recipeid,
			@RequestParam(required = true) String recipetitle, Model model, HttpSession session) {
		Object userName = session.getAttribute("userName");

		if (userName == null) {
			return "redirect:/loginform";
		}
		Integer menuid = (Integer) session.getAttribute("currentMenuID");
		menuDAO.addRecipeToMenu(recipeid, menuid, recipetitle);
		return "redirect:/menu/recipe";
	}

	@RequestMapping("/menu/create/recipe/delete")
	public String doDeleteRecipeFromMenu(@RequestParam(required = true) int recipeid, Model model,
			HttpSession session) {
		Object userName = session.getAttribute("userName");

		if (userName == null) {
			return "redirect:/loginform";
		}
		Integer menuid = (Integer) session.getAttribute("currentMenuID");
		menuDAO.deleteMenuRecipe(menuid, recipeid);
		return "redirect:/menu/recipe";
	}

	@GetMapping("/menu/recipe")
	public String getAllRecipeInMenu(Model model, HttpSession session) {
		Object userName = session.getAttribute("userName");

		if (userName == null) {
			return "redirect:/loginform";
		}
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
		model.addAttribute("menu", menu);
		model.addAttribute("menuRecipes", menuRecipes);
		return "viewMenu";
	}
	
	@RequestMapping("/menu/delete")
	public String doDeleteMenu(@RequestParam(required = true) int menuid, Model model, HttpSession session) {
		Object userName = session.getAttribute("userName");
		

		if (userName == null) {
			return "redirect:/loginform";
		}
		
		Menu_model menuOwner = menuDAO.getUserIdByMenuId(menuid);
		Integer userID = (Integer) session.getAttribute("userid");
		if (menuOwner.getUserID() != userID) {
			return "redirect:/";
		}
		menuDAO.deleteMenu(menuid);
		return "redirect:/userInfo";
	}
	
	@RequestMapping("/menu/editform")
	public String getEditForm(@RequestParam(required = true) int menuid, Model model, HttpSession session) {
		Menu_model menuOwner = menuDAO.getUserIdByMenuId(menuid);
		Integer userID = (Integer) session.getAttribute("userid");
		if (menuOwner.getUserID() != userID) {
			return "redirect:/";
		}
		session.setAttribute("currentMenuID", menuid);
		Menu_model menu = menuDAO.getMenuByID(menuid);
		model.addAttribute("menu", menu);
		model.addAttribute("titlemessage", session.getAttribute("errorMenuTitle"));
		model.addAttribute("descriptionmessage", session.getAttribute("errorMenuDescription"));
		return "menueditform";
	}
	
	@RequestMapping("/menu/edit")
	public String doEditMenu(@ModelAttribute("menu") Menu_model menu, Model model, HttpSession session) {
		Object userName = session.getAttribute("userName");
		Integer menuid = (Integer) session.getAttribute("currentMenuID");

		if (userName == null) {
			return "redirect:/loginform";
		}
		
		Menu_model menuOwner = menuDAO.getUserIdByMenuId(menuid);
		Integer userID = (Integer) session.getAttribute("userid");
		if (menuOwner.getUserID() != userID) {
			return "redirect:/";
		}
		
		boolean error = false;
		if (menu.getMenuTitle().length() == 0) {
			String message = "Please enter Menu Title";
			session.setAttribute("errorMenuTitle", message);
			error = true;
		}
		
		if (menu.getDescription().length() == 0) {
			String message = "Please enter Description";
			session.setAttribute("errorMenuDescription", message);
			error = true;
		}
		
		if (error) {
			return "redirect:/menu/editform/?menuid=" + menuid;
		}
		
		menuDAO.editMenu(menuid, menu.getMenuTitle(), menu.getDescription());
		
		session.removeAttribute("errorMenuTitle");
		session.removeAttribute("errorMenuDescription");
		
		return "redirect:/menu/recipe";
	}
}
