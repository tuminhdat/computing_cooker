package com.csis3275.dao_computingcooker;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;

public class MenuDAOImpl {
	// Use JDPTemplate for implementation
	JdbcTemplate jdbcTemplate;

	// SQL Queries

	// Default Constructor
	@Autowired
	public MenuDAOImpl(DataSource dataSource) {
		jdbcTemplate = new JdbcTemplate(dataSource);
	}
}
