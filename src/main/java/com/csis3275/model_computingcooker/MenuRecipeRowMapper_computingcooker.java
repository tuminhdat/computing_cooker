package com.csis3275.model_computingcooker;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

public class MenuRecipeRowMapper_computingcooker implements RowMapper<MenuRecipe_model>{

	@Override
	public MenuRecipe_model mapRow(ResultSet rs, int rowNum) throws SQLException {
		// TODO Auto-generated method stub
		MenuRecipe_model menuRecipe = new MenuRecipe_model();
		
		menuRecipe.setMenuID(rs.getInt("MenuID"));
		menuRecipe.setRecipeID(rs.getInt("RecipeID"));
		menuRecipe.setRecipeTitle(rs.getString("RecipeTitle"));
		
		return menuRecipe;
	}

}
