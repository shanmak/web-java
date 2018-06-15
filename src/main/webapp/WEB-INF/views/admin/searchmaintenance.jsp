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
    Admin: Search Results for Facility Availability
  </title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css">
<link href="https://fonts.googleapis.com/css?family=Kaushan+Script|Montserrat:400,700|Roboto+Slab:400,700" rel="stylesheet">
<link href="https://code.jquery.com/uui/1.10.4/themes/ui-lightness/jquery-ui.css" rel="stylesheet">
<link rel="stylesheet" 	href="https://use.fontawesome.com/releases/v5.0.13/css/all.css">
<link rel="stylesheet" href="../resources/css/welcome.css">
<script src="https://code.jquery.com/jquery-3.3.1.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css" rel="stylesheet">
<script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>
<link rel="stylesheet" href="../../resources/css/searchresults.css">
<link rel="stylesheet" href="../../resources/js/maintresults.js">
<style>
body{
	background-color: #ebedef;
}
.selectable .ui-widget-content {
	background-color: #ebedef;
	}
	
.selectable .ui-selectee:hover {
	background: #fff;
}
</style>
</head>
<body>
	<form id="form-booking" class="formbook" action="" method="post">
		<input type="hidden" name="count" id="count"
			value="${fn:length(facslots)}"> Schedule Maintenance for: <span
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
						value="Schedule Maintenance">
				</div>
				<div class="col-12  justify-content-left">Note: Time Slots are
					in blocks of 1 hour<br/> red slots are unavailable</div>
			</div>
		</div>

	</form>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="../resources/js/index.js"></script>
<script>

function toasterOptions() {
		toastr.options = {
			"closeButton" : true,
			"debug" : false,
			"newestOnTop" : false,
			"progressBar" : false,
			"positionClass" : "toast-top-right",
			"preventDuplicates" : true,
			"onclick" : null,
			"showDuration" : "300",
			"hideDuration" : "1000",
			"timeOut" : "5000",
			"extendedTimeOut" : "1000",
			"showEasing" : "swing",
			"hideEasing" : "linear",
			"showMethod" : "fadeIn",
			"hideMethod" : "fadeOut"
		};
	};

		$(".selectable").each(
				function(indexi) {
					$(".fac-" + indexi).bind("mousedown", function(e) {
						e.metaKey = true; }).selectable({
								filter : ".enabled",
								stop : function() {
									var result = $(".showarea-" + indexi).empty();
									var result2 = $(".resultarea").empty()
											.append($(".fackey-" + indexi).text());
									$(".ui-selected", this).each(function() {
												var index = $(".fac-" + indexi + " li").index(this);
												result.append("#" + (index + 1));
												result2.append("," + (index + 1));
											});
								}
							});
				});


	$(document).ready(
			function() {
				$("#form-booking").submit(
						function(e) {
							e.preventDefault();
							var date = $(".datearea").text();
							var count = $("#count").val();
							var booknames = [];
							var bookslots = [];
							var hasdata = false;
							for (i = 0; i < count; i++) {
								booknames.push($(".fackey-" + i).text());
								if ($(".showarea-" + i).text() != "") {
									hasdata = true;
									bookslots.push($(".showarea-" + i).text());
								} else {
									bookslots.push("#0");
								}
							}
							;

							if (!hasdata) {
								toasterOptions();
								toastr.error("Please choose a slot to add!",
										"No Slot Selected");
							} else {
								var issueid = $("#issueid").text();
								$.post("${pageContext.request.contextPath}/admin/plain/createmaintenancebooking", {
									'bookdate' : date,
									'count' : count,
									'bookfacnames' : JSON.stringify(booknames),
									'bookslots' : JSON.stringify(bookslots),
									'issueid' : issueid
								}, function(data) {
									$('#bookmaint').html(data);
								});
								$('#maindetailform').hide();
								$('#calendar').hide();
							}
						});
			});

	$('.enabled').css('cursor', 'pointer');
</script>
</body>
</html>