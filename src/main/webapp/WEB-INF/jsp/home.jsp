<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
<div class="pull-right">
<font size="4"><a href="login.html">Login</a> | <a href="register.html">Sign-up</a></font>
</div>
<br>
<br>
<br>
<table class="table table-striped table-bordered">
	<tr>
		<th class="text-center">Open Job Position</th>
		<th class="text-center">Publish Date</th>
	</tr>
	<c:forEach items="${ jobs }" var="j">
				<tr class="text-center">
					<td><a href="viewjobdetails/${j.id }.html">${ j.title }</a></td>
					<td>${ j.publishDate }</td>
				</tr>
				
	</c:forEach>

</table>
<!-- <a href="#"  class="btn btn-primary pull-right">Apply</a> -->

</div>	
</body>
</html>