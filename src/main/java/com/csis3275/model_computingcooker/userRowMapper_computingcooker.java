package com.csis3275.model_computingcooker;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

public class userRowMapper_computingcooker implements RowMapper<user_model>{

	@Override
	public user_model mapRow(ResultSet rs, int rowNum) throws SQLException {
		// TODO Auto-generated method stub
		user_model user = new user_model();
		
		user.setId(rs.getInt("UserID"));
		user.setEmail(rs.getString("Email"));
		user.setFirstName(rs.getString("FirstName"));
		user.setLastName(rs.getString("LastName"));
		user.setAge(rs.getInt("Age"));
		user.setDescription(rs.getString("Description"));
		user.setUserName(rs.getString("UserName"));
		user.setUserPassword(rs.getString("UserPassword"));
		
		return user;
	}
	
}
