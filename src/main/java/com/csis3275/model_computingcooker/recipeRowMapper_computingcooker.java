package com.csis3275.model_computingcooker;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

public class recipeRowMapper_computingcooker implements RowMapper<recipe_model> {
	
	@Override
	public recipe_model mapRow(ResultSet rs, int rowNum) throws SQLException {
		// TODO Auto-generated method stub
		recipe_model recipe = new recipe_model();
		
		recipe.setRecipeID(rs.getInt("RecipeID"));
		recipe.setRecipeTitle(rs.getString("RecipeTitle"));
		recipe.setDescription(rs.getString("Description"));
		recipe.setPrepTime(rs.getInt("PrepTime"));
		recipe.setTotalTime(rs.getInt("TotalTime"));
		recipe.setNumServe(rs.getInt("NumServe"));
		recipe.setIngredient(rs.getString("Ingredient"));
		recipe.setPreparation(rs.getString("Preparation"));
		recipe.setAuthor(rs.getString("Author"));
		recipe.setUserID(rs.getInt("UserID"));
		
		return recipe;
	}
}
