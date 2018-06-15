<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.0.13/css/all.css">

<link
	href="https://fonts.googleapis.com/css?family=Kaushan+Script|Montserrat:400,700|Roboto+Slab:400,700"
	rel="stylesheet">
<link rel="stylesheet" href="resources/css/indexstyle.css">
<title>T7 ClubHouse</title>
</head>
<body>
	<nav class="navbar navbar-expand-lg navbar-dark fixed-top" id="mainNav">
		<div class="container">
			<button class="navbar-toggler navbar-toggler-right" type="button"
				data-toggle="collapse" data-target="#navbarResponsive"
				aria-controls="navbarResponsive" aria-expanded="false"
				aria-label="Toggle navigation">
				Menu <i class="fa fa-bars"></i>
			</button>
			<a class="navbar-brand js-scroll-trigger" href="#"><img
				src="resources/images/t7logo.svg" width=50px>T7ClubHouse</a>

			<div class="collapse navbar-collapse" id="navbarResponsive">
				<ul class="navbar-nav text-uppercase ml-auto">
					<li class="nav-item"><a class="nav-link js-scroll-trigger"
						href="#about">About Us</a></li>
					<li class="nav-item"><a class="nav-link js-scroll-trigger"
						href="#facilities">Facilities</a></li>
					<li class="nav-item"><a class="nav-link"
						href="login">LOGIN / SIGNUP</a></li>
				</ul>
			</div>

		</div>
	</nav>

	<div id="mycarousel" class="carousel slide" data-ride="carousel">
		<ol class="carousel-indicators">
			<li data-target="#mycarousel" data-slide-to="0" class="active"></li>
			<li data-target="#mycarousel" data-slide-to="1"></li>
			<li data-target="#mycarousel" data-slide-to="2"></li>
		</ol>
		<div class="carousel-inner" role="listbox">
			<div class="carousel-item active">
				<img class="d-block img-fluid" src="resources/images/splash1.jpg"
					alt="First slide">
				<div class="carousel-caption">
					<header class="masthead">
						<div class="intro-text">
							<div class="intro-lead-in">Welcome To The T7 ClubHouse!</div>
							<div class="intro-heading text-uppercase d-none d-md-block">SPORTS
								FOR THE FAMILY</div>
							<a
								class="btn btn-primary btn-xl text-uppercase js-scroll-trigger"
								href="#about">LEARN MORE</a> <a
								class="btn btn-success btn-xl text-uppercase js-scroll-trigger"
								href="${pageContext.request.contextPath}/login">LOG-IN/ SIGN UP</a>
						</div>
					</header>
				</div>
			</div>
			<div class="carousel-item">
				<img class="d-block img-fluid" src="resources/images/splash2.jpg"
					alt="Second slide">
				<div class="carousel-caption">
					<header class="masthead">
						<div class="container">
							<div class="intro-text">
								<div class="intro-lead-in">Welcome To The T7 ClubHouse!</div>
								<div class="intro-heading text-uppercase d-none d-md-block">LUXURY
									SPACES</div>
								<a
									class="btn btn-primary btn-xl text-uppercase js-scroll-trigger"
									href="#about">LEARN MORE</a> <a
									class="btn btn-success btn-xl text-uppercase js-scroll-trigger"
									href="${pageContext.request.contextPath}/login">LOG-IN/ SIGN UP</a>
							</div>
						</div>
					</header>
				</div>
			</div>
			<div class="carousel-item">
				<img class="d-block img-fluid" src="resources/images/splash3.jpg"
					alt="Third slide">
				<div class="carousel-caption">
					<header class="masthead">
						<div class="container">
							<div class="intro-text">
								<div class="intro-lead-in">Welcome To The T7 ClubHouse!</div>
								<div class="intro-heading text-uppercase d-none d-md-block">MEETING
									SPACES</div>
								<a
									class="btn btn-primary btn-xl text-uppercase js-scroll-trigger"
									href="#about">LEARN MORE</a> <a
									class="btn btn-success btn-xl text-uppercase js-scroll-trigger"
									href="${pageContext.request.contextPath}/login">LOG-IN/ SIGN UP</a>
							</div>
						</div>
					</header>
				</div>
			</div>
		</div>
		<a class="carousel-control-prev" href="#mycarousel" role="button"
			data-slide="prev"> <span class="carousel-control-prev-icon"
			aria-hidden="true"></span> <span class="sr-only">Previous</span>
		</a> <a class="carousel-control-next" href="#mycarousel" role="button"
			data-slide="next"> <span class="carousel-control-next-icon"
			aria-hidden="true"></span> <span class="sr-only">Next</span>
		</a>
	</div>
	<div class="spacer2" id="about"></div>
	<div class="intro pt-5">
		Enjoy the height of luxury and active sports at T7 ClubHouse

		<div class="container mt-3">

			<div class="row imggal">

				<div class="col-lg-3 col-md-4 col-sm-6">
					<a class="d-block mb-4 h-100"> <img
						class="img-fluid img-thumbnail" src="resources/images/img1.jpg"
						alt="">
					</a>
				</div>
				<div class="col-lg-3 col-md-4 col-sm-6">
					<a class="d-block mb-4 h-100"> <img
						class="img-fluid img-thumbnail" src="resources/images/img2.jpg"
						alt="">
					</a>
				</div>
				<div class="col-lg-3 col-md-4 col-sm-6">
					<a class="d-block mb-4 h-100"> <img
						class="img-fluid img-thumbnail" src="resources/images/img3.jpg"
						alt="">
					</a>
				</div>
				<div class="col-lg-3 col-md-4 col-sm-6">
					<a class="d-block mb-4 h-100"> <img
						class="img-fluid img-thumbnail" src="resources/images/img4.jpg"
						alt="">
					</a>
				</div>
			</div>

		</div>

	</div>

	<div class="header-intro">
		<div class="container-fluid">
			<div class="row">
				<div class="col-12 col-md-4 col-lg-3 m-auto  boxes">
					<div class="diamond">
						<div class="d-item">
							<i class="fas fa-futbol" aria-hidden="true"></i>
						</div>
					</div>
					<h3>Sports Facilities</h3>
					Basketball, Squash, Tennis Courts<br />
					Table Tennis<br /> Football Field<br />
				</div>
				<div class="col-12 col-md-4 col-lg-3 m-auto boxes">
					<div class="diamond">
						<div class="d-item">
							<i class="fa fa-user" aria-hidden="true"></i>
						</div>
					</div>
					<h3>Function Rooms</h3>
					Meeting Rooms<br /> Auditorium<br />
				</div>
				<div class="col-12 col-md-4 col-lg-3 m-auto boxes">
					<div class="diamond">
						<div class="d-item">
							<i class="fas fa-golf-ball" aria-hidden="true"></i>
						</div>
					</div>
					<h3>Resort Living</h3>
					Billiard Tables <br /> Swimming Pools<br /> Spa<br /> Restaurants
				</div>

			</div>
		</div>
	</div>
	<div class="spacer2" id="facilities"></div>
	<div class="container-fluid">
		<div class="row">
			<div class="col-12 fac pt-5">Facilities</div>
			<div class="left d-none d-md-block col-sm-4 cards p-5">
				Basketball Court<br />
				<a href="${pageContext.request.contextPath}/login"><button type="button" class="btn btn-outline-warning">Join
					NOW</button></a>
			</div>
			<div class="right col-md-8"></div>

			<div class="right2 col-12 col-md-8"></div>
			<div class="left2 d-none d-md-block col-sm-4 cards p-5">
				Badminton Court<br />
				<a href="${pageContext.request.contextPath}/login"><button type="button" class="btn btn-outline-danger">Join
					NOW</button></a>
			</div>

			<div class="left d-none d-md-block col-sm-4 cards p-5">
				Auditorium<br />
				<a href="${pageContext.request.contextPath}/login"><button type="button" class="btn btn-outline-warning">Join
					NOW</button></a>
			</div>
			<div class="right3 col-md-8"></div>


			<div class="right4 col-12 col-md-8"></div>
			<div class="left2 d-none d-md-block col-sm-4 cards p-5">
				Meeting Room<br />
				<a href="${pageContext.request.contextPath}/login"><button type="button" class="btn btn-outline-danger">Join
					NOW</button></a>
			</div>

		</div>
	</div>
	<footer class="footer">
		<div class="container p-5">
			<div class="row">
				<div class="subfoot col-sm-6 col-md-4 p-t-50">
					<h4 class="txt13 m-b-32">Opening Times</h4>

					<ul>
						<li class="txt14">09:00 AM - 09:00 PM</li>

						<li class="txt14">Every Day</li>
					</ul>
				</div>
				<div class="subfoot col-sm-6 col-md-4 p-2">
					<h4 class="txt13 m-b-33">Contact Us</h4>

					<ul class="m-b-70">

						<li class="txt14"><i
							class="fa fa-phone fs-16 dis-inline-block size19"
							aria-hidden="true"></i> (+65) 6716 6879</li>

						<li class="txt14 m-b-14"><i
							class="fa fa-envelope fs-13 dis-inline-block size19"
							aria-hidden="true"></i> contact@t7club.com</li>
					</ul>
				</div>


				<div class="subfoot col-sm-6 col-md-4 p-2">
					<h4 class="txt13 m-b-33">Find Us</h4>

					<ul class="m-b-70">
						<li class="txt14"><i
							class="fa fa-map-marker fs-16 dis-inline-block size19"
							aria-hidden="true"></i> 123 Resort Avenue, S(123456)</li>

					</ul>
				</div>
			</div>
		</div>
	</footer>
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
	<script
		src="//cdn.jsdelivr.net/npm/jquery.localscroll@2.0.0/jquery.localScroll.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
	<script src="resources/js/index.js"></script>
</body>
</html>