<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
<title>상품 정보</title>

<style type="text/css">
#smallImageDiv {
	display: flex;
}

#smallImageDiv img {
	width: 80px;
	height: 80px;
}

#smallImageDiv img:hover {
	opacity: 70%;
	cursor: pointer;
}

#goodsDetailDiv>div {
	padding: 10px;
	border-bottom: 1px solid #777;
}
</style>


</head>
<body>
	<div class="container" style="padding-top: 200px;">
		<div class="card">
			<div class="card-header">
				<h3>상품 정보</h3>
			</div>
			<div class="card-body">
				<div class="row">
					<div class="col-md-6">

						<div id="bigImageDiv" class="img-thumbnail">
							<img src="${vo.woman_image_name }" style="width: 100%;">
						</div>
						<div id="smallImageDiv">
							<img src="${vo.woman_image_name }" class="img-thumbnail">
							<c:if test="${!empty imageList }">
								<c:forEach items="${imageList}" var="imageVO">
									<img src="${imageVO.woman_image_name }" class="img-thumbnail">
								</c:forEach>
							</c:if>
						</div>
					</div>
					<div class="col-md-6" id="goodsDetailDiv">

						<div>
							<i class="fa fa-caret-right"></i> 상품 번호 : ${vo.woman_no }
						</div>
						<div>
							<i class="fa fa-caret-right"></i> 브랜드 : ${vo.woman_cate_name }
						</div>
						<div>
							<i class="fa fa-caret-right"></i> 상품명 : ${vo.woman_name }
						</div>
						<div>${vo.content }</div>
						<div>
							<i class="fa fa-caret-right"></i> 정가 : ${vo.price }
						</div>
						<div>
							<i class="fa fa-caret-right"></i> 할인가 : ${vo.sale_price }
						</div>
						<div>
							<i class="fa fa-caret-right"></i> 배송료 : ${vo.delivery_charge }
						</div>
						<div>
							<i class="fa fa-caret-right"></i> 적립율 : ${vo.saved_rate }
						</div>
						<div class="input-group mb-3">
							<div class="input-group-prepend">
								<span class="input-group-text">사이즈</span> <select
									class="form-control" id="woman_size_name">
									<option>=========</option>
									<c:forEach items="${sizeList }" var="sizeVO">
										<option>${sizeVO.woman_size_name }</option>
									</c:forEach>
								</select>
							</div>
						</div>
						<div class="input-group mb-3">
							<div class="input-group-prepend">
								<span class="input-group-text">색상</span> <select
									class="form-control" id="woman_color_name">
									<option>=========</option>
									<c:forEach items="${colorList }" var="colorVO">
										<option>${colorVO.woman_color_name }</option>
									</c:forEach>
								</select>
							</div>
						</div>
					</div>
				</div>


			</div>
			<div class="card-footer">
				<button class="btn btn-primary" id="listBtn">리스트</button>
				<button class="btn btn-success" id="updateBtn">수정</button>
				<form action="${pageContext.request.contextPath}/woman/delete.do"
					method="post" onsubmit="return confirm('정말 삭제하시겠습니까?');">
					<input type="hidden" name="woman_no" value="${vo.woman_no}" />
					<button type="submit" class="btn btn-danger">삭제</button>
				</form>
			</div>
		</div>
	</div>
	<script type="text/javascript">
	$(function() {

	    $("#smallImageDiv img").click(function() {
		//alert("이미지 클릭");
		$("#bigImageDiv img").attr("src", $(this).attr("src"));
	    });

	    $("#listBtn").click(
		    function() {
			//alert("리스트 버튼");
			location = "list.do?page=${param.page}"
				+ "&perPageNum=${param.perPageNum}"
				+ "&${womanSearchVO.searchQuery}";
		    });

	    $("#updateBtn")
		    .click(
			    function() {
				//alert("수정 버튼");
				location = "updateForm.do?woman_no=${vo.woman_no}&page=${param.page}"
					+ "&perPageNum=${param.perPageNum}"
					+ "&${womanSearchVO.searchQuery}";
			    });

	});
    </script>
</body>
</html>