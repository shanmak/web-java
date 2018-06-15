<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html>
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>T7 ClubHouse Admin Dashboard: Booking List</title>
</head>
<body>
<a href="${pageContext.request.contextPath}/admin/home"><div class="btn btn-warning"><i class="fa fa-home"></i>HOME</div></a><br/><br/>
<h3> Booking List</h3>
  <c:if test="${cancelsuccess}">
				<div class="alert alert-success" role="alert">
  				<strong>Booking successfully cancelled! </strong> </div></c:if>
<table class="table">
<tr>
<th>Booking ID</th>
<th>User Name</th>
<th>Booking Date</th>
<th>Facility Name</th>
<th>Reserved Date</th>
<th>Reserved Time</th>
<th>Status</th>
<th></th>
<th></th>
<th></th>
</tr>

<c:forEach var="booklist" items="${booklist}">
<c:forEach var="item" items="${booklist.bookingitems}">
 <tr style="width:500px;">
 <td>${item.booking.bookingId} </td>
 <td>${item.booking.user.userName} </td>
 <td>${item.booking.bookingDate} </td>
 <td>${item.facility.facilityName} </td>
 <td>${item.reservedDate} </td>
 <td>${item.slot.slotDescription} </td>
 <td>${item.status} </td>
 <td><a href="cancelbooking/${item.detailId}">
 <spring:message code="caption.cancel" text="CANCEL" /></a></td>
 </tr>
</c:forEach>
</c:forEach>
</table>


</body>
</html>