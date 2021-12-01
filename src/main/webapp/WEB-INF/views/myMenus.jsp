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
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
	crossorigin="anonymous"></script>

<title>Recipe List</title>
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
							<li class="nav-item"><a class="nav-link"
								href="${pageContext.request.contextPath}/menu/create/menuform">Add
									Menu</a></li>
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

		<h2 style="text-align: center">MY MENUS</h2>

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
	</div>
</body>
</html>