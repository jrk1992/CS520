<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@  taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
	<li><a href="../applicant.html">Applicant Home</a></li>
	<li>View Application</li>
</ul>
		<div class="pull-right">
			<div class="pull-right">
				<c:url var="logoutUrl" value="/logout" />
				<form action="${logoutUrl}" method="POST">
					<input name="${_csrf.parameterName }" type="hidden"
						value="${_csrf.token}" /> <input name="submit" type="submit"
						class="btn btn-primary pull-right" value="Logout" />
				</form>
			</div>

		</div>
		<br> <br> <label>First Name :</label>
		<p>${viewapplication.applicant.firstName }</p>
		<label>Last Name :</label>
		<p>${viewapplication.applicant.lastName }</p>
		<label>E-mail :</label>
		<p>${viewapplication.applicant.email }</p>
		<label>Phone number :</label>
		<p>${viewapplication.applicant.phone }</p>
		<label>Address :</label>
		<p>${viewapplication.applicant.address }</p>
		<label>Application Submit Date :</label>
		<p>${viewapplication.submitDate }</p>
		<label>Current Job Title :</label>
		<p>${viewapplication.currentJobTitle }</p>
		<label>Current Job Institute :</label>
		<p>${viewapplication.currentJobInstitution }</p>
		<label>Start year of current job :</label>
		<p>${viewapplication.currentJobYear }</p>
		<label>Degrees :</label>
		<table class="table table-striped table-bordered">
			<tr>
				<th class="text-center">Degree</th>
				<th class="text-center">University</th>
				<th class="text-center">Year</th>
			</tr>
			<c:forEach items="${ viewapplication.degrees }" var="j">
				<tr class="text-center">
					<td>${ j.name }</td>
					<td>${ j.school }</td>
					<td>${ j.year }</td>
				</tr>

			</c:forEach>
		</table>
		<p>CV :</p>
		<a href="../download.html?filetype=cv">Download CV</a>
		<p>Research Statement :</p>
		<a href="../download.html?filetype=research">Download Research
			Statement</a>
		<p>Teaching Statement :</p>
		<a href="../download.html?filetype=teaching">Download Teaching
			Statement</a>
	</div>
</body>
</html>