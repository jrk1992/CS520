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
			<form action="upload.html?${_csrf.parameterName }=${_csrf.token }" method="post"
				enctype="multipart/form-data">
				<table class="table">
					<tr>
						<th>Resume :</th>
						<td><input type="file" name="resume" class="form-control"
							required /></td>
					</tr>
					<tr>
						<th>Research Statement :</th>
						<td><input type="file" name="research" class="form-control"
							required /></td>
					</tr>
					<tr>
						<th>Teaching Statement :</th>
						<td><input type="file" name="teaching" class="form-control"
							required />
							
							</td>
					</tr>

					<tr>
						<th><br /></th>
						<td> <input type="submit" name="upload"
							class="btn btn-primary" value="Submit" /></td>
					</tr>
				</table>
			</form>

		</div>
	</div>

</body>
</html>