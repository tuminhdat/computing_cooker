package com.csis3275.controller_computingcooker;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.csis3275.dao_computingcooker.CommentDAOImpl;
import com.csis3275.model_computingcooker.Comment_model;

@Controller
public class Comment_controller {
	
	@Autowired
	public CommentDAOImpl commentDAOImpl;

	public Comment_model setupAddForm() {
		return new Comment_model();
	}

	@RequestMapping("/comment/list")
	public String listRecipes(@ModelAttribute("comment") Comment_model createComment, Model model, HttpSession session) {

		ArrayList<Comment_model> allComments = new ArrayList<Comment_model>();

		allComments = commentDAOImpl.getAllComments();

		// Return the viewc
		return "redirect:/recipe/view";
	}
}
