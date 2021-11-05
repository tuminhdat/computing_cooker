package com.csis3275.dao_computingcooker;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;

import com.csis3275.model_computingcooker.recipeRowMapper_computingcooker;
import com.csis3275.model_computingcooker.recipe_model;

@Service
public class recipeDAOImpl {
	// Use JDPTemplate for implementation
		JdbcTemplate jdbcTemplate;

		// SQL Queries
		private final String SQL_CREATE_RECIPE = "INSERT INTO recipes (RecipeTitle, Description, PrepTime, TotalTime, NumServe, Ingredient, Preparation, Author, UserID) "
				+ "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
		private final String SELECT_RECIPE_BY_ID = "SELECT * FROM recipes WHERE RecipeID = ?";
		private final String SQL_UPDATE_RECIPE = "UPDATE recipes SET RecipeTitle = ?, Description = ?, PrepTime = ?, TotalTime = ?, NumServe = ?, Ingredient = ?, Preparation = ?, Author = ?, UserID = ?"
				+ "WHERE RecipeID = ?";


		// Default Constructor
		@Autowired
		public recipeDAOImpl(DataSource dataSource) {
			jdbcTemplate = new JdbcTemplate(dataSource);
		}

		public boolean createUser(recipe_model newRecipe) {
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
		
		@SuppressWarnings("deprecation")
		public boolean getRecipeById(int id) {
			return (jdbcTemplate.queryForObject(SELECT_RECIPE_BY_ID, new Object[] {id}, Integer.class)) > 0;
		}
		
		public boolean updateUserInfo(recipe_model recipe) {
			return jdbcTemplate.update(SQL_UPDATE_RECIPE, 
					recipe.getRecipeTitle(), 
					recipe.getDescription(), 
					recipe.getPrepTime(),
					recipe.getTotalTime(), 
					recipe.getNumServe(), 
					recipe.getIngredient(),
					recipe.getPreparation(),
					recipe.getAuthor(),
					recipe.getUserID(),
					recipe.getRecipeID()) > 0;
		}
}
