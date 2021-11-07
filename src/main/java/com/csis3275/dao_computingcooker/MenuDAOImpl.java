package com.csis3275.dao_computingcooker;

import java.util.ArrayList;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;

import com.csis3275.model_computingcooker.MenuRecipeRowMapper_computingcooker;
import com.csis3275.model_computingcooker.MenuRecipe_model;
import com.csis3275.model_computingcooker.MenuRowMapper_computingcooker;
import com.csis3275.model_computingcooker.Menu_model;
import com.csis3275.model_computingcooker.RecipeRowMapper_computingcooker;
import com.csis3275.model_computingcooker.Recipe_model;

@Service
public class MenuDAOImpl {
	
	// Use JDPTemplate for implementation
	JdbcTemplate jdbcTemplate;

	// SQL Queries
	private final String SQL_CREATE_MENU = "INSERT INTO menus (MenuTitle, UserID, Description) VALUES (?, ?, ?)";
	private final String SQL_GET_ALL_RECIPE = "SELECT * FROM recipes";
	private final String SQL_ADD_MENU_RECIPE = "INSERT INTO menurecipe (RecipeID, MenuID, RecipeTitle) VALUES (?, ?, ?)";
	private final String SQL_GET_MENURECIPE_BY_ID = "SELECT * FROM menurecipe WHERE MenuID = ?";
	private final String SQL_GET_MENU_BY_TITLE_USERID = "SELECT * FROM menus WHERE MenuTitle = ? AND UserID = ?";
	private final String SQL_GET_ALL_MENU_BY_USERID = "SELECT * FROM menus WHERE UserID = ?";
	private final String SQL_GET_MENU_RECIPE_BY_MENUID = "SELECT * FROM menurecipe WHERE MenuID = ?";
	private final String SQL_GET_MENU_BY_MENUID = "SELECT * FROM menus WHERE MenuID = ?";

	

	// Default Constructor
	@Autowired
	public MenuDAOImpl(DataSource dataSource) {
		jdbcTemplate = new JdbcTemplate(dataSource);
	}
	
	public boolean createMenu(Menu_model newMenu) {
		return jdbcTemplate.update(SQL_CREATE_MENU, newMenu.getMenuTitle(), newMenu.getUserID(), newMenu.getDescription()) > 0;
	}
	
	public ArrayList<Recipe_model> getAllRecipe() {
		ArrayList<Recipe_model> allRecipes = new ArrayList<Recipe_model>();
		allRecipes = (ArrayList<Recipe_model>) jdbcTemplate.query(SQL_GET_ALL_RECIPE, new RecipeRowMapper_computingcooker());
		return allRecipes;
	}
	
	public boolean addRecipeToMenu(int recipeID, int menuID, String RecipeTitle) {
		return jdbcTemplate.update(SQL_ADD_MENU_RECIPE, recipeID, menuID, RecipeTitle) > 0;
	}
	
	public ArrayList<MenuRecipe_model> getAllMenuRecipeByMenuID(int menuID){
		ArrayList<MenuRecipe_model> menuRecipe = new ArrayList<MenuRecipe_model>();
		menuRecipe = (ArrayList<MenuRecipe_model>) jdbcTemplate.query(SQL_GET_MENURECIPE_BY_ID, new Object[] {menuID}, new MenuRecipeRowMapper_computingcooker());
		return menuRecipe;
	}
	
	public Menu_model getMenuByUserIDAndTitle(int userID, String title) {
		Menu_model menu = new Menu_model();
		menu = jdbcTemplate.queryForObject(SQL_GET_MENU_BY_TITLE_USERID, new Object[] {title, userID}, new MenuRowMapper_computingcooker());
		return menu;
	}
	
	public ArrayList<Menu_model> getAllUserMenu(int userID){
		ArrayList<Menu_model> userMenu = new ArrayList<Menu_model>();
		userMenu = (ArrayList<Menu_model>) jdbcTemplate.query(SQL_GET_ALL_MENU_BY_USERID, new Object[] {userID}, new MenuRowMapper_computingcooker());
		return userMenu;
	}
	
	public Menu_model getMenuByID(int menuID) {
		return jdbcTemplate.queryForObject(SQL_GET_MENU_BY_MENUID, new Object[] {menuID}, new MenuRowMapper_computingcooker());
	}
	
	public ArrayList<MenuRecipe_model> getMenuRecipeByMenuID(int menuID) {
		ArrayList<MenuRecipe_model> menuRecipe = new ArrayList<MenuRecipe_model>();
		menuRecipe = (ArrayList<MenuRecipe_model>) jdbcTemplate.query(SQL_GET_MENU_RECIPE_BY_MENUID, new Object[] {menuID}, new MenuRecipeRowMapper_computingcooker());
		return menuRecipe;
	}
}
