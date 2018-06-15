<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<title>T7 ClubHouse Admin Dashboard: Add New Facility</title>
</head>
<body>

 <form:form method="POST" modelAttribute="Facility"
	action="${pageContext.request.contextPath}/admin/edit/${faclist.facilityId}.html">
		<center>
			<table cellpadding=4 cellspacing=2 border=0>
				<tr>
					<th width="45%">Description</th>
					<th width="55%">Detail</th>
				</tr>
				 <tr>
				   <td><s:message code="facility.id" text="Facility ID" /> *</td>
				   <td><form:input path="FacilityId"/>
				   
				 </tr> 
				 <tr>
				   <td><s:message code="facility.name" text="Facility Name" /> *</td>
				   <td><form:input path="FacilityName"/>
				  
				 </tr> 
				<tr>
				   <td><s:message code="facility.type" text="Type"/></td>
				   <td><form:input path="FacilityType"/>
				  
				 </tr>
				<tr>
				   <td><s:message code="facility.description" text="Description"/> *</td>
				   <td><form:textarea rows="5" cols="22" path="Description"/>
				  
				 </tr>
				<tr>
				   <td><s:message code="facility.venue" text="Venue"/></td>
				   <td><form:input path="Venue"/>
				  
				 </tr>

				 <tr>
				 <td><input type="submit" value="Submit"> </td>
				 <td><input type="reset" value="Reset"></td>
				 </tr>
		</table>
		</center>
	
	</form:form> 
</body>
</html>