<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>Create Menu</title>
<style>
.textBox {
	width: 100%;
}

body {
	padding: 10px;
}

.title1 {
	color: #1ecbe1;
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

	<h1 class="title1">Create Menu</h1>

	<form action="/menu/create/addmenu" method="post" modelAttribute="menu">
		<label for="MenuTitle">Menu Title :</label> <br> <input
			type="text" class="textBox" name="MenuTitle"> <br> <label
			for="Description">Menu Description :</label> <br>

		<textarea class="textBox" name="Description" rows="4"></textarea>

		<br> <input type="submit" value="Next">
	</form>
</body>
</html>