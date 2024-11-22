<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="decorator"
	uri="http://www.opensymphony.com/sitemesh/decorator"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<meta name="viewport"
	content="width=device-width, 
                initial-scale=1.0, 
                minimum-scale=1.0, 
                maximum-scale=1.0, 
                user-scalable=no, 
                viewport-fit=cover" />
<meta name="format-detection" content="telephone=no" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />




<!--Main CSS -->
<link rel="stylesheet" href="/resources/styles/reset.css?after">
<link rel="stylesheet" href="/resources/styles/common.css?after">
<link rel="stylesheet" href="/resources/styles/root.css?after">
<link rel="stylesheet" href="/resources/styles/main.css?after">
<link rel="stylesheet" href="/resources/styles/reponsive.css?after">


<link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet" />
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.css" />



<!-- Mian JS -->

<script
	src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.js"></script>
<script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
<script type="text/javascript" src="/resources/js/common.js?after"></script>





<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<!-- loginForm JS -->
<script src="/resources/js/loginForm.js"></script>

<!-- icon -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">

<!-- web-font [pretendard] -->
<link rel="stylesheet" type="text/css"
	href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard/dist/web/static/pretendard.css" />





<title>Reve : <decorator:title />
</title>

<style type="text/css">
</style>


<decorator:head />
</head>
<body class="body" id="body">

	<!-- header -->
	<header class="header">
		<div class="header-topbanner">
			<a href="#">신규 회원가입 시 50,000원 웰컴쿠폰 즉시 발급</a>
		</div>
		<div class="header-wrap display-flex">
			<div class="header-contents display-flex">
				<button class="menu-button header-menuicon">
					<img src="/resources/images/icons/menubar.svg" alt=""
						class="menuicon-black" />
				</button>
				<h1 class="logo">
					<a href="/main/main.do"><img src="/resources/images/logo.svg"
						alt="REVE로고" /></a>
				</h1>
				<nav class="gnb">
					<ul class="display-flex">
						<li><a href="#">NEW</a></li>
						<li><a href="/brands/list.do">BRAND</a></li>
						<li><a href="/woman/list.do">WOMAN</a></li>
						<li><a href="/goods/list.do">MAN</a></li>
						<li><a href="#">EVENT</a></li>
						<li><a href="#">REVIEW</a></li>
					</ul>
				</nav>
				<div class="header-icons display-flex">
					<ul class="display-flex">
						<li class="search-icon">
							<button>
								<img src="/resources/images/icons/search.svg" alt="검색 아이콘" />
							</button>
						</li>
						<li class="userpage-icon"><a href="/member/view.do"> <img
								src="/resources/images/icons/usericon.svg" alt="유저 아이콘" />
						</a></li>
						<li class="shoppingbag-icon"><a href="/cart/list.do"> <img
								src="/resources/images/icons/cart.svg" alt="카트 아이콘" />
						</a></li>
						<c:if test="${login.gradeNo == 9 }">
							<li><a href="/member/list.do" target="_blank"> <img
									width="24" height="24"
									src="https://img.icons8.com/pastel-glyph/24/groups--v1.png"
									alt="groups--v1" />
							</a></li>
						</c:if>
					</ul>



					<!-- 로그인/로그아웃 버튼 -->
					<c:choose>
						<c:when test="${not empty login}">
							<span class="login-icon"> <a href="/member/logout.do"><svg
										xmlns="http://www.w3.org/2000/svg" x="0px" y="0px" width="24"
										height="24" viewBox="0 0 48 48">
<path
											d="M 24 4 C 19.599415 4 16 7.599415 16 12 L 16 16 L 12.5 16 C 10.019 16 8 18.019 8 20.5 L 8 39.5 C 8 41.981 10.019 44 12.5 44 L 35.5 44 C 37.981 44 40 41.981 40 39.5 L 40 20.5 C 40 18.019 37.981 16 35.5 16 L 19 16 L 19 12 C 19 9.220585 21.220585 7 24 7 C 26.647834 7 28.781049 9.0253952 28.978516 11.613281 A 1.5003761 1.5003761 0 1 0 31.970703 11.386719 C 31.656169 7.2646048 28.194166 4 24 4 z M 24 27 C 25.657 27 27 28.343 27 30 C 27 31.657 25.657 33 24 33 C 22.343 33 21 31.657 21 30 C 21 28.343 22.343 27 24 27 z"></path>
</svg></a>
							</span>
						</c:when>
						<c:otherwise>
							<span class="login-icon"> <a href="/member/loginForm.do"><img
									src="/resources/images/icons/lock.svg" alt="자물쇠 아이콘" /></a>
							</span>
						</c:otherwise>
					</c:choose>


				</div>
			</div>
			<div class="header-contents__Mobile">
				<div class="m-header__icons display-flex">
					<button class="menu-button m-header__menu">
						<img src="/resources/images/icons/menubar.svg" alt=""
							class="m-menuicon-black" /> <img
							src="/resources/images/icons/menubar_white.svg" alt=""
							class="m-menuicon-white" />
					</button>
					<span class="m-login-icon"> <a href="/member/loginForm.do">
							<img src="/resources/images/icons/lock.svg" alt=""
							class="m-lockicon-black" /> <img
							src="/resources/images/icons/lock_white.svg" alt=""
							class="m-lockicon-white" />
					</a>
					</span>
				</div>

				<h1 class="logo display-flex">
					<a href="/main/main.do"> <img
						src="/resources/images/logo_light.svg" alt="REVE로고"
						class="logo-white" /> <img src="/resources/images/logo.svg"
						alt="REVE로고" class="logo-black" />
					</a>
				</h1>
				<div class="menubox">
					<ul class="menubox-list display-flex">
						<li><a href="#">NEW</a></li>
						<li><a href="/brands/list.do">BRAND</a></li>
						<li><a href="/woman/list.do">WOMAN</a></li>
						<li><a href="/goods/list.do">MAN</a></li>
						<li><a href="#">EVENT</a></li>
						<li><a href="#">REVIEW</a></li>
					</ul>
				</div>
			</div>
		</div>
	</header>
	<!-- /header -->

	<article>
		<!-- 여기에 개발자 작성한 body 태그 안에 내용이 들어온다. -->
		<decorator:body />
	</article>
	<!-- footer (S) -->
	<!-- footer -->
	<footer class="footer">
		<div class="footer-wrap">
			<div class="footer-contents display-flex">
				<div class="footer-company">
					<ul class="footer-contents__list display-flex">
						<li><a href="#">회사소개</a></li>
						<li><a href="#">공지사항</a></li>
						<li><a href="#">이용약관</a></li>
						<li><a href="#">개인정보처리방침</a></li>
						<li><a href="#">제휴상담</a></li>
					</ul>
					<div class="company-infowrap display-flex">
						<p>(주)레브</p>
						<ul class="company-info__list">
							<li><strong>대표자명</strong> xxx</li>
							<li><strong>사업자등록번호</strong> 201-86-12345 <a href="#"
								style="display: inline-block">[사업자정보확인]</a></li>
							<li><strong>통신판매업신고번호</strong> 205-경기고양-1234</li>
							<li><strong>주소</strong> (12345) 경기도 고양시 일산서구</li>
							<li><strong>개인정보보호책임자</strong> xxx</li>
						</ul>
					</div>
				</div>
				<a class="logo" href="/madin/main.do"> <img
					src="/resources/images/logo_light.svg" alt="로고" />
				</a>
				<div class="footer-service display-flex">
					<p class="csnumber">
						고객센터 <a href="tel:01047829909" style="display: inline-block">1588-1125</a>
					</p>
					<p>
						<strong>운영시간</strong> 10:00 ~ 17:00 (토,일요일 / 공휴일 휴무)
					</p>
					<p>
						<strong>E-mail</strong> <a href="mailto:1234567@gmail.com"
							style="display: inline-block">1234567@gmail.com</a>
					</p>
					<div class="footer-snsicons">
						<ul class="snsicons-list display-flex">
							<li><a href="#"> <img
									src="/resources/images/icons/sns_instagram.svg" alt="인스타그램" />
							</a></li>
							<li><a href="#"> <img
									src="/resources/images/icons/sns_x.svg" alt="엑스" />
							</a></li>
							<li><a href="#"> <img
									src="/resources/images/icons/sns_youtube.svg" alt="유튜브" />
							</a></li>
						</ul>
					</div>
				</div>
			</div>
			<p class="footer-copyright">COPYRIGHT © REVE ALL RIGHT RESERVED.</p>
		</div>

		<div class="footer-wrap__mobile">
			<a class="logo" href="/main/main.do"> <img
				src="/resources/images/logo_light.svg" alt="로고" />
			</a>
			<div class="m-footer__contents">
				<div class="m-footer-infolist">
					<button class="m-footer__contenttitle display-flex">
						Company Info <span><img
							src="/resources/images/icons/arrow-down.svg" alt="" /></span>
					</button>
					<div class="m-footer__contentinner">
						<ul class="company-info__list">
							<li><strong>대표자명</strong> xxx</li>
							<li><strong>사업자등록번호</strong> 201-86-12345 <a href="#"
								style="display: inline-block">[사업자정보확인]</a></li>
							<li><strong>통신판매업신고번호</strong> 205-경기고양-1234</li>
							<li><strong>주소</strong> (12345) 경기도 고양시 일산서구</li>
							<li><strong>개인정보보호책임자</strong> xxx</li>
						</ul>
					</div>
				</div>
				<div class="m-footer-infolist">
					<button class="m-footer__contenttitle display-flex">
						Community <span><img
							src="/resources/images/icons/arrow-down.svg" alt="" /></span>
					</button>
					<div class="m-footer__contentinner">
						<ul class="company-info__list">
							<li><a href="#"><strong>공지사항</strong></a></li>
							<li><a href="#"><strong>QNA</strong></a></li>
							<li><strong>고객센터</strong><a href="tel:01012345678"
								style="display: inline-block">1588-1125</a></li>
						</ul>
					</div>
				</div>

				<div class="m-footer-infolist">
					<button class="m-footer__contenttitle display-flex">
						Terms of service <span><img
							src="/resources/images/icons/arrow-down.svg" alt="" /></span>
					</button>
					<div class="m-footer__contentinner">
						<ul class="company-info__list">
							<li><a href="#"><strong>이용약관</strong></a></li>
							<li><a href="#"><strong>개인정보 처리방침</strong></a></li>
						</ul>
					</div>
				</div>
			</div>

			<div class="m-footer-infolist">
				<button class="m-footer__contenttitle display-flex">
					Social Media <span><img
						src="/resources/images/icons/arrow-down.svg" alt="" /></span>
				</button>
				<div class="m-footer__contentinner">
					<ul class="company-info__list">
						<li><a href="#"><strong>Instagram</strong></a></li>
						<li><a href="#"><strong>X (Twitter)</strong></a></li>
						<li><a href="#"><strong>Youtube</strong></a></li>
					</ul>
				</div>
			</div>
			<p class="footer-copyright">COPYRIGHT © REVE ALL RIGHT RESERVED.</p>
		</div>
	</footer>
	<!-- /footer -->

	<div class="navbar-only__mobile">
		<ul class="display-flex">
			<li>
				<button class="menu-button">
					<img src="/resources/images/icons/category.svg" alt="" />
				</button>
			</li>
			<li>
				<button>
					<img src="/resources/images/icons/search.svg" alt="" />
				</button>
			</li>
			<li><a href="/main/main.do"><img
					src="/resources/images/icons/home.svg" alt="" /></a></li>
			<li><a href="#"><img
					src="/resources/images/icons/usericon.svg" alt="" /></a></li>
			<li>
				<button>
					<img src="/resources/images/icons/cart.svg" alt="" />
				</button>
			</li>
		</ul>
	</div>



	<!-- The Modal -->
	<div class="modal fade" id="msgModal">
		<div class="modal-dialog">
			<div class="modal-content">

				<!-- Modal Header -->
				<div class="modal-header">

					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>

				<!-- Modal body -->
				<div class="modal-body">${msg}</div>

				<!-- Modal footer -->
				<div class="modal-footer">
					<button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
				</div>

			</div>
		</div>
	</div>

	<!-- session 담은 msg를 보여주는 모달창 -->
	<c:if test="${!empty msg}">
		<!-- 모달을 보이게하는 javascript -->
		<script type="text/javascript">
	    $(function() {
		$("#msgModal").modal("show");

	    })
	</script>
	</c:if>

	<script>
	AOS.init();
    </script>
</body>
</html>
<%-- <%session.removeAttribute("msg"); %> --%>







