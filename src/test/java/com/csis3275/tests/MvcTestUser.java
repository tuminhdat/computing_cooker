package com.csis3275.tests;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.WebMvcTest;
import org.springframework.http.MediaType;
import org.springframework.test.context.junit.jupiter.SpringExtension;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;

import com.csis3275.controller_computingcooker.user_controller;
import com.csis3275.dao_computingcooker.userDAOImpl;
import com.csis3275.model_computingcooker.user_model;

@ExtendWith(SpringExtension.class)
@WebMvcTest(user_controller.class)
class MvcTestUser {
	
	@Autowired
	private MockMvc mvc;
	
	public user_controller user = new user_controller();

//	@BeforeAll
//	static void setUpBeforeClass() throws Exception {
//
//	}

//	@AfterAll
//	static void tearDownAfterClass() throws Exception {
//	}

//	@BeforeEach
//	void setUp() throws Exception {
//	}

//	@AfterEach
//	void tearDown() throws Exception {
//	}

//	@Test
//	void test() {
//		fail("Not yet implemented");
//	}
	
	@Test
	public void TestViewHomePage() throws Exception{
		mvc.perform(MockMvcRequestBuilders
				.get("/")
				.accept(MediaType.TEXT_HTML))
		.andExpect(status().isOk());
//		.andExpect(model().attributeExists("userLogin"))
//		.andExpect(model().attribute("userLogin", null))
//		.andExpect(MockMvcResultMatchers.view().name("index"));
	}
}
