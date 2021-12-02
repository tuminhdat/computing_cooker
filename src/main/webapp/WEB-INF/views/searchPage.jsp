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
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<style>
body {
	padding: 10px;
}

.nav-bar {
	background-color: orange;
	font-size: 30px;
	padding: 30px;
	font-weight: bold;
}

#linkbar {
	float: left;
}

#item {
	margin-left: 10px;
}
</style>
</head>
<body>
	<div class="nav-bar">
		<nav id="linkbar">
			<c:if test="${ userLogin !=null }">
				<a href="/userInfo">Profile</a> |
			</c:if>

			<c:if test="${ userLogin == null }">
				<a href="/loginform">Login</a> |
			</c:if>
		</nav>
		<form action="/searching" method="GET" class="form-horizontal">
			<input type="text" id="item" placeholder="Search for... " name="item">
			<button type="submit">Search</button>
		</form>
	</div>

	<table class="table table-striped">
		<thead>
			<th>There is <span>${numResult}</span> result
			</th>
		</thead>
		<tbody>
			<c:forEach var="s" items="${allRecipes}">
				<tr>
					<td><a
						href="${pageContext.request.contextPath}/recipe/view/?id=${s.recipeID}">${s.recipeTitle}</a></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>

</body>
</html>