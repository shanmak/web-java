<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="fa"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>T7 Admin Dashboard: All Bookings</title>
</head>
<body>

<h1><center>Booking History</center></h1>
<table  border="1" align="center" class="table table-striped thead-dark">
		<thead>
			<tr class="listHeading">
				<th><spring:message code="Booking ID" /></th>
				<th><spring:message code="Username" /></th>
				<th><spring:message code="Facility Name" /></th>
				<th><spring:message code="Reserved Date" /></th>
				<th><spring:message code="Time Slot" /></th>
				<th><spring:message code="Booking Status" /></th>
			</tr>
		</thead>

<fa:forEach var="bd" items="${bd}">
<tr>
<td><center>${bd.getBooking().getBookingId()}</center></td>
<td><center>${bd.getBooking().getUser().getUserName()}</center></td>
 <td><center>${bd.getFacility().getFacilityName()}</center></td>
<td><center>${bd.getReservedDate()}</center></td>
<td> <center>${bd.getSlot().getSlotDescription()}</center></td>
<td><center>${bd.getStatus()}</center></td> 
<%-- <td align="center"><a
						href="${pageContext.request.contextPath}/admin/edit/${faclist.facilityId}.html"><spring:message
								code="caption.edit" /></a></td>
					<td><a
						href="${pageContext.request.contextPath}/admin/delete/${faclist.facilityId}.html"><spring:message
								code="caption.delete" /></a></td> --%>
								
</fa:forEach>	
</table>							
</body>
</html>