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

<link rel="stylesheet" type="text/css" href="resources/navBar.css">
</head>
<body>
	<div class="nav-bar">
		<nav style="float: right;">
			<a href="/">Home</a>
			<c:choose>
				<c:when test="${user != null}">
					<div class="dropdown">
						<a href="#">Your Account</a>
						<div class="dropdown-content">
							<a href="/userProfile">Profile</a> <a href="/invalidate/session">Logout</a>
						</div>
					</div>
				</c:when>
				<c:otherwise>
					<a href="/loginform">Login</a>
				</c:otherwise>
			</c:choose>
		</nav>
	</div>


	<div class="container">
		<h1 class="title1">Create Recipe</h1>

		<form:form action="${pageContext.request.contextPath}/recipe/add"
			method="POST" class="form-horizontal" modelAttribute="recipe">

			<div class="mb-3">
				Recipe Title
				<form:input type="text" class="form-control" path="RecipeTitle" required="required"/>
			</div>
			<div class="mb-3">
				Description
				<form:input type="text" class="form-control" path="Description" required="required"/>
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
				<form:input type="text" class="form-control" path="Ingredient" required="required"/>
			</div>
			<div class="mb-3">
				Preparation
				<form:input type="text" class="form-control" path="Preparation" required="required"/>
			</div>
			<form:button type="submit" class="btn btn-primary">Submit</form:button>
		</form:form>
	</div>
</body>
</html>
