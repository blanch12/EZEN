<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- list.jsp -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">



<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">

<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>


<link rel="stylesheet"
	href="https://code.jquery.com/ui/1.14.0/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.14.0/jquery-ui.js"></script>

<link rel="stylesheet" href="/resources/styles/reset.css?after">
<link rel="stylesheet" href="/resources/styles/common.css?after">
<link rel="stylesheet" href="/resources/styles/root.css?after">
<link rel="stylesheet" href="/resources/styles/main.css?after">
<link rel="stylesheet" href="/resources/styles/reponsive.css?after">


<title>카테고리</title>
<style type="text/css">
.editDiv {
	display: none;
}
</style>


</head>
<body>
	<div class="container" style="padding-top: 200px;">
		<div class="card">
			<div class="card-header">
				<h2>브랜드 카테고리 관리</h2>
			</div>
			<div class="card-body">
				<!-- Nav tabs -->
				<ul class="nav nav-tabs">
					<c:forEach items="${listBig }" var="vo">
						<li class="nav-item"><a
							class="nav-link bigCateData
								${(vo.brands_cate_code1 == brands_cate_code1)?'active':''}"
							data-toggle="tab" href="#mid_category"
							data-brands_cate_code1="${vo.brands_cate_code1}"> <span
								class="brands_cate_name">${vo.brands_cate_name }</span> <i
								class="fa fa-edit cate_edit"></i>
								<div class="editDiv">
									<button class="btn btn-success btn-sm updateBigBtn">수정</button>
									<br>
									<button class="btn btn-danger btn-sm deleteBigBtn">삭제</button>
								</div>
						</a></li>
					</c:forEach>
					<li class="nav-item"><a class="nav-link" data-toggle="tab"
						href="#mid_category"
						data-brands_cate_code1="${vo.brands_cate_code1}" id="writeBigBtn"><i
							class="fa fa-plus"></i></a></li>
				</ul>

				<!-- Tab panes -->
				<div class="tab-content">
					<div id="mid_category" class="container tab-pane active">
						<br>
						<h3>
							카테고리 중분류
							<button class="btn btn-primary btn-sm" id="writeMidBtn"
								data-brands_cate_code1="${vo.brands_cate_code1 }">
								<i class="fa fa-plus"></i>
							</button>
						</h3>
						<ul class="list-group">
							<c:forEach items="${listMid }" var="vo">
								<li class="list-group-item"
									data-brands_cate_code1="${vo.brands_cate_code1}"
									data-brands_cate_code2="${vo.brands_cate_code2 }"><span
									class="float-right">
										<button class="btn btn-success updateMidBtn">수정</button>
										<button class="btn btn-danger deleteMidBtn">삭제</button>
								</span> <span class="midCateName">${vo.brands_cate_name }</span></li>
							</c:forEach>
						</ul>
					</div>

				</div>

			</div>
			<div class="card-footer">Footer</div>
		</div>
	</div>

	<!-- The Modal -->
	<div class="modal fade" id="categoryModal">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">

				<!-- Modal Header -->
				<div class="modal-header">
					<h4 class="modal-title">Modal Heading</h4>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>

				<form action="" method="post" id="modalForm">
					<input type="hidden" name="brands_cate_code1" id="modalCateCode1"
						value="0"> <input type="hidden" name="brands_cate_code2"
						id="modalCateCode2" value="0">
					<!-- Modal body -->
					<div class="modal-body">
						<input name="brands_cate_name" class="form-control"
							id="modalCateName">
					</div>

					<!-- Modal footer -->
					<div class="modal-footer">
						<button class="btn btn-primary" id="submitBtn">전송</button>
						<button type="button" class="btn btn-secondary"
							data-dismiss="modal">Close</button>
					</div>
				</form>
			</div>
		</div>
	</div>

	<script type="text/javascript">
$(function(){
	// 이벤트 처리
	// 대분류 탭 클릭
	$(".bigCateData").click(function(){
		//alert("대분류 클릭");
		// 대분류 번호 수집
		let brands_cate_code1 = $(this).data("brands_cate_code1");
		// 현재 대분류가 아닐때만 이동
		if (!$(this).hasClass("active")) {
			// 중분류가져오기 -> 이동
			location="list.do?brands_cate_code1=" + brands_cate_code1;
		}
	});
	
	$(".cate_edit").click(function() {
		//alert("카테고리 대분류 수정");
		
		// 대분류 수정,삭제 버튼이 전부 안보이도록 처리
		$(".editDiv").hide();
		
		// edit를 클릭한 대분류만 수정, 삭제 버튼이 보이도록 처리
		$(this).next(".editDiv").slideDown();
		
		return false; // a tag의 페이지 이동 처리 무시
	});
	
	// 대분류 등록(+) 탭 클릭
	$("#writeBigBtn").click(function(){
		//alert("대분류 등록");
		return categoryProcess("대분류 등록", 0, 0, "", "write.do", "등록");; // a tag의 페이지 이동 처리를 무시합니다.
	});
	
	// 중분류 등록(+) 버튼 클릭
	// 현재 active 되어있는 대분류에서 중분류가 추가됩니다.
	$("#writeMidBtn").click(function(){
		//alert("중분류 등록");
		return categoryProcess("중분류 등록", ${brands_cate_code1}, 0, "", "write.do", "등록"); // a tag의 페이지 이동 처리를 무시합니다.
	});
	
	// 대분류 수정 버튼 클릭
	$(".updateBigBtn").click(function() {
		
		// 데이터 수집
		let brands_cate_code1 = $(this).closest("a").data("brands_cate_code1");
		let brands_cate_name = $(this).closest("a").find(".brands_cate_code1").text();
		
		alert("brands_cate_code1 = " + brands_cate_code1 + ", brands_cate_code1 = " + brands_cate_code1);
		
		//return false;
		return categoryProcess("대분류 수정", brands_cate_code1, 0,
			brands_cate_name, "update.do", "수정");
	});
	
	// 중분류 수정 버튼 클릭
	$(".updateMidBtn").click(function() {
		// 데이터 수집
		let brands_cate_code1 = $(this).closest("li").data("brands_cate_code1");
		let brands_cate_code2 = $(this).closest("li").data("brands_cate_code2");
		let brands_cate_name = $(this).closest("li").find(".midCateName").text();
		
	//	console.log("cate_code1 = " + cate_code1 +
	//			", cate_code2 = " + cate_code2 +
	//			", cate_name = " + cate_name);
		
		return categoryProcess("중분류 수정", brands_cate_code1,
			brands_cate_code2, brands_cate_name, "update.do", "수정");
	});
	
	// 대분류 삭제 버튼 이벤트
	$(".deleteBigBtn").click(function() {
		//alert("대분류 삭제 버튼");
		// 데이터 수집
		let brands_cate_code1 = $(this).closest("a").data("brands_cate_code1");
		let brands_cate_name = $(this).closest("a").find(".brands_cate_name").text();
		
		return categoryProcess("대분류 삭제", brands_cate_code1, 0,
			brands_cate_name, "delete.do", "삭제"); 
	});
	
	// 중분류 삭제 버튼 클릭
	$(".deleteMidBtn").click(function() {
		// 데이터 수집
		let brands_cate_code1 = $(this).closest("li").data("brands_cate_code1");
		let brands_cate_code2 = $(this).closest("li").data("brands_cate_code2");
		let brands_cate_name = $(this).closest("li").find(".midCateName").text();
		
	//	console.log("cate_code1 = " + cate_code1 +
	//			", cate_code2 = " + cate_code2 +
	//			", cate_name = " + cate_name);
		
		return categoryProcess("중분류 삭제", brands_cate_code1,
			brands_cate_code2, brands_cate_name, "delete.do", "삭제");
	});
	
	// 모달창을 보여주기전 세팅하는 함수
	function categoryProcess(title, brands_cate_code1, brands_cate_code2, brands_cate_name, url, btnName) {
		$("#categoryModal").find(".modal-title").text(title);
		
		$("#modalCateCode1").val(brands_cate_code1);
		$("#modalCateCode2").val(brands_cate_code2);
		
		$("#modalForm").attr("action", url);
		
		$("#modalCateName").val(brands_cate_name);
		
		$("#submitBtn").text(btnName);
		
		$("#submitBtn").removeClass("btn-primary");
		$("#submitBtn").removeClass("btn-success");
		$("#submitBtn").removeClass("btn-danger");
		if (btnName == "수정") {
			$("#submitBtn").addClass("btn-success");
		} else if (btnName == "삭제") {
			$("#submitBtn").addClass("btn-danger");
		} else {
			$("#submitBtn").addClass("btn-primary");
		}
		
		$("#categoryModal").modal("show");
		
		return false; // a tag의 페이지 이동 처리를 무시합니다.
	}
});
</script>
</body>
</html>





