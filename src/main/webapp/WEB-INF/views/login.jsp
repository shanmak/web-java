<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<title>The T7 ClubHouse: LogIn/Sign Up</title>

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<link
	href="https://fonts.googleapis.com/css?family=Kaushan+Script|Fira+Sans:400,700|Montserrat:400,700|Roboto+Slab:400,700"
	rel="stylesheet">
<link rel="stylesheet" href="resources/css/indexstyle.css">
<link rel="stylesheet" href="resources/css/loginstyle.css">

</head>

<body><div class ="bodycontainer">
     <div class ="backbrand">
        <a class="navbar-brand" href="index"><img src = "resources/images/t7logo.svg" width=50px>T7ClubHouse</a>
      </div></div>


	<main ontouchstart class="main with-hover">
	<aside>
		
		<div></div>
		
		<img src="resources/images/t7logo.svg">
		<div>
			<p id="intro-signup">
				Join <strong><span class="or">T7</span> ClubHouse</strong> <br />today!
			</p>
			<p id="intro-login" class="active">
				Welcome back to<br />
				<strong><span class="or">T7</span> ClubHouse</strong>!
			</p>
		</div>

	</aside>

	<section>
		<h1>
			<a id="link-signup">Sign Up</a> | <a id="link-login" class="active">Log
				In</a>
		</h1>
		<form id="form-login" method="post" modelAttribute="userForm" 
			action="authenticate" class="needs-validation active">
			<div>
				<fieldset>
					<div>
						<label for="userid">Username</label> <input id="userid"
							type="text" name="userName" placeholder="username" required />
					</div>
				</fieldset>
				<fieldset>
					<div>
						<label for="password">Password</label> <input id="password"
							type="password" name="password" placeholder="••••••••"
							pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}"
							title="Must contain at least one number and one uppercase and lowercase letter, and at least 8 or more characters"
							required />
					</div>
				</fieldset>
				<fieldset><c:if test="${loginerror}">
				<div class="alert alert-danger pl-3 p-1 mb-0" style="font-size: 0.8rem;" role="alert">
  				<strong>Something went wrong! </strong>   Please try again!.</div></c:if></fieldset>
			</div>

			<input type="submit" value="Log In" />
		</form>
		
		<form id="form-signup" method="post" modelAttribute="userForm" action="registration" class="needs-validation">

			<div class="form-group">
				<input id="userId" name="userId" type="hidden" value="0"/> 
				<input id="role" name="role" type="hidden" value="member"/> 
				<fieldset>
					<div>
						<label for="username">Username</label> <input id="userName" name="userName" type="text"
							placeholder="username" required />
					</div>	
				</fieldset><div id="feedback" style="width: 100%; text-align:right;"></div>
				<fieldset>
					<div>
						<label for="password">Password</label> <input id="password1" name="password"
							type="password" placeholder="••••••••"
							pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}"
							title="Must contain at least one number and one uppercase and lowercase letter, and at least 8 or more characters"
							required />
					</div>
				</fieldset>
				</fieldset>
				<fieldset>
					<div>
						<label for="confirm_password">Password</label> <input
							id="confirm_password" type="password" placeholder="••••••••"
							required />
					</div>
				</fieldset>
				<fieldset>
					<div>
						<label for="name">First Name</label> <input id="firstName" name ="firstName"
						type="text" placeholder="Jane" required />
					</div>
				</fieldset>
				<fieldset>
					<div>
						<label for="name">Last Name</label> <input id="lastName" name="lastName"
							 type="text" placeholder="Smith" required />
					</div>
				</fieldset>
				<fieldset>
					<div>
						<label for="email">Email</label> <input id="email" name="email" type="email"
							placeholder="janesmith@email.com" required />
					</div>
				</fieldset>
				<fieldset>
					<div>
						<label for="address">Address</label> <input id="address" name = "address"
							type="text" placeholder="Address" />
					</div>
				</fieldset>
				<fieldset>
					<div>
						<label for="mobile">Contact No.</label> <input id="contactNumber" name="contactNumber"
							type="text" placeholder="91234567" pattern="^[0-9]{8}$"
							title="Please enter a valid 8-digit number"
							required  />
					</div>
				</fieldset>
				<c:if test="${creatingerror}">
				<div class="alert alert-danger pl-3 p-1 mb-0" style="font-size: 0.8rem;" role="alert">
  				<strong>Something went wrong! </strong> Please try again!.</div></c:if>
			</div>

			<input class="submitbtn" type="submit" value="Sign Up" />
		</form>

	</section>

	</main>

	<script src="https://code.jquery.com/jquery-3.3.1.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
	<script src="resources/js/login.js"></script>
	<script>
	$('#userName').bind('blur',function(e) {
		$.post("checkusername", { username: $('#userName').val()
		}, function(data) {
			$('#feedback').html(data);
			if($("#fdb").text()=="true") { $("#userName").addClass("is-invalid");
			$('.submitbtn').attr('disabled', true);} 
			else{ $("#userName").removeClass("is-invalid"); 
			$('.submitbtn').attr('disabled', false);}
		});
	});
	</script>
</body>

</html>
