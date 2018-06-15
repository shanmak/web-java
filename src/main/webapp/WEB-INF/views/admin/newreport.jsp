<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html >
<html>
<head>
<title>T7 Admin Dashboard: Report Damages</title>
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/themes/ui-lightness/theme.min.css">

</head>
<body>
	<a href="${pageContext.request.contextPath}/admin/home"><div class="btn btn-warning">
			<i class="fa fa-home"></i>HOME
		</div></a>
	<br />
	<br />

	<h3>Report Damages</h3>

	<form id="form-report" method="post" 
		action="createreport" class="col-12 col-sm-7 col-md-4 needs-validation">

		<div class="form-group">
				<label for="name">Damaged Facility</label> 
                  <select
					name="facilityId" id="facilityId" class="form-control" required>
					<c:forEach items="${faclist}" var="facility">
						<option value="${facility.key}">${facility.value}</option>
					</c:forEach>
				</select>
					
			</div>

		<div class="form-group">
				<label for="description">Description of Damages</label> <textarea id="description"
					name="description" class="form-control" rows="4" cols="50" required /></textarea>
			</div>


				<c:if test="${creatingerror}">
				<div class="alert alert-danger" role="alert">
  				<strong>Something went wrong! </strong> Please try again!.</div></c:if>


			<div class="form-group">
		<input class="btn btn-danger mx-3" type="reset" value="Reset" />
		<input class="submitbtn btn btn-success mx-3" type="submit" value="Make Report" />
		</div>
	</form>
	<script src="https://code.jquery.com/jquery-3.3.1.js"></script>

<script src="https://code.jquery.com/jquery-3.3.1.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  <script>
  $( function() {
    $( "#issueDate" ).datepicker().formatDate( "yy-mm-dd", new Date( 2007, 1 - 1, 26 ) );
  } );
  </script>
</body>
</html>