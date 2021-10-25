package com.csis3275.dao_computingcooker;

import java.util.ArrayList;

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
	private final String SQL_GET_ALL_USERS = "SELECT * FROM users";
	private final String SQL_CREATE_USER = "INSERT INTO users (LastName, FirstName, Age, Email, Description, UserName, UserPassword) VALUES (?, ?, ?, ?, ?, ?, ?)";
	private final String SQL_DELETE_USER = "DELETE FROM users WHERE id = ?";
	private final String SQL_UPDATE_USER = "UPDATE users set LastName = ?, FirstName = ?, Age = ?, Email =? , Description = ?, UserName = ?, UserPassword = ? WHERE id = ?";
	
	// Default Constructor
	@Autowired
	public userDAOImpl(DataSource dataSource) {
		jdbcTemplate = new JdbcTemplate(dataSource);
	}
	public ArrayList<user_model> getAllUsers()	{
		//Empty list for the students
		ArrayList<user_model> allUsers = new ArrayList<user_model>();
		
		//Call the JDBCTemplate, assign ASSIGN the results back.
		allUsers = (ArrayList<user_model>) jdbcTemplate.query(SQL_GET_ALL_USERS, new userRowMapper_computingcooker());
		
		return allUsers;
	}
	
	//Create a new student by passing one in.
		public boolean createUser(user_model newUser) {
			return jdbcTemplate.update(SQL_CREATE_USER, 
					newUser.getLastName(),
					newUser.getFirstName(),
					newUser.getAge(),
					newUser.getEmail(),
					newUser.getDescription(),
					newUser.getUserName(),
					newUser.getUserPassword()) > 0;
		}
		
		//Delete Student
		public boolean deleteUser(int id) {
			return jdbcTemplate.update(SQL_DELETE_USER, id) > 0;
		}
		
		//Update the student (based on the given id)
		public boolean updateUser(user_model user) {
			return jdbcTemplate.update(SQL_UPDATE_USER, 
					user.getLastName(),
					user.getFirstName(),
					user.getAge(),
					user.getEmail(),
					user.getDescription(),
					user.getUserName(),
					user.getUserPassword()) > 0;
		}
		
		
		
		
		
}
