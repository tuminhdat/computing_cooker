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
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
	crossorigin="anonymous"></script>
<title>Profile</title>
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
							<li class="nav-item"><a class="nav-link"
								href="/invalidate/session">Logout</a></li>
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

	<h2>Your Account</h2>
	<div class="card-deck">
		<div class="card border-dark mb-3">
			<div class="card-body">
				<h5 class="card-title">User Information</h5>
				<p class="card-text">View and update user information (name,
					userName, age, and gender).</p>
			</div>
			<div class="card-footer">
				<a href="/userInfo">Information</a>
			</div>
		</div>
		<div class="card border-dark mb-3">
			<div class="card-body">
				<h5 class="card-title">My Menu</h5>
				<p class="card-text">View, edit or delete your menus.</p>
			</div>
			<div class="card-footer">
				<a href="/userProfile/menu/list">Menu List</a>
			</div>
		</div>
		<div class="card border-dark mb-3">
			<div class="card-body">
				<h5 class="card-title">My Recipe</h5>
				<p class="card-text">View, edit or delete your recipes.</p>
			</div>
			<div class="card-footer">
				<a href="/userProfile/recipe/list">Recipe List</a>
			</div>
		</div>
	</div>
</body>
</html>