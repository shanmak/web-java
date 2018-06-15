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
    T7 ClubHouse Members: Facility Booking
  </title>

<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<script>
$(".del").click(function(e){
	e.preventDefault();
	toastr.success("Item Deleted!","");
    $("#mainpanel").load($(this).attr("href"));
    return false;
});
	
	$('#form-cart').submit(function() { 
	    $.ajax({ 
	        data: $(this).serialize(), 
	        type: $(this).attr('method'), 
	        url: $(this).attr('action'), 
	        success: function(data) { 
	            $('#mainpanel').html(data); 
	        }
	    });
	    return false; 
	});
	
	$(function () {
		  $('[data-toggle="tooltip"]').tooltip()
		})
</script>
</head>
<body>
	<form id="form-cart" action="confirmcart" class="" method="post">
		<div class="container">
			<div class="row">
				<div class="col-12">

					<h3>My Cart</h3>
					<c:choose><c:when test="${empty cartlist}">
				   	<div class="alert alert-info" role="alert">
						<strong>Your cart is empty!</strong> Choose a facility and date
								to continue booking.
					</div></c:when>
				   	<c:otherwise>
					
					<div class="alert alert-warning"
						style="display: ${duplicate ? 'block' : 'none'};">
						<strong>Duplicate Booking Timings not added - see below</strong>
					</div>
					<table class="table table-striped table-hover">
						<tr>
							<td>No.</td>
							<td>Facility Name</td>
							<td>Reserved Date</td>
							<td>Slot Description</td>
							<td></td>
						</tr>
						<c:forEach items="${cartlist}" var="cart" varStatus="itemsRow">
							<tr>
								<td><c:out value="${itemsRow.index+1}"></c:out></td>
								<td><c:out value="${cart.facilityName}"></c:out></td>
								<td><c:out value="${cart.reservedDate}"></c:out></td>
								<td><c:out value="${cart.slot.slotDescription}"></c:out></td>
								<td><c:choose><c:when test="${cart.isDuplicate}">
				   					<i class="warn fas fa-exclamation-circle" data-toggle="tooltip" data-placement="top" title="Duplicate not added"></i></c:when>
									<c:otherwise><a href="deletefromcart?id=${itemsRow.index}"
									class="del">Delete</a></c:otherwise></c:choose></td>
							</tr>
						</c:forEach>

					</table>
					<div class="col-12 pr-5" style="text-align: right;">
						<button type="submit" id="confirmcartbtn"
							class="confirmcartbtn btn btn-outline-success">CONFIRM
							BOOKING</button>
					</div>
					</c:otherwise></c:choose>
				</div>
			</div>
		</div>
	</form>
	
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="../resources/js/index.js"></script>
</body>
</html>