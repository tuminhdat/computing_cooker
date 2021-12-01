<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%><!DOCTYPE html>
<html>
<head>
<title>Create Menu</title>
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

	<h1 class="title1">Edit Menu</h1>

	<form action="/menu/edit" method="post" modelAttribute="menu">
		<label for="MenuTitle">Menu Title :</label> <br> <input
			type="text" class="textBox" value="${menu.getMenuTitle()}"
			name="MenuTitle"> <br> <label for="Description">Menu
			Description :</label> <br>

		<textarea class="textBox" name="Description" rows="4">${menu.getDescription()}</textarea>

		<br> <input type="submit" value="Next">
	</form>
</body>
</html>