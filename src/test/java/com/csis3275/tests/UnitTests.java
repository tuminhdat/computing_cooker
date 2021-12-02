package com.csis3275.tests;

import static org.junit.jupiter.api.Assertions.*;

import java.util.ArrayList;

import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.csis3275.controller_computingcooker.Search_controller;
import com.csis3275.controller_computingcooker.user_controller;
import com.csis3275.dao_computingcooker.MenuDAOImpl;
import com.csis3275.dao_computingcooker.RecipeDAOImpl;
import com.csis3275.model_computingcooker.Menu_model;
import com.csis3275.model_computingcooker.Recipe_model;
import com.csis3275.model_computingcooker.user_model;

class UnitTests {

//	@BeforeAll
//	static void setUpBeforeClass() throws Exception {
//	}
//
//	@Test
//	void test() {
//		fail("Not yet implemented");
//	}

	user_controller userCon;
	user_model user;
	Menu_model menu;
	Recipe_model recipe;

	// this test will test if the password is encrypt correctly
	@Test
	void testHashPassword() {
		String password = userCon.getMd5("password");
		assertEquals("5f4dcc3b5aa765d61d8327deb882cf99", password);
	}

	// this test will test setter and getter of user first name
	@Test
	void testSetUserModel() {

		user = new user_model();
		user.setFirstName("David");

		assertEquals("David", user.getFirstName());
	}

	// this test will test setter and getter of recipe title
	@Test
	void testSetRecipeModel() {

		recipe = new Recipe_model();
		recipe.setRecipeTitle("Flan");

		assertEquals("Flan", recipe.getRecipeTitle());
	}

	// this test will test setter and getter of menu title
	@Test
	void testSetMenuModel() {

		menu = new Menu_model();
		menu.setMenuTitle("party");

		assertEquals("party", menu.getMenuTitle());
	}

}
