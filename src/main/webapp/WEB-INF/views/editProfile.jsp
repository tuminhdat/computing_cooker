<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
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
<body>
	<div class="container">

		<h3>Edit User</h3>
		<form:form action="${pageContext.request.contextPath}/userInfo/edit/"
			cssClass="form-horizontal" method="post" modelAttribute="user">

			<div class="form-group">
				<label for="name" class="col-md-3 control-label">Last Name</label>
				<div class="col-md-9">
					<form:input path="lastName" value="${user.lastName}"
						cssClass="form-control" />
				</div>
				<label for="name" class="col-md-3 control-label">First Name</label>
				<div class="col-md-9">
					<form:input path="firstName" value="${user.firstName}"
						cssClass="form-control" />
				</div>
				<label for="name" class="col-md-3 control-label">Age</label>
				<div class="col-md-9">
					<form:input path="age" value="${user.age}"
						cssClass="form-control" />
				</div>
				<label for="email" class="col-md-3 control-label">Email</label>
				<div class="col-md-9">
					<form:input path="email" value="${user.email}"
						cssClass="form-control" />
				</div>
				<label for="name" class="col-md-3 control-label">Description</label>
				<div class="col-md-9">
					<form:input path="name" value="${user.description}"
						cssClass="form-control" />
				</div>
				<label for="name" class="col-md-3 control-label">User Name</label>
				<div class="col-md-9">
					<form:input path="userName" value="${user.userName}"
						cssClass="form-control" />
				</div>
				<label for="name" class="col-md-3 control-label">User Password</label>
				<div class="col-md-9">
					<form:password path="userPassword" value="${user.userPassword}"
						cssClass="form-control" />
				</div>
			</div>

			<div class="form-group">
				<!-- Button -->
				<div class="col-md-offset-3 col-md-9">
					<form:button class="btn btn-primary">Submit</form:button>
				</div>
			</div>

		</form:form>

	</div>



</body>
</html>
