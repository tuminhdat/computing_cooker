<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!doctype html>
<html lang="en">
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="resources/navBar.css">
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


	<h1 class="title1">${menu.getMenuTitle()}</h1>

	<h2>${ menu.getDescription()}</h2>

	<table id="myTable">
		<tr class="header">
			<th style="width: 100%;">Recipe Title</th>
		</tr>
		<c:forEach var="s" items="${menuRecipes}">

			<tr>
				<td><a
					href="${pageContext.request.contextPath}/recipe/view/?id=${s.getRecipeID()}">${s.getRecipeTitle()}</a></td>
			</tr>
		</c:forEach>
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
				<c:when test="${s.userID == user}">
					<div class="dropdown">
						<button style="border: none;">
							<strong>...</strong>
						</button>
						<div class="dropdown-content">
							<a
								href="${pageContext.request.contextPath}/comment/menu/delete/?id=${s.commentID}">Delete</a>
							<a
								href="${pageContext.request.contextPath}/comment/update/?id=${s.commentID}">Edit</a>
						</div>
					</div>
				</c:when>
				<c:otherwise>
					<c:if test="${user == menu.getUserID()}">
						<a
							href="${pageContext.request.contextPath}/comment/menu/delete/?id=${s.commentID}"
							class="btn-close" aria-label="Close"></a>
					</c:if>
				</c:otherwise>
			</c:choose>
		</div>

	</c:forEach>

	<div class="comment-container">
		<form:form
			action="${pageContext.request.contextPath}/comment/menu/add"
			method="POST" class="form-horizontal" modelAttribute="comment">
			<form:input type="text" class="form-control" path="Content" />
			<form:button type="submit" class="btn btn-primary">Submit</form:button>
		</form:form>
	</div>
</body>
</html>