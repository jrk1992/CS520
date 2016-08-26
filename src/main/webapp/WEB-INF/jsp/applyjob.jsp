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
	<li>Step 1</li>
	
</ul>
	<div class="pull-right">
<c:url var="logoutUrl" value="/logout"/>
 <form action="${logoutUrl}" method="POST">
  <input name="${_csrf.parameterName }" type="hidden" 
		value="${_csrf.token}" />
  <input name="submit" type="submit" class="btn btn-primary pull-right" value="Logout" />
</form> 
</div>
		<!-- <a href="home.html" class="btn btn-primary pull-right">Home</a><br> -->
		<div class="container">

			<div class="form-group">
				<label>Job Title :</label>
				<p>${application.job.title}</p>


			</div>

			<div class="form-group">
				<label>Job Description:</label>
				<p>${application.job.description}</p>


			</div>
			<div class="form-group">
				<label>Publish Date :</label>
				<p>${application.job.publishDate}</p>


			</div>

			<div class="form-group">
				<label>Close Date :</label>
				<p>${application.job.closeDate}</p>


			</div>

			<div class="form-group">
				<label>First Name :</label>
				<p>${ application.applicant.firstName }</p>


			</div>

			<div class="form-group">
				<label>Last Name :</label>
				<p>${ application.applicant.lastName }</p>


			</div>

			<div class="form-group">
				<label>Email :</label>
				<p>${application.applicant.email}</p>


			</div>
			
			
		
		
		
			<form:form class="form-horizontal" modelAttribute="application" method="post">
				<div class="form-group">
					<label>Current Job Title :</label> 
					<font color="red"><form:errors path="currentJobTitle" /></font>
					<form:input class="form-control" path="currentJobTitle"  />


				</div>
				<div class="form-group">
					<label>Current Job Institution :</label>
					<font color="red"><form:errors path="currentJobInstitution" /></font>
					<form:input class="form-control" path="currentJobInstitution"  />


				</div>

				<div class="form-group">
					<label>Current Job Start Year :</label> 
					<font color="red"><form:errors path="currentJobYear" /></font>
					<form:input class="form-control" path="currentJobYear"  />


				</div>


				<div class="form-group">
					<button type="submit" class="btn btn-primary pull-right">Next</button>
				</div>
			</form:form>
			
			<!-- <a href="degreeadd.html" class="btn btn-primary pull-right">Next</a> -->
			
		</div>
	</div>

</body>
</html>