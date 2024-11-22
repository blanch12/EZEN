<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
$(function(){

	
});
</script>
</head>
<body>
<div class="container">
	<div class="card">
  		<div class="card-header">Header</div>
		<div class="card-body">
		<ul>
			<c:forEach var="result" items="${resultList }">
				<li>
				<a href="${result.link }">${result.title }</a>
				 / ${result.press }</li>
			</c:forEach>
		</ul>
		</div>
		<div class="card-footer">Footer</div>
	</div>
</div>
</body>
</html>