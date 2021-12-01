<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html>
<head>
<title>Login</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
	integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
	crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
	integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
	crossorigin="anonymous"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
	integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
	crossorigin="anonymous"></script>
<link rel="stylesheet" type="text/css" href="resources/login.css">
</head>
<body>
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
			<button type="button" class="btn btn-success" data-toggle="modal"
				data-target="#exampleModal">Register</button>
		</p>

		<!-- Modal -->
		<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog"
			aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalLabel">Registration
							form</h5>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
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
								First Name
								<form:input type="text" class="form-control" path="firstName" />
							</div>

							<div class="mb-3">
								Last Name
								<form:input type="text" class="form-control" path="lastName" />
							</div>

							<div class="mb-3">
								Age
								<form:input type="Number" class="form-control" path="age" />
							</div>
							<div class="mb-3">
								Email
								<form:input type="email" class="form-control" path="email" />
							</div>
							<div class="mb-3">
								Description
								<form:input type="text" class="form-control" path="description" />
							</div>


							<form:button type="submit" cssClass="btn btn-primary">Submit</form:button>
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
