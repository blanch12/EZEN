<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<link rel="stylesheet" href="/resources/styles/reponsive.css?after">
<meta charset="UTF-8">
<title>QnA 수정 폼</title>
<style>
.container {
	padding-top : 130px;
}

</style>
<script type="text/javascript">
$(function() {
	$("#imageName").on('change',function(){
		console.log("change");
		  let fileName = $("#imageName").val();
		  realName = fileName.substring(fileName.indexOf('fakepath')+9);
		  console.log(realName);
		  $("#nameText").val(realName);
		  
		//document.getElementById("existingImage").src = fileName;
		});
	
	$("#imageName").on("change", handleImgFileSelect);
	
	function handleImgFileSelect(e){
		var files = e.target.files;
		var reader = new FileReader();
		reader.onload = function(e){
			$("#existingImage").attr("src", e.target.result);
			console.log(e.target.result);
		}
		reader.readAsDataURL(files[0]);
	}
});
</script>
</head>
<body>

<div class="container">
  <h2><i class="fa fa-edit"></i> Q&A 글 수정</h2><br>
  <form action="update.do" method="post" enctype="multipart/form-data">
  	<input type="hidden" name="page" value="${pageObject.page}">
  	<input type="hidden" name="perPageNum" value="${pageObject.perPageNum}">
  	<input type="hidden" name="no" value="${param.no }">
    <div class="form-group">
      <label for="title">제목</label>
      <input type="text" class="form-control" id="title"
      	pattern="^[^ .].{2.99}$" required
      	title="맨앞에 공백문자 불가, 3~100자입력"
       placeholder="제목 입력" name="title" value="${vo.title }">
    </div>
    <div class="form-group">
      <label for="content">내용</label>
      <textarea class="form-control" rows="7" id="content" required
      	name="content" placeholder="내용 입력">${vo.content }</textarea>
    </div>
    <div class="form-group">
    
    
    <label for="imageName">첨부이미지</label>
    <c:if test="${!empty vo.filename}">
        <div>
            <img src="${vo.filename}" alt="첨부 이미지" style="max-width: 200px; display: block; margin-bottom: 5px;"
             id="existingImage">
        </div>
    <!-- 새로운 파일 선택을 위한 input -->
    <!-- 기존 파일 존재: 파일변경 버튼 -->
    <div class="filebox">
    <input class="text md-3" id="nameText" value="${vo.filename }" readonly style="height:25px;">
    <label for="imageName" class="btn btn-warning">
	  파일 변경
	</label>
    <input type="file" class="form-control" id="imageName" name="imageName" style="display:none">
	</div>
    </c:if>
    
    <!-- 기존 파일 없음: 파일등록 버튼 -->
    <c:if test="${empty vo.filename}">
    <div class="filebox">
    <input class="text md-3" id="nameText" value="${vo.filename }" readonly style="height:25px;">
    <label for="imageName" class="btn btn-warning">
	  파일 등록
	</label>
    <input type="file" class="form-control" id="imageName" name="imageName" style="display:none">
	</div>
    </c:if>
    <div class="custom-control custom-checkbox mb-3">
      <input type="checkbox" class="custom-control-input" id="customCheck" name="secret"
      value="1" ${(vo.secret == 1)?"checked":"" }>
      <label class="custom-control-label" for="customCheck">비밀 글</label>
    </div>
</div>
    <button type="submit" class="btn btn-primary">등록</button>
    <button type="reset" class="btn btn-secondary">새로입력</button>
    <button type="button" class="btn btn-success" onclick="history.back();"
    	id="cencelBtn">취소</button>
  </form>
</div>
</body>
</html>