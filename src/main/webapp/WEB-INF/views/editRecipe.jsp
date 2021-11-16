<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html><h
tml>
<head>
<title>Create Recipe</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<style>
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
	
	<div class="container">
		<h1 class="title1">Edit Recipe - ${recipe.getRecipeTitle()}</h1>
		
		<form:form action="${pageContext.request.contextPath}/recipe/edit/"
			cssClass="form-horizontal" method="post" modelAttribute="recipe">
			
			<form:input type="hidden" name="RecipeID" value="${recipe.getRecipeID()}" path="RecipeID" />
			
			<div class="mb-3">
				Recipe Title
				<form:input type="text" name="RecipeTitle" class="form-control" value="${recipe.getRecipeTitle()}" path="RecipeTitle" />
			</div>
			
			<div class="mb-3">
				Description
				<form:input type="text" name="Description" class="form-control" value="${recipe.getDescription()}" path="Description" />
			</div>
			
			<div class="mb-3">
				Preparation Time
				<form:input type="number" name="PrepTime" class="form-control" value="${recipe.getPrepTime()}" path="PrepTime" />
			</div>

			<div class="mb-3">
				Total Time
				<form:input type="Number" name="TotalTime" class="form-control" value="${recipe.getTotalTime()}" path="TotalTime" />
			</div>
			
			<div class="mb-3">
				NumServe
				<form:input type="number" name="NumServe" class="form-control" value="${recipe.getNumServe()}" path="NumServe" />
			</div>
			
			<div class="mb-3">
				Ingredient
				<form:input type="text" name="Ingredient" class="form-control" value="${recipe.getIngredient()}" path="Ingredient" />
			</div>
			
			<div class="mb-3">
				Preparation
				<form:input type="text" name="Preparation" class="form-control" value="${recipe.getPreparation()}" path="Preparation" />
			</div>
			<form:button type="submit" class="btn btn-primary">Submit</form:button>
		</form:form>
	</div>
</body>
</html>