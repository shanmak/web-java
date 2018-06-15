<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html >
<html>
<head>

</head>
<body>
	<a href="${pageContext.request.contextPath}/admin/home"><div class="btn btn-warning">
			<i class="fa fa-home"></i>HOME
		</div></a>
	<br />
	<br />

	<h3>Add a New User</h3>

	<form id="form-signup" method="post" modelAttribute="userForm"
		action="createuser" class="col-12 col-sm-7 col-md-4 needs-validation">

		<div class="form-group">
			<input id="userId" name="userId" type="hidden" value="0" />
			<label
				for="username">Username</label> <input id="userName" name="userName"
				type="text" class="form-control" placeholder="username" value=""
				required /><div id="feedback" style="width: 100%; text-align: right;"></div>
		</div>
		
		<div class="form-group">
			<label for="password">Password</label> <input id="password1"
				name="password" class="form-control" type="password"
				placeholder="&#9679;&#9679;&#9679;&#9679;&#9679;&#9679;&#9679;&#9679;"
				pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}"
				title="Must contain at least one number and one uppercase and lowercase letter, and at least 8 or more characters"
				required />
		</div>
		<div class="form-group">
			<label for="confirm_password">Confirm Password</label> <input
				class="form-control" id="confirm_password" type="password"
				placeholder="&#9679;&#9679;&#9679;&#9679;&#9679;&#9679;&#9679;&#9679;"
				required />
		</div>
		<div class="form-group">
				<label for="name">First Name</label> <input id="firstName"
					name="firstName" class="form-control" type="text"
					placeholder="Jane" value="" required />
			</div>
		<div class="form-group">
				<label for="name">Last Name</label> <input id="lastName"
					name="lastName" class="form-control" type="text"
					placeholder="Smith" value="" required />
			</div>
		<div class="form-group">
				<label for="email">Email</label> <input id="email" name="email"
					type="email" class="form-control" placeholder="janesmith@email.com"
					value="" required />
			</div>
		<div class="form-group">
				<label for="address">Address</label> <input id="address"
					name="address" class="form-control" type="text" value=""
					placeholder="Address" />
			</div>
		<div class="form-group">
				<label for="mobile">Contact No.</label> <input id="contactNumber"
					name="contactNumber" class="form-control" type="text"
					placeholder="91234567" value="" pattern="^[0-9]{8}$"
					title="Please enter a valid 8-digit number" required />
			</div>
		<div class="form-group">	
		<label for="role">Role</label>		
			<select name="role" class="form-control">
			  <option value="admin">Admin</option>
			  <option value="member">Member</option>
			</select>
	</div>		
	<div class="form-group">
		<c:if test="${creatingerror}">
			<div class="alert alert-danger pl-3 p-1 mb-0"
				style="font-size: 0.8rem;" role="alert">
				<strong>Something went wrong! </strong> Please try again!.
			</div>
		</c:if>
		</div>
			<div class="form-group">
		<input class="btn btn-danger mx-3" type="reset" value="Reset" />
		<input class="submitbtn btn btn-success mx-3" type="submit" value="Sign Up" />
		</div>
	</form>
	<script src="https://code.jquery.com/jquery-3.3.1.js"></script>
	<script>
	$('#userName').bind('blur',function(e) {
		$.post("${pageContext.request.contextPath}/checkusername", { username: $('#userName').val()
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