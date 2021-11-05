package com.csis3275.model_computingcooker;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

public class CommentRowMapper_computingcooker implements RowMapper<Comment_model> {

	@Override
	public Comment_model mapRow(ResultSet rs, int rowNum) throws SQLException {
		Comment_model userComment = new Comment_model();
		
		userComment.setCommentID(rs.getInt("CommentID"));
		userComment.setContent(rs.getString("Content"));
		userComment.setUserID(rs.getInt("UserID"));
		userComment.setRecipeID(rs.getInt("RecipeID"));
		userComment.setMenuID(rs.getInt("MenuID"));
		
		
		
		return userComment;
	}

}
