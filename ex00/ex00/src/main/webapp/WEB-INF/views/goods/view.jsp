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
	padding: 15px;
	border-bottom: 1px solid #ccc;
}

.size-container {
	display: flex;
	gap: 10px;
	flex-wrap: wrap;
}

.form-check {
	display: flex;
	align-items: center;
}

.form-check label {
	font-size: 1rem;
	width: 30px;
	height: 30px;
	text-align: center;
	line-height: 30px;
	color: #4a4a4a;
	border-radius: 6px;
	transition: all 0.3s ease;
	gap: 3rem;
}

.form-check label:hover {
	color: #333;
	box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1);
}

.size_title {
	padding: 1rem 0rem;
}

input#size_S {
	accent-color: #f0ebe7;
}

label#color_BLACK {
	accent-color: #000;
}

input#color_Pink {
	accent-color: pink;
}

input#color_Red {
	accent-color: blue;
}
/* 색상  */
.color-label {
	display: inline-block;
	width: 20px;
	height: 20px;
	border-radius: 50%;
	cursor: pointer;
	border: 2px solid transparent;
	transition: border-color 0.3s ease;
}

.color-radio:checked+.color-label {
	border-color: #000;
}

.color-radio {
	display: none;
}

.color-container {
	display: flex;
	gap: 20px;
	flex-wrap: wrap;
}

.color_title {
	padding: 1rem 0rem;
}

/* 장바구니 */
.cart_btn {
	border: 1px solid #333;
	width: 100%;
	height: 50px;
	transition: background-color 0.3s ease, transform 0.2s ease;
	font-size: 1.6rem;
}

.cart_btn:hover {
	background-color: #333;
	color: #fff;
}

.cart-form {
	display: flex;
	align-items: center;
	gap: 10px;
	padding: 2rem 0rem;
}

.quantity-input {
	width: 60px;
	padding: 5px;
	border: 1px solid #ccc;
	border-radius: 5px;
	font-size: 14px;
	text-align: center;
	display: none;
}

.btn-cart {
	border: 1px solid #333;
	width: 100%;
	height: 50px;
	transition: background-color 0.3s ease, transform 0.2s ease;
	font-size: 1.6rem;
}

.btn-cart:hover {
	background-color: #333;
	color: #fff;
}
</style>


</head>
<body>
	<div class="container" style="padding-top: 200px;">
		<div class="card">
			<div class="card-header"></div>
			<div class="card-body">
				<div class="row">
					<div class="col-md-6 description-box">

						<div id="bigImageDiv" class="img-thumbnail">
							<img src="${vo.image_name }" style="width: 100%;">
						</div>
						<div id="smallImageDiv">
							<img src="${vo.image_name }" class="img-thumbnail">
							<c:if test="${!empty imageList }">
								<c:forEach items="${imageList}" var="imageVO">
									<img src="${imageVO.image_name }" class="img-thumbnail">
								</c:forEach>
							</c:if>
						</div>
					</div>
					<div class="col-md-6" id="goodsDetailDiv">
						<div>상품 번호 : ${vo.goods_no }</div>
						<div>브랜드 : ${vo.cate_name }</div>
						<div>상품명 : ${vo.goods_name }</div>
						<div>${vo.content }</div>
						<div>정가 : ${vo.price }</div>
						<div>할인가 : ${vo.sale_price }</div>
						<div>배송료 : ${vo.delivery_charge }</div>
						<div>적립율 : ${vo.saved_rate }</div>
						<div class="form-group">
							<label class="size_title">사이즈</label>
							<div class="size-container">
								<c:forEach items="${sizeList}" var="sizeVO">
									<div class="form-check">
										<!-- 라디오 버튼 -->
										<input class="form-check-input" type="radio" name="size_name"
											id="size_${sizeVO.size_name}" value="${sizeVO.size_name}" />
										<!-- 라벨 -->
										<label class="form-check-label" for="size_${sizeVO.size_name}">
											${sizeVO.size_name} </label>
									</div>
								</c:forEach>
							</div>
						</div>


						<div class="form-group">
							<label class="color_title">색상</label>
							<div class="color-container">
								<c:forEach items="${colorList}" var="colorVO">
									<!-- 라벨을 클릭 영역으로 사용 -->
									<label class="color-label" for="color_${colorVO.color_name}"
										style="background-color: ${colorVO.color_name};"> <input
										type="radio" name="color_name"
										id="color_${colorVO.color_name}" value="${colorVO.color_name}"
										class="color-radio" />
									</label>
								</c:forEach>
							</div>
						</div>
						<form action="/cart/add" method="POST" class="cart-form">
							<input type="hidden" name="id" value="${login.id}" /> <input
								type="hidden" name="goods_no" value="${vo.goods_no}" /> <input
								type="hidden" name="goods_name" value="${vo.goods_name}" /> <input
								type="hidden" name="image_name" value="${vo.image_name}" /> <input
								type="hidden" name="sale_price" value="${vo.sale_price}" /> <input
								type="hidden" name="delivery_charge"
								value="${vo.delivery_charge}" /> <input type="number"
								name="quantity" class="quantity-input" min="1" value="1"
								required placeholder="수량 입력" />


							<button type="submit" class="btn btn-cart">장바구니에 추가</button>
						</form>

						<form action="/cart/list.do">
							<button class="cart_btn" type="submit">결제하기</button>
						</form>
					</div>
				</div>


			</div>
			<div class="card-footer">
				<button class="btn btn-primary" id="listBtn">리스트</button>
				<button class="btn btn-success" id="updateBtn">수정</button>
				<form action="${pageContext.request.contextPath}/goods/delete.do"
					method="post">
					<input type="hidden" name="goods_no" value="${vo.goods_no}" />
					<button type="submit" class="btn btn-danger">삭제</button>
				</form>
			</div>

		</div>
	</div>
	<script type="text/javascript">
	$(function() {

	    $("#smallImageDiv img").click(function() {
		$("#bigImageDiv img").attr("src", $(this).attr("src"));
	    });

	    $("#listBtn").click(
		    function() {
			location = "list.do?page=${param.page}"
				+ "&perPageNum=${param.perPageNum}"
				+ "&${goodsSearchVO.searchQuery}";
		    });

	    $("#updateBtn")
		    .click(
			    function() {
				location = "updateForm.do?goods_no=${vo.goods_no}&page=${param.page}"
					+ "&perPageNum=${param.perPageNum}"
					+ "&${goodsSearchVO.searchQuery}";
			    });

	});
    </script>
</body>
</html>