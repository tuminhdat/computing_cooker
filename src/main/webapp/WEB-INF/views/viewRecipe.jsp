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
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
	crossorigin="anonymous"></script>
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
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
		<div class="container-fluid">
			<a class="navbar-brand" href="/">Computing Cooker</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav me-auto mb-2 mb-lg-0">
					<c:choose>
						<c:when test="${user == null}">
							<li class="nav-item"><a class="nav-link" href="/loginform">Login</a></li>
						</c:when>
						<c:otherwise>
							<li class="nav-item dropdown"><a
								class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
								role="button" data-bs-toggle="dropdown" aria-expanded="false">
									Your Account </a>
								<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
									<li><a class="dropdown-item" href="/userProfile">Profile</a></li>
									<li><a class="dropdown-item" href="/invalidate/session">Logout</a></li>
								</ul></li>
						</c:otherwise>
					</c:choose>
				</ul>
				<form class="d-flex" action="/searching" method="GET">
					<input class="form-control me-2" type="search" placeholder="Search"
						aria-label="Search" id="item" name="item">
					<button class="btn btn-outline-success" type="submit">Search</button>
				</form>
			</div>
		</div>
	</nav>

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
			<c:choose>
				<c:when test="${s.commentAuthor == user}">
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
				</c:when>
				<c:otherwise>
					<c:if test="${selectedRecipe.getAuthor() == user}">
						<div class="dropdown">
							<a
								href="${pageContext.request.contextPath}/comment/recipe/delete/?id=${s.commentID}"
								class="btn-close" aria-label="Close"></a>
						</div>
					</c:if>
				</c:otherwise>
			</c:choose>
		</div>

	</c:forEach>

	<c:if test="${user != null}">
		<div class="comment-container">
			<form:form
				action="${pageContext.request.contextPath}/comment/recipe/add"
				method="POST" class="form-horizontal" modelAttribute="comment">
				<form:input type="text" class="form-control" path="Content" />
				<form:button type="submit" class="btn btn-primary">Submit</form:button>
			</form:form>
		</div>
	</c:if>
</body>
</html>