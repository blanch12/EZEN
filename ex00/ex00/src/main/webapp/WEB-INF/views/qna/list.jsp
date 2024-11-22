<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="pageNav" tagdir="/WEB-INF/tags" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

<!-- jQuery UI 스타일 및 스크립트 -->
<link rel="stylesheet"
	href="https://code.jquery.com/ui/1.14.0/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.14.0/jquery-ui.js"></script>

<!-- 커스텀 스타일 -->

<link rel="stylesheet" href="/resources/styles/reset.css?after">
<link rel="stylesheet" href="/resources/styles/common.css?after">
<link rel="stylesheet" href="/resources/styles/root.css?after">
<link rel="stylesheet" href="/resources/styles/reponsive.css?after">
<meta charset="UTF-8">
<title>QnA 리스트</title>
<jsp:include page="../jsp/webLib.jsp"></jsp:include>
<style type="text/css">
.dataRow>.card-header{
	background: #e0e0e0;
}
.dataRow:hover{
	border-color: orange;
	cursor: pointer;
}
.dataRow {
	margin: 0 50px 5px 50px;
}

</style>

<script type="text/javascript">
$(function() {
	// jquery 이벤트 코드는 이안에 작성한다.
	$(".dataRow").click(function() {
		// tag에 적힌 data-no="${vo.no}"
		let no = $(this).data("no");
		//alert(no);
		location = "view.do?no=" + no
			+ "&${pageObject.pageQuery}";
			// pageObject의 getPageQuery()를 가져와서
			// page, perPageNum, key, word를 붙인다.
	});
	
	// perPageNum 값이 변경되었을 때 이벤트 처리
	$("#perPageNum").change(function() {
		//alert("change perPageNum");
		$("#searchForm").submit();
	});
	
	// 검색 데이터 세팅
	// key 값이 없으면 '제목' 으로 세팅
	$("#key").val('${(empty pageObject.key)?"t":pageObject.key}');
	// perPageNum 세팅
	// perPageNum 이 없으면 '10' 으로 세팅
	$("#perPageNum")
		.val('${(empty pageObject.perPageNum)?"10":pageObject.perPageNum}');
	
	
});
</script>
</head>
<body>
<div class="container" style="padding-top: 150px;">
	<div class="card">
		<div class="card-header"><h3>QnA 리스트</h3></div>
		<div class="card-body">
			<!-- 검색창 및 perPageNum 설정창 -->
			<form action="list.do" id="searchForm">
				<input type="hidden" name="page" value="1"> <!-- 초기값세팅 -->
				<div class="row">
					<div class="col-md-8">
			  			<div class="input-group mt-3 mb-3">
							<div class="input-group-prepend">
								<select class="form-control" id="key" name="key">
									<option value="t">제목</option>
							        <option value="c">내용</option>
							        <option value="w">작성자</option>
							        <option value="tc">제목/내용</option>
							        <option value="tw">제목/작성자</option>
							        <option value="cw">내용/작성자</option>
							        <option value="tcw">모두</option>
								</select>
							</div>
				      		<input type="text" class="form-control" placeholder="검색어입력"
			      				id="word" name="word" value="${pageObject.word }">
							<div class="input-group-prepend">
								<button type="submit" class="btn btn-primary">
									<i class="fa fa-search"></i></button>
							</div>
					    </div>
					</div> <!-- end of class="col-md-8" -->
					<div class="col-md-4">
						<div class="input-group mt-3 mb-3">
						  <div class="input-group-prepend">
						    <span class="input-group-text">Rows/Page</span>
						  </div>
						  <select id="perPageNum" name="perPageNum"
						   class="form-control">
						   		<option>5</option>
						   		<option>10</option>
						   		<option>15</option>
						   		<option>20</option>
						   		<option>25</option>
						  </select>
						</div>
					</div> <!-- end of class="col-md-4" -->
				</div><!-- end of class="row" -->
			</form>
			
			
			
			
			<!-- QNA 리스트 데이터 -->
			<c:forEach items="${list }" var="vo">
				<div class="card dataRow" data-no="${vo.no }">
					
					<!-- 작성글(ans==0)이면 상태 출력 -->
					<c:if test="${vo.ans == 0 }">
						<div class="card-header">
						상태 : ${vo.status }
						</div>
					</c:if>
					
					<!-- 작성자 본인 or 관리자만 정보볼 수 있게 -->
					<c:if test="${id == vo.writer || gradeNo == 9 || id == vo.parent_writer || vo.secret == 0}">
						<!-- 작성글: 제목출력 -->
						<c:if test="${vo.ans == 0 }">
							<div class="card-body">
								<pre>${vo.title }</pre>
							</div>
						</c:if>
						<!-- 답글: 제목 앞 답글기호 -->
						<c:if test="${vo.ans == 1 }">
							<div class="card-body" style="background: #E2E1EE">
								<pre> └ ${vo.title }</pre>
							</div>
						</c:if>
					</c:if>
					
					<!-- 작성자 본인X and 일반회원: 비밀글 처리 -->
					<c:if test="${id != vo.writer && gradeNo != 9 && id != vo.parent_writer && vo.secret == 1}">
						<!-- 작성글 -->
						<c:if test="${vo.ans == 0 }">
							<div class="card-body">
								<pre>비밀글 입니다.</pre>
							</div>
						</c:if>
						<!-- 답글 -->
						<c:if test="${vo.ans == 1 }">
							<div class="card-body" style="background: #E2E1EE">
								<pre>└ 비밀 답변 입니다.</pre>
							</div>
						</c:if>
					</c:if>
					
					<div class="card-footer">
						<!-- (작성자본인 or 관리자) and 작성글: writer 전체출력 -->
						<c:if test="${(id == vo.writer || gradeNo == 9) && vo.ans == 0 }">
							${vo.writer }
               			</c:if>
               			<!-- (작성자본인X and 일반회원) and 작성글: writer 일부가리기 -->
						<c:if test="${(id != vo.writer && gradeNo != 9) && vo.ans == 0}">
							<!-- vo.writer를 절반으로 나눠 halfLength로 지정 -->
							<c:set var="halfLength" value="${fn:length(vo.writer) / 2}" />
	               			 ${fn:substring(vo.writer, 0, halfLength-1)}**${fn:substring(vo.writer, halfLength+1, fn:length(vo.writer))}
						</c:if>
						<!-- 작성일 -->
						<span style="color:gray">
	               			 &emsp;<fmt:formatDate value="${vo.writeDate }"
								pattern="yyyy-MM-dd"/>
						</span>
					</div>
				</div>
			</c:forEach>
		</div>
		<div class="card-footer">
			<div>
				<pageNav:pageNav listURI="list.do" pageObject="${pageObject}"></pageNav:pageNav>
			</div>
			<!-- 글등록 버튼 -->
			<a href="writeForm.do" class="btn btn-primary">글등록</a>
		</div>
	</div>
</div>
</body>
</html>