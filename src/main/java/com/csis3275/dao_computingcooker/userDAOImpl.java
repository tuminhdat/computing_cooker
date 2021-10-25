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
	private final String SQL_FIND_USER = "SELECT * FROM users WHERE UserName = ?";

	// Default Constructor
	@Autowired
	public userDAOImpl(DataSource dataSource) {
		jdbcTemplate = new JdbcTemplate(dataSource);
	}

	@SuppressWarnings("deprecation")
	public user_model getUserByUserName(String userName) {
		return jdbcTemplate.queryForObject(SQL_FIND_USER, new Object[] { userName }, new userRowMapper_computingcooker());
	}
}
