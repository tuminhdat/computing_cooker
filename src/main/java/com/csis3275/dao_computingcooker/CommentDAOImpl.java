package com.csis3275.dao_computingcooker;

import java.util.ArrayList;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;

import com.csis3275.model_computingcooker.Comment_model;
import com.csis3275.model_computingcooker.CommentRowMapper_computingcooker;

public class CommentDAOImpl {
	JdbcTemplate jdbcTemplate;

	private final String SQL_CREATE_COMMENT_RECIPE = "INSERT INTO comments (Content, UserID, RecipeID) VALUES (?,?,?)";
	private final String SQL_CREATE_COMMENT_MENU = "INSERT INTO comments (Content, UserID, MenuID) VALUES (?,?,?)";
	private final String SQL_GET_ALL_COMMENTS = "SELECT * FROM comments";

	@Autowired
	public CommentDAOImpl(DataSource dataSource) {
		jdbcTemplate = new JdbcTemplate(dataSource);
	}
	
	public ArrayList<Comment_model> getAllComments()	{
		ArrayList<Comment_model> allComments = new ArrayList<Comment_model>();
		
		allComments = (ArrayList<Comment_model>) jdbcTemplate.query(SQL_GET_ALL_COMMENTS, new CommentRowMapper_computingcooker());
		
		return allComments;
	}
	
	public boolean createCommentForMenu(Comment_model newComment) {
		return jdbcTemplate.update(SQL_CREATE_COMMENT_MENU, newComment.getContent(), newComment.getUserID(), newComment.getMenuID()) > 0;
	}
	
	public boolean createCommentForRecipe(Comment_model newComment) {
		return jdbcTemplate.update(SQL_CREATE_COMMENT_RECIPE, newComment.getContent(), newComment.getUserID(), newComment.getRecipeID()) > 0;
	}
}
