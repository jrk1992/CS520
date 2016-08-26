<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<title>CS Jobs</title>

</head>
<body>
	<div class="container">
		<div class="page-header">
			<h1>
				CS JOBS <small>CS520</small>
			</h1>
		</div>
		<ul class="breadcrumb">
	<li><a href="applicant.html">Applicant Home</a></li>
	
</ul>

		<div class="container">




			<form class="controls form-inline" action="degreeadd.html"
				method="post">


				<font color="red"><c:if test="${isempty==true }">
						<p>Empty fields not allowed!</p>
					</c:if></font> <font color="red"><c:if test="${ not empty invalid }">
						<p>Invalid credentials!</p>
					</c:if></font> 
					<label>Degree Name:</label> 
					<input type="text" name="degree" class="form-control" required />
					 <label>Degree Institution :</label> 
					 <input type="text" name="school" class="form-control" required/>
					 <label>Degree Year :</label>
					  <input type="number" name="year" class="form-control" required/>

				<input name="${_csrf.parameterName }" type="hidden" 
		value="${_csrf.token}" />
				<button type="submit" class="btn btn-default">Add degree</button>

			</form>
			<br>
			<br>
			<table class="table table-striped table-bordered">
	<tr>
		<th class="text-center">Degree</th>
		<th class="text-center">University</th>
		<th class="text-center">Year</th>
	</tr>
	<c:forEach items="${ showdegrees }" var="j">
				<tr class="text-center">
					<td>${ j.name }</td>
					<td>${ j.school }</td>
					<td>${ j.year }</td>
				</tr>
				
	</c:forEach>
</table>

			<a href="save.html" class="btn btn-primary pull-left">Next</a>
		</div>
	</div>

</body>
</html>