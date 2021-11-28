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
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<style>
#myTable {
	border-collapse: collapse;
	width: 100%;
	border: 1px solid #ddd;
	font-size: 18px;
}

#myTable th, #myTable td {
	text-align: left;
	padding: 12px;
}

#myTable tr {
	border-bottom: 1px solid #ddd;
}

#myTable tr.header, #myTable tr:hover {
	background-color: #f1f1f1;
}

body {
	padding: 10px;
}

.title1 {
	color: #1ecbe1;
}

.nav-bar {
	background-color: orange;
	font-size: 30px;
	padding: 30px;
	font-weight: bold;
}

.textBox {
	width: 100%;
}

.myDiv {
  border: 1px solid black;
  padding-left: 10px;
}
</style>
</head>
<body>
	<div class="nav-bar">
		<nav>
			<a href="/userInfo">Profile</a> |
			<!-- <a href="/css/">CSS</a> |
                <a href="/js/">JavaScript</a> |
                <a href="/python/">Python</a> -->
		</nav>
	</div>


	<h1 class="title1">${selectedRecipe.getRecipeTitle()}</h1>

	<h2>${ selectedRecipe.getRecipeTitle()}</h2>

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

	<c:forEach var="s" items="${allComments}">

		<div class="myDiv">
			<a href="${pageContext.request.contextPath}/comment/delete/?id=${s.commentID}" class="btn-close" aria-label="Close"></a>
			<h2>Created by ${s.authorID}</h2>
			<p>${s.content}</p>
		</div>

	</c:forEach>

	<div class="comment-container">
		<form action="/action_page.php">
			<textarea class="textBox" name="w3review" rows="4"></textarea>
			<br> <input type="submit" value="Submit">
		</form>
	</div>
</body>
</html>