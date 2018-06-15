<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Welcome: T7 ClubHouse Member Center</title>

    </head>
    
    <body>

<center>
<h1>
	ENJOY YOUR COMFORTABLE SPORT TIME!
</h1></center>
        
        <c:if test="${isnewuser}">
				<div class="alert alert-success" role="alert">
  				<strong>Welcome New User! </strong>   Your Member ID is: ${usersession.getUserId()}</div></c:if>
        


<table class="table">
<tr>
<th>Facility Name</th>
<th>Description</th>
<th></th>
</tr>

<tr>
<td>Function Room</td>
<td>The function room is provided for member to organize events/activities/games/training class like aerobic exercise. it is around 255 square feet.
<td><img src="${pageContext.request.contextPath}/resources/images/functionroom1(F001).jpg" width="600px" height="400px"></td> 
</tr>

<tr>
<td>Auditorium</td>
<td>The capacity is 500 people, and most for the companies to organize meetings or events/parties.</td>
<td><img src="${pageContext.request.contextPath}/resources/images/auditorium(F003).jpg" width="600px" height="400px"></td>
</tr>

<tr>
<td>Badminton Court</td>
<td>Outdoor and indoor badminton courts with air-thrust sports floor system are available for members to book.</td>
<td><img src="${pageContext.request.contextPath}/resources/images/badmintoncourt1(S013).jpg" width="600px" height="400px"></td>
</tr>

<tr>
<td>Basketball Court</td>
<td>There are 2 basketball courts can book. The smaller one is measuring exactly 90 by 45 feet size. The bigger one is with 94 by 50 feet size, and can contain about 100 audiences</td>
<td><img src="${pageContext.request.contextPath}/resources/images/basketballcourt1(S015).jpg"  width="600px" height="400px"></td>
</tr>

<tr>
<td>Billiard Room</td>
<td>There are 3 pool tables for members to play.The room size is 30*26 square feet.</td>
<td><img src="${pageContext.request.contextPath}/resources/images/billiardtables3(S008).jpg"  width="600px" height="400px"></td>
</tr>

<tr>
<td>Football Field</td>
<td>Designed to protect athletes, assist in player development, and provide a fast and flat surface supporting true ball roll and bounce.</td>
<td><img src="${pageContext.request.contextPath}/resources/images/footballfield(S005).jpg"  width="600px" height="400px"></td>
</tr>

<tr>
<td>Table Tennis Court</td>
<td>There are 2 tables in each court with air-thrust flooring (each courts). Area size is 7m*5m.</td>
<td> <img src="${pageContext.request.contextPath}/resources/images/tabletenniscourt1(S001).jpg" width="600px" height="400px"></td>
</tr>

</table>     
        </table>     
    </body>
</html> 