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

<link rel="stylesheet" href="/resources/styles/brand_list.css?after">
<link rel="stylesheet" href="/resources/styles/reset.css?after">
<link rel="stylesheet" href="/resources/styles/common.css?after">
<link rel="stylesheet" href="/resources/styles/root.css?after">
<link rel="stylesheet" href="/resources/styles/reponsive.css?after">
<title>Woman Shop</title>

<style type="text/css">
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

#woman_cate_code2 {
	display: flex;
}

.search_box {
	padding-top: 30px;
	width: 50%;
	margin: 0 auto;
}

.form-control:focus {
	outline: none;
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

a {
	text-decoration: none;
	color: inherit;
}
</style>


</head>
<body>
	<div class="wrap">
		<section class="section section-width__limit main-trendpick"
			style="height: 850px;">
			<h2 class="title">Man Trend Pick</h2>
			<div class="trendpick-wrap">
				<div class="product-list__box">
					<ul class="product-list" id="productList">
						<!-- item -->
					</ul>
				</div>
			</div>
		</section>



		<!-- 상품리스트 -->
		<!-- 기존 코드의 선택 박스 부분 -->
		<div class="container-xl" style="width: 100%; height: auto;">
			<form action="list.do" id="searchForm">
				<input type="hidden" name="page" value="${pageObject.page }">
				<!-- 상품검색 시작 -->
				<div class="row">
					<div class="">
						<div class="">
							<div class="">
								<!-- 대분류 라디오 버튼을 flex로 스타일링 -->
								<div id="woman_cate_code1" class="category-radio-group">
									<c:forEach items="${listBig }" var="vo">
										<div class="form-check">
											<input class="form-check-input" type="submit"
												name="woman_cate_code1" value="${vo.woman_cate_code1 } "
												id="woman_cate_code1_${vo.woman_cate_code1 }"
												<c:if test="${ womanSearchVO.woman_cate_code1 == vo.woman_cate_code1 }">checked</c:if>>
											<label class="form-check-label"
												for="woman_cate_code1_${vo.woman_cate_code1 }"> ${vo.woman_cate_name }</label>
										</div>
									</c:forEach>
								</div>



							</div>
							<!-- 중분류 라디오 버튼 위치 -->
							<button id="woman_cate_code2" class="category-radio-group"
								type="submit" style="display: none;"></button>

							<!-- 검색 버튼 -->
							<div class="input-group-prepend search_box">
								<!-- 텍스트 입력 -->
								<input type="text" class="form-control" placeholder="상품명 검색"
									id="woman_name" name="woman_name"
									value="${womanSearchVO.woman_name }">
								<button type="submit" class="btn search">
									<i class="fa fa-search"></i>
								</button>
							</div>
						</div>
					</div>
				</div>
				<!-- price_range 가로 정렬 -->
				<div class="input-group-prepend" style="border: none; display: none">
					<select class="form-control" id="price_range" name="price_range">
						<option value="0" style="font-weight: bold;">신상품</option>
						<option value="2">낮은가격</option>
						<option value="3">높은가격</option>
					</select>
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
				</div>
			</form>
		</div>



		<section class="brands_items_list" style="padding-top: 10px;">
			<c:if test="${empty list}">
				<h4>상품이 업데이트 중 입니다.</h4>
			</c:if>
			<c:if test="${!empty list}">
				<div class="row">
					<c:forEach items="${list}" var="vo" varStatus="vs">
						<c:if test="${(vs.index != 0) && (vs.index % 4 == 0)}">
                    ${"</div>"}
                    ${"<div class='row'>"}
                </c:if>
						<!--상품 표시 시작 -->
						<div class="gallery dataRow">
							<div>
								<div class="gallery-item">
									<img src="${vo.woman_image_name}">
								</div>
								<div class="gallery-text">
									<span class="woman_no" data-woman_no="${vo.woman_no}">
										상품번호 : ${vo.woman_no}</span> <br> <span> ${vo.woman_cate_name }</span>
									<br> <span>상품명 : ${vo.woman_name}</span> <br> <span
										class="price">정가 : <fmt:formatNumber
											value="${vo.price}" /> 원
									</span> <br> <span class="sale">할인가 : <fmt:formatNumber
											value="${vo.sale_price}" /> 원
									</span> <br> <span>적립율 : ${vo.saved_rate}</span> <br>
									<div class="sale_text">추가할인</div>
								</div>
							</div>
						</div>
					</c:forEach>
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
	<script type="text/javascript" src="/resources/js/product.js?after"></script>



	<script type="text/javascript">
	$(function() {

	    // 이벤트 처리 - 리스트에서 상품을 클릭했을때
	    $(".dataRow").click(
		    function() {
			let woman_no = $(this).find(".woman_no").data(
				"woman_no");
			location = "view.do?woman_no=" + woman_no
				+ "&${pageObject.pageQuery}"
				+ "&${womanSearchVO.searchQuery}";
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
	    $("#woman_cate_code1").change(function() {
		let woman_cate_code1 = $(this).val();

		$.ajax({
		    type : "get",
		    url : "/woman/getwomanCategory.do?woman_cate_code1=" + woman_cate_code1,
		    success : function(result, status, xhr) {
			console.log("==== 중분류데이터 ====");
			console.log("result : " + JSON.stringify(result));
			console.log("status : " + status);
			console.log("xhr : " + xhr);

			let str = '<option value="0">All</option>';

			result.forEach(function(item) {
			    console.log(item.woman_cate_name);
			    str += '<option value="' + item.woman_cate_code2 + '">';
			    str += item.woman_cate_name + '</option>\n';
			});

			console.log(str);

			$("#woman_cate_code2").html(str);
		    },
		    error : function(xhr, status, err) {
			console.log("중분류 가져오기 오류 *************");
			console.log("xhr : " + xhr);
			console.log("status : " + status);
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

	<script type="text/javascript">
	$(document)
		.ready(
			function() {
			    // 대분류 라디오 버튼 클릭 시 처리
			    $("input[name='woman_cate_code1']")
				    .change(
					    function() {
						var selectedWomanCateCode1 = $(this)
							.val(); // 선택된 대분류 값

						// AJAX 요청 보내기
						$
							.ajax({
							    type : "GET",
							    url : "/woman/getwomanCategory.do", // 중분류를 가져오는 URL
							    data : {
								woman_cate_code1 : selectedWomanCateCode1
							    },
							    success : function(
								    result) {
								// 중분류 라디오 버튼 동적으로 생성
								var str = '';
								str += '<div class="form-check"><input type="radio" class="form-check-input" name="woman_cate_code2" value="0" id="woman_cate_code2_0"><label class="form-check-label" for="woman_cate_code2_0">All</label></div>';

								result
									.forEach(function(
										item) {
									    str += '<div class="form-check">';
									    str += '<input type="radio" class="form-check-input" name="woman_cate_code2" value="' + item.woman_cate_code2 + '" id="woman_cate_code2_' + item.woman_cate_code2 + '">';
									    str += '<label class="form-check-label" for="woman_cate_code2_' + item.woman_cate_code2 + '">'
										    + item.woman_cate_name
										    + '</label>';
									    str += '</div>';
									});

								// 중분류 div 업데이트
								$("#woman_cate_code2")
									.html(
										str);
							    },
							    error : function(
								    xhr,
								    status, err) {
								console
									.log("중분류 가져오기 오류");
								console
									.log("xhr: "
										+ xhr);
								console
									.log("status: "
										+ status);
								console
									.log("err: "
										+ err);
							    }
							});
					    });
			});
    </script>
</body>
</html>