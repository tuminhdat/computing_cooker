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


	<h2 class="title1">${menu.getMenuTitle()}</h2>

	<table>
		<thead>
			<th>Recipes</th>
		</thead>
		<tbody>
			<c:forEach var="s" items="${menuRecipes}">
				<tr>
					<td>${s.getRecipeTitle()}</td>
				</tr>
			</c:forEach>
		</tbody>

	</table>

	<div class="comment-container">
		<form action="/action_page.php">
			<textarea id="w3review" name="w3review" rows="4"></textarea>
			<br> <input type="submit" value="Submit">
		</form>
	</div>
</body>
</html>