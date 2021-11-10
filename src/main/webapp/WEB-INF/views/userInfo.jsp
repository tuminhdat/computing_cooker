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
<title>Profile</title>
</head>
<body>
	<table class="table table-striped">
		<tr>
			<th>LastName</th>
			<td>${user.getLastName()}</td>
		</tr>
		<tr>
			<th>FirstName</th>
			<td>${user.getFirstName()}</td>
		</tr>
		<tr>
			<th>Age</th>
			<td>${user.getAge()}</td>
		</tr>
		<tr>
			<th>Email</th>
			<td>${user.getEmail()}</td>
		</tr>
		<tr>
			<th>Description</th>
			<td>${user.getDescription()}</td>
		</tr>
		<tr>
			<th>UserName</th>
			<td>${user.getUserName()}</td>
		</tr>
	</table>

	<form action="/userInfo/editform" method="POST">
		<input type="submit" value="Edit Profile" class="btn btn-success" />
	</form>
	<hr>
	<h1 style="text-align: center">RECIPES - <a href="${pageContext.request.contextPath}/recipe/list"
			class="btn btn-primary">All Recipe List</a></h1>
	
	<h2>
		My recipe <a href="${pageContext.request.contextPath}/recipe/add"
			class="btn btn-primary">Add new recipe</a>
	</h2>

	<table class="table table-striped">
		<thead>
			<th>Recipe Title</th>
			<th>Description</th>
			<th>Author</th>
			<th>Edit</th>
			<th>Delete</th>
		</thead>

		<tbody>
			<!-- Garbage Out!-->
			<c:forEach var="s" items="${userRecipes}">
				<tr>
					<td><a href="${pageContext.request.contextPath}/recipe/view/?id=${s.recipeID}">${s.recipeTitle}</a></td>
					<td>${s.description}</td>
					<td>${s.author}</td>
					<td><a href="${pageContext.request.contextPath}/recipe/edit/?id=${s.recipeID}"
						class="btn btn-info">Edit</a></td>
					<td><a href="${pageContext.request.contextPath}/recipe/delete/?id=${s.recipeID}"
						class="btn btn-danger">Delete</a></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	
	<hr>
	<h2>
		My menu <a href="${pageContext.request.contextPath}/menu/create/menuform"
			class="btn btn-primary">Add new menu</a>
	</h2>
	
	<table class="table table-striped">
		<thead>
			<th>Menu Title</th>
			<th>Edit</th>
			<th>Delete</th>
		</thead>

		<tbody>
			<c:forEach var="m" items="${userMenus}">

				<tr>
					<td><a
						href="${pageContext.request.contextPath}/menu/view/?menuid=${m.getMenuID()}">${m.getMenuTitle()}</a></td>
					<td><a
						href="${pageContext.request.contextPath}/menu/editform/?menuid=${m.getMenuID()}"
						class="btn btn-info">Edit</a></td>
					<td><a
						href="${pageContext.request.contextPath}/menu/delete/?menuid=${m.getMenuID()}"
						class="btn btn-danger">Delete</a></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>

	<form action="/invalidate/session" method="post">
		<input type="submit" value="Log out" class="btn btn-danger" />
	</form>

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