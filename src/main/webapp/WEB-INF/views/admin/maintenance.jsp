<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>T7 Members: Search for Facility</title>
<script>

</script>
<style>
.main{
	margin-top: 30px;
}
.mcontent{
	margin-top: 0px;
}
</style>
</head>
<body>
<a href="${pageContext.request.contextPath}/admin/home"><div class="btn btn-warning"><i class="fa fa-home"></i>HOME</div></a><br/><br/>
	<form id="form-maintenance" action="maintenancedetail" class="" method="post">
		<div class="container">
			<div class="row">
				<div class="col-12">

					<h3>Open Damage Reports</h3>					
					<table class="table table-striped table-hover">
						<tr>
							<td>Issue ID</td>
							<td>Facility Name</td>
							<td>Issue Date</td>
							<td>Status</td>
							<td></td>
							<td></td>
						</tr>
						<c:forEach items="${unresolvedlist}" var="damage" varStatus="itemsRow">
							<tr>
								<td><c:out value="${damage.issueId}"></c:out></td>
								<td><c:out value="${damage.facility.facilityName}"></c:out></td>
								<td><c:out value="${damage.issueDate}"></c:out></td>
								<td><c:out value="${damage.status}"></c:out></td>
								<td><a href="maintenancedetail/${damage.issueId}" class="btn btn-warning">DETAILS</a></td>
								<td></td>
							</tr>
						</c:forEach>

					</table>
					
					<h3>Resolved Damage Reports</h3>					
					<table class="table table-striped table-hover">
						<tr>
							<td>Issue ID</td>
							<td>Facility Name</td>
							<td>Issue Date</td>
							<td>Status</td>
							<td></td>
							<td></td>
						</tr>
						<c:forEach items="${damagelist}" var="damage" varStatus="itemsRow">
							<tr>
								<td><c:out value="${damage.issueId}"></c:out></td>
								<td><c:out value="${damage.facility.facilityName}"></c:out></td>
								<td><c:out value="${damage.issueDate}"></c:out></td>
								<td><c:out value="${damage.status}"></c:out></td>
								<td><a href="maintenancedetail/${damage.issueId}" class="btn btn-warning">DETAILS</a></td>
								<td></td>
							</tr>
						</c:forEach>

					</table>
					<div class="col-12 pr-5" style="text-align: right;">
					</div>
				</div>
			</div>
		</div>
	</form>

</body>
</html>