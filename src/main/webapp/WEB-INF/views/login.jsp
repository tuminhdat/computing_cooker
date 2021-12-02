<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html>
<head>
<title>Login</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
	crossorigin="anonymous"></script>
<link rel="stylesheet" type="text/css" href="resources/login.css">
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
		</div>
	</nav>
	<h2>Login Page</h2>
	<br>
	<div class="userLogin">
		<form action="/login" method="POST" class="form-horizontal" id="login"
			modelAttribute="user">

			<p class="error">${message}</p>

			<label for="UserName"> UserName <input type="text"
				id="UserName" name="UserName" placeholder="Required UserName"
				required>
			</label> <br> <br> <label for="UserPassword"> Password <input
				type="password" id="UserPassword" name="UserPassword"
				placeholder="Required Password" required>
			</label> <br> <br>

			<button type="submit" class="btn btn-primary">Submit</button>
		</form>
		<hr>
		<!-- Button trigger modal -->
		<p style="color: #08ffd1;">
			Don't have account?
			<button type="button" class="btn btn-success" data-bs-toggle="modal"
				data-bs-target="#exampleModal">Register</button>
		</p>

		<!-- Modal -->
		<div class="modal fade" id="exampleModal" tabindex="-1"
			aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalLabel">Registration
							form</h5>
					</div>
					<div class="modal-body">
						<p>(*) - Required Information</p>
						<form:form
							action="${pageContext.request.contextPath}/users/create"
							method="POST" cssClass="form-horizontal" modelAttribute="user">

							<div class="mb-3">
								User Name (*)
								<form:input type="text" class="form-control" path="userName"
									required="required" />
							</div>
							<div class="mb-3">
								User Password (*)
								<form:input type="password" class="form-control"
									path="userPassword" required="required" />
							</div>
							<div class="mb-3">
								First Name (*)
								<form:input type="text" class="form-control" path="firstName"
									required="required" />
							</div>

							<div class="mb-3">
								Last Name (*)
								<form:input type="text" class="form-control" path="lastName"
									required="required" />
							</div>

							<div class="mb-3">
								Age
								<form:input type="Number" class="form-control" path="age" />
							</div>
							<div class="mb-3">
								Email (*)
								<form:input type="email" class="form-control" path="email"
									required="required" />
							</div>
							<div class="mb-3">
								Description
								<form:input type="text" class="form-control" path="description" />
							</div>


							<form:button type="submit" class="btn btn-primary">Submit</form:button>
							<p>
								Already have an account? <a href="/loginform">Login</a>
							</p>
						</form:form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
