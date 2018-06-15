<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>T7 Admin: Maintenance Dashboard</title>

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css">
<link href="https://fonts.googleapis.com/css?family=Kaushan+Script|Montserrat:400,700|Roboto+Slab:400,700" rel="stylesheet">
<link href="https://code.jquery.com/uui/1.10.4/themes/ui-lightness/jquery-ui.css" rel="stylesheet">
<link rel="stylesheet" 	href="https://use.fontawesome.com/releases/v5.0.13/css/all.css">
<link rel="stylesheet" href="../resources/css/welcome.css">
<script src="https://code.jquery.com/jquery-3.3.1.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css" rel="stylesheet">
<script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>
<link rel="stylesheet" href="../resources/css/welcome.css">
<link rel="stylesheet" href="../resources/css/searchresults.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/admin.css">
<script>
$(document).ready(function() {
	$('#calendar').datepicker({
		dayNamesMin : [ 'Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat' ],
		minDate : +1,
		maxDate : "+2M",
		onSelect : function() {
			checktimes();
		}
	});
});


</script>
<style>

#calendar{
	width: 100%;
}
.ui-datepicker {
	margin: 20px;
	width: 100%;
}

.ui-datepicker a {
	text-decoration: none;
}

.ui-datepicker table {
width: 100%;
}

.ui-datepicker-header {
width: 100%;
	background-color: orange;
	color: #fff;
	font-weight: bold;
	line-height: 30px;
	border-radius: 30px;
}

.ui-datepicker-title {
	text-align: center;
}

.ui-datepicker-prev, .ui-datepicker-next {
	display: inline-block;
	width: 30px;
	height: 30px;
	text-align: center;
	cursor: pointer;
	background-image: url('${pageContext.request.contextPath}/resources/images/arrow.png');
	background-repeat: no-repeat;
	line-height: 600%;
	overflow: hidden;
}

.ui-datepicker-prev {
	float: left;
	background-position: center -30px;
}

.ui-datepicker-next {
	float: right;
	background-position: center 0px;
}

.ui-datepicker th {
	text-transform: uppercase;
	font-size: 0.8rem;
	padding: 5px 0;
	color: #666666;
	text-shadow: 1px 0px 0px #fff;
	filter: dropshadow(color = #fff, offx = 1, offy = 0);
}

.ui-datepicker td span, .ui-datepicker td a {
	display: inline-block;
	font-weight: bold;
	text-align: center;
	width: 30px;
	height: 30px;
	line-height: 30px;
	color: #666666;
	text-shadow: 1px 1px 0px #fff;
	filter: dropshadow(color = #fff, offx = 1, offy = 1);
}

.ui-datepicker-calendar {
}

.ui-datepicker-unselectable .ui-state-default {
	background: #f4f4f4;
	color: #b4b3b3;
}

.ui-datepicker-calendar .ui-state-hover {
	background: #ededed;
	background: -moz-linear-gradient(top, #ededed 0%, #dedede 100%);
	background: -webkit-gradient(linear, left top, left bottom, color-stop(0%, #ededed),
		color-stop(100%, #dedede));
	background: -webkit-linear-gradient(top, #ededed 0%, #dedede 100%);
	background: -o-linear-gradient(top, #ededed 0%, #dedede 100%);
	background: -ms-linear-gradient(top, #ededed 0%, #dedede 100%);
	background: linear-gradient(top, #ededed 0%, #dedede 100%);
	filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#ededed',
		endColorstr='#dedede', GradientType=0);
	-webkit-box-shadow: inset 1px 1px 0px 0px rgba(250, 250, 250, .5);
	-moz-box-shadow: inset 1px 1px 0px 0px rgba(250, 250, 250, .5);
	box-shadow: inset 1px 1px 0px 0px rgba(250, 250, 250, .5);
	border-radius: 15px;
	text-decoration: none;
}

.ui-datepicker-calendar .ui-state-active {
	background: orange;
	-webkit-box-shadow: inset 0px 0px 10px 0px rgba(0, 0, 0, .1);
	-moz-box-shadow: inset 0px 0px 10px 0px rgba(0, 0, 0, .1);
	box-shadow: inset 0px 0px 10px 0px rgba(0, 0, 0, .1);
	color: #fff;
	text-shadow: 0px 1px 0px #4d7a85;
	filter: dropshadow(color = #4d7a85, offx = 0, offy = 1);
	position: relative;
	margin: -1px;
	border-radius: 15px;
	text-decoration: none;
}
</style>
<link rel="stylesheet" href="../resources/css/searchfacility.css">
</head>
<body>

<div class="container"><div class="row">
	<div id="maindetailform" class="col-12 col-md-5">
	<form:form method="POST" modelAttribute="DamageReport" action="">
		<h3>Damage Report Details</h3>
		<table class="table">
			<tr>
				<th width="45%">Description</th>
				<th width="55%">Detail</th>
			</tr>
			<tr>
				<td>Issue ID</td>
				<td><div id="issueid" style="display:none">${DamageReport.issueId}</div>
				<form:input path="issueId" type="hidden"></form:input>${DamageReport.issueId}
			</tr>
			<tr>
				<td>Facility Name</td>
				<td><div id="facid" style="display:none">${DamageReport.facility.facilityId}</div>
				<form:input path="facility.facilityName" type="hidden"></form:input>${DamageReport.facility.facilityName}</td>
			</tr>
			<tr>
				<td>Issue Date</td>
				<td><form:input path="issueDate" type="hidden"></form:input>${DamageReport.issueDate}</td>
			</tr>
			<tr>
				<td>Description</td>
				<td><form:input path="description" type="hidden"></form:input>${DamageReport.description}</td>
			</tr>
			<tr>
			<td>Status</td>
			<td>
             <form:select path="status" name="status">
                <form:option value="open">open</form:option>
                <form:option value="investigating">investigating</form:option>
                 <form:option value="maintenance scheduled">maintenance scheduled</form:option>
                <form:option value="resolved">resolved</form:option>
            </form:select></td>
			</tr>
			<tr>
			</tr>

			<tr>
				<td align=right><a href="../maintenance" class="btn btn-danger">Back</a></td>
				<td><input type="submit" class="btn btn-success" value="Change Status"></td>
			</tr>
			<tr>
				<td colspan=2 align=center><a href="${pageContext.request.contextPath}/admin/plain/createmaintenancebooking" id="schedulemaint" class="btn btn-warning">Schedule Maintenance</a></td>
			</tr>
			<tr><td colspan=2></td></tr>
		</table>
	</form:form></div>
	<div class=" col-12 col-md-6 pl-3">
		<div class="container p-3"><div class="row">
		<div id="calendar" class="col-12 pr-5" style="width:200px; display:none"></div>
		<div id="bookmaint"  style="border:1px #000 solid; display:none" class="bookmaint col-12 pl-5 p-3"></div>
		</div></div>
	</div>

</div></div>

<script>
$(document).ready(function() {
	$("#schedulemaint").click(function(e) {
		e.preventDefault();
		$('#calendar').show();
		checktimes();
	});
});

function checktimes() {
	$('#bookmaint').show();
	var facid = $("#facid").text();
	var date = $("#calendar").datepicker().val();
	$.get("${pageContext.request.contextPath}/admin/plain/createmaintenancebooking", {
		bookdate : date,
		facid : facid
	}, function(data) {
		$('#bookmaint').html(data);
	});
}



</script>

</body>
</html>