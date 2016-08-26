<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
<link rel="stylesheet" href="/resources/demos/style.css">
<script>
	$('input').keydown(function(e) {
		e.preventDefault();
		return false;
	});
	$(function() {
		$("#datepicker").datepicker({
			dateFormat : 'm/d/yy'
		});
	});

	$(function() {
		$("#datepick").datepicker({
			dateFormat : 'm/d/yy'
		});
	});
	
	$(document).ready(function(){
		$("#xyz1").click(function(){
			$("#datepicker").val("");
		});
	});
	
	$(document).ready(function(){
		$("#xyz2").click(function(){
			$("#datepick").val("");
		});
	});
	
</script>
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
	<li><a href="admin.html">Admin Home</a></li>
	<li>Edit Job</li>
</ul>
		<div class="pull-right">
			<c:url var="logoutUrl" value="/logout" />
			<form action="${logoutUrl}" method="POST">
				<input name="${_csrf.parameterName }" type="hidden"
					value="${_csrf.token}" /> <input name="submit" type="submit"
					class="btn btn-primary pull-right" value="Logout" />
			</form>
		</div>
		<br> <br> <br>


		<div>
			<form action="editJob.html" method="post">
				<input type="hidden" name="id" value="${editJob.id }" />
				<table class="table">
					<tr>
						<th>Title :</th>
						<td><input type="text" name="jtitle" class="form-control"
							value="${editJob.title }" required /></td>
					</tr>
					<tr>
						<th>Description:</th>
						<td><input type="textarea" name="jdescription"
							value="${editJob.description }" class="form-control" /></td>
					</tr>

					<tr>
						<th>Publish Date:</th>
						<td><input type="text" id="datepicker" name="pdate"
							value="${editJob.publishDate }" class="form-control" readonly>
							<a id="xyz1" class="btn btn-danger" role="button">Remove</a>
						</td>

					</tr>
					<tr>
						<th>Close Date:</th>
						<td><input type="text" id="datepick" name="cdate"
							value="${editJob.closeDate }" class="form-control" readonly>
							<a id="xyz2" class="btn btn-danger" role="button">Remove</a></td>
					</tr>
					<tr>
						<th>Committeee Chair:</th>
						<td><div>
								<select name="chairid" class="btn btn-default dropdown-toggle">
									<c:forEach items="${reviewers }" var="r">
										<option value="${r.id }"
											<c:if test="${r.id eq editJob.committeeChair.id}">selected="selected"</c:if>>${r.firstName}</option>
									</c:forEach>
								</select>
							</div></td>

					</tr>
					<tr>
						<th>Committee Members:</th>
						<td><div class="checkbox">
								<input type="checkbox" value="0" checked="checked"
									style="display: none" name="members" /> <label> <c:forEach
										items="${reviewers }" var="r">
										<input type="checkbox" value="${r.id }" name="members"
											<c:forEach var="x" items="${editJob.committeeMembers }"> <c:if test="${r.id eq x.id}">checked</c:if></c:forEach> /> ${r.firstName }<br />
									</c:forEach>
								</label>
							</div></td>
					</tr>
					<tr>
						<td><br /></td>
						<td><input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token}" /><input type="submit" name="save" value="save"
							class="btn btn-primary" /></td>
					</tr>
				</table>
			</form>
		</div>
	</div>
</body>
</html>