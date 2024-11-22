<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="pageNav" tagdir="/WEB-INF/tags"%>

<!-- 데이터는 DispatcherServlet에 담겨있다.(request) -->

<!DOCTYPE html>
<html>
<head>
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

<title>장바구니 리스트</title>



<style type="text/css">
.container {
	padding-top: 200px;
}

.cart-container {
	width: 80%;
	margin: 20px auto;
}

/* Header */
.header-row {
	font-weight: bold;
	background-color: #f1f1f1;
	padding: 12px;
	text-align: center;
}

/* Cart item styling */
.cart-item {
	padding: 15px;
	background-color: #ffffff;
	border-radius: 8px;
	box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
	margin-bottom: 10px;
	display: flex;
	align-items: center;
}

.cart-item img {
	width: 60px;
	height: 60px;
	border-radius: 5px;
}

.cart-item input[type="number"] {
	width: 50px;
	padding: 5px;
	text-align: center;
}

.total-price {
	font-weight: bold;
	color: #2c3e50;
}

.right-align {
	text-align: right;
}

/* Summary section */
.summary {
	margin-top: 30px;
	padding: 20px;
	background-color: transparent;
	width: 100%;
	margin: 0 auto;
}

.summary div {
	margin: 8px 0;
	font-size: 18px;
}

/* Buttons */
.checkout-btn {
	width: 30%;
	padding: 15px;
	background-color: #000;
	color: white;
	border: none;
	font-size: 1.5rem;
	cursor: pointer;
}

.checkout-btn:disabled {
	background-color: #d5dbdb;
	cursor: not-allowed;
}

#delete-btn {
	background-color: #e74c3c;
	color: white;
	font-size: 16px;
	border: none;
	cursor: pointer;
}

#delete-btn:hover {
	background-color: #c0392b;
}

/* Utility classes */
.center {
	display: flex;
	align-items: center;
	justify-content: center;
}

.cartNo {
	text-align: center;
}

.back_btn {
	width: 100px;
	height: 40px;
	border: 1px solid #333;
	background-color: #fff;
	color: #000;
	transition: background-color 0.3s ease, transform 0.2s ease;
}

.back_btn:hover {
	color: #fff;
	background-color: #333;
}
</style>


</head>

<body>
	<div class="container">
		<c:if test="${empty list}">
			<h4>장바구니가 비었습니다.</h4>
		</c:if>
		<c:if test="${!empty list}">

			<div class="row header-row">
				<div class="col-sm-1">선택</div>
				<div class="col-sm-2">상품사진</div>
				<div class="col-sm-2">상품명</div>
				<div class="col-sm-1">상품가격</div>
				<div class="col-sm-1">수량</div>
				<div class="col-sm-1">합계금액</div>
				<div class="col-sm-2">상품번호</div>
			</div>
			<c:forEach items="${list}" var="vo" varStatus="vs">
				<div class="row cart-item">
					<div class="col-sm-1 center">
						<input type="checkbox" class="item-checkbox"
							onchange="updateSummary()">
					</div>
					<div class="col-sm-2 center">
						<img src="${vo.imageName}" alt="상품이미지">
					</div>
					<div class="col-sm-2 center">${vo.goodsName}</div>


					<div class="col-sm-1 right-align item-price">${vo.saleprice}</div>
					<div class="col-sm-1 center">
						<input type="number" value="${vo.quantity}" class="item-quantity"
							onchange="updateSummary()">
					</div>

					<div class="col-sm-1 right-align total-price">${vo.saleprice * vo.quantity}</div>
					<div class="col-sm-2 center cartNo">${vo.cartNo}</div>
					<button id="delete-btn" class="btn btn-danger">X</button>
				</div>

			</c:forEach>
			<button class="back_btn" onclick="history.back()">계속 쇼핑하기</button>
			<div class="summary">
				<div>
					<span>선택한 상품 금액 합계: </span> <span id="selected-total">₩ </span>
				</div>
				<div>
					<span>총 결제 금액: </span> <span id="total-amount">₩ </span>
				</div>
			</div>
			<button class="checkout-btn" id="checkout-btn" disabled>결제하기</button>
		</c:if>



	</div>
	<script>
	//페이지가 로딩 후 세팅
	function updateSummary() {
	        let total = 0;
	        let selectedTotal = 0;
	        let checkoutEnabled = false;
	        
	        console.log("updateSummary()---+++");
	
	        // 각 상품별로 체크박스와 수량을 반영하여 계산
	        document.querySelectorAll('.cart-item').forEach((item) => {
	            const checkbox = item.querySelector('.item-checkbox');
	            const quantityInput = item.querySelector('.item-quantity');
	            const itemPrice = parseInt(item.querySelector('.item-price').textContent.replace(' ', '').replace(',', ''));
	            const itemQuantity = parseInt(quantityInput.value);
	            const totalPriceElement = item.querySelector('.total-price');
	            
	            console.log(item.querySelector('.item-price').textContent);
	            console.log(itemPrice);
	
	            // 상품의 결제 금액을 업데이트
	            const itemTotalPrice = itemPrice * itemQuantity;
	            console.log("itemPrice =", itemPrice);
	            console.log("itemQuantity =", itemQuantity);
	            console.log("itemTotalPrice =", itemTotalPrice);
	            totalPriceElement.textContent = ' '+itemTotalPrice.toLocaleString();
	            console.log(totalPriceElement);
	            console.log(itemTotalPrice.toLocaleString());
	
	            // 체크박스가 선택된 상품만 합산
	            if (checkbox.checked) {
	                selectedTotal += itemTotalPrice;
	            }
	
	            // 체크박스가 하나라도 선택되면 결제 가능
	            if (checkbox.checked) {
	                checkoutEnabled = true;
	            }
	
	            total += itemPrice * itemQuantity;
	            
	            console.log("updateSummary() querySelectorAll(.cart-item) ---+++");
	        });

        // 합계 업데이트
        document.getElementById('selected-total').textContent = ' ' + selectedTotal.toLocaleString();
        document.getElementById('total-amount').textContent = ' ' + total.toLocaleString();

        // 결제 버튼 활성화/비활성화
        const checkoutButton = document.getElementById('checkout-btn');
        checkoutButton.disabled = !checkoutEnabled;
    	}
	
	
	$(function() {
	    // 체크박스 상태를 반영하여 합계를 계산하는 함수
	    
  
	    // 페이지 로딩 시 초기 합계 업데이트
	    updateSummary();
	    
	    $(document).on('change', '.item-checkbox', function() {
	        updateSummary();  // 체크박스를 변경할 때마다 합계를 업데이트
	    });
    
		 // 수량 변경 시 합계 업데이트
	    $('input.item-quantity').change(function() {
	        updateSummary();
	    });

// 	    // 체크박스 상태 변경 시 합계 업데이트
// 	    $('input.item-checkbox').change(function() {
// 	        updateSummary();
// 	    });
 
		// 삭제 버튼 클릭 시 선택된 항목 삭제
	    $('#delete-btn').click(function() {
	    	console.log('Delete button clicked');  // 버튼 클릭 확인
        	let selectedCartNos = [];

	        document.querySelectorAll('.cart-item').forEach((item) => {
	            const checkbox = item.querySelector('.item-checkbox');
	            console.log('Checkbox checked:', checkbox.checked);  // 체크박스 상태 확인
	            if (checkbox.checked) {
	                const cartNoElement = item.querySelector('.cartNo');
	                if (cartNoElement) {
	                    const cartNo = cartNoElement.textContent.trim();
	                    console.log('cartNo:', cartNo);  // cartNo가 제대로 출력되는지 확인
	                    if (cartNo) {
	                        selectedCartNos.push(cartNo);
	                    } else {
	                        console.warn('cartNo is empty for item:', item);
	                    }
	                } else {
	                    console.error('cartNo element is missing for item:', item);
	                }
	            }
	        });

        console.log('Selected Cart Nos:', selectedCartNos);  // 삭제할 항목 확인
        if (selectedCartNos.length === 0) {
            alert('삭제할 상품을 선택하세요.');
            return;
        }
	
	        // Ajax 요청으로 서버에 삭제 요청
	        $.ajax({
	            url: '/cart/removeItems',  // 서버에서 처리할 URL
	            type: 'POST',
	            contentType: 'application/json',  // JSON 형식으로 전송
	            data: JSON.stringify({ cartNos: selectedCartNos }),  // 배열을 JSON 문자열로 변환
	            success: function(response, status, xhr) {
	            	console.log (response);
	            	console.log (status);
	            	console.log (xhr);
	                if (response.success) {
	                    // 서버에서 성공적으로 삭제되면 화면에서 삭제
	                    document.querySelectorAll('.cart-item').forEach((item) => {
	                        const checkbox = item.querySelector('.item-checkbox');
	                        if (checkbox.checked) {
	                            item.remove();
	                        }
	                    });
	
	                    // 삭제 후 합계 업데이트
	                    updateSummary();
	                } else {
	                    alert('상품 삭제 실패');
	                }
	            },
	            error: function(xhr, status, error) {
	                alert('삭제 중 오류가 발생했습니다.');
	            }
	        });
	    });
    
	});
</script>
</body>
</html>