<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>


<!doctype html>
<html lang="en">
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">

<title>Recipe List</title>
</head>
<body>
	<div class="container">
		<h2>My Recipe</h2>
		<table class="table table-striped">
			<tr>
				<th>Recipe Title</th>
				<td>${selectedRecipe.getRecipeTitle()}</td>
			</tr>
			<tr>
				<th>Description</th>
				<td>${selectedRecipe.getDescription()}</td>
			</tr>
			<tr>
				<th>Preparation Time</th>
				<td>${selectedRecipe.getPrepTime()}</td>
			</tr>
			<tr>
				<th>Total Time</th>
				<td>${selectedRecipe.getTotalTime()}</td>
			</tr>
			<tr>
				<th>NumServe</th>
				<td>${selectedRecipe.getNumServe()}</td>
			</tr>
			<tr>
				<th>Ingredient</th>
				<td>${selectedRecipe.getIngredient()}</td>
			</tr>
			<tr>
				<th>Preparation</th>
				<td>${selectedRecipe.getPreparation()}</td>
			</tr>
			
		</table>
		
		<a href="${pageContext.request.contextPath}/userInfo"
			class="btn btn-primary">Return to user profile</a>

		<div class="comment-container">
			<form action="">
				<textarea id="w3review" name="w3review" rows="4"></textarea>
				<br> <input type="submit" value="Submit">
			</form>
		</div>

		<!-- Optional JavaScript; choose one of the two! -->

		<!-- Option 1: Bootstrap Bundle with Popper -->
		<script
			src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
			integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
			crossorigin="anonymous"></script>

		<!-- Option 2: Separate Popper and Bootstrap JS -->
		<!--
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>
    -->
</body>
</html>