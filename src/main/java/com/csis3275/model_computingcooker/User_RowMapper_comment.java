package com.csis3275.model_computingcooker;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

public class User_RowMapper_comment implements RowMapper<User_model_comment> {

	@Override
	public User_model_comment mapRow(ResultSet rs, int rowNum) throws SQLException {
		User_model_comment userComment = new User_model_comment();
		
		userComment.setCommentID(rs.getInt("CommentID"));
		userComment.setContent(rs.getString("Content"));
		userComment.setUserID(rs.getInt("UserID"));
		userComment.setRecipeID(rs.getInt("RecipeID"));
		userComment.setMenuID(rs.getInt("MenuID"));
		
		
		
		return userComment;
	}

}
