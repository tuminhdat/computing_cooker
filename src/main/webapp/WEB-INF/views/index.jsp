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
<title>Home</title>
<style type="text/css">
body {
	padding: 10px;
}

.nav-bar {
	background-color: orange;
	padding: 30px;
	font-weight: bold;
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