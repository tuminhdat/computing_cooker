package com.csis3275.dao_computingcooker;

import java.util.ArrayList;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;

import com.csis3275.model_computingcooker.userRowMapper_computingcooker;
import com.csis3275.model_computingcooker.user_model;

@Service
public class userDAOImpl {

	// Use JDPTemplate for implementation
	JdbcTemplate jdbcTemplate;

	// SQL Queries
	private final String SQL_CREATE_USER = "INSERT INTO users (LastName, FirstName, Age, Email, Description, UserName, UserPassword) VALUES (?, ?, ?, ?, ?, ?, ?)";
	private final String SQL_CHECK_EXIST_USERNAME = "SELECT COUNT (*) FROM users WHERE UserName = ?";

	// Default Constructor
	@Autowired
	public userDAOImpl(DataSource dataSource) {
		jdbcTemplate = new JdbcTemplate(dataSource);
	}

	// Create a new student by passing one in.
	public boolean createUser(user_model newUser) {
		return jdbcTemplate.update(SQL_CREATE_USER, newUser.getLastName(), newUser.getFirstName(), newUser.getAge(),
				newUser.getEmail(), newUser.getDescription(), newUser.getUserName(), newUser.getUserPassword()) > 0;
	}
	
	// Check if username is already exist in database
	public int checkExistUser(String username) {
		int result = jdbcTemplate.queryForObject(SQL_CHECK_EXIST_USERNAME, new Object[] {username}, Integer.class);
		return result;
	}

}
