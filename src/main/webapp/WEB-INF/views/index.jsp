<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!doctype html>
<html lang="en">
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
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
</style>
</head>
<body>
	<div class="nav-bar">
		<nav>
			<c:if test="${ userLogin !=null }">
				<a href="/userInfo">Profile</a> |
			</c:if>

			<c:if test="${ userLogin == null }">
				<a href="/loginform">Login</a> |
			</c:if>
		</nav>
	</div>
	<form action="/search" method="GET" class="form-horizontal" >
		<input type="text" id="searchitem" placeholder="Search for... "
			name="searchitem">
		<button type="submit" class="btn btn-primary">Submit</button>
	</form>
	
	<table class="table table-striped">
			<thead>
				<th>Recipe Title</th>
				<th>Description</th>
				<th>Author</th>
				<th>View</th>
			</thead>

			<tbody>
				<!-- Garbage Out!-->
				<c:forEach var="s" items="${allRecipes}">

					<tr>
						<td>${s.recipeTitle}</td>
						<td>${s.description}</td>
						<td>${s.author}</td>
						<td><a href="${pageContext.request.contextPath}/recipe/view/?id=${s.recipeID}" class="btn btn-primary">View</a></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	
</body>
</html>