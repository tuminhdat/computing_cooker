package com.csis3275.controller_computingcooker;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.csis3275.dao_computingcooker.CommentDAOImpl;
import com.csis3275.model_computingcooker.Comment_model;

@Controller
public class Comment_controller {
	
	@Autowired
	public CommentDAOImpl commentDAOImpl;

	public Comment_model setupAddForm() {
		return new Comment_model();
	}
	
	@PostMapping("/comment/recipe/add")
	public String createCommentForRecipe(@ModelAttribute("comment") Comment_model createComment, Model model, HttpSession session) {
		
		createComment.setUserID((int) session.getAttribute("userid"));
		createComment.setRecipeID((int) session.getAttribute("recipeID"));
		
		
		// Add the comment
		commentDAOImpl.createCommentForRecipe(createComment);
		
		int id = createComment.getRecipeID();
		
		return "redirect:/recipe/view/?id=" + id;
	}
	
	@PostMapping("/comment/menu/add")
	public String createCommentForMenu(@ModelAttribute("comment") Comment_model createComment, Model model, HttpSession session) {
		
		createComment.setUserID((int) session.getAttribute("userid"));
		createComment.setMenuID((int) session.getAttribute("menuID"));
		
		
		// Add the comment
		commentDAOImpl.createCommentForMenu(createComment);
		
		int id = createComment.getMenuID();
		
		return "redirect:/menu/view/?menuid=" + id;
	}
	
	@GetMapping("/comment/recipe/delete")
	public String deleteRecipeComment(@RequestParam(required = true) int id, Model model, HttpSession session) {
		
		commentDAOImpl.deleteComment(id);
		
		int recipeID = (int) session.getAttribute("recipeID");
		
		return "redirect:/recipe/view/?id=" + recipeID;
	}
	
	@GetMapping("/comment/menu/delete")
	public String deleteMenuComment(@RequestParam(required = true) int id, Model model, HttpSession session) {
		
		commentDAOImpl.deleteComment(id);
		
		int menuID = (int) session.getAttribute("menuID");
		
		return "redirect:/menu/view/?menuid=" + menuID;
	}
}
