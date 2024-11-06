<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- main.jsp -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>main</title>
<script type="text/javascript">
		$(function() {
			
			$(window).scroll(function() {
			    if ($(this).scrollTop() > 1) {  // 스크롤이 50px 이상 내려갔을 때
			        $('.navbar').addClass('scrolled');
			        $('.nav-link, .navbar-brand').addClass('scrolled');
			    } else {
			        $('.navbar').removeClass('scrolled');
			        $('.nav-link').removeClass('scrolled');
			    }
			});
			
			$('.carousel').carousel();
		});
	</script>
<style>
body{
	padding-top: 0;
}

.navbar.scrolled {
    background-color: white; /* 스크롤 시 배경 색상 */
    border-bottom: 0.5px solid #f0f0f0;
}
.nav-link.scrolled{
	color:black;
}
.nav-link {
		color: white;
}
.navbar{
	    transition: background-color 0.3s ease;
    	background-color: transparent;
    	border-bottom: 0;
}
h3 {
	text-align: center;
}
.carousel-item img {
	width: 1600px;
	height: 800px;
}
</style>
</head>
<body>
<div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel" data-interval="5000">
	<ol class="carousel-indicators">
		<li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
		<li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
		<li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
		<li data-target="#carouselExampleIndicators" data-slide-to="3"></li>
	</ol>
	<div class="carousel-inner">
		<div class="carousel-item active">
			<img src="/upload/goods/main2.jpg" alt="Slide 1">
		</div>
		<div class="carousel-item">
			<img src="/upload/goods/m1.jpg" alt="Slide 2">
		</div>
		<div class="carousel-item">
			<img src="/upload/goods/m2.jpg" alt="Slide 3">
		</div>
		<div class="carousel-item">
			<img src="/upload/goods/m3.jpg" alt="Slide 4">
		</div>
	</div>
	<a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
		<span class="carousel-control-prev-icon" aria-hidden="true"></span>
		<span class="sr-only">Previous</span>
	</a>
	<a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
		<span class="carousel-control-next-icon" aria-hidden="true"></span>
		<span class="sr-only">Next</span>
	</a>
</div>
<div class="container">

	  	${weatherVO.forecastWeather }
	 
	
</div>
</body>
</html>