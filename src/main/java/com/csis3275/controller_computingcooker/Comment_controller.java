package com.csis3275.controller_computingcooker;

import java.util.ArrayList;
import java.util.List;

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
import com.csis3275.model_computingcooker.Recipe_model;

@Controller
public class Comment_controller {

	@Autowired
	public CommentDAOImpl commentDAOImpl;

	public Comment_model setupAddForm() {
		return new Comment_model();
	}

	@PostMapping("/comment/recipe/add")
	public String createCommentForRecipe(@ModelAttribute("comment") Comment_model createComment, Model model,
			HttpSession session) {

		createComment.setUserID((int) session.getAttribute("userid"));
		createComment.setRecipeID((int) session.getAttribute("recipeID"));
		createComment.setCommentAuthor((String) session.getAttribute("userName"));

		// Add the comment
		commentDAOImpl.createCommentForRecipe(createComment);

		int id = createComment.getRecipeID();

		return "redirect:/recipe/view/?id=" + id;
	}

	@PostMapping("/comment/menu/add")
	public String createCommentForMenu(@ModelAttribute("comment") Comment_model createComment, Model model,
			HttpSession session) {

		createComment.setUserID((int) session.getAttribute("userid"));
		createComment.setMenuID((int) session.getAttribute("menuID"));
		createComment.setCommentAuthor((String) session.getAttribute("userName"));

		// Add the comment
		commentDAOImpl.createCommentForMenu(createComment);

		int id = createComment.getMenuID();

		return "redirect:/menu/view/?menuid=" + id;
	}

	@GetMapping("/comment/recipe/delete")
	public String deleteRecipeComment(@RequestParam(required = true) int id, Model model, HttpSession session) {
		String userName = (String) session.getAttribute("userName");
		if (userName == null) {
			return "redirect:/loginform";
		}
		commentDAOImpl.deleteComment(id);

		int recipeID = (int) session.getAttribute("recipeID");

		return "redirect:/recipe/view/?id=" + recipeID;
	}

	@GetMapping("/comment/menu/delete")
	public String deleteMenuComment(@RequestParam(required = true) int id, Model model, HttpSession session) {
		String userName = (String) session.getAttribute("userName");
		if (userName == null) {
			return "redirect:/loginform";
		}
		commentDAOImpl.deleteComment(id);

		int menuID = (int) session.getAttribute("menuID");

		return "redirect:/menu/view/?menuid=" + menuID;
	}

	@GetMapping("/comment/update")
	public String editCommentForm(@RequestParam(required = true) int id, Model model, HttpSession session) {
		String userName = (String) session.getAttribute("userName");
		if (userName == null) {
			return "redirect:/loginform";
		}
		Comment_model selectedComment = commentDAOImpl.getCommentById(id);
		model.addAttribute("selectedComment", selectedComment);

		return "editComment";
	}

	@PostMapping("/comment/recipe/edit")
	public String updateRecipeComment(@ModelAttribute("selectedComment") Comment_model updatedComment, Model model,
			HttpSession session) {

		commentDAOImpl.updateComment(updatedComment);
		int id = updatedComment.getRecipeID();

		List<Comment_model> comments = commentDAOImpl.getCommentByRecipeID(id);
		model.addAttribute("comment", comments);

		return "redirect:/recipe/view/?id=" + id;

	}

	@PostMapping("/comment/menu/edit")
	public String updateMenuComment(@ModelAttribute("selectedComment") Comment_model updatedComment, Model model,
			HttpSession session) {

		commentDAOImpl.updateComment(updatedComment);
		int id = updatedComment.getMenuID();

		List<Comment_model> comments = commentDAOImpl.getCommentByMenuID(id);
		model.addAttribute("comment", comments);

		return "redirect:/menu/view/?menuid=" + id;

	}
}
