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
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
	integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
	crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
	integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
	crossorigin="anonymous"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
	integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
	crossorigin="anonymous"></script>
<title>Home</title>
</head>
<body>
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
		<a class="navbar-brand" href="/">Computing Cooker</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav mr-auto">
				<c:choose>
					<c:when test="${user == null}">
						<li class="nav-item"><a class="nav-link" href="/loginform">Login</a></li>
					</c:when>
					<c:otherwise>
						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
							role="button" data-toggle="dropdown" aria-haspopup="true"
							aria-expanded="false"> Your Account </a>
							<div class="dropdown-menu" aria-labelledby="navbarDropdown">
								<a class="dropdown-item" href="/userProfile">Profile</a> <a
									class="dropdown-item" href="/invalidate/session">Logout</a>
							</div></li>
					</c:otherwise>
				</c:choose>
			</ul>
			<form class="form-inline my-2 my-lg-0">
				<input class="form-control mr-sm-2" type="search"
					placeholder="Search" aria-label="Search">
				<button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
			</form>
		</div>
	</nav>


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
				<th>Author</th>
			</thead>

			<tbody>
				<!-- Garbage Out!-->
				<c:forEach var="s" items="${allRecipes}">

					<tr>
						<td><a
							href="${pageContext.request.contextPath}/recipe/view/?id=${s.recipeID}">${s.recipeTitle}</a></td>
						<td>${s.description}</td>
						<td>${s.author}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<hr>
		<h2>Menu List</h2>
		<table class="table table-striped">
			<thead>
				<th>Menu Title</th>
				<th>Description</th>
			</thead>

			<tbody>
				<!-- Garbage Out!-->
				<c:forEach var="m" items="${allMenus}">

					<tr>
						<td><a
							href="${pageContext.request.contextPath}/menu/view/?menuid=${m.getMenuID()}">${m.getMenuTitle()}</a></td>
						<td>${m.description}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</body>
</html>