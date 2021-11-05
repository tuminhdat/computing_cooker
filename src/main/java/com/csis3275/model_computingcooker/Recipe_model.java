package com.csis3275.model_computingcooker;

public class Recipe_model {
	private int recipeID;
	private String recipeTitle;
	private String description;
	private int prepTime;
	private int totalTime;
	private int numServe;
	private String ingredient;
	private String preparation;
	private String author;
	private int userID;

	public int getRecipeID() {
		return recipeID;
	}

	public void setRecipeID(int recipeID) {
		this.recipeID = recipeID;
	}

	public String getRecipeTitle() {
		return recipeTitle;
	}

	public void setRecipeTitle(String recipeTitle) {
		this.recipeTitle = recipeTitle;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public int getPrepTime() {
		return prepTime;
	}

	public void setPrepTime(int prepTime) {
		this.prepTime = prepTime;
	}

	public int getTotalTime() {
		return totalTime;
	}

	public void setTotalTime(int totalTime) {
		this.totalTime = totalTime;
	}

	public int getNumServe() {
		return numServe;
	}

	public void setNumServe(int numServe) {
		this.numServe = numServe;
	}

	public String getIngredient() {
		return ingredient;
	}

	public void setIngredient(String ingredient) {
		this.ingredient = ingredient;
	}

	public String getPreparation() {
		return preparation;
	}

	public void setPreparation(String preparation) {
		this.preparation = preparation;
	}

	public String getAuthor() {
		return author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	public int getUserID() {
		return userID;
	}

	public void setUserID(int userID) {
		this.userID = userID;
	}

}
