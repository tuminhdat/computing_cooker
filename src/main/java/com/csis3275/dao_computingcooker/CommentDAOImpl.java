package com.csis3275.dao_computingcooker;

import java.util.ArrayList;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;

import com.csis3275.model_computingcooker.Comment_model;
import com.csis3275.model_computingcooker.CommentRowMapper_computingcooker;

@Service
public class CommentDAOImpl {
	JdbcTemplate jdbcTemplate;

	private final String SQL_CREATE_COMMENT_RECIPE = "INSERT INTO comments (Content, UserID, RecipeID, CommentAuthor) VALUES (?,?,?,?)";
	private final String SQL_CREATE_COMMENT_MENU = "INSERT INTO comments (Content, UserID, MenuID, Author) VALUES (?,?,?,?)";
	private final String SQL_GET_ALL_COMMENTS_BY_RECIPEID = "SELECT * FROM comments Where RecipeID = ?";
	private final String SQL_DELETE_COMMENT = "DELETE FROM comments WHERE CommentID = ?";
	private final String SELECT_COMMENT_BY_ID = "SELECT * FROM comment WHERE CommentID = ?";
	private final String SQL_GET_ALL_COMMENTS_BY_MENUID = "SELECT * FROM comments Where MenuID = ?";
	private final String SQL_UPDATE_COMMENT = "UPDATE comment SET Content = ? WHERE CommentID = ?";

	@Autowired
	public CommentDAOImpl(DataSource dataSource) {
		jdbcTemplate = new JdbcTemplate(dataSource);
	}
	
	public ArrayList<Comment_model> getCommentByRecipeID(int recipeID){
		ArrayList<Comment_model> allComments = new ArrayList<Comment_model>();
		allComments = (ArrayList<Comment_model>) jdbcTemplate.query(SQL_GET_ALL_COMMENTS_BY_RECIPEID, new Object[] {recipeID}, new CommentRowMapper_computingcooker());
		return allComments;
	}
	
	public ArrayList<Comment_model> getCommentByMenuID(int menuID){
		ArrayList<Comment_model> allComments = new ArrayList<Comment_model>();
		allComments = (ArrayList<Comment_model>) jdbcTemplate.query(SQL_GET_ALL_COMMENTS_BY_MENUID, new Object[] {menuID}, new CommentRowMapper_computingcooker());
		return allComments;
	}
	
	public boolean createCommentForMenu(Comment_model newComment) {
		return jdbcTemplate.update(SQL_CREATE_COMMENT_MENU, newComment.getContent(), newComment.getUserID(), newComment.getMenuID(), newComment.getCommentAuthor()) > 0;
	}
	
	public boolean createCommentForRecipe(Comment_model newComment) {
		return jdbcTemplate.update(SQL_CREATE_COMMENT_RECIPE, newComment.getContent(), newComment.getUserID(), newComment.getRecipeID(), newComment.getCommentAuthor()) > 0;
	}
	
	public boolean deleteComment(int id) {
		return jdbcTemplate.update(SQL_DELETE_COMMENT, id) > 0;
	}
	
	public boolean updateComment(Comment_model comment) {
		return jdbcTemplate.update(SQL_UPDATE_COMMENT, comment.getContent(), comment.getCommentID()) > 0;
	}
	
	@SuppressWarnings("deprecation")
	public Comment_model getCommentById(int id) {
		return jdbcTemplate.queryForObject(SELECT_COMMENT_BY_ID, new Object[] {id}, new CommentRowMapper_computingcooker());
	}
}
