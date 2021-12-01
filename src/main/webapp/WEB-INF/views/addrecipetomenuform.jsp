<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
* {
	box-sizing: border-box;
}

#myInput {
	background-image: url('/css/searchicon.png');
	background-position: 10px 10px;
	background-repeat: no-repeat;
	width: 100%;
	font-size: 16px;
	padding: 12px 20px 12px 40px;
	border: 1px solid #ddd;
	margin-bottom: 12px;
}

#myTable {
	border-collapse: collapse;
	width: 100%;
	border: 1px solid #ddd;
	font-size: 18px;
}

#myTable th, #myTable td {
	text-align: left;
	padding: 12px;
}

#myTable tr {
	border-bottom: 1px solid #ddd;
}

#myTable tr.header, #myTable tr:hover {
	background-color: #f1f1f1;
}

#myTable2 {
	border-collapse: collapse;
	width: 100%;
	border: 1px solid #ddd;
	font-size: 18px;
}

#myTable2 th, #myTable2 td {
	text-align: left;
	padding: 12px;
}

#myTable2 tr {
	border-bottom: 1px solid #ddd;
}

#myTable2 tr.header, #myTable2 tr:hover {
	background-color: #f1f1f1;
}
</style>
</head>
<body>
	<h2>Menu Recipe</h2>

	<table id="myTable2">
		<tr class="header">
			<th style="width: 60%;">Recipe Title</th>
			<th style="width: 40%;">Delete</th>
		</tr>


		<!-- Garbage Out!-->
		<c:forEach var="s" items="${allAddedRecipes}">

			<tr>
				<td>${s.recipeTitle}</td>
				<td><a
					href="${pageContext.request.contextPath}/menu/create/recipe/delete/?recipeid=${s.recipeID}"
					class="btn btn-danger">Delete</a></td>
			</tr>
		</c:forEach>

	</table>

	<br>

	<a href="/userProfile/menu/list"><input type="button"
		value="Finish"></a>

	<h2>Pick Recipe</h2>

	<input type="text" id="myInput" onkeyup="myFunction()"
		placeholder="Search for names.." title="Type in a name">

	<table id="myTable">
		<tr class="header">
			<th style="width: 60%;">Recipe Title</th>
			<th style="width: 40%;">Add</th>
		</tr>
		<c:forEach var="s" items="${allRecipes}">

			<tr>
				<td>${s.recipeTitle}</td>
				<td><a
					href="${pageContext.request.contextPath}/menu/create/recipe/add/?recipeid=${s.recipeID}
        &recipetitle=${s.recipeTitle}"
					class="btn btn-danger">Add</a></td>
			</tr>
		</c:forEach>
	</table>



	<script>
		function myFunction() {
			var input, filter, table, tr, td, i, txtValue;
			input = document.getElementById("myInput");
			filter = input.value.toUpperCase();
			table = document.getElementById("myTable");
			tr = table.getElementsByTagName("tr");
			for (i = 0; i < tr.length; i++) {
				td = tr[i].getElementsByTagName("td")[0];
				if (td) {
					txtValue = td.textContent || td.innerText;
					if (txtValue.toUpperCase().indexOf(filter) > -1) {
						tr[i].style.display = "";
					} else {
						tr[i].style.display = "none";
					}
				}
			}
		}
	</script>

</body>
</html>
