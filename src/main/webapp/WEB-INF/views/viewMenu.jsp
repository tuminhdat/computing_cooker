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

	<div class="comment-container">
		<form action="/action_page.php">
			<textarea class="textBox" name="w3review" rows="4"></textarea>
			<br> <input type="submit" value="Submit">
		</form>
	</div>
</body>
</html>