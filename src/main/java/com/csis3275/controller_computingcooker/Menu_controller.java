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

import com.csis3275.dao_computingcooker.CommentDAOImpl;
import com.csis3275.dao_computingcooker.MenuDAOImpl;
import com.csis3275.model_computingcooker.Comment_model;
import com.csis3275.model_computingcooker.MenuRecipe_model;
import com.csis3275.model_computingcooker.Menu_model;
import com.csis3275.model_computingcooker.Recipe_model;

@Controller
public class Menu_controller {

	@Autowired
	public MenuDAOImpl menuDAO;
	
	@Autowired
	public CommentDAOImpl commentDAO;

	public Menu_model setupAddForm() {
		return new Menu_model();
	}
	
	@RequestMapping("/userProfile/menu/list")
	public String listMenu(@ModelAttribute("menu") Menu_model createMenu, Model model, HttpSession session) {
		Integer userID = (Integer) session.getAttribute("userid");
		
		ArrayList<Menu_model> userMenus = new ArrayList<Menu_model>();
		userMenus = menuDAO.getAllUserMenu(userID);
		model.addAttribute("userMenus", userMenus);
		session.removeAttribute("currentMenuID");
		
		String userName = (String) session.getAttribute("userName");
		model.addAttribute("user", userName);

		// Return the view
		return "myMenus";
	}
	
	@GetMapping("/menu/create/menuform")
	public String getMenuCreateForm(Model model, HttpSession session) {
		String userName = (String) session.getAttribute("userName");
		model.addAttribute("user", userName);
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
		return "redirect:/menu/recipe";
	}

	@RequestMapping("/menu/create/recipe/add")
	public String doAddRecipeToMenu(@RequestParam(required = true) int recipeid,
			@RequestParam(required = true) String recipetitle, Model model, HttpSession session) {
		Integer menuid = (Integer) session.getAttribute("currentMenuID");
		menuDAO.addRecipeToMenu(recipeid, menuid, recipetitle);
		return "redirect:/menu/recipe";
	}

	@RequestMapping("/menu/create/recipe/delete")
	public String doDeleteRecipeFromMenu(@RequestParam(required = true) int recipeid, Model model,
			HttpSession session) {
		Integer menuid = (Integer) session.getAttribute("currentMenuID");
		menuDAO.deleteMenuRecipe(menuid, recipeid);
		return "redirect:/menu/recipe";
	}

	@GetMapping("/menu/recipe")
	public String getAllRecipeInMenu(Model model, HttpSession session) {
		String userName = (String) session.getAttribute("userName");
		model.addAttribute("user", userName);
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
		session.setAttribute("menuID", menuid);
		Menu_model menu = menuDAO.getMenuByID(menuid);
		ArrayList<MenuRecipe_model> menuRecipes = menuDAO.getMenuRecipeByMenuID(menuid);
		model.addAttribute("menu", menu);
		model.addAttribute("menuRecipes", menuRecipes);
		
		Integer userID = (Integer) session.getAttribute("userid");
		model.addAttribute("user", userID);
		
		ArrayList<Comment_model> allComments = new ArrayList<Comment_model>();
		allComments = commentDAO.getCommentByMenuID(menuid);			
		model.addAttribute("allComments", allComments);
		
		model.addAttribute("comment", new Comment_model());
		
		return "viewMenu";
	}
	
	@RequestMapping("/menu/delete")
	public String doDeleteMenu(@RequestParam(required = true) int menuid, Model model, HttpSession session) {
		menuDAO.deleteMenu(menuid);
		commentDAO.deleteCommentMenu(menuid);
		return "redirect:/userProfile/menu/list";
	}
	
	@RequestMapping("/menu/editform")
	public String getEditForm(@RequestParam(required = true) int menuid, Model model, HttpSession session) {
		String userName = (String) session.getAttribute("userName");
		model.addAttribute("user", userName);
		session.setAttribute("currentMenuID", menuid);
		Menu_model menu = menuDAO.getMenuByID(menuid);
		model.addAttribute("menu", menu);
		return "menueditform";
	}
	
	@RequestMapping("/menu/edit")
	public String doEditMenu(@ModelAttribute("menu") Menu_model menu, Model model, HttpSession session) {
		Integer menuid = (Integer) session.getAttribute("currentMenuID");
		menuDAO.editMenu(menuid, menu.getMenuTitle(), menu.getDescription());
		return "redirect:/menu/recipe";
	}
}
