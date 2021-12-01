<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>Create Recipe</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
	crossorigin="anonymous"></script>
<link rel="stylesheet" type="text/css" href="resources/navBar.css">
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


	<div class="container">
		<h1 class="title1">Create Recipe</h1>
		<p>(*) - Required Information</p>
		<form:form action="${pageContext.request.contextPath}/recipe/add"
			method="POST" class="form-horizontal" modelAttribute="recipe">

			<div class="mb-3">
				Recipe Title (*)
				<form:input type="text" class="form-control" path="RecipeTitle"
					required="required" />
			</div>
			<div class="mb-3">
				Description (*)
				<form:input type="text" class="form-control" path="Description"
					required="required" />
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
				Ingredient (*)
				<form:input type="text" class="form-control" path="Ingredient"
					required="required" />
			</div>
			<div class="mb-3">
				Preparation (*)
				<form:input type="text" class="form-control" path="Preparation"
					required="required" />
			</div>
			<form:button type="submit" class="btn btn-primary">Submit</form:button>
		</form:form>
	</div>
</body>
</html>
