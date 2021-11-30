package com.csis3275.model_computingcooker;

public class Comment_model {

	private int CommentID;
	private String Content;
	private int UserID;
	private int RecipeID;
	private int MenuID;
	private String CommentAuthor;

	public int getCommentID() {
		return CommentID;
	}

	public void setCommentID(int commentID) {
		CommentID = commentID;
	}

	public String getContent() {
		return Content;
	}

	public void setContent(String content) {
		Content = content;
	}

	public int getUserID() {
		return UserID;
	}

	public void setUserID(int userID) {
		UserID = userID;
	}

	public int getRecipeID() {
		return RecipeID;
	}

	public void setRecipeID(int recipeID) {
		RecipeID = recipeID;
	}

	public int getMenuID() {
		return MenuID;
	}

	public String getCommentAuthor() {
		return CommentAuthor;
	}

	public void setCommentAuthor(String commentAuthor) {
		CommentAuthor = commentAuthor;
	}

	public void setMenuID(int menuID) {
		MenuID = menuID;
	}

}
