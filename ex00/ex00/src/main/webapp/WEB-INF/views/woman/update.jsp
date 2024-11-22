<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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
<link rel="stylesheet" href="/resources/styles/main.css?after">
<link rel="stylesheet" href="/resources/styles/reponsive.css?after">


<title>상품 수정</title>

</head>
<body>
	<div class="container" style="padding-top: 200px;">
		<div class="card">
			<div class="card-header">
				<h3>상품 수정</h3>
			</div>
			<form action="update.do" method="post" enctype="multipart/form-data">
				<input type="hidden" name="page" value="${pageObject.page}">
				<input type="hidden" name="perPageNum"
					value="${pageObject.perPageNum}">
				<%-- 			<input type="hidden" name="womanSearchVO.woman_cate_code1" value="${womanSearchVO.woman_cate_code1 }">  			 --%>
				<%-- 			<input type="hidden" name="womanSearchVO.woman_cate_code2" value="${womanSearchVO.woman_cate_code2 }">  			 --%>
				<%-- 			<input type="hidden" name="womanSearchVO.woman_name" value="${womanSearchVO.woman_name }">  			 --%>
				<%-- 			<input type="hidden" name="womanSearchVO.min_price" value="${womanSearchVO.min_price }">  			 --%>
				<%-- 			<input type="hidden" name="womanSearchVO.max_price" value="${womanSearchVO.max_price }">  			 --%>
				<input type="hidden" name="woman_price_no"
					value="${womanVO.woman_price_no }">
				<div class="card-body">
					<div class="form-group">
						<label for="woman_no">상품번호</label> <input class="form-control"
							id="woman_no" name="woman_no" readonly
							value="${womanVO.woman_no }">
					</div>
					<!-- 대분류, 중분류는 java 구현후 작성할 예정 -->
					<div class="form-group">
						<label for="woman_cate_code1">대분류</label> <select
							class="form-control" id="woman_cate_code1"
							name="woman_cate_code1">
							<c:forEach items="${listBig }" var="listVO">
								<option value="${listVO.woman_cate_code1 }"
									${(womanVO.woman_cate_code1 == listVO.woman_cate_code1)?'selected':''}>
									${listVO.woman_cate_name }</option>
							</c:forEach>
						</select>
					</div>
					<div class="form-group">
						<label for="woman_cate_code2">중분류</label> <select
							class="form-control" id="woman_cate_code2"
							name="woman_cate_code2">
							<c:forEach items="${listMid }" var="listVO">
								<option value="${listVO.woman_cate_code2 }"
									${(womanVO.woman_cate_code2 == listVO.woman_cate_code2)?'selected':''}>
									${listVO.woman_cate_name }</option>
							</c:forEach>
						</select>
					</div>
					<div class="form-group">
						<label for="woman_cate_name">브랜드</label> <input
							class="form-control" id="woman_cate_name" name="woman_cate_name"
							required value="${womanVO.woman_cate_name }">
					</div>
					<div class="form-group">
						<label for="woman_name">상품명</label> <input class="form-control"
							id="woman_name" name="woman_name" required
							value="${womanVO.woman_name }">
					</div>
					<div class="form-group">
						<!-- 파일로 넘어가는 데이터는 GoodsVO 객체의 이름과 다른이름을 사용해야 합니다. -->
						<label for="imageMain">대표이미지</label> <img alt=""
							src="${womanVO.woman_image_name }"
							style="width: 100px; height: 100px;">
					</div>
					<div class="form-group">
						<label for="content">상품설명</label>
						<textarea rows="10" class="form-control" id="content"
							name="content">${womanVO.content }</textarea>
					</div>
					<div class="form-group">
						<label for="company">제조사</label> <input class="form-control"
							id="company" name="company" required value="${womanVO.company }">
					</div>
					<div class="form-group">
						<label for="product_date">생산일</label> <input
							class="form-control datepicker" readonly id="product_date"
							name="product_date"
							value="<fmt:formatDate value='${womanVO.product_date }' pattern='yyyy-MM-dd' />">
					</div>
					<div class="form-group">
						<label for="price">정가</label> <input class="form-control"
							id="price" name="price" required value="${womanVO.price }">
					</div>
					<div class="form-group">
						<label for="discount">할인금액</label> <input class="form-control"
							id="discount" name="discount" value=${womanVO.discount }>
					</div>
					<div class="form-group">
						<label for="discount_rate">할인율</label> <input class="form-control"
							id="discount_rate" name="discount_rate"
							value="${womanVO.discount_rate }">
					</div>
					<div class="form-group">
						<label for="saved_rate">적립율</label> <input class="form-control"
							id="saved_rate" name="saved_rate" value="${womanVO.saved_rate }">
					</div>
					<div class="form-group">
						<label for="delivery_charge">배송료</label> <input
							class="form-control" id="delivery_charge" name="delivery_charge"
							value="${womanVO.delivery_charge }">
					</div>
					<div class="form-group">
						<label for="sale_start_date">판매시작일</label> <input
							class="form-control datepicker" readonly id="sale_start_date"
							name="sale_start_date"
							value="<fmt:formatDate value='${womanVO.sale_start_date }' pattern='yyyy-MM-dd' />">
					</div>
					<div class="form-group">
						<label for="sale_end_date">판매종료일</label> <input
							class="form-control datepicker" readonly id="sale_end_date"
							name="sale_end_date"
							value="<fmt:formatDate value='${womanVO.sale_end_date }' pattern='yyyy-MM-dd' />">
					</div>
					<fieldset class="border p-4">
						<legend class="w-auto px-2">
							<b style="font-size: 14px">[Option]</b>
						</legend>
						<fieldset class="border p-4 colorForm">
							<legend class="w-auto px-2">
								<b style="font-size: 14px">[Color]</b>
								<button class="btn btn-primary btn-sm" id="appendColorBtn"
									type="button">addColor</button>
							</legend>
							<c:if test="${empty colorList }">
								<div class="input-group mb-3">
									<input type="text" class="form-control" name="color_names">
								</div>
							</c:if>
							<c:if test="${!empty colorList }">
								<c:forEach items="${colorList}" var="colorVO" varStatus="status">
									<div class="input-group mb-3">
										<input type="text" class="form-control" name="color_names"
											value=${colorVO.woman_color_name }>
										<c:if test="${status.index != 0 }">
											<div class="input-group-append">
												<button class="btn btn-danger removeColorBtn" type="button">
													<i class="fa fa-close"></i>
												</button>
											</div>
										</c:if>
									</div>
								</c:forEach>
							</c:if>
						</fieldset>
						<fieldset class="border p-4 sizeForm">
							<legend class="w-auto px-2">
								<b style="font-size: 14px">[Size]</b>
								<button class="btn btn-primary btn-sm" id="appendSizeBtn"
									type="button">addSize</button>
							</legend>
							<c:if test="${empty sizeList }">
								<div class="input-group mb-3">
									<input type="text" class="form-control" name="size_names">
								</div>
							</c:if>
							<c:if test="${!empty sizeList }">
								<c:forEach items="${sizeList}" var="sizeVO" varStatus="status">
									<div class="input-group mb-3">
										<input type="text" class="form-control" name="size_names"
											value=${sizeVO.woman_size_name }>
										<c:if test="${status.index != 0 }">
											<div class="input-group-append">
												<button class="btn btn-danger removeSizeBtn" type="button">
													<i class="fa fa-close"></i>
												</button>
											</div>
										</c:if>
									</div>
								</c:forEach>
							</c:if>
						</fieldset>

					</fieldset>
					<fieldset class="border p-4 imageForm">
						<legend class="w-auto px-2">
							<b style="font-size: 14px">[추가이미지]</b>
							<button class="btn btn-primary btn-sm" id="appendImageBtn"
								type="button">addImage</button>
						</legend>
						<c:if test="${empty imageList }">
							<div class="input-group mb-3">
								<input type="file" class="form-control" name="imageFiles">
							</div>
						</c:if>
						<c:if test="${!empty imageList }">
							<c:forEach items="${imageList}" var="imageVO" varStatus="status">
								<div class="input-group mb-3">
									<img src="${imageVO.woman_image_name }"
										style="height: 100px; width: 100px;">
								</div>
							</c:forEach>
						</c:if>
					</fieldset>
				</div>
				<div class="card-footer">
					<button class="btn btn-primary">수정</button>
					<button type="reset" class="btn btn-secondary">다시입력</button>
					<button type="button" class="btn btn-success"
						onclick="history.back();">취소</button>
				</div>
			</form>
		</div>
	</div>
	<script type="text/javascript">
$(function(){
	// 이벤트 처리
	let now = new Date();
	let startYear = now.getFullYear();
	let yearRange = (startYear - 10) + ":" + (startYear + 10);
	
	// 날짜 입력 설정
	$(".datepicker").datepicker({
		// 입력란의 데이터 포맷
		dateFormat : "yy-mm-dd",
		// 월 선택 추가
		changeMonth: true,
		// 년 선택 추가
		changeYear: true,
		// 월 선택 입력(기본:영어->한글)
		monthNamesShort: ["1월","2월","3월","4월","5월","6월","7월","8월","9월","10월","11월","12월"],
		// 달력의 요일 표시 (기본:영어->한글)
		dayNamesMin: ["일","월","화","수","목","금","토"],
		// 선택할 수 있는 년도의 범위
		yearRange : yearRange
	});
	
	
	// 생산일은 현재날짜 이전만 입력가능
	$("#product_date").datepicker("option", {"maxDate" : new Date()});
	// 판매시작일과 종료일은 현재날짜 이후만 입력가능
	$("#sale_start_date, #sale_end_date")
		.datepicker("option", {"minDate" : new Date()});
	
	// 판매시작일이 판매종료일보다 앞에 있도록 합니다.
	$("#sale_start_date").change(function(){
		$("#sale_end_date").datepicker("option", "minDate", $(this).val())
	});
	$("#sale_end_date").change(function(){
		$("#sale_start_date").datepicker("option", "maxDate", $(this).val());
	});
	
	
	// 대분류 리스트 변경
	$("#woman_cate_code1").change(function(){
		//alert("대분류 리스트 변경");
		let woman_cate_code1 = $(this).val();
		//alert("cate_code1 = " + cate_code1);
		

		$.ajax({
			type: "get",
			url: "/woman/getwomanCategory.do?woman_cate_code1=" + woman_cate_code1,
			//dataType: "json",
			success: function(result, status, xhr) {
				//alert("중분류 가져오기 성공함수");
				console.log("==== 중분류데이터 ====");
				console.log("result : " + JSON.stringify(result));
				console.log("status : " + status);
				console.log("xhr : " + xhr);
				
				let str = "";

				result.forEach(function(item){
					console.log(item.woman_cate_name);
					str += '<option value="' + item.woman_cate_code2 + '">';
					str += item.woman_cate_name + '</option>\n';
				});
				
				console.log(str);
				
				$("#woman_cate_code2").html(str);
			},
			error: function(xhr, status, err) {
				console.log("중분류 가져오기 오류 *************");
				console.log("xhr : " + xhr);
				console.log("status : " + status);
				console.log("err : " + err);
			}
		});

	});
	// 대분류 리스트 변경 끝

	// color 추가 / 삭제
	let colorTagCnt = ${fn:length(colorList)};
	console.log("colorTagCnt = " + colorTagCnt);
	
	$("#appendColorBtn").click(function(){
		//alert("add color button");
		
		if (colorTagCnt >= 5) return;
		
		let addColorTag = "";
		
		addColorTag += '<div class="input-group mb-3">';
		addColorTag += '<input type="text" class="form-control" name="color_names">';
		addColorTag += '<div class="input-group-append">';
		addColorTag += '<button class="btn btn-danger removeColorBtn" type="button">';
		addColorTag += '<i class="fa fa-close"></i>';
		addColorTag += '</button>';
		addColorTag += '</div>';
		addColorTag += '</div>';
		
		$(".colorForm").append(addColorTag);
		colorTagCnt++;
	});
	
	$(".colorForm").on("click", ".removeColorBtn", function(){
		//alert("remove color button");
		$(this).closest(".input-group").remove();
		colorTagCnt--;
	});
	
	// size 추가 / 삭제
	let sizeTagCnt =${fn:length(sizeList)};
	console.log("sizeTagCnt = " + sizeTagCnt);
	
	
	$("#appendSizeBtn").click(function(){
		//alert("add size button");
		
		if (sizeTagCnt >= 5) return;
		
		let addSizeTag = "";
		
		addSizeTag += '<div class="input-group mb-3">';
		addSizeTag += '<input type="text" class="form-control" name="size_names">';
		addSizeTag += '<div class="input-group-append">';
		addSizeTag += '<button class="btn btn-danger removeSizeBtn" type="button">';
		addSizeTag += '<i class="fa fa-close"></i>';
		addSizeTag += '</button>';
		addSizeTag += '</div>';
		addSizeTag += '</div>';
		
		$(".sizeForm").append(addSizeTag);
		sizeTagCnt++;
	});
	
	$(".sizeForm").on("click", ".removeSizeBtn", function(){
		//alert("remove size button");
		$(this).closest(".input-group").remove();
		sizeTagCnt--;
	});
	
	// image 추가 / 삭제
	let imageTagCnt =1;
	
	$("#appendImageBtn").click(function(){
		//alert("add image button");
		
		if (imageTagCnt >= 5) return;
		
		let addImageTag = "";
		
		addImageTag += '<div class="input-group mb-3">';
		addImageTag += '<input type="file" class="form-control" name="imageFiles">';
		addImageTag += '<div class="input-group-append">';
		addImageTag += '<button class="btn btn-danger removeImageBtn" type="button">';
		addImageTag += '<i class="fa fa-close"></i>';
		addImageTag += '</button>';
		addImageTag += '</div>';
		addImageTag += '</div>';
		
		$(".imageForm").append(addImageTag);
		imageTagCnt++;
	});
	

	
});
</script>
</body>
</html>










