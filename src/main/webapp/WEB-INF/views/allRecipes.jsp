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

		<c:if test="${ messages !=null }">

			<c:forEach var="message" items="${messages}">

				<div class="alert alert-success fade show" role="alert">${message}</div>

			</c:forEach>

		</c:if>
		<h2>Recipe List</h2>
		<table class="table table-striped">
			<thead>
				<th>Recipe Title</th>
				<th>Description</th>
				<th>Preparation Time</th>
				<th>Total Time</th>
				<th>Num Serve</th>
				<th>Ingredient</th>
				<th>Preparation</th>
				<th>Author</th>
				<th>Delete</th>
				<th>Edit</th>
			</thead>

			<tbody>
				<!-- Garbage Out!-->
				<c:forEach var="s" items="${allRecipes}">

					<tr>
						<td>${s.recipeTitle}</td>
						<td>${s.description}</td>
						<td>${s.prepTime}</td>
						<td>${s.totalTime}</td>
						<td>${s.numServe}</td>
						<td>${s.ingredient}</td>
						<td>${s.preparation}</td>
						<td>${s.author}</td>
						<%
						String userName = (String) session.getAttribute("userName");
						%>
						<c:set var = "userName" value = "<%=userName %>" />
						<c:choose>
							<c:when test="${userName == s.author}">
								<td><a href="${pageContext.request.contextPath}/recipe/delete/?id=${s.recipeID}" class="btn btn-danger">Delete</a></td>
								<td><a href="${pageContext.request.contextPath}/recipe/edit/?id=${s.recipeID}" class="btn btn-success">Edit</a></td>
							</c:when>
							<c:otherwise>
								<td>Invalid</td>
								<td>Invalid</td>
							</c:otherwise>
						</c:choose>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		
		
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


		<a
			href="${pageContext.request.contextPath}/userInfo"
			class="btn btn-primary">Return to user profile</a>

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