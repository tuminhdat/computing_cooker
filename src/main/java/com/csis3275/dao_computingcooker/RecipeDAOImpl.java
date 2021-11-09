package com.csis3275.dao_computingcooker;

import java.util.ArrayList;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;

import com.csis3275.model_computingcooker.RecipeRowMapper_computingcooker;
import com.csis3275.model_computingcooker.Recipe_model;

@Service
public class RecipeDAOImpl {
	// Use JDPTemplate for implementation
		JdbcTemplate jdbcTemplate;

		// SQL Queries
		private final String SQL_GET_ALL_RECIPES = "SELECT * FROM recipes";
		private final String SQL_CREATE_RECIPE = "INSERT INTO recipes (RecipeTitle, Description, PrepTime, TotalTime, NumServe, Ingredient, Preparation, Author, UserID) "
				+ "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
		private final String SELECT_RECIPE_BY_ID = "SELECT * FROM recipes WHERE RecipeID = ?";
		private final String SQL_UPDATE_RECIPE = "UPDATE recipes SET RecipeTitle = ?, Description = ?, PrepTime = ?, TotalTime = ?, NumServe = ?, Ingredient = ?, Preparation = ?"
				+ "WHERE RecipeID = ?";
		private final String SQL_DELETE_RECIPE = "DELETE FROM recipes WHERE RecipeID = ?";
		private final String SQL_GET_ALL_RECIPE_BY_USERID = "SELECT * FROM recipes WHERE UserID = ?";



		// Default Constructor
		@Autowired
		public RecipeDAOImpl(DataSource dataSource) {
			jdbcTemplate = new JdbcTemplate(dataSource);
		}
		
		public ArrayList<Recipe_model> getAllRecipes()	{
			ArrayList<Recipe_model> allRecipes = new ArrayList<Recipe_model>();
			
			allRecipes = (ArrayList<Recipe_model>) jdbcTemplate.query(SQL_GET_ALL_RECIPES, new RecipeRowMapper_computingcooker());
			
			return allRecipes;
		}
		
		public boolean createRecipe(Recipe_model newRecipe) {
			return jdbcTemplate.update(SQL_CREATE_RECIPE, 
					newRecipe.getRecipeTitle(), 
					newRecipe.getDescription(), 
					newRecipe.getPrepTime(),
					newRecipe.getTotalTime(), 
					newRecipe.getNumServe(), 
					newRecipe.getIngredient(),
					newRecipe.getPreparation(),
					newRecipe.getAuthor(),
					newRecipe.getUserID()) > 0;
		}
		
		public boolean deleteRecipe(int id) {
			return jdbcTemplate.update(SQL_DELETE_RECIPE, id) > 0;
		}
		
		@SuppressWarnings("deprecation")
		public Recipe_model getRecipeById(int id) {
			return jdbcTemplate.queryForObject(SELECT_RECIPE_BY_ID, new Object[] {id}, new RecipeRowMapper_computingcooker());
		}
		
		public boolean updateRecipe(Recipe_model recipe) {
			return jdbcTemplate.update(SQL_UPDATE_RECIPE, 
					recipe.getRecipeTitle(), 
					recipe.getDescription(), 
					recipe.getPrepTime(),
					recipe.getTotalTime(), 
					recipe.getNumServe(), 
					recipe.getIngredient(),
					recipe.getPreparation(),
					recipe.getRecipeID()) > 0;
		}
		
		public ArrayList<Recipe_model> getAllUserRecipe(int userID){
			ArrayList<Recipe_model> userRecipe = new ArrayList<Recipe_model>();
			userRecipe = (ArrayList<Recipe_model>) jdbcTemplate.query(SQL_GET_ALL_RECIPE_BY_USERID, new Object[] {userID}, new RecipeRowMapper_computingcooker());
			return userRecipe;
		}

}
