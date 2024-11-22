<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="pageNav" tagdir="/WEB-INF/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- Bootstrap 스타일 및 스크립트 -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

<!-- jQuery UI 스타일 및 스크립트 -->
<link rel="stylesheet"
	href="https://code.jquery.com/ui/1.14.0/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.14.0/jquery-ui.js"></script>

<!-- 커스텀 스타일 -->
<link rel="stylesheet" href="/resources/styles/brand_list.css?after">
<link rel="stylesheet" href="/resources/styles/reset.css?after">
<link rel="stylesheet" href="/resources/styles/common.css?after">
<link rel="stylesheet" href="/resources/styles/root.css?after">
<link rel="stylesheet" href="/resources/styles/reponsive.css?after">
<title>Review</title>

<style type="text/css">
/* 대분류, 중분류 버튼 스타일링 */
.category-radio-group {
	display: flex;
	gap: 10px;
	width: 100%;
	height: auto;
}

.form-check {
	display: flex;
	align-items: center;
	gap: 8px;
}

.form-check input {
	margin: 0;
	display: none;
	padding: 2rem 0rem;
}

.form-check label {
	font-size: 1rem;
	font-weight: normal;
	width: 100px;
	height: 40px;
	border: 1px solid #ccc;
	text-align: center;
	line-height: 40px;
	background-color: #f0ebe7;
	color: #4a4a4a;
	border-radius: 6px;
	transition: all 0.3s ease;
}

.form-check label:hover {
	background-color: #e4ddd7;
	border-color: #b3aea8;
	color: #333;
	box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1);
}

/* 검색창 스타일 */
.search_box {
	padding-top: 30px;
	width: 50%;
	margin: 0 auto;
}

.form-control {
	border-width: 0 0 1px;
	background-color: transparent;
}

.search {
	background-color: #f0ebe7;
}

.search:hover {
	background-color: #e4ddd7;
	border-color: #b3aea8;
	color: #333;
	box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1);
}
</style>
</head>
<body>
	<div class="wrap">
		<!-- 상품 목록 -->
		<section class="brands_items_list" style="padding-top: 100px;">
			<c:if test="${empty list}">
				<h4>작성된 리뷰가 없습니다.</h4>
			</c:if>
			<c:if test="${!empty list}">
				<div class="row">
					<c:forEach items="${list}" var="vo" varStatus="vs">
						<c:if test="${(vs.index != 0) && (vs.index % 4 == 0)}">
                            ${"</div>"}
                            ${"<div class='row'>"}
                        </c:if>
						<!-- 개별 상품 표시 -->
						<div class="gallery dataRow">
							<div>
								<div class="gallery-item">
									<img src="${vo.filename}">
								</div>
								<div class="gallery-text">
									<span class="goods_no" data-rno="${vo.rno}">
										</span> <br>
									<span>번호: ${vo.rno }</span> <br>
									<span>제목 : ${vo.title}</span> <br>
									<span>작성자 : ${vo.id }</span> <br>
									<span> 작성일 : <fmt:formatDate value="${vo.writeDate }"/></span> <br>
									<span> 평점 : ${vo.stars }</span> <br>
								</div>
							</div>
						</div>
					</c:forEach>
				</div>
			</c:if>

			<!-- 상품 등록 버튼 -->
			<div>
				<a href="writeForm.do?perPageNum=" ${pageObject.perPageNum }
					class="btn btn-primary">등록</a>
			</div>

			<!-- 페이지 네비게이션 -->
			<div>
				<pageNav:pageNav listURI="allList.do" pageObject="${pageObject}"></pageNav:pageNav>
			</div>
		</section>
	</div>
	
	
	<script type="text/javascript" src="/resources/js/mainslider.js?after"></script>
	<script type="text/javascript" src="/resources/js/product.js?after"></script>
	<script type="text/javascript">
	$(function() {

	    // 이벤트 처리 - 리스트에서 상품을 클릭했을때
	    $(".dataRow").click(
		    function() {
			let goods_no = $(this).find(".goods_no").data(
				"goods_no");
			location = "view.do?goods_no=" + goods_no
				+ "&${pageObject.pageQuery}"
				+ "&${goodsSearchVO.searchQuery}";
		    });

	});
    </script>
	<script>
	var swiper = new Swiper(".mySwiper", {
	    spaceBetween : 30,
	    effect : "fade",
	    autoplay : {
		delay : 5000,
		disableOnInteraction : false,

	    },
	});
    </script>

	<script>
	$(document).ready(
		function() {
		    $("button, a ,input").click(
			    function(event) {
				sessionStorage.setItem("scrollPosition", $(
					window).scrollTop());
			    });

		    var savedScrollPosition = sessionStorage
			    .getItem("scrollPosition");
		    if (savedScrollPosition !== null) {
			$(window).scrollTop(savedScrollPosition);
			sessionStorage.removeItem("scrollPosition");
		    }
		});
    </script>
</body>
</html>