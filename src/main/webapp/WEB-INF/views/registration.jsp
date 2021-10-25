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

<title>User List</title>
</head>
<body>
	<div class="container">
		<h1>Registration form</h1>
		<c:if test="${ messages !=null }">

			<c:forEach var="message" items="${messages}">

				<div class="alert alert-success fade show" role="alert">${message}</div>

			</c:forEach>

		</c:if>
		<table class="table table-striped">

			</tbody>
		</table>
		<h3>Required Information</h3>
		<form:form action="${pageContext.request.contextPath}/users/create"
			method="POST" cssClass="form-horizontal" modelAttribute="user">

			<div class="mb-3">
				last Name
				<form:input type="text" class="form-control" path="lastName" />
			</div>
			<div class="mb-3">
				first Name
				<form:input type="text" class="form-control" path="firstName" />
			</div>
			<div class="mb-3">
				age
				<form:input type="Number" class="form-control" path="age" />
			</div>
			<div class="mb-3">
				Email
				<form:input type="email" class="form-control" path="email" />
			</div>
			<div class="mb-3">
				description
				<form:input type="text" class="form-control" path="description" />
			</div>
			<div class="mb-3">
				user Name
				<form:input type="text" class="form-control" path="userName" />
			</div>
			<div class="mb-3">
				user Password
				<form:input type="text" class="form-control" path="userPassword" />
			</div>

			<form:button type="submit" cssClass="btn btn-primary">Submit</form:button>
		</form:form>
	</div>


	<!-- Optional JavaScript; choose one of the two! -->

	<!-- Option 1: Bootstrap Bundle with Popper -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>

	<!-- Option 2: Separate Popper and Bootstrap JS -->
	<!--
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>
    -->
</body>
</html>