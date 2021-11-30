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

.flex-container {
	display: flex;
	width: 50%;
}

.flex-container>div {
	background-color: #f1f1f1;
}

.comment-content {
	padding: 10px;
	width: 50%;
}

.content {
	width: 100%;
	word-break: break-word;
}

.dropdown {
	position: relative;
	display: inline-block;
	height: 1%;
}

.dropdown-content {
	display: none;
	position: absolute;
	background-color: #f1f1f1;
	min-width: 160px;
	box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.2);
	z-index: 1;
}

.dropdown-content a {
	color: black;
	padding: 12px 16px;
	text-decoration: none;
	display: block;
}

.dropdown-content a:hover {
	background-color: #ddd;
}

.dropdown:hover .dropdown-content {
	display: block;
}
</style>
</head>
<body>
	<div class="nav-bar">
		<nav>
			<a href="/userInfo">Profile</a> |
		</nav>
	</div>


	<h1 class="title1">${selectedRecipe.getRecipeTitle()}</h1>

	<table class="table table-striped">
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

	<h3>Comments</h3>

	<c:forEach var="s" items="${allComments}">

		<div class="flex-container">
			<div class="comment-content">
				<p>
					<strong>${s.commentAuthor}</strong>
				</p>
				<p class="content">${s.content}</p>
			</div>
			<div class="dropdown">
				<button style="border: none;">
					<strong>...</strong>
				</button>
				<div class="dropdown-content">
					<a
						href="${pageContext.request.contextPath}/comment/recipe/delete/?id=${s.commentID}">Delete</a>
					<a
						href="${pageContext.request.contextPath}/comment/update/?id=${s.commentID}">Edit</a>
				</div>
			</div>
		</div>

	</c:forEach>

	<div class="comment-container">
		<form:form
			action="${pageContext.request.contextPath}/comment/recipe/add"
			method="POST" class="form-horizontal" modelAttribute="comment">
			<form:input type="text" class="form-control" path="Content" />
			<form:button type="submit" class="btn btn-primary">Submit</form:button>
		</form:form>
	</div>
</body>
</html>