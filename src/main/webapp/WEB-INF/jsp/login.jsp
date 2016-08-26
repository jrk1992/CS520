<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

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
	<li><a href="home.html">Home</a></li>
	<li>Login</li>
</ul>
<!-- <a href="home.html" class="btn btn-primary pull-right">Home</a><br> -->
		<form class="container form-horizontal" action="j_spring_security_check" method="post" >
			<c:if test="${not empty sessionScope.SPRING_SECURITY_LAST_EXCEPTION.message }">
				<font color="red">${sessionScope.SPRING_SECURITY_LAST_EXCEPTION.message}</font>
			</c:if>
			<font color="red"><c:if test="${isempty==true }"><p>Empty fields not allowed!</p></c:if></font>
			<font color="red"><c:if test="${ not empty invalid }"><p>Invalid credentials!</p></c:if></font>
			<div class=" form-group">
				<label>Username :</label>
				
				<input type="text" name="j_username" class="form-control"  placeholder="Email" />
				

			</div>

			<div class=" form-group">
				<label>Password :</label>
				
				<input type="password"  name="j_password" class="form-control"  />
				

			</div>
			<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token}" />
			<div class="form-group">
				<button type="submit" class="btn btn-default">Login</button>
			</div>
		</form>

</div>	
</body>
</html>