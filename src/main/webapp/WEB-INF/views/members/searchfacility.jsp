<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>T7 Members: Search for Facility</title>
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

	$(document).ready(function() {
		$("#ddlFacility").change(function() {
			checktimes();
		});

		$(document).on("click", "#buttonshow", function() {
			var date = $("#calendar").datepicker({
				dateFormat : 'yy-mm-dd'
			}).val();
			checktimes();
		});

		$(".cartlink").click(function() {
			$("#mainpanel").load($(this).attr("href"));
			return false;
		});
	});

	function checktimes() {
		var factype = $("#ddlFacility option:selected").text();
		var date = $("#calendar").datepicker().val();
		$.get("searchresults", {
			bookdate : date,
			factype : factype
		}, function(data) {
			$('#mainpanel').html(data);
		});
	}
</script>
<link rel="stylesheet" href="../resources/css/searchfacility.css">
</head>
<body>

	<form action="searchfacility" class="form-group form-inline"
		method="post">
		<div class="grid-container">
			<div class="backarea">
				<div class="homebtn btn btn-outline-warning"><a href = "welcome">
					<i class="far fa-arrow-alt-circle-left"></i> HOME
				</a></div>
			</div>
			<div class="selectarea">
				Search for Facility Availability <br />Select a Facility:&nbsp; <select
					name="facility" id="ddlFacility" class="form-control">
					<c:forEach items="${factypes}" var="facility">
						<option value="${facility}">${facility}</option>
					</c:forEach>
				</select> <input type="button" id="buttonshow"
					class="btn btn-outline-success" style="display:none;" value="Search for Times" />
			</div>
			<div class="cartarea">
				<a href="viewcart" class="cartlink"><i
					class="fas fa-shopping-cart"><span id="cartareain"> CART</span></i></a>
			</div>
			<div id="calendar"></div>
			<div id="mainpanel"></div>
			<div id="side"></div>
		</div>
	</form>


</body>
</html>