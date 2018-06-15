<%@page	import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator" prefix="decorator" %>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <title>
    Members: Search Results for Facility Availability
  </title>
<link rel="stylesheet" href="../resources/css/welcome.css">
<link rel="stylesheet" href="../resources/css/searchresults.css">
<script src="../resources/js/searchresults.js"></script>

</head>
<body>
	<form id="form-booking" class="formbook" action="" method="post">
		<input type="hidden" name="count" id="count"
			value="${fn:length(facslots)}"> Make Booking for: <span
			class="datearea">${date}</span><br /> <br />
		<div class="timegrid container ml-0">
			<div class="row">
				<c:forEach var="fac" items="${facslots}" varStatus="itemsRow">
					<div class="col-12 pb-3">
						<span class="facil fackey-${itemsRow.index}">${fac.key}</span><br />
						<span class="result showarea-${itemsRow.index}"
							style="display: none"></span>
						<ol id="" class="selectable fac-${itemsRow.index} ${fac.key}">
							<li class="ui-widget-content ${fac.value[1] ? 'disabled' : 'enabled'}">09:00 am</li>
							<li class="ui-widget-content ${fac.value[2] ? 'disabled' : 'enabled'}">10:00 am</li>
							<li class="ui-widget-content ${fac.value[3] ? 'disabled' : 'enabled'}">11:00 am</li>
							<li class="ui-widget-content ${fac.value[4] ? 'disabled' : 'enabled'}">12:00 nn</li>
							<li class="ui-widget-content ${fac.value[5] ? 'disabled' : 'enabled'}">01:00 pm</li>
							<li class="ui-widget-content ${fac.value[6] ? 'disabled' : 'enabled'}">02:00 pm</li>
							<li class="ui-widget-content ${fac.value[7] ? 'disabled' : 'enabled'}">03:00 pm</li>
							<li class="ui-widget-content ${fac.value[8] ? 'disabled' : 'enabled'}">04:00 pm</li>
							<li class="ui-widget-content ${fac.value[9] ? 'disabled' : 'enabled'}">05:00 pm</li>
							<li class="ui-widget-content ${fac.value[10] ? 'disabled' : 'enabled'}">06:00 pm</li>
							<li class="ui-widget-content ${fac.value[11] ? 'disabled' : 'enabled'}">07:00 pm</li>
							<li class="ui-widget-content ${fac.value[12] ? 'disabled' : 'enabled'}">08:00 pm</li>
						</ol>
					</div>
				</c:forEach>
				<div class="col-12 cartbutton pr-5">
					<input type="submit" class="btn btn-outline-success" id="submitbtn"
						value="Add to Cart">
				</div>
				<div class="col-12  justify-content-left">Note: Time Slots are
					in blocks of 1 hour, red slots are unavailable</div>
			</div>
		</div>

	</form>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="../resources/js/index.js"></script>
</body>
</html>