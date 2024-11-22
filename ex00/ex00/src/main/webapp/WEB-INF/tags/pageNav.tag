<%@ tag language="java" pageEncoding="UTF-8" %>
<%@ tag trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ attribute name="pageObject" required="true"
 type="org.zerock.util.page.PageObject" %>
<%@ attribute name="listURI" required="true"
 type="java.lang.String" %>
<%@ attribute name="query" required="false"
 type="java.lang.String" %> 

<% request.setAttribute("noLinkColor", "#000"); %>

<ul class="pagination" style="gap: 10px;">
  	<li data-page="1" class="page-item">
		<c:if test="${pageObject.page > 1}">
			<!-- 맨 첫페이지로 이동 : query가 없는 경우 - 일반 게시판 페이지 처리 -->
	  		<a href="${listURI }?page=1&${pageObject.notPageQuery}"
	  		  title="click to move first page!" class="page-link">
	  			<i class="fa fa-backward"></i>
	  		</a>
  		</c:if>
		<c:if test="${pageObject.page == 1 }">
	  		<a href="" onclick="return false"
	  		 ${noMove } class="page-link">
	  			<i class="fa fa-backward" style="color: ${noLinkColor};"></i>
	  		</a>
	  	</c:if>
	</li>
	
	<li data-page="${pageObject.startPage -1 }" class="page-item">
		<c:if test="${pageObject.startPage > 1 }">
	  		<a href="${listURI }?page=${pageObject.startPage - 1 }&${pageObject.notPageQuery}${query}"
	  		  title="click to move previous page group!" class="page-link">
	  			<i class="fa fa-caret-left"></i>
	  		</a>
	  	</c:if>
		<c:if test="${pageObject.startPage == 1 }">
	  		<a href="" onclick="return false" class="page-link"
	  		 ${noMove }>
	  			<i class="fa fa-caret-left" style="color: ${noLinkColor};"></i>
	  		</a>
	  	</c:if>
  	</li>

	<c:forEach begin="${pageObject.startPage }" end="${pageObject.endPage }" var="cnt">
  	<li ${(pageObject.page == cnt)?"class=\"active page-item\"":" class=\"page-item\""} 
  	 data-page=${cnt } >
  	 	<!-- 페이지와 cnt가 같으면 링크가 없음 -->
  	 	<c:if test="${pageObject.page == cnt }">
  			<a href="" onclick="return false" class="page-link"
  			 ${noMove }>${cnt}</a>
  	 	</c:if>
  	 	<!-- 페이지와 cnt가 같지 않으면 링크가 있음 -->
  	 	<c:if test="${pageObject.page != cnt }">
  			<a href="${listURI }?page=${cnt }&${pageObject.notPageQuery}${query}"
	  		 title="click to move ${cnt } page" class="page-link">${cnt}</a>
  		</c:if>
  	</li>
	</c:forEach>

  	<li data-page="${pageObject.endPage + 1 }" class="page-item">
		<c:if test="${pageObject.endPage < pageObject.totalPage }">
	  		<a href="${listURI }?page=${pageObject.endPage + 1 }&${pageObject.notPageQuery}${query}"
	  		  title="click to move next page group!" class="page-link">
	  			<i class="fa fa-caret-right"></i>
	  		</a>
	  	</c:if>
		<c:if test="${pageObject.endPage == pageObject.totalPage }">
	  		<a href="" onclick="return false" class="page-link"
	  		 ${noMove }>
	  			<i class="fa fa-caret-right" style="color: ${noLinkColor};"></i>
	  		</a>
	  	</c:if>
  	</li>
  	<li data-page="${pageObject.totalPage }" class="page-item">
		<c:if test="${pageObject.page < pageObject.totalPage }">
	  		<a href="${listURI }?page=${pageObject.totalPage }&${pageObject.notPageQuery}${query}"
	  		  title="click to move last page!" class="page-link">
	  			<i class="fa fa-forward"></i>
	  		</a>
	  	</c:if>
		<c:if test="${pageObject.page == pageObject.totalPage }">
	  		<a href="" onclick="return false"
	  		 ${noMove } class="page-link">
	  			<i class="fa fa-forward" style="color: ${noLinkColor};"></i>
	  		</a>
	  	</c:if>
  	</li>
</ul>

<style>
  .pagination .page-item .page-link {
    background-color: transparent;
    border: none;
    color: #000;
    padding: 5px 5px;
    text-align: center;
    cursor: pointer;
    margin: 0 5px;
    transition: background-color 0.3s ease, color 0.3s ease;
  }

  .pagination .page-item .page-link:hover {
    background-color: transparent;
    border: none;
  }

  .pagination .page-item.active .page-link {
    border-bottom: 1px solid #000;
    background-color: transparent;
  }
  
  .pagination {
    display: flex;
    gap: 10px;
    border: none;
  }
</style>

<script>
$(document).ready(function(){
    // 페이지네이션 클릭 시 스크롤 위치 저장
    $(".pagination a").click(function(event){
      // 스크롤 위치 저장
      sessionStorage.setItem("scrollPosition", $(window).scrollTop());
    });

    // 페이지가 로드되면 저장된 스크롤 위치로 이동
    var savedScrollPosition = sessionStorage.getItem("scrollPosition");
    if (savedScrollPosition !== null) {
      $(window).scrollTop(savedScrollPosition);
      sessionStorage.removeItem("scrollPosition"); // 스크롤 위치 복원 후 제거
    }
  });
</script>
