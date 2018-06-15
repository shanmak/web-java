<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <title>
    T7 ClubHouse Admin: Maintenance Booking Confirmation
  </title>

<script>
	$(function () {
		  $('[data-toggle="tooltip"]').tooltip()
		})
</script>

</head>
<body>
	<form id="form-confirm" class="" action="" method="post">
	<div class="container"><div class="row"><div class="col-12">

	<h3>Booking Confirmation</h3><br/>
	<div class="alert alert-warning" style="display: ${cartsuccess.contains(false) ? 'block' : 'none'};">
	  <strong>We are very sorry! Some Dates may have already been booked</strong> <br/>
	  Please see below for details
	</div>
	<table class="table table-striped table-hover">
			<tr>
				<td>No.</td>
                <td>Facility Name</td>
                <td>Reserved Date</td>
                <td>Slot Description</td>
                <td>Booked</td>
            </tr>
		<c:forEach items="${bookedcart}" var="cart" varStatus="itemsRow">
		    <tr>
		    	<td><c:out value="${itemsRow.index+1}"></c:out></td>
                <td><c:out value="${cart.facilityName}"></c:out></td>
                <td><c:out value="${cart.reservedDate}"></c:out></td>
                <td><c:out value="${cart.slot.slotDescription}"></c:out></td>
                <td> <c:choose>
				   <c:when test="${cartsuccess[itemsRow.index]}">
				   <i class="fas fa-check-circle text-success" data-toggle="tooltip" data-placement="top" title="Booked Successfully"></i></c:when>
				   <c:otherwise><i class="fas fa-times-circle text-danger" data-toggle="tooltip" data-placement="top" title="Conflict! Not Booked"></i>
				   </c:otherwise>    
				</c:choose>
				</td>
			 </tr>
		</c:forEach>
	</table>
	<div class ="col-12 pr-5" style="text-align: right;"><a href = "${pageContext.request.contextPath}/admin/maintenance" class="btn btn-outline-warning">Maintenance HOME</a></div>
	</div></div></div>
	</form>

</body>
</html>