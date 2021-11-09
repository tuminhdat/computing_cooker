<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


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
<body>
	<div class="container">

		<h2>Add New Recipe</h2>
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
