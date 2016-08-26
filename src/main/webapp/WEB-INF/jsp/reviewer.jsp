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
<ul class="breadcrumb">
	<li>Reviewer Home</li>
	
</ul>
<div class="pull-right">
<div class="pull-right">
<c:url var="logoutUrl" value="/logout"/>
 <form action="${logoutUrl}" method="POST">
  <input name="${_csrf.parameterName }" type="hidden" 
		value="${_csrf.token}" />
  <input name="submit" type="submit" class="btn btn-primary pull-right" value="Logout" />
</form> 
</div>

</div>
<br>
<br>
<br>
<p>Reviewer Page!! ${currentUser.firstName }</p>
</div>	
</body>
</html>