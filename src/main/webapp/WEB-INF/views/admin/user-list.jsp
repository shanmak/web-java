<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="fa"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html>
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>T7 Admin Dashboard: User List</title>
</head>
<body>
<a href="${pageContext.request.contextPath}/admin/home"><div class="btn btn-warning"><i class="fa fa-home"></i>HOME</div></a><br/><br/>

<h3> User List</h3>
<table class="table">
<tbody>


<fa:forEach var="userlist" items="${userlist}">
<tr>
<td> ${userlist.userId}</td>
<td> ${userlist.userName}</td>
<td> ${userlist.firstName}</td>
<td> ${userlist.lastName}</td>
<td> ${userlist.email}</td>
<td> ${userlist.contactNumber}</td>
<td> ${userlist.role}</td>

<td align="center"><a
						href="${pageContext.request.contextPath}/admin/useredit/${userlist.userId}"><spring:message
								code="caption.edit" /></a></td>
					<td><a
						href="${pageContext.request.contextPath}/admin/deleteuser/${userlist.userId}"><spring:message
								code="caption.delete" /></a></td>
</tr>

</fa:forEach>
</tbody>
</table>


</body>
</html>