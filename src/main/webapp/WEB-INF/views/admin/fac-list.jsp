<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="fa"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html>
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>T7 ClubHouse Admin Dashboard: Facility List</title>
</head>
<body>
<a href="${pageContext.request.contextPath}/admin/home"><div class="btn btn-warning"><i class="fa fa-home"></i>HOME</div></a><br/><br/>

<table class="table">
<h3> Facility List</h3>
<tr>
<th>Facility ID</th>
<th>Facility Name</th>
<th>Facility Type</th>
<th>Venue</th>
<th colspan=2> <a href="${pageContext.request.contextPath}/admin/new"><div class="btn btn-primary"><i class="fa fa-life-ring"></i> ADD NEW</div></a></th>
</tr>


<fa:forEach var="faclist" items="${faclist}">
<tr>
<td> ${faclist.facilityId}</td>
<td> ${faclist.facilityName}</td>
<td> ${faclist.facilityType}</td>
<td> ${faclist.venue}</td>
<td align="center"><a
						href="edit/${faclist.facilityId}"><spring:message
								code="caption.edit" text="EDIT" /></a></td>
					<td><a
						href="delete/${faclist.facilityId}"><spring:message
								code="caption.delete" text="DELETE" /></a></td>
</tr>
</fa:forEach>
</table>


</body>
</html>