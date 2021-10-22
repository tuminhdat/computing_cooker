package com.csis3275.model_computingcooker;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

public class userRowMapper_computingcooker implements RowMapper<user_model>{

	@Override
	public user_model mapRow(ResultSet rs, int rowNum) throws SQLException {
		// TODO Auto-generated method stub
		user_model user = new user_model();
		
//		user.setId(rs.getInt("id"));
//		user.setEmail(rs.getString("email"));
//		user.setName(rs.getString("name"));
		
		return user;
	}
	
}
