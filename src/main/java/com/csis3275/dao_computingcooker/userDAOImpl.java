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
	private final String FIND_USER = "SELECT * FROM users WHERE UserName = ? AND UserPassword = ?";
	private final String CHECK_EXIST_USER = "SELECT COUNT (UserID) FROM users WHERE UserName = ? AND UserPassword = ?";

	// Default Constructor
	@Autowired
	public userDAOImpl(DataSource dataSource) {
		jdbcTemplate = new JdbcTemplate(dataSource);
	}
	
	@SuppressWarnings("deprecation")
	public user_model getUserByUserNamePassword(String userName, String userPassword) {
		user_model user = null;
		int numRecord = jdbcTemplate.queryForObject(CHECK_EXIST_USER, new Object[] {userName, userPassword}, Integer.class);
		if (numRecord > 0) {
			user = jdbcTemplate.queryForObject(FIND_USER, new Object[] {userName, userPassword}, new userRowMapper_computingcooker());
		}	
		return user;
	}

	// Create a new student by passing one in.
	public boolean createUser(user_model newUser) {
		return jdbcTemplate.update(SQL_CREATE_USER, newUser.getLastName(), newUser.getFirstName(), newUser.getAge(),
				newUser.getEmail(), newUser.getDescription(), newUser.getUserName(), newUser.getUserPassword()) > 0;
	}
	
	// Check if username is already exist in database
	@SuppressWarnings("deprecation")
	public int checkExistUser(String username) {
		int result = jdbcTemplate.queryForObject(SQL_CHECK_EXIST_USERNAME, new Object[] {username}, Integer.class);
		return result;
	}

}
