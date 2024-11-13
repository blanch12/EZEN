<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>QnA 수정 폼</title>
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
  <h2><i class="fa fa-edit"></i> QnA 글 수정 폼</h2>
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
    
    <!-- 기존 이미지 미리보기 및 삭제 버튼 -->
    <label for="imageName">첨부이미지</label>
    <c:if test="${!empty vo.filename}">
        <div>
            <img src="${vo.filename}" alt="첨부 이미지" style="max-width: 200px; display: block; margin-bottom: 5px;"
             id="existingImage">
        </div>
    <!-- 새로운 파일 선택을 위한 input -->
    <div class="filebox">
    <input class="text md-3" id="nameText" value="${vo.filename }" readonly style="height:25px;">
    <label for="imageName" class="btn btn-warning">
	  파일 변경
	</label>
    <input type="file" class="form-control" id="imageName" name="imageName" style="display:none">
	</div>
    </c:if>
    
    <c:if test="${empty vo.filename}">
    <div class="filebox">
    <input class="text md-3" id="nameText" value="${vo.filename }" readonly style="height:25px;">
    <label for="imageName" class="btn btn-warning">
	  파일 등록
	</label>
    <input type="file" class="form-control" id="imageName" name="imageName" style="display:none">
	</div>
    </c:if>
    
</div>
    <button type="submit" class="btn btn-primary">등록</button>
    <button type="reset" class="btn btn-secondary">새로입력</button>
    <button type="button" class="btn btn-success" onclick="history.back();"
    	id="cencelBtn">취소</button>
  </form>
</div>
</body>
</html>