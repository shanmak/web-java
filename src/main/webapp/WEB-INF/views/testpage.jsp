<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Insert title here</title>

</head>
<body>
<form>
					<div>
						<label for="username">Username</label> <input id="userName" name="userName" type="text"
							placeholder="username" required />
					</div>	<div id="feedback" >hello</div></form>
<div id="one">
<c:out value="${testparam}"></c:out>
<c:out value="Tester Message***"></c:out><c:out value="${USERSESSION}"></c:out>
</div>
<div id="mainpanel" style="width:300px; height: 300px; background-color: yellow;"></div>


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


<script src="https://code.jquery.com/jquery-3.3.1.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script>
$('#userName').bind('blur',function(e) {
	alert("boos");
	$.get("home", {
	}, function(data) {
		$('#mainpanel').html(data);
	});
});
</script>
</body>
</html>