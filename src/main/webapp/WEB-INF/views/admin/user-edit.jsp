<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="<c:url value='/css/style.css'/>" rel="stylesheet"
	type="text/css" />
</head>
<body>
<h1>Edit User</h1>

 <form:form method="POST" modelAttribute="user"
	 action="${pageContext.request.contextPath}/admin/useredit/${user.userId}.html"> 
		<center>
			<table cellpadding=4 cellspacing=2 border=0>
				<tr>
					<th width="45%">Description</th>
					<th width="55%">Detail</th>
				</tr>
		<%-- 		 <tr>
				   <td><s:message code="user.id" /> *</td>				 
				   <td><form:input path="userId"/>
				   <c:out value="userId"></c:out>
				   
				 </tr>  --%>
				 <tr>
				   <td><s:message code="user.name" /> *</td>
				   <td><form:input path="userName"/>
				  
				 </tr> 
				<tr>
				   <td><s:message code="user.firstname" /> *</td>
				   <td><form:input path="firstName"/>
				  
				 </tr>
				<tr>
				   <td><s:message code="user.lastname" /> *</td>
				   <td><form:input path="lastName"/>
				  
				 </tr>
				<tr>
				   <td><s:message code="user.mailId" /></td>
				   <td><form:input path="email"/>
				  
				 </tr>
				 <tr>
				   <td><s:message code="user.Address" /></td>
				   <td><form:input path="address"/>
				  
				 </tr>
				<tr>
				   <td><s:message code="user.Contact" /></td>
				   <td><form:input path="contactNumber"/>
				  
				 </tr>
				<tr>
				   <td><s:message code="user.Role" /></td>
             <td><form:select path="role" name="role">
                <form:option value="member">Member</form:option>
                <form:option value="admin">Admin</form:option>
            </form:select></td>
				  
				 </tr>
				 
				 <tr>
				   <td><s:message code="user.Password" /></td>
				   <td><form:input type="password" path="password" />
				  
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