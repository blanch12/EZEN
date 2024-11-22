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

<link rel="stylesheet" href="/resources/styles/reset.css">
<link rel="stylesheet" href="/resources/styles/common.css">
<link rel="stylesheet" href="/resources/styles/root.css">
<link rel="stylesheet" href="/resources/styles/layout.css">


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
				<%-- 			<input type="hidden" name="SearchVO.cate_code1" value="${goodsSearchVO.cate_code1 }">  			 --%>
				<%-- 			<input type="hidden" name="goodsSearchVO.cate_code2" value="${goodsSearchVO.cate_code2 }">  			 --%>
				<%-- 			<input type="hidden" name="goodsSearchVO.goods_name" value="${goodsSearchVO.goods_name }">  			 --%>
				<%-- 			<input type="hidden" name="goodsSearchVO.min_price" value="${goodsSearchVO.min_price }">  			 --%>
				<%-- 			<input type="hidden" name="goodsSearchVO.max_price" value="${goodsSearchVO.max_price }">  			 --%>
				<input type="hidden" name="goods_price_no"
					value="${goodsVO.goods_price_no }">
				<div class="card-body">
					<div class="form-group">
						<label for="goods_no">상품번호</label> <input class="form-control"
							id="goods_no" name="goods_no" readonly
							value="${goodsVO.goods_no }">
					</div>

					<div class="form-group">
						<label for="cate_code1">대분류</label> <select class="form-control"
							id="cate_code1" name="cate_code1">
							<c:forEach items="${listBig }" var="listVO">
								<option value="${listVO.cate_code1 }"
									${(goodsVO.cate_code1 == listVO.cate_code1)?'selected':''}>
									${listVO.cate_name }</option>
							</c:forEach>
						</select>
					</div>
					<div class="form-group">
						<label for="cate_code2">중분류</label> <select class="form-control"
							id="cate_code2" name="cate_code2">
							<c:forEach items="${listMid }" var="listVO">
								<option value="${listVO.cate_code2 }"
									${(goodsVO.cate_code2 == listVO.cate_code2)?'selected':''}>
									${listVO.cate_name }</option>
							</c:forEach>
						</select>
					</div>
										<div class="form-group">
						<label for="cate_name">상품명</label> <input class="form-control"
							id="cate_name" name="cate_name" required
							value="${goodsVO.cate_name }">
					</div>
					<div class="form-group">
						<label for="goods_name">상품명</label> <input class="form-control"
							id="goods_name" name="goods_name" required
							value="${goodsVO.goods_name }">
					</div>
					<div class="form-group">
						<label for="imageMain">대표이미지</label> <img alt=""
							src="${goodsVO.image_name }" style="width: 100px; height: 100px;">
					</div>
					<div class="form-group">
						<label for="content">상품설명</label>
						<textarea rows="10" class="form-control" id="content"
							name="content">${goodsVO.content }</textarea>
					</div>
					<div class="form-group">
						<label for="company">제조사</label> <input class="form-control"
							id="company" name="company" required value="${goodsVO.company }">
					</div>
					<div class="form-group">
						<label for="product_date">생산일</label> <input
							class="form-control datepicker" readonly id="product_date"
							name="product_date"
							value="<fmt:formatDate value='${goodsVO.product_date }' pattern='yyyy-MM-dd' />">
					</div>
					<div class="form-group">
						<label for="price">정가</label> <input class="form-control"
							id="price" name="price" required value="${goodsVO.price }">
					</div>
					<div class="form-group">
						<label for="discount">할인금액</label> <input class="form-control"
							id="discount" name="discount" value=${goodsVO.discount }>
					</div>
					<div class="form-group">
						<label for="discount_rate">할인율</label> <input class="form-control"
							id="discount_rate" name="discount_rate"
							value="${goodsVO.discount_rate }">
					</div>
					<div class="form-group">
						<label for="saved_rate">적립율</label> <input class="form-control"
							id="saved_rate" name="saved_rate" value="${goodsVO.saved_rate }">
					</div>
					<div class="form-group">
						<label for="delivery_charge">배송료</label> <input
							class="form-control" id="delivery_charge" name="delivery_charge"
							value="${goodsVO.delivery_charge }">
					</div>
					<div class="form-group">
						<label for="sale_start_date">판매시작일</label> <input
							class="form-control datepicker" readonly id="sale_start_date"
							name="sale_start_date"
							value="<fmt:formatDate value='${goodsVO.sale_start_date }' pattern='yyyy-MM-dd' />">
					</div>
					<div class="form-group">
						<label for="sale_end_date">판매종료일</label> <input
							class="form-control datepicker" readonly id="sale_end_date"
							name="sale_end_date"
							value="<fmt:formatDate value='${goodsVO.sale_end_date }' pattern='yyyy-MM-dd' />">
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
											value=${colorVO.color_name }>
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
											value=${sizeVO.size_name }>
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
									<img src="${imageVO.image_name }"
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

	let now = new Date();
	let startYear = now.getFullYear();
	let yearRange = (startYear - 10) + ":" + (startYear + 10);
	

	$(".datepicker").datepicker({

		dateFormat : "yy-mm-dd",

		changeMonth: true,

		changeYear: true,

		monthNamesShort: ["1월","2월","3월","4월","5월","6월","7월","8월","9월","10월","11월","12월"],

		dayNamesMin: ["일","월","화","수","목","금","토"],

		yearRange : yearRange
	});
	
	

	$("#product_date").datepicker("option", {"maxDate" : new Date()});

	$("#sale_start_date, #sale_end_date")
		.datepicker("option", {"minDate" : new Date()});
	

	$("#sale_start_date").change(function(){
		$("#sale_end_date").datepicker("option", "minDate", $(this).val())
	});
	$("#sale_end_date").change(function(){
		$("#sale_start_date").datepicker("option", "maxDate", $(this).val());
	});
	
	

	$("#cate_code1").change(function(){

		let cate_code1 = $(this).val();

		

		$.ajax({
			type: "get",
			url: "/goods/getCategory.do?cate_code1=" + cate_code1,

			success: function(result, status, xhr) {

				console.log("==== 중분류데이터 ====");
				console.log("result : " + JSON.stringify(result));
				console.log("status : " + status);
				console.log("xhr : " + xhr);
				
				let str = "";

				result.forEach(function(item){
					console.log(item.cate_name);
					str += '<option value="' + item.cate_code2 + '">';
					str += item.cate_name + '</option>\n';
				});
				
				console.log(str);
				
				$("#cate_code2").html(str);
			},
			error: function(xhr, status, err) {
				console.log("중분류 가져오기 오류 *************");
				console.log("xhr : " + xhr);
				console.log("status : " + status);
				console.log("err : " + err);
			}
		});

	});



	let colorTagCnt = ${fn:length(colorList)};
	console.log("colorTagCnt = " + colorTagCnt);
	
	$("#appendColorBtn").click(function(){

		
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

		$(this).closest(".input-group").remove();
		colorTagCnt--;
	});
	

	let sizeTagCnt =${fn:length(sizeList)};
	console.log("sizeTagCnt = " + sizeTagCnt);
	
	
	$("#appendSizeBtn").click(function(){

		
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

		$(this).closest(".input-group").remove();
		sizeTagCnt--;
	});
	

	let imageTagCnt =1;
	
	$("#appendImageBtn").click(function(){

		
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










