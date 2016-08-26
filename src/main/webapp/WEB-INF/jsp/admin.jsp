<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
	<li>Admin Home</li>
	
</ul>
<div class="pull-right">
<c:url var="logoutUrl" value="/logout"/>
 <form action="${logoutUrl}" method="POST">
  <input name="${_csrf.parameterName }" type="hidden" 
		value="${_csrf.token}" />
  <input name="submit" type="submit" class="btn btn-primary pull-right" value="Logout" />
</form> 

<%-- <font size="4"><a href="<c:url value="j_spring_security_logout" />" class="btn btn-primary pull-right">Logout</a></font> --%>

</div>
<p>
  <font size="4"><a href="addJob.html">Create New Job</a></font> <br> <br>
 <%--  <a href="<c:url value='/login.html' />">Login</a> --%>
</p>
<table border="1" class="table table-striped table-bordered">
<tr><th class="text-center">JOB</th>
<th class="text-center">Publish Date</th>
<th class="text-center">Close Date</th>
<th class="text-center">Operations</th></tr>

<c:forEach items="${alljobs }" var="a">
<tr>
<td><a href="viewjobdetails/${a.id}.html">${a.title }</a></td>
<td><fmt:formatDate value="${a.publishDate}" pattern="M/d/yyyy" /></td>
<td><fmt:formatDate value="${a.closeDate}" pattern="M/d/yyyy" /></td>
<td><a href="editJob.html?id=${a.id }">Edit</a></td>
</tr>
</c:forEach>


</table>
</div>	
</body>
</html>