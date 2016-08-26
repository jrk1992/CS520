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
	<li><a href="home.html">Home</a></li>
	<li>Register</li>
</ul>
<!-- <a href="home.html" class="btn btn-primary pull-right">Home</a><br> -->
		<div class="container">
		<form:form class="form-horizontal" modelAttribute="user">
			<div class="form-group">
				<label>First Name :</label>
				<font color="red"><form:errors path="firstName" /></font>
				<form:input class="form-control" path="firstName" />
				

			</div>

			<div class="form-group">
				<label>Last Name :</label>
				<font color="red"><form:errors path="lastName" /></font>
				<form:input class="form-control" path="lastName" />
				

			</div>
			<div class="form-group">
				<label>Phone number :</label>
				<font color="red"><form:errors path="phone" /></font>
				<form:input class="form-control" path="phone" />
				

			</div>
			<div class="form-group">
				<label>Address :</label>
				<font color="red"><form:errors path="address" /></font>
				<form:textarea class="form-control" path="address" />
				

			</div>
			<div class="form-group">
				<label>Email :</label>
				<font color="red"><form:errors path="email" /><c:if test="${ error }">this email is already used!</c:if></font>
				<form:input class="form-control" path="email" />
				

			</div>
			<div class="form-group">
				<label>Password :</label>
				<font color="red"><form:errors path="password" /></font>
				<form:input type="password" class="form-control" path="password" />
				

			</div>
			<div class="form-group">
				<label>Re Type Password :</label>
				<font color="red"><form:errors path="password2" /></font>
				<form:input type="password" class="form-control" path="password2" />
				

			</div>
			<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token}" />
			<div class="form-group">
				<button type="submit" class="btn btn-primary">Sign Up</button>
			</div>
		</form:form>
		</div>
	</div>

</body>
</html>