package com.csis3275.model_computingcooker;

public class Menu_model {
	private int MenuID;
	private int UserID;
	private String MenuTitle;
	private String Description;

	public int getUserID() {
		return UserID;
	}

	public void setUserID(int userID) {
		UserID = userID;
	}

	public int getMenuID() {
		return MenuID;
	}

	public void setMenuID(int menuID) {
		MenuID = menuID;
	}

	public String getMenuTitle() {
		return MenuTitle;
	}

	public void setMenuTitle(String menuTitle) {
		MenuTitle = menuTitle;
	}

	public String getDescription() {
		return Description;
	}

	public void setDescription(String description) {
		Description = description;
	}

}
