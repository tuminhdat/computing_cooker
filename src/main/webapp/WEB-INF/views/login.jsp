<!DOCTYPE html>
<html>
<head>
<title>Login</title>
<link rel="stylesheet" type="text/css" href="resources/login.css">
</head>
<body>
	<h2>Login Page</h2>
	<br>
	<div class="login">
		<form action="/login" method="POST" class="form-horizontal"
			id="login" modelAttribute="user">

			<p class="error">${message}</p>

			<label for="UserName"> UserName <input type="text" id="UserName"
				name="UserName" placeholder="Required UserName" required>
			</label>

			<br>
			<br>

			<label for="UserPassword"> Password <input type="password"
				id="UserPassword" name="UserPassword" placeholder="Required Password"
				required>
			</label>

			<br>
			<br>

			<form>
				<button type="submit" class="btn btn-primary">Submit</button>
			</form>

			<a href="/register">Register</a>
		</form>
	</div>
</body>
</html>
