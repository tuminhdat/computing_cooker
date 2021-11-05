package com.csis3275.model_computingcooker;

public class MenuRecipe_model {
	private int RecipeID;
	private int MenuID;
	private String RecipeTitle;

	public int getRecipeID() {
		return RecipeID;
	}

	public void setRecipeID(int recipeID) {
		RecipeID = recipeID;
	}

	public int getMenuID() {
		return MenuID;
	}

	public void setMenuID(int menuID) {
		MenuID = menuID;
	}

	public String getRecipeTitle() {
		return RecipeTitle;
	}

	public void setRecipeTitle(String recipeTitle) {
		RecipeTitle = recipeTitle;
	}

}
