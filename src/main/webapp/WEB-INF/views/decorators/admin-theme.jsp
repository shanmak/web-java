<%@page	import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator" prefix="decorator" %>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <title>
    <decorator:title/>
  </title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css">
<link href="https://fonts.googleapis.com/css?family=Kaushan+Script|Montserrat:400,700|Roboto+Slab:400,700" rel="stylesheet">
<link href="https://code.jquery.com/uui/1.10.4/themes/ui-lightness/jquery-ui.css" rel="stylesheet">
<link rel="stylesheet" 	href="https://use.fontawesome.com/releases/v5.0.13/css/all.css">
<script src="https://code.jquery.com/jquery-3.3.1.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css" rel="stylesheet">
<script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/admin.css">
<decorator:head/>
</head>
<body>

	<div class="nav-side-menu">
    <div class="brand"><a class="navbar-brand js-scroll-trigger" href="${pageContext.request.contextPath}/index"><img src = "/team7clubapp/resources/images/t7logo.svg" width=50px>T7ClubHouse</a></div>
    <i class="fa fa-bars fa-2x toggle-btn" data-toggle="collapse" data-target="#menu-content"></i>
  
        <div class="menu-list">
  
            <ul id="menu-content" class="menu-content collapse out">
                <li>
                  <a href="${pageContext.request.contextPath}/admin/home"><i class="fa fa-home fa-lg fa-fw sidebar-icon"></i> Dashboard</a>
                </li>
                
               <li  data-toggle="collapse" data-target="#managebooking" class="collapsed">
                    <a href="#"><i class="fa fa-calendar fa-lg fa-fw sidebar-icon"></i> Manage Bookings
                    <i class="fas fa-caret-down"></i></a>
                </li>
                <ul class="sub-menu collapse" id="managebooking">
                    <li><a href="${pageContext.request.contextPath}/admin/bookinglist"><i class="fa fa-angle-right"></i> View/Delete Bookings</a></li>
                </ul>

                
                <li  data-toggle="collapse" data-target="#managefacility" class="collapsed">
                    <a href="#"><i class="fa fa-life-ring fa-lg fa-fw sidebar-icon"></i> Manage Facility
                    <i class="fas fa-caret-down"></i></a>
                </li>
                <ul class="sub-menu collapse" id="managefacility">
                    <li><a href="${pageContext.request.contextPath}/admin/list"><i class="fa fa-angle-right"></i> View Facilities</a></li>
                    <li><a href="${pageContext.request.contextPath}/admin/new"><i class="fa fa-angle-right"></i> Create New </a></li>
                </ul>
                

                <li  data-toggle="collapse" data-target="#managemembers" class="collapsed">
                    <a href="#"><i class="fa fa-user fa-lg fa-fw sidebar-icon"></i> Manage Members
                    <i class="fas fa-caret-down"></i></a>
                </li>
                <ul class="sub-menu collapse" id="managemembers">
                    <li><a href="${pageContext.request.contextPath}/admin/userlist"><i class="fa fa-angle-right"></i> View Members</a></li>
                    <li><a href="${pageContext.request.contextPath}/admin/createuser"><i class="fa fa-angle-right"></i> Create New </a></li>
                </ul>
                                
                                
                <li>
                  <a href="${pageContext.request.contextPath}/admin/maintenance"><i class="fa fa-wrench fa-lg fa-fw sidebar-icon"></i> Maintenance</a>
                </li>
                
                <ul class="sub-menu collapse" id="managereports">
                    <li><a href="${pageContext.request.contextPath}/admin/maintenance"><i class="fa fa-angle-right"></i>Damage Reports</a></li>
                </ul>
                
<!--
                <li>
                  <a href="#"><i class="fa fa-bar-chart fa-lg fa-fw sidebar-icon"></i> Statistics</a>
                </li>
-->

            </ul>
     </div>
</div>

<div class="main">
    <div class= "mcontent"><decorator:body /></div>
</div>


<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css" rel="stylesheet">
<script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
</body>
</html>