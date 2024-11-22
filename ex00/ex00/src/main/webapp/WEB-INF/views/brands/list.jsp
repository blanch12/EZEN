<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="pageNav" tagdir="/WEB-INF/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">

<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

<!-- datepicker: jquery는 bootstrap에서 정의한 라이브러리 사용 -->
<link rel="stylesheet"
	href="https://code.jquery.com/ui/1.14.0/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.14.0/jquery-ui.js"></script>


<link rel="stylesheet" href="/resources/styles/reset.css?after">
<link rel="stylesheet" href="/resources/styles/common.css?after">
<link rel="stylesheet" href="/resources/styles/root.css?after">
<link rel="stylesheet" href="/resources/styles/reponsive.css?after">
<link rel="stylesheet" href="/resources/styles/brand_list.css?d">





<title>Brand Shop</title>



</head>
<body>

	<!-- 상품리스트 전 -->
	<div class="wrap">
		<!-- 메인 비주얼 배너 -->
		<section
			class="section section-width__wide section-no__margin main-banner main-banner__visual swiper">
			<div class="visual-banner__wrap swiper-wrapper">
				<div class="visual-banner__item swiper-slide">
					<img src="/resources/image/brands/main/brands_banner01.png" alt="" />
					<div class="visual-item__txt display-flex">
						<p class="visual-txt__content">
							혁신적인 디자인과 세련된 감각의 조화 <strong>프라다</strong>
						</p>
						<a href="/brands/list.do" class="btn-component01">바로가기 <span></span></a>
					</div>
				</div>
				<div class="visual-banner__item swiper-slide">
					<img src="/resources/image/brands/main/brands_banner06.png" alt="" />
					<div class="visual-item__txt display-flex">
						<p class="visual-txt__content">
							우아함과 예술적 감각이 빚어낸 명품의 정수 <strong>샤넬</strong>
						</p>
						<a href="/brands/list.do" class="btn-component01">바로가기 <span></span></a>
					</div>
				</div>
				<div class="visual-banner__item swiper-slide">
					<img src="/resources/image/brands/main/brands_banner02.png" alt="" />
					<div class="visual-item__txt display-flex">
						<p class="visual-txt__content">
							클래식한 품격과 라이프스타일의 아이콘 <strong>랄프로렌</strong>
						</p>
						<a href="/brands/list.do" class="btn-component01">바로가기 <span></span></a>
					</div>
				</div>
				<div class="visual-banner__item swiper-slide">
					<img src="/resources/image/brands/main/brands_banner03.png" alt="" />
					<div class="visual-item__txt display-flex">
						<p class="visual-txt__content">
							대담한 창의성과 현대적 실험의 선두주자 <strong>발렌시아가</strong>
						</p>
						<a href="/brands/list.do" class="btn-component01">바로가기 <span></span></a>
					</div>
				</div>

			</div>
			<div class="swiper-pagination"></div>
			<div class="swiper-button-prev prev-no-bg"></div>
			<div class="swiper-button-next next-no-bg"></div>
		</section>


		<section>
			<div class="brands_lists">
				<div class="accordion">
					<div class="tab2">
						<img src="/resources/image/brands/brandslist/brands01.jpeg" alt="" />
						<p class="tab_title">Louis Vuitton</p>
						<div class="caption">
							<h2>Louis Vuitton</h2>
							<br>
							<p>시간을 초월한 우아함과 정교함</p>
						</div>
					</div>
					<div class="tab2">
						<img src="/resources/image/brands/brandslist/brands02.jpeg" alt="" />
						<p class="tab_title">Chanel</p>
						<div class="caption">
							<h2>Chanel</h2>
							<br>
							<p>아름다움과 강렬함의 만남</p>
						</div>
					</div>
					<div class="tab2">
						<img src="/resources/image/brands/brandslist/brands03.jpg" alt="" />
						<p class="tab_title">Balenciaga</p>
						<div class="caption">
							<h2>Balenciaga</h2>
							<br>
							<p>독창적이고 대담하며 당당하게</p>
						</div>
					</div>
					<div class="tab2">
						<img src="/resources/image/brands/brandslist/brands04.jpg" alt="" />
						<p class="tab_title">Prada</p>
						<div class="caption">
							<h2>Prada</h2>
							<br>
							<p>혁신적인 디자인, 현대적 감각을 위한 선택</p>
						</div>
					</div>
					<div class="tab2">
						<img src="/resources/image/brands/brandslist/brands05.jpg" alt="" />
						<p class="tab_title">Hermès</p>
						<div class="caption">
							<h2>Hermès</h2>
							<br>
							<p>전통과 혁신의 조화</p>
						</div>
					</div>
				</div>

			</div>
		</section>


		<section class="sec_1">
			<div class="brands_sec_1">
				<img alt="" src="/resources/image/brands/main/12.jpg">
				<div class="brands_sec_1_text">
					<h1>Discover Iconic Luxury</h1>
					<br> <br>
					<h2>Unveil Your Best Self with Iconic Brands</h2>
					<br>
					<h2>Indulge in the Finest – Luxury, Reimagined</h2>
				</div>
			</div>
		</section>

		<!-- 상품리스트 전 -->

		<div class="container-xl p-5">
			<form action="list.do" id="searchForm">
				<input type="hidden" name="page" value="${pageObject.page }">
				<!-- 상품검색 시작 -->
				<div class="gallery_list">
					<div class="col-md-12">
						<div class="input-group mb-3">
							<div class="input-group-prepend">
								<select class="form-control" id="brands_cate_code1"
									name="brands_cate_code1">
									<option value="0">Brand</option>
									<c:forEach items="${listBig }" var="vo">
										<option value="${vo.brands_cate_code1 }"
											<c:if test="${ brandsSearchVO.brands_cate_code1 == vo.brands_cate_code1}">
                                    selected
                                </c:if>>${vo.brands_cate_name }</option>
									</c:forEach>
								</select> <select class="form-control" id="brands_cate_code2"
									name="brands_cate_code2">
									<option value="0">All</option>
									<c:forEach items="${listMid }" var="vo">
										<option value="${vo.brands_cate_code2 }"
											<c:if test="${ brandsSearchVO.brands_cate_code2 == vo.brands_cate_code2}">
                                    selected
                                </c:if>>${vo.brands_cate_name }</option>
									</c:forEach>
								</select>
							</div>
							<input type="text" class="form-control" placeholder="상품명 검색"
								id="brands_name" name="brands_name"
								value="${brandsSearchVO.brands_name }">

							<div class="input-group-prepend" style="border: none;">
								<select class="form-control" id="price_range" name="price_range">
									<option value="0" style="font-weight: bold;">신상품</option>
									<option value="2">낮은가격</option>
									<option value="3">높은가격</option>
								</select>
							</div>

							<div class="input-group-prepend">
								<button type="submit" class="btn btn-primary">
									<i class="fa fa-search"></i>
								</button>
							</div>
						</div>
					</div>
				</div>
				<!-- 상품검색 끝 -->

				<div class="row" style="display: none;">
					<div class="col-md-4">
						<div class="input-group mt-2 mb-3">
							<div class="input-group-prepend">
								<span class="input-group-text">Rows/Page</span>
							</div>
							<select id="perPageNum" name="perPageNum" class="form-control">
								<option>4</option>
								<option>8</option>
								<option>12</option>
								<option>16</option>
							</select>
						</div>
					</div>
					<!-- end of class="col-md-4" -->
				</div>
				<!-- end of class="row" -->
			</form>
		</div>


		<section class="brands_items_list" style="padding-top: 10px;">
			<c:if test="${empty list}">
				<h4>상품이 존재하지 않습니다.</h4>
			</c:if>
			<c:if test="${!empty list}">
				<div class="gallery_list">
					<!-- 이미지 list의 데이터가 있는 만큼 표시하는 처리 시작 -->
					<c:forEach items="${list}" var="vo" varStatus="vs">
						<!-- 줄바꿈처리 - 4개를 표시하면 줄을 바꾼다. -->
						<c:if test="${(vs.index != 0) && (vs.index % 4 == 0)}">
                    ${"</div>"}
                    ${"<div class='row'>"}
                </c:if>
						<!-- 데이터 표시 시작 -->
						<div class="gallery dataRow">
							<div>
								<div class="gallery-item">
									<img src="${vo.brands_image_name}">
								</div>
								<div class="gallery-text">
									<span class="brands_no" data-brands_no="${vo.brands_no}">${vo.brands_no}</span> <br> 
									<span class="brand_cate_name"> ${vo.brands_cate_name }</span><br> 
									<span class="brand_name"> ${vo.brands_name}</span> <br> <br>
									
									<div class="sale_price">
										<span class="discount">${vo.discount_rate}%</span>
										<span class="price"><fmt:formatNumber value="${vo.price}" /> 원 </span>
										<span class="sale"><fmt:formatNumber value="${vo.sale_price}" /> 원 </span>
									</div>
									
								</div>
							</div>
							<!-- end of card -->
						</div>
						<!-- 데이터 표시 끝 -->
					</c:forEach>
					<!-- 이미지 데이터 반복 표시 끝 -->
				</div>
			</c:if>
			<%-- 	<c:if test="${!empty login }"> --%>
			<!-- 로그인이 되어있으면 등록버튼이 보이게 처리 -->
			<div>
				<a href="writeForm.do?perPageNum=" ${pageObject.perPageNum }
					class="btn btn-primary">등록</a>
			</div>
			<%-- 	</c:if> --%>
			<div>
				<pageNav:pageNav listURI="list.do" pageObject="${pageObject}"></pageNav:pageNav>
			</div>
		</section>
	</div>
	<script type="text/javascript" src="/resources/js/mainslider.js?after"></script>
	<script type="text/javascript">
	$(function() {
	    console.log("jquery loading......");

	    let titleHeights = [];

	    $(".title").each(function(idx, title) {
		console.log($(title).height());
		titleHeights.push($(title).height());
	    });

	    let maxTitleHeight = Math.max.apply(null, titleHeights);
	    console.log("maxTitleHeight=" + maxTitleHeight);

	    $(".title").height(maxTitleHeight);

	    let imgWidth = $(".imageDiv:first").width();
	    let imgHeight = $(".imageDiv:first").height();
	    console.log("image width=" + imgWidth + ",height=" + imgHeight);

	    let height = imgWidth / 5 * 4;
	    console.log("height=", height);

	    $(".imageDiv").height(height);

	    $(".imageDiv > img").each(function(idx, image) {

		if ($(image).height() > height) {
		    let image_width = $(image).width();
		    let image_height = $(image).height();
		    let width = height / image_height * image_width;
		    console.log("image_width=" + image_width);
		    console.log("image_height=" + image_height);
		    console.log("width=" + width);
		    console.log("height=" + height);
		    //이미지 높이를 줄이고
		    $(image).height(height);
		    //이미지 너비를 줄입니다.
		    $(image).width(width);
		}

	    });

	    // 이벤트 처리 - 리스트에서 상품을 클릭했을때
	    $(".dataRow").click(
		    function() {
			// 자료수집 - goods_no
			let brands_no = $(this).find(".brands_no").data(
				"brands_no");
			//alert("goods_no=" + goods_no);
			location = "view.do?brands_no=" + brands_no
				+ "&${pageObject.pageQuery}"
				+ "&${brandsSearchVO.searchQuery}";
		    });

	    $("#perPageNum").change(function() {
		$("#searchForm").submit();
	    });

	    // 검색데이터 세팅
	    $("#key").val("${(empty pageObject.key)?'t':pageObject.key}");
	    $("#perPageNum")
		    .val(
			    "${(empty pageObject.perPageNum)?'10':pageObject.perPageNum}");

	    // 대분류 리스트 변경
	    $("#brands_cate_code1")
		    .change(
			    function() {
				let brands_cate_code1 = $(this).val();

				$
					.ajax({
					    type : "get",
					    url : "/brands/getbrandsCategory.do?brands_cate_code1="
						    + brands_cate_code1,
					    success : function(result, status,
						    xhr) {
						console.log("==== 중분류데이터 ====");
						console
							.log("result : "
								+ JSON
									.stringify(result));
						console.log("status : "
							+ status);
						console.log("xhr : " + xhr);

						let str = '<option value="0">All</option>';

						result
							.forEach(function(item) {
							    console
								    .log(item.brands_cate_name);
							    str += '<option value="' + item.brands_cate_code2 + '">';
							    str += item.brands_cate_name
								    + '</option>\n';
							});

						console.log(str);

						$("#brands_cate_code2").html(
							str);
					    },
					    error : function(xhr, status, err) {
						console
							.log("중분류 가져오기 오류 *************");
						console.log("xhr : " + xhr);
						console.log("status : "
							+ status);
						console.log("err : " + err);
					    }
					});

			    });
	    // 대분류 리스트 변경 끝

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
		    // 페이지네이션 클릭 시 스크롤 위치 저장
		    $("button, a").click(
			    function(event) {
				// 스크롤 위치 저장
				sessionStorage.setItem("scrollPosition", $(
					window).scrollTop());
			    });

		    // 페이지가 로드되면 저장된 스크롤 위치로 이동
		    var savedScrollPosition = sessionStorage
			    .getItem("scrollPosition");
		    if (savedScrollPosition !== null) {
			$(window).scrollTop(savedScrollPosition);
			sessionStorage.removeItem("scrollPosition"); // 스크롤 위치 복원 후 제거
		    }
		});
    </script>


</body>
</html>