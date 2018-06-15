<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<head>
<style>
.fdb{
font-size: 0.8rem;
padding-right: 20px;
}
</style>
<link rel="stylesheet" 	href="https://use.fontawesome.com/releases/v5.0.13/css/all.css">
</head>
<body><div id="fdb" style="display:none;">${feedback}</div>
      <c:choose>
         <c:when test = "${feedbackisempty}"><span class = "fdb feedbacktext text-danger"><i class="fas fa-times-circle"></i> Please enter a username</span>
         </c:when>
         <c:when test = "${feedback}">
            <span class = "fdb feedbacktext text-danger"><i class="fas fa-times-circle"></i> UserName ${usercheckname} is already taken!</span>
         </c:when>
         <c:otherwise>
            <span class = "fdb feedbacktext text-success"><i class="fas fa-check-circle"></i> UserName ${usercheckname} is available!</i></span>
         </c:otherwise>
      </c:choose>
</body>