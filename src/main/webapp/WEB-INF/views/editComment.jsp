<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<h tml>
<head>
<title>Edit Comment</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
	crossorigin="anonymous"></script>
<link rel="stylesheet" type="text/css" href="resources/navBar.css">
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
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav me-auto mb-2 mb-lg-0">
					<c:choose>
						<c:when test="${user == null}">
							<li class="nav-item"><a class="nav-link" href="/loginform">Login</a></li>
						</c:when>
						<c:otherwise>
							<li class="nav-item dropdown"><a
								class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
								role="button" data-bs-toggle="dropdown" aria-expanded="false">
									Your Account </a>
								<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
									<li><a class="dropdown-item" href="/userProfile">Profile</a></li>
									<li><a class="dropdown-item" href="/invalidate/session">Logout</a></li>
								</ul></li>
						</c:otherwise>
					</c:choose>
				</ul>
				<form class="d-flex" action="/searching" method="GET">
					<input class="form-control me-2" type="search" placeholder="Search"
						aria-label="Search" id="item" name="item">
					<button class="btn btn-outline-success" type="submit">Search</button>
				</form>
			</div>
		</div>
	</nav>
	<div class="container">
		<h1 class="title1">Edit Comment</h1>
		<c:choose>
			<c:when test="${selectedComment.getRecipeID() != 0}">
				<form:form
					action="${pageContext.request.contextPath}/comment/recipe/edit/"
					cssClass="form-horizontal" method="post"
					modelAttribute="selectedComment">

					<div class="form-group">
						<form:input type="hidden" name="RecipeID"
							value="${selectedComment.getRecipeID()}" path="RecipeID" />
						<form:input type="hidden" name="CommentID"
							value="${selectedComment.getCommentID()}" path="CommentID" />

						<div class="mb-3">
							<form:input type="text" name="Content" class="form-control"
								value="${selectedComment.getContent()}" path="Content"
								required="required" />
						</div>
					</div>

					<div class="form-group">
						<!-- Button -->
						<div class="col-md-offset-3 col-md-9">
							<form:button class="btn btn-primary">Submit</form:button>
						</div>
					</div>

				</form:form>
			</c:when>
			<c:otherwise>
				<form:form
					action="${pageContext.request.contextPath}/comment/menu/edit/"
					cssClass="form-horizontal" method="post"
					modelAttribute="selectedComment">

					<div class="form-group">
						<form:input type="hidden" name="MenuID"
							value="${selectedComment.getMenuID()}" path="MenuID" />
						<form:input type="hidden" name="CommentID"
							value="${selectedComment.getCommentID()}" path="CommentID" />

						<div class="mb-3">
							<form:input type="text" name="Content" class="form-control"
								value="${selectedComment.getContent()}" path="Content"
								required="required" />
						</div>
					</div>

					<div class="form-group">
						<!-- Button -->
						<div class="col-md-offset-3 col-md-9">
							<form:button class="btn btn-primary">Submit</form:button>
						</div>
					</div>

				</form:form>
			</c:otherwise>
		</c:choose>
	</div>
</body>
</html>