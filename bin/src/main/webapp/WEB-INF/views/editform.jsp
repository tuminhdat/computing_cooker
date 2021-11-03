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

<title>Edit</title>
</head>
<body>
	<div class="container">
		<h1>Edit form</h1>

		<table class="table table-striped">

			</tbody>
		</table>
		<h3>Information</h3>
		<form:form action="${pageContext.request.contextPath}/userInfo/edit"
			method="POST" cssClass="form-horizontal" modelAttribute="user">
			<div class="mb-3">
				First Name
				<form:input type="text" name="FirstName" class="form-control" value="${user.getFirstName()}" path="firstName" />
			</div>

			<div class="mb-3">
				Last Name
				<form:input type="text" name="LastName" class="form-control" value="${user.getLastName()}" path="lastName" />
			</div>

			<div class="mb-3">
				Age
				<form:input type="Number" name="Age" class="form-control" value="${user.getAge()}" path="age" />
			</div>
			<div class="mb-3">
				Email
				<form:input type="email" name="Email" class="form-control" value="${user.getEmail()}" path="email" />
			</div>
			<div class="mb-3">
				Description
				<form:input type="text" name="Description" class="form-control" value="${user.getDescription()}" path="description" />
			</div>


			<form:button type="submit" class="btn btn-primary">Submit</form:button>
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