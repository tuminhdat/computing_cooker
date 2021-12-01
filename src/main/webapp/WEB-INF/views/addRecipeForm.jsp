<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>Create Recipe</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">

<style type="text/css">
body {
	padding: 10px;
}

.nav-bar {
	background-color: orange;
	padding: 30px;
	font-weight: bold;
}

.title1 {
	color: #1ecbe1;
}

.error {
	color: red;
	font-style: italics;
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
			<a href="">Profile</a> |
			<!-- <a href="/css/">CSS</a> |
                <a href="/js/">JavaScript</a> |
                <a href="/python/">Python</a> -->
		</nav>
	</div>


	<div class="container">
		<h1 class="title1">Create Recipe</h1>

		<form:form action="${pageContext.request.contextPath}/recipe/add"
			method="POST" class="form-horizontal" modelAttribute="recipe">

			<div class="mb-3">
				Recipe Title
				<form:input type="text" class="form-control" path="RecipeTitle" />
			</div>
			<div class="mb-3">
				Description
				<form:input type="text" class="form-control" path="Description" />
			</div>
			<div class="mb-3">
				Preparation Time
				<form:input type="number" class="form-control" path="PrepTime" />
			</div>
			<div class="mb-3">
				Total Time
				<form:input type="number" class="form-control" path="TotalTime" />
			</div>
			<div class="mb-3">
				NumServe
				<form:input type="number" class="form-control" path="NumServe" />
			</div>
			<div class="mb-3">
				Ingredient
				<form:input type="text" class="form-control" path="Ingredient" />
			</div>
			<div class="mb-3">
				Preparation
				<form:input type="text" class="form-control" path="Preparation" />
			</div>
			<form:button type="submit" class="btn btn-primary">Submit</form:button>
		</form:form>
	</div>
</body>
</html>
