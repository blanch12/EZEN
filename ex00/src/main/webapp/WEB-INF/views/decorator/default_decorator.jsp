<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="decorator" uri="http://www.opensymphony.com/sitemesh/decorator"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, 
                initial-scale=1.0, 
                minimum-scale=1.0, 
                maximum-scale=1.0, 
                user-scalable=no, 
                viewport-fit=cover" />
<meta name="format-detection" content="telephone=no" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />

<!-- CSS -->
<link rel="stylesheet" href="/resources/styles/reset.css">
<link rel="stylesheet" href="/resources/styles/common.css">
<link rel="stylesheet" href="/resources/styles/root.css">
<link rel="stylesheet" href="/resources/styles/layout.css">
<link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet" />
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.css" />




<!-- Mian JS -->

<script src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.js"></script>
<script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>


<!--제이쿼리-->
<script src="https://code.jquery.com/ui/1.14.0/jquery-ui.js"></script>
<script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<!-- loginForm JS -->
<script src="/resources/js/loginForm.js"></script>

<!-- icon -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

<title>Reve<decorator:title />
</title>

<decorator:head />
</head>
<body>
	<!-- header (S) -->
	<header class="header">
		<div class="headerwrap display-flex">
			<h1 class="logo">
				<a href="/main/main.do" target="blank_">
					<img src="/resources/image/logo.svg" alt="로고" />
				</a>
			</h1>
			<ul class="gnb display-flex">
				<li><a href="#">NEW</a></li>
				<li><a href="#">BRAND</a></li>
				<li><a href="#">WOMAN</a></li>
				<li><a href="#">MAN</a></li>
				<li><a href="#">BAG</a></li>
				<li><a href="#">ACC</a></li>
				<li><a href="#">EVENT</a></li>
			</ul>
			<div class="header--icons display-flex">
				<ul class="header--icons__list display-flex">
					<li class="search">
						<button>
							<img src="/resources/image/search.svg" alt="검색" />
						</button>
					</li>
					<li class="user"><a href="/member/view.do">
							<img src="/resources/image/usericon.svg" alt="마이페이지" />
						</a></li>
					<li class="cart"><a href="#">
							<img src="/resources/image/cart.svg" alt="장바구니" />
						</a></li>
					<c:if test="${login.gradeNo == 9 }">
						<li class="nav-item"><a class="nav-link" href="/member/list.do">회원리스트보기</a></li>
					</c:if>

				</ul>
				<a class="login" href="/member/loginForm.do">
					<img src="/resources/image/lock.svg" alt="로그인" />
				</a>

			</div>
		</div>
	</header>
	<!-- header (E) -->
	<article>
		<!-- 여기에 개발자 작성한 body 태그 안에 내용이 들어온다. -->
		<decorator:body />
	</article>
	<!-- footer (S) -->
	<footer class="footer">
		<div class="footerwrap">
			<div class="footer--contents display-flex">
				<div class="footer--company">
					<ul class="footer--contents__list display-flex">
						<li><a href="#">회사소개</a></li>
						<li><a href="#">공지사항</a></li>
						<li><a href="#">이용약관</a></li>
						<li><a href="#">개인정보처리방침</a></li>
						<li><a href="#">제휴상담</a></li>
					</ul>
					<div class="company--infowrap display-flex">
						<p>(주)레브</p>
						<ul class="company--info">
							<li><strong>공통대표자명</strong> 이진형 김정현 박범수 신재준</li>
							<li><strong>사업자등록번호</strong> 123-45-6789 <a href="#" style="display: inline-block">[사업자정보확인]</a></li>
							<li><strong>통신판매업신고번호</strong> 205-경기고양-1234</li>
							<li><strong>주소</strong> 12345 경기도 고양시 일산서구</li>
							<li><strong>개인정보보호책임자</strong> 이진형 김정현 박범수 신재준</li>
						</ul>
					</div>
				</div>
				<a class="logo" href="index.html">
					<img src="/resources/image/logo_light.svg" alt="로고" />
				</a>
				<div class="footer-service display-flex">
					<p class="csnumber">
						고객센터
						<a href="tel:01047829909" style="display: inline-block">1588-1125</a>
					</p>
					<p>
						<strong>운영시간</strong> 10:00 ~ 17:00 (토,일요일 / 공휴일 휴무)
					</p>
					<p>
						<strong>E-mail</strong>
						<a href="mailto:bruu1125@gmail.com" style="display: inline-block">abcd1234@gmail.com</a>
					</p>
					<div class="footer-snsicons">
						<ul class="snsicons--list display-flex">
							<li><a href="#">
									<img src="/resources/image/sns_instagram.svg" alt="인스타그램" />
								</a></li>
							<li><a href="#">
									<img src="/resources/image/sns_x.svg" alt="엑스" />
								</a></li>
							<li><a href="#">
									<img src="/resources/image/sns_youtube.svg" alt="유튜브" />
								</a></li>
						</ul>
					</div>
				</div>
			</div>
			<p class="footer--copyright">COPYRIGHT © REVE ALL RIGHT RESERVED.</p>
		</div>
	</footer>
	<!-- footer (E) -->


	<!-- The Modal -->
	<div class="modal fade" id="msgModal" style="display: none">
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







