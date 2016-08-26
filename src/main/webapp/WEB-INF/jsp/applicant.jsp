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
	<li>Applicant Home</li>
	
</ul>
<div class="pull-right">
<c:url var="logoutUrl" value="/logout"/>
 <form action="${logoutUrl}" method="POST">
  <input name="${_csrf.parameterName }" type="hidden" 
		value="${_csrf.token}" />
  <input name="submit" type="submit" class="btn btn-primary pull-right" value="Logout" />
</form> 
</div>
<br>
<br>
<table class="table table-striped table-bordered">
	<tr>
		<th class="text-center">Applied Job Positions</th>
		
	</tr>
	<c:forEach items="${ applicationsmade }" var="a">
				<tr class="text-center">
					<td><a href="viewjobdetails/${a.job.id }.html">${ a.job.title }</a></td>
					<td><a href="viewapplication/${a.id }.html">View Application</a></td>
				</tr>
				
	</c:forEach>

</table>
<br>
<br>
<table class="table table-striped table-bordered">
	<tr>
		<th class="text-center">Remaining Job Positions</th>
		
	</tr>
	<c:forEach items="${ jobsleft }" var="j">
				<tr class="text-center">
					<td><a href="viewjobdetails/${j.id }.html">${ j.title }</a></td>
					<td><a href="applyjob.html?jobid=${j.id }" class="btn btn-primary pull-right">Apply</a></td>
				</tr>
				
	</c:forEach>

</table>
</div>	
</body>
</html>