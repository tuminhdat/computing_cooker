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

.flex-container {
	display: flex;
	width: 50%;
}

.flex-container>div {
	background-color: #f1f1f1;
	width: 50%;
	padding: 10px;
}

.content {
	width: 100%;
	word-break: break-word;
}
</style>
</head>
<body>
	<div class="nav-bar">
		<nav>
			<a href="/userInfo">Profile</a> |
			<!-- <a href="/css/">CSS</a> |
                <a href="/js/">JavaScript</a> |
                <a href="/python/">Python</a> -->
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

	<c:forEach var="s" items="${allComments}">

		<div class="flex-container">
			<div>
				<p>${s.userID}</p>
				<p class="content">${s.content}</p>
			</div>
			<div>
				<a
					href="${pageContext.request.contextPath}/comment/menu/delete/?id=${s.commentID}"
					class="btn-close" aria-label="Close" style="margin:"></a>
			</div>
		</div>
		<hr>

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