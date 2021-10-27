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
	private final String SQL_FIND_USER = "SELECT * FROM users WHERE UserName = ? AND UserPassword = ?";
	private final String SQL_CHECK_USER_EXIST = "SELECT COUNT (*) FROM users WHERE UserName = ?";
	private final String SQL_UPDATE_USER_PROFILE = "UPDATE users SET LastName = ?, FirstName = ?, Age = ?, Email = ?, Description = ? WHERE UserName = ? AND UserPassword = ?";

	// Default Constructor
	@Autowired
	public userDAOImpl(DataSource dataSource) {
		jdbcTemplate = new JdbcTemplate(dataSource);
	}

	@SuppressWarnings("deprecation")
	public user_model getUserByUserNamePassword(String userName, String password) {
		return jdbcTemplate.queryForObject(SQL_FIND_USER, new Object[] { userName, password },
				new userRowMapper_computingcooker());
	}

	@SuppressWarnings("deprecation")
	public int checkExistUser(String userName) {
		return jdbcTemplate.queryForObject(SQL_CHECK_USER_EXIST, new Object[] { userName }, Integer.class);
	}

	public boolean updateUserInfo(user_model user) {
		return jdbcTemplate.update(SQL_UPDATE_USER_PROFILE, user.getLastName(), user.getFirstName(), user.getAge(),
				user.getEmail(), user.getDescription(), user.getUserName(), user.getUserPassword()) > 0;
	}
}
