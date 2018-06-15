<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html >
<html>
<head>
<link href="<c:url value='/css/style.css'/>" rel="stylesheet"
	type="text/css" />
</head>
<body>
<a href="${pageContext.request.contextPath}/admin/home"><div class="btn btn-warning"><i class="fa fa-home"></i>HOME</div></a><br/><br/>

<h3><center> Add a New Facility</center></h3>
<form:form method="POST" commandName="Facility"
	action="${pageContext.request.contextPath}/admin/new.html">
		<center>
			<table cellpadding=4 cellspacing=2 border=0>
				<tr>
					<th width="45%">Description</th> 
					<th width="55%">Detail</th>
				</tr>
				<tr>
				   <td><s:message code="facility.id" /> *</td>
				   <td><form:input path="FacilityId"/>
				   <form:errors path="FacilityId" cssStyle="color: red;" /></td>
				 </tr>
				<tr>
				   <td><s:message code="facility.name" /> *</td>
				   <td><form:input path="FacilityName"/>
				   <form:errors path="FacilityName" cssStyle="color: red;" /></td>
				 </tr>
				<tr>
				   <td><s:message code="facility.type" /> *</td>
				   <td><form:input path="facilityType"/>
				   <form:errors path="facilityType" cssStyle="color: red;" /></td>
				 </tr>
				<tr>
				   <td><s:message code="facility.description" /> *</td>
				   <td><form:input path="description"/>
				   <form:errors path="description" cssStyle="color: red;" /></td>
				 </tr>
				<tr>
				   <td><s:message code="facility.venue" /></td>
				   <td><form:input path="venue"/>
				   <form:errors path="venue" cssStyle="color: red;" /></td>
				 </tr>
				 
				 <input name="image" path="image" type="hidden" value=""/> 
				 <input name="price" path="price" type="hidden" value="0"/> 

			
				 <tr>
				 <td><input type="submit" value="Submit"> </td>
				 <td><input type="reset" value="Reset"></td>
				 </tr>
		</table>
		</center>
	
	</form:form>
</body>
</html>