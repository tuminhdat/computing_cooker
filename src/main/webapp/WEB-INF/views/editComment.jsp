<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<h tml>
<head>
<title>Edit Comment</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<style>
body {
	padding: 10px;
}

.title1 {
	color: #1ecbe1;
}

.textBox {
	width: 100%;
}
</style>
</head>
<body>

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
								value="${selectedComment.getContent()}" path="Content" />
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
								value="${selectedComment.getContent()}" path="Content" />
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