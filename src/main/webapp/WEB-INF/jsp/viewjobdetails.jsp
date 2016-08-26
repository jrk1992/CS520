<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
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
<c:url var="logoutUrl" value="/logout"/>
 <form action="${logoutUrl}" method="POST">
  <input name="${_csrf.parameterName }" type="hidden" 
		value="${_csrf.token}" />
  <input name="submit" type="submit" class="btn btn-primary pull-right" value="Logout" />
</form> 

</div>
<br>
<br>
<label>Job Title :</label><p>${viewjobdetails.title }</p>
<label>Job Description :</label><p>${viewjobdetails.description }</p>
<label>Publish Date :</label><p><fmt:formatDate value="${viewjobdetails.publishDate}" pattern="M/d/yyyy" /></p>
<label>Close Date :</label><p><fmt:formatDate value="${viewjobdetails.closeDate}" pattern="M/d/yyyy" /></p>
<security:authorize access="hasRole('ROLE_ADMIN') or hasRole('ROLE_REVIEWER')">
<label>Committee Chair :</label><p>${viewjobdetails.committeeChair.firstName }</p>
<label>Committee Members :</label>
<c:forEach items="${viewjobdetails.committeeMembers }" var="x">
<p>${x.firstName}</p>
</c:forEach>
</security:authorize>


</div>	
</body>
</html>