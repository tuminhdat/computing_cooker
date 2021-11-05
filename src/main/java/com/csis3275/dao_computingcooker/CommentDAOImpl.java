package com.csis3275.dao_computingcooker;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;

import com.csis3275.model_computingcooker.userRowMapper_computingcooker;
import com.csis3275.model_computingcooker.user_model;

public class CommentDAOImpl {
	// Use JDPTemplate for implementation
		JdbcTemplate jdbcTemplate;
/*
 * CommentID int AUTO_INCREMENT PRIMARY KEY,
	Content varchar(max),
	UserID int,
	RecipeID int,
	MenuID int
 * 
 * 
 * 
 * */
		// SQL Queries
		private final String SQL_CREATE_COMMENT_RECIPE = "INSERT INTO comments (Content, UserID, RecipeID) VALUES (?,?,?)";
		private final String SQL_CREATE_COMMENT_MENU = "INSERT INTO comments (Content, UserID, MenuID) VALUES (?,?,?)";		

		// Default Constructor
		@Autowired
		public CommentDAOImpl(DataSource dataSource) {
			jdbcTemplate = new JdbcTemplate(dataSource);
		}
		
		

}
