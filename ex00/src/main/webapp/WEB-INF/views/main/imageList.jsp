<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="pageNav" tagdir="/WEB-INF/tags" %>
<c:forEach items="${goodsList }" var="vo" varStatus="vs">
<div class="col-md-3 dataRow">
	<div class="imageDiv align-content-center text-center">
  	<img class="card-img-top" src="${vo.image_name }" alt="Card image">
  </div>
  <div class="card-body title">
    <p class="card-text">
    	<div>
    	<strong style="border: 0.5px solid #E5E5E5; color:gray;
    	font-size:10px;"
    	>라이프스타일</strong>
    	</div>
    	<input type="hidden"class="goods_no" data-goods_no="${vo.goods_no }">
    	<div>
	    	${vo.goods_name }
    	</div>
    	<div>
	    	₩ <fmt:formatNumber value="${vo.price }" />
	    	</div>
		</p>
	  </div>
	
</div>
</c:forEach>