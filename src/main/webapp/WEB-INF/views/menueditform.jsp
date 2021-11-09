<!DOCTYPE html>
<html>
<head>
<title>Create Menu</title>
<style>
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
			<a href="">Profile</a> |
			<!-- <a href="/css/">CSS</a> |
                <a href="/js/">JavaScript</a> |
                <a href="/python/">Python</a> -->
		</nav>
	</div>

	<h1 class="title1">Edit Menu</h1>

	<form action="/menu/edit" method="post" modelAttribute="menu">
		<label for="MenuTitle">Menu Title :</label> <br> <input
			type="text" class="textBox" value="${menu.getMenuTitle()}" name="MenuTitle">
		<br> <label for="Description">Menu Description :</label> <br>

		<textarea class="textBox"
			name="Description" rows="4">${menu.getDescription()}</textarea>

		<br> <input type="submit" value="Next">
	</form>
</body>
</html>