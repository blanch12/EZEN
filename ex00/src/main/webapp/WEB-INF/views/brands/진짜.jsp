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

<link rel="stylesheet" href="/resources/styles/reset.css">
<link rel="stylesheet" href="/resources/styles/common.css">
<link rel="stylesheet" href="/resources/styles/root.css">
<link rel="stylesheet" href="/resources/styles/layout.css">
<link rel="stylesheet" href="/resources/styles/brand_list.css?after">



<title>Brand</title>

<style type="text/css">
.imageDiv img {
	width: 100%;
	height: 100%;
	object-fit: cover;
}

.row {
	padding: 20px;
}
</style>

</head>
<body>

	<!-- 상품리스트 전 -->
	<div class="wrap">
		<div class="swiper mySwiper">
			<div class="swiper-wrapper">
				<div class="swiper-slide">
					<img alt="배너이미지" src="" />
				</div>
				<div class="swiper-slide">
					<img alt="배너이미지" src="" />
				</div>
				<div class="swiper-slide">
					<img alt="배너이미지" src="" />
				</div>
				<div class="swiper-slide">
					<img alt="배너이미지" src="" />
				</div>
			</div>
		</div>


		<main>
			<div class="brands_lists">
				<div class="accordion">
					<div class="tab2">
						<img src="/resources/image/brands/brandslist/brands01.jpeg" alt="" />
						<p class="tab_title">Lorem</p>
						<div class="caption">
							<h2>Lorem Impsum</h2>
							<p>Lorem ipsum dolor sit amet,</p>
						</div>
					</div>
					<div class="tab2">
						<img src="/resources/image/brands/brandslist/brands02.jpeg" alt="" />
						<p class="tab_title">Lorem</p>
						<div class="caption">
							<h2>Lorem Impsum</h2>
							<p>Lorem ipsum dolor sit amet,</p>
						</div>
					</div>
					<div class="tab2">
						<img src="/resources/image/brands/brandslist/brands03.jpg" alt="" />
						<p class="tab_title">Lorem</p>
						<div class="caption">
							<h2>Lorem Impsum</h2>
							<p>Lorem ipsum dolor sit amet,</p>
						</div>
					</div>
					<div class="tab2">
						<img src="/resources/image/brands/brandslist/brands04.jpg" alt="" />
						<p class="tab_title">Lorem</p>
						<div class="caption">
							<h2>Lorem Impsum</h2>
							<p>Lorem ipsum dolor sit amet,</p>
						</div>
					</div>
					<div class="tab2">
						<img src="/resources/image/brands/brandslist/brands05.jpg" alt="" />
						<p class="tab_title">Lorem</p>
						<div class="caption">
							<h2>Lorem Impsum</h2>
							<p>Lorem ipsum dolor sit amet,</p>
						</div>
					</div>
				</div>

			</div>
		</main>


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

		<section class="sec_2">
			<div class="brands_sec_2">
				<div class="brands_box_1">
					<div class="brands_item_1">
						<div class="brands_gallery">
							<div class="brands_box_item_1">
								<img alt="" src="/resources/image/brands/brandsbag/02.jpg">
							</div>
							<div class="brands_box_item_2">
								<img alt="" src="/resources/image/brands/brandsbag/12.jpg">
							</div>
							<div class="brands_box_item_3">
								<img alt="" src="/resources/image/brands/brandsbag/11.jpg">
							</div>
							<div class="brands_box_item_4">
								<img alt="" src="/resources/image/brands/brandsbag/04.jpg">
							</div>
							<div class="brands_box_item_5">
								<img alt="" src="/resources/image/brands/brandsbag/08.jpg">
							</div>
							<div class="brands_box_item_6">
								<img alt="" src="/resources/image/brands/brandsbag/01.jpg">
							</div>
						</div>
					</div>
				</div>
				<div class="brands_box_2">
					<div class="brands_box_2_item_1">
						<img alt="" src="/resources/image/brands/brandsbag/05.jpg">
					</div>
					<div class="brands_box_2_item_2">
						<img alt="" src="/resources/image/brands/brandsbag/14.jpg">
					</div>
					<div class="brands_box_2_item_3">
						<img alt="" src="/resources/image/brands/brandsbag/09.jpg">
					</div>
				</div>
				<div class="brands_box_3">
					<img alt="" src="/resources/image/brands/brandsbag/10.jpg">
				</div>
			</div>
		</section>

		<section>
			<div class="gallery">
				<div class="gallery-item">
					<img src="/resources/image/brands/brandsbag/01.jpg" alt="Bag 1">
				</div>
				<div class="gallery-item">
					<img src="/resources/image/brands/brandsbag/02.jpg" alt="Bag 2">
				</div>

				<div class="gallery-item">
					<img src="/resources/image/brands/brandsbag/04.jpg" alt="Bag 4">
				</div>

				<div class="gallery-item">
					<img src="/resources/image/brands/brandsbag/07.jpg" alt="Bag 7">
				</div>
				<div class="gallery-item">
					<img src="/resources/image/brands/brandsbag/08.jpg" alt="Bag 8">
				</div>

				<div class="gallery-item">
					<img src="/resources/image/brands/brandsbag/10.jpg" alt="Bag 10">
				</div>
				<div class="gallery-item">
					<img src="/resources/image/brands/brandsbag/11.jpg" alt="Bag 11">
				</div>
				<div class="gallery-item">
					<img src="/resources/image/brands/brandsbag/12.jpg" alt="Bag 12">
				</div>
			</div>
		</section>
	</div>

	<!-- 상품리스트 전 -->

	<div class="container-xl p-1 my-3" style="width: 100%;">
		<form action="list.do" id="searchForm">
			<input type="hidden" name="page" value="${pageObject.page }">
			<!-- 상품검색 시작 -->
			<div class="row">
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
							value="${brandsSearchVO.brands_name }"> <input
							type="text" class="form-control" placeholder="최저가격입력"
							id="min_price" name="min_price"
							value="${brandsSearchVO.min_price }"> <input type="text"
							class="form-control" placeholder="최고가격입력" id="max_price"
							name="max_price" value="${brandsSearchVO.max_price }">
						<div class="input-group-prepend">
							<button type="submit" class="btn btn-primary">
								<i class="fa fa-search"></i>
							</button>
						</div>
					</div>
				</div>
			</div>
			<!-- 상품검색 끝 -->

			<div class="row">
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

		<c:if test="${empty list }">
			<h4>데이터가 존재하지 않습니다.</h4>
		</c:if>
		<c:if test="${!empty list }">
			<div class="row">
				<!-- 이미지 list의 데이터가 있는 만큼 표시하는 처리 시작 -->
				<c:forEach items="${list }" var="vo" varStatus="vs">
					<!-- 줄바꿈처리 - 4개를 표시하면 줄을 바꾼다. -->
					<c:if test="${(vs.index != 0) && (vs.index%4 == 0) }">
					${"</div>"}
					${"<div class='row'>"}
				</c:if>
					<!-- 데이터 표시 시작 -->
					<div class="col-md-3 dataRow">
						<div class="card" style="width: 100%">
							<div class="imageDiv align-content-center text-center">
								<img class="card-img-top" src="${vo.brands_image_name }"
									alt="Card image">
							</div>
							<div class="card-body title">
								<p class="card-text">
								<div class="brands_no" data-brands_no="${vo.brands_no }">
									상품번호 : ${vo.brands_no }</div>
								<div>상품명 : ${vo.brands_name }</div>
								<div>
									정가 :
									<fmt:formatNumber value="${vo.price }" />
									원
								</div>
								<div>
									할인가 :
									<fmt:formatNumber value="${vo.sale_price }" />
									원
								</div>
								<div>적립율 : ${vo.saved_rate }</div>
								</p>
							</div>
						</div>
						<!-- end of card -->
					</div>
					<!-- 데이터 표시 끝 -->
				</c:forEach>
				<!-- 이미지 데이터 반복 표시 끝 -->
			</div>
			<div>
				<pageNav:pageNav listURI="list.do" pageObject="${pageObject}"></pageNav:pageNav>
			</div>
		</c:if>
		<!-- 데이터 존재했을때 처리 끝 -->

		<%-- 	<c:if test="${!empty login }"> --%>
		<!-- 로그인이 되어있으면 등록버튼이 보이게 처리 -->
		<div>
			<a href="writeForm.do?perPageNum=" ${pageObject.perPageNum }
				class="btn btn-primary">등록</a>
		</div>
		<%-- 	</c:if> --%>

	</div>
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
				//alert("대분류 리스트 변경");
				let brands_cate_code1 = $(this).val();
				//alert("cate_code1 = " + cate_code1);

				$
					.ajax({
					    type : "get",
					    url : "/brands/getbrandsCategory.do?brands_cate_code1="
						    + brands_cate_code1,
					    //dataType: "json",
					    success : function(result, status,
						    xhr) {
						//alert("중분류 가져오기 성공함수");
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

	<script type="text/javascript">
    


	const gallery = document.querySelector('.gallery');

	images.forEach(src => {
	    const item = document.createElement('div');
	    item.classList.add('gallery-item');
	    item.innerHTML = `<img src="${src}" alt="Gallery Image">`;
	    gallery.appendChild(item);
	});

    </script>


</body>
</html>