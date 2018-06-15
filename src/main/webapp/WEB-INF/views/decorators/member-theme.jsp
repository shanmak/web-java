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
<link rel="stylesheet" href="../resources/css/welcome.css">
<script src="https://code.jquery.com/jquery-3.3.1.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css" rel="stylesheet">
<script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>
<decorator:head/>
</head>
<body>
     <nav class="navbar navbar-expand-lg navbar-dark fixed-top" id="mainNav">
      <div class="container">
        <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
          Menu
          <i class="fa fa-bars"></i>
        </button>
        <a class="navbar-brand js-scroll-trigger" href="../index"><img src = "${pageContext.request.contextPath}/resources/images/t7logo.svg" width=50px>T7ClubHouse</a>

        <div class="collapse navbar-collapse" id="navbarResponsive">
          <ul class="navbar-nav text-uppercase ml-auto">
            <li class="nav-item">
              <a class="nav-link" href="searchfacility">Search Facilities<span class = "badge">&nbsp;</span></a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="${pageContext.request.contextPath}/members/mybooking">My Bookings<span class = "badge">&nbsp;</span></a>
            </li>
            <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="welcome" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
         WELCOME, ${usersession.getFirstName()} <span class = "badge"><i class="fa fa-user-circle"></i></span>
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
          <a class="dropdown-item" href="welcome">MEMBER HOME</a>
          <a class="dropdown-item" href="../logout">LOG OUT</a>
        </div>
      </li>
          </ul>
          </div>
      </div>
    </nav>
   <div class= "mcontent"><decorator:body /></div>



<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="../resources/js/index.js"></script>
</body>
</html>