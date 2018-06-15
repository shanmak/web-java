<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>T7 ClubHouse: Admin Dashboard</title>
<style>
.nametext{
	padding: 10px;
	width: 800px;
	margin: 0px;
	text-align: left;
	font-size: 0.8rem;
}
.headerbtn{
	width: 800px;
	padding: 30px;
}
.dashboardbtn{
	padding: 50px 30px;
	width: 400px;
	font-size: 1.6rem;
	color: #fff;
}

.icon{
	font-size: 2rem;
	padding-right: 20px;
}

.logoutarea{
	
	font-size: 1.2rem;
}
</style>
</head>
<body>
<div class="btn btn-light nametext"><h5>Welcome Admin: ${usersession.getFirstName()} ${usersession.getLastName()}</h5>
<a href="../logout"><span class="logoutarea" style="float:right">LOGOUT</span></a></div><br/>
<div class="btn btn-dark headerbtn"><h3 >T7 ClubHouse Admin Dashboard</h3></div><br/>
<a href="${pageContext.request.contextPath}/admin/bookinglist"><span class="dashboardbtn btn btn-info"><i class="fa fa-calendar icon"></i> Manage Bookings</span></a><a href="${pageContext.request.contextPath}/admin/list"><span class="dashboardbtn btn btn-success"><i class="fa fa-life-ring icon"></i>Manage Facilities</span><br/></a>
<a href="${pageContext.request.contextPath}/admin/maintenance"><span class="dashboardbtn btn btn-warning"><i class="fa fa-wrench icon"></i>Maintenance</span></a><a href="${pageContext.request.contextPath}/admin/userlist"><span class="dashboardbtn btn btn-primary"><i class="fa fa-user icon"></i>Manage Users</span></a>

</body>
</html>