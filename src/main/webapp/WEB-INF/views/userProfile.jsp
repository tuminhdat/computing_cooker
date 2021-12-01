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
<link rel="stylesheet" type="text/css" href="resources/navBar.css">
<title>Profile</title>
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

	<div class="card-deck">
		<div class="card">
			<div class="card-body">
				<h5 class="card-title">User Information</h5>
				<p class="card-text">View and update user information (name,
					userName, age, and gender).</p>
			</div>
			<div class="card-footer">
				<a href="/userInfo">Information</a>
			</div>
		</div>
		<div class="card">
			<div class="card-body">
				<h5 class="card-title">My Menu</h5>
				<p class="card-text">View, edit or delete your menus.</p>
			</div>
			<div class="card-footer">
				<a href="/userProfile/menu/list">Menu List</a>
			</div>
		</div>
		<div class="card">
			<div class="card-body">
				<h5 class="card-title">My Recipe</h5>
				<p class="card-text">View, edit or delete your recipes.</p>
			</div>
			<div class="card-footer">
				<a href="/userProfile/recipe/list">Recipe List</a>
			</div>
		</div>
	</div>

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