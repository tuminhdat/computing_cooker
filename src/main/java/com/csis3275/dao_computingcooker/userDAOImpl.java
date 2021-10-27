package com.csis3275.dao_computingcooker;

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

}
