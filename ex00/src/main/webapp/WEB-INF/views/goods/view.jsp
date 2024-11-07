<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="/resources/styles/reset.css">
<link rel="stylesheet" href="/resources/styles/common.css">

<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<title>상품 정보</title>
<style type="text/css">
#smallImageDiv img {
	width: 80px;
	height: 80px;

}
#smallImageDiv img:hover {
	opacity: 70%;
	cursor: pointer;
}

#goodsDetailDiv>div{
	padding: 10px;
}
#goodsDetailDiv{
	height: 100%;
}
#goodsDetailDiv a:hover{
	cursor: pointer;
	color: #B0B0B0;
}
#bigImageDiv img {
    transition: opacity 0.5s ease;
}
.gName {
	color: gray;
}
</style>

<script type="text/javascript">
$(function(){

	$("#smallImageDiv img").click(function() {
	    let bigImage = $("#bigImageDiv img");
	    let newImageSrc = $(this).attr("src");

	    // 임시 이미지 요소 생성 후 새로운 이미지 src로 설정
	    let tempImage = $("<img>").attr("src", newImageSrc).css({
	        position: "absolute",
	        top: 5,
	        left: 20,
	        width: bigImage.width(),
	        height: bigImage.height(),
	        opacity: 0,  // 투명하게 시작
	        transition: "opacity 1s ease"  // 부드러운 전환 효과
	    });

	    // #bigImageDiv에 임시 이미지 추가
	    $("#bigImageDiv").append(tempImage);

	    // 임시 이미지가 로드된 후 opacity를 1로 설정해 서서히 나타나게 함
	    tempImage.on("load", function() {
	        tempImage.css("opacity", 1);  // 새 이미지 나타내기

	        setTimeout(function() {
	            // 전환이 끝난 후 원래 bigImage의 src 변경 및 임시 이미지 제거
	            bigImage.attr("src", newImageSrc);
	            tempImage.remove();
	        }, 1000);  // 1초 후 원래 이미지 교체 및 임시 이미지 삭제
	    });
	});
	
	$("#listBtn").click(function(){
		//alert("리스트 버튼");
		location="list.do?page=${param.page}"
			+ "&perPageNum=${param.perPageNum}"
			+ "&${goodsSearchVO.searchQuery}";
	});
	
	$("#updateBtn").click(function(){
		//alert("수정 버튼");
		location="updateForm.do?goods_no=${vo.goods_no}&page=${param.page}"
			+ "&perPageNum=${param.perPageNum}"
			+ "&${goodsSearchVO.searchQuery}";
	});
	
});
</script>
</head>
<body>
<div class="container">
	<div class="card">
		<div class="card-body">
			<div class="row">
				<div class="col-md-6">
					<div id="bigImageDiv" class="img-thumbnail">
						<img src="${vo.image_name }" style="width : 100%;">
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
				<div class="col-md-4 border border-dark" id="goodsDetailDiv">
					<div class="gName">
						<strong>${vo.goods_name }</strong>
					</div>
					<div>
						₩ <fmt:formatNumber value="${vo.price }" />
					</div>
					<div>
						<a data-toggle="modal" data-target="#deliveryModal"
						style="font-size:12px;">배송 및 환불</a>
					</div>
					<div>
						${vo.content }
					</div>
					<div class="input-group mb-3">
					    <div class="input-group-prepend">
					    	<span class="input-group-text">사이즈</span>
						   	<select	class="form-control" id="size_name">
								<option>선택</option>
								<c:forEach items="${sizeList }" var="sizeVO">
									<option>${sizeVO.size_name }</option>
								</c:forEach>
							</select>
					   	</div>
					</div>
					<div class="input-group mb-3">
					    <div class="input-group-prepend">
					    	<span class="input-group-text">색상</span>
						   	<select	class="form-control" id="color_name">
								<option>선택</option>
								<c:forEach items="${colorList }" var="colorVO">
									<option>${colorVO.color_name }</option>
								</c:forEach>
							</select>
					   	</div>
					</div>
				<div style="padding-left: 140px; border-top: 1px solid black;">
			      <a>추가하기</a>
			    </div>
				</div>
			</div>
<!-- 			<div class="row"> -->
<!-- 				<div class="col-md-12"> -->
<%-- 				<pre>${vo.content }</pre> --%>
<!-- 				</div> -->
<!-- 			</div> -->
	
		</div>
		<div class="card-footer">
			<button class="btn btn-primary" id="listBtn">리스트</button>
			<button class="btn btn-success" id="updateBtn">수정</button>
		</div>
	</div>
</div>

<!-- The Modal -->
  <div class="modal fade" id="deliveryModal">
    <div class="modal-dialog">
      <div class="modal-content">
      
        <!-- Modal Header -->
        <div class="modal-header">
          <h4 class="modal-title">배송 및 환불</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        
        <!-- Modal body -->
        <div class="modal-body">
        <pre>
        <b style="font-size:20px;">배송</b>
        
        당일 배송
        배송비 - ₩ <fmt:formatNumber value="${vo.delivery_charge }" />
 
        <b style="font-size:20px;">환불 정책</b>
        
        개봉 및 사용시 환불 불가
        </pre>
        </div>
        
      </div>
    </div>
  </div>
</body>
</html>