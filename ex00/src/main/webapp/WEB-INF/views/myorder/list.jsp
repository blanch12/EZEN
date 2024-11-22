<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>주문내역 조회</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        /* 기본 스타일 */
        body {
            font-family: Arial, sans-serif;
        }

        a {
            color: #333; /* 링크 기본 색상 */
            text-decoration: none; /* 링크 밑줄 제거 */
        }

        a:hover {
            color: #555; /* 호버 시 색상 */
        }

        .container {
            max-width: 1200px;
            margin: 50px auto;
        }

        .title {
		    font-size: 1.8rem;
		    font-weight: bold;
		    margin-bottom: 50px; /* 제목과 라인 사이 여백 */
		    border-bottom: 2px solid #000; /* 밑줄 */
		    padding-bottom: 25px; /* 텍스트와 밑줄 사이 간격 추가 */
		    margin-top: 20px; /* 제목 위쪽 여백 추가 */
		}

        .side-menu ul {
            list-style: none;
            padding: 0;
        }

        .side-menu ul li {
            padding: 10px 0;
        }

        .side-menu ul li a {
            color: #555;
            text-decoration: none;
            font-size: 1.1em;
        }

        .side-menu ul li a:hover {
            color: #000;
        }

        .main-content {
            padding-left: 20px;
        }

        .tabs {
        display: flex;
        border-bottom: 2px solid #000; /* 하단 라인은 그대로 유지 */
        margin-bottom: 15px;
        justify-content: flex-start; /* 버튼을 왼쪽으로 정렬 */

	    }
	
	    .tabs button {
	        flex: 0 0 auto; /* 버튼 크기를 줄이고 고정 */
	        border: none;
	        padding: 10px 20px; /* 버튼 크기를 줄이기 위한 패딩 조정 */
	        background-color: #f9f9f9;
	        font-size: 1rem;
	        cursor: pointer;
	        text-align: center;
	        transition: background-color 0.3s, color 0.3s;
	    }
	
	    .tabs button.active {
	        font-weight: bold;
	        background-color: #000;
	        color: #fff;
	    }

        .description {
            font-size: 1rem;
            color: #555;
            margin-bottom: 40px;
            margin-top: 10px;
            line-height: 2;
        }

        .filters {
            display: flex;
            justify-content: space-between;
            margin-bottom: 50px;
        }

        .filters button,
        .filters input[type="date"],
        .filters select {
            margin-right: 10px;
            padding: 5px 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        table {
        width: 100%;
        border-collapse: collapse;
        margin-top: 20px;
	    }
	
	    table th, table td {
	        padding: 10px 15px;
	        text-align: center;
	    }
	
	    table th {
	        font-weight: bold;
	        border-top: 2px solid #000; /* 상단에 선만 유지 */
	        border-bottom: 1px solid #eee; /* 얇은 줄 */
	    }
	    .no-data {
	        text-align: center;
	        color: #777;
	        padding: 20px;
	        font-size: 1rem;
	    }
    </style>
</head>
<body>
    <div class="container">
        <h1 class="title">주문내역 조회</h1>
        
        <div class="row">
            <!-- 사이드 메뉴 -->
            <div class="col-md-3 side-menu">
                <ul>
                    <li><a href="/myreview/list.do" class="active">상품 리뷰</a></li>
                    <li><a href="/myorder/list.do">주문내역</a></li>
                    <li><a href="/qna/list.do">Q&A</a></li>
                    <li><a href="/mycoupon/list.do">쿠폰</a></li>
                    <li><a href="/myrate/list.do">적립금</a></li>
                    <li><a href="/mygiftcard/list.do">상품권</a></li>
                    <li><a href="/member/addr.do">배송지 관리</a></li>
                    <li><a href="/recent/list.do">최근 본 상품</a></li>
                    <li><a href="/member/update.do">개인정보 수정</a></li>
                </ul>
            </div>

            <!-- 메인 콘텐츠 -->
            <div class="col-md-9 main-content">
                <div class="tabs">
                    <button class="active" onclick="setActiveTab(this)">주문내역 조회 (0)</button>
					<button onclick="setActiveTab(this)">취소/반품/교환내역 (0)</button>
                </div>
                <div class="description">
                    기본적으로 최근 3개월간의 자료가 조회되며, 기간 검색시 지난 주문내역을 조회하실 수 있습니다.<br>
                    주문번호를 클릭하시면 해당 주문에 대한 상세 내역을 확인하실 수 있습니다.<br>
                    배송 준비가 시작되는 "배송준비중" 단계부터는 취소가 불가능하며, 취소를 희망하실 경우 반품 신청 부탁드립니다.<br>
                    교환 진행 현황은 주문 내역 조회에서 확인 가능합니다.
                </div>
                <div class="filters">
                    <div>
                        <button>오늘</button>
                        <button>1주일</button>
                        <button>1개월</button>
                        <button>3개월</button>
                        <button>6개월</button>
                    </div>
                    <div>
                        <input type="date" value="2024-08-21">
                        <span>~</span>
                        <input type="date" value="2024-11-19">
                        <select>
                            <option>전체 주문처리상태</option>
                        </select>
                    </div>
                </div>
                <h2>주문배송 조회</h2>
                <table>
                    <thead>
                        <tr>
                            <th>주문일자(주문번호)</th>
                            <th>이미지</th>
                            <th>상품정보</th>
                            <th>수량</th>
                            <th>상품구매금액</th>
                            <th>주문처리상태</th>
                            <th>취소/교환/반품</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td colspan="7" class="no-data">주문 내역이 없습니다.</td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
<script>
    function setActiveTab(button) {
        // 모든 버튼에서 active 클래스 제거
        const buttons = document.querySelectorAll('.tabs button');
        buttons.forEach(btn => btn.classList.remove('active'));
        
        // 클릭된 버튼에 active 클래스 추가
        button.classList.add('active');
    }
</script>

    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
