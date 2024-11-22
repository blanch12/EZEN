<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>상품권</title>
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

        .summary-box {
            display: flex;
            justify-content: space-between;
            align-items: center;
            border: 1px solid #ddd;
            padding: 20px 40px;
            border-radius: 8px;
            background-color: #fff;
            max-width: 800px;
            margin-bottom: 50px;
            height: 120px; /* 원하는 세로 크기 지정 */
        }

        .summary-box > div {
            flex: 1;
            text-align: center;
            position: relative;
        }

        .summary-box > div:not(:last-child)::after {
            content: "";
            position: absolute;
            top: 20%;
            right: 0;
            bottom: 20%;
            width: 1px;
            background-color: #ddd;
        }

        .summary-box span {
            margin-right: 5px; /* 항목 간 간격 */
        }

        .summary-box .label {
            font-size: 2.2rem;
            font-weight: bold;
            color: #333;
            text-align: left; /* 왼쪽 정렬 */
    		margin-left: -90px; /* 왼쪽으로 약간 이동 */
        }

        .summary-box .value {
            font-size: 2.4rem;
            font-weight: bold;
            color: #d35d1f; /* 주황색 */
        }

        .summary-box .count {
		    font-size: 1.2rem;
		    color: #888; /* 회색 */
		    position: absolute;
		    right: 10px; /* 오른쪽으로 이동 */
		    top: 50%; /* 세로 가운데 위치 */
		    transform: translateY(-50%); /* 가운데 정렬 보정 */
		    text-align: right; /* 텍스트 오른쪽 정렬 */
		}


        .register-box {
            margin-bottom: 50px;
        }
		.register-box h5 {
		    font-size: 1.8rem; /* 글씨 크기 */
		    font-weight: bold; /* 굵게 */
		    color: #333; /* 글씨 색상 */
		    margin-bottom: 10px; /* 아래쪽 간격 */
		}
		
		.register-box p {
		    font-size: 1.1rem; /* 설명 글씨 크기 */
		    line-height: 1.5; /* 줄 간격 */
		    color: #555; /* 글씨 색상 */
		}

        .register-box input {
            width: 300px;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
            margin-right: 10px;
        }

        .register-box button {
            padding: 10px 20px;
            background-color: #000;
            color: #fff;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        .register-box button:hover {
            background-color: #444;
        }

         .nav-tabs {
            display: flex;
            justify-content: flex-start;
            border-bottom: 3px solid #000; /* 버튼 아래 굵은 선 */
            margin-bottom: 0;
            padding-bottom: 0;
        }

        .nav-tabs .nav-item {
            flex: none; /* 각 버튼 크기를 고정 */
        }

        .nav-tabs .nav-link {
            text-align: center;
            padding: 10px 25px;
            border: none;
            background-color: #f9f9f9;
            color: #555;
            font-size: 1.2rem;
            font-weight: bold;
        }

        .nav-tabs .nav-link.active {
            background-color: #000;
            color: #fff;
            border-bottom: 3px solid #000; /* 활성화된 탭 굵은 선 */
        }

        .content {
            margin-top: 0;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 0;
        }

        table th, table td {
            text-align: center;
            padding: 10px;
            border: 1px solid #ddd;
        }

        .no-data {
            text-align: center;
            padding: 20px;
            font-size: 1.1rem;
            color: #999;
        }

        .info-box {
            margin-top: 20px;
            font-size: 0.9rem;
            color: #777;
        }
        .info-details {
        max-height: 0;
        overflow: hidden;
        transition: max-height 0.5s ease, padding 0.5s ease;
        padding-left: 0;
        font-size: 1.1rem; /* 글씨 크기 */
	    line-height: 1.8; /* 줄 간격 */
	    color: #555; /* 글씨 색상 */
	    }
	    .info-details.open {
	        max-height: 500px; /* 내용이 모두 보일 수 있는 적절한 값으로 설정 */
	        padding-left: 20px; /* 열릴 때 padding 추가 */
	    }
	    .info-title {
		    cursor: pointer; /* 마우스를 올리면 손가락 모양으로 변경 */
		    display: inline-block;
		    font-size: 1.6rem; /* 글씨 크기 */
		    font-weight: bold; /* 굵게 */
		    color: #333; /* 글씨 색상 */
		    text-shadow: 1px 1px 2px rgba(0, 0, 0, 0.1); /* 약간의 그림자 추가 */
		    font-family: "Arial", sans-serif; /* 원하는 폰트로 설정 */
		}
	    
    </style>
</head>
<body>
    <div class="container" style="padding-top: 100px;">
        <h1 class="title">상품권</h1>
        
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
                <!-- 상품권 요약 -->
                <div class="summary-box">
        <div>
            <span class="label">상품권 잔액</span>
            <span class="value">0원</span>
            <span class="count">총 0장</span>
        </div>
        <div>
            <span class="label">만료예정</span>
            <span class="value">0원</span>
            <span class="count">총 0장</span>
        </div>
    </div>



                <!-- 상품권 등록 -->
                <div class="register-box">
                    <h5>상품권 등록하기</h5>
                    <p>선물 받으신 상품권 16자리를 입력하여 등록하세요<br>등록한 상품권만 사용할 수 있습니다</p>
                    <div>
                        <input type="text" placeholder="상품권 번호 (숫자만 입력)">
                        <button>등록</button>
                    </div>
                </div>

                <!-- 상품권 상태 -->
                <ul class="nav nav-tabs">
            <li class="nav-item">
                <a class="nav-link active" href="#" onclick="showContent('available', event)">사용 가능</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#" onclick="showContent('unavailable', event)">사용 불가</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#" onclick="showContent('history', event)">상품권 내역</a>
            </li>
        </ul>

        <div class="content" id="available">
            <table>
                <thead>
                    <tr>
                        <th>등록일자</th>
                        <th>상품권명</th>
                        <th>유효기간</th>
                        <th>잔액</th>
                        <th>선물보내기</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td colspan="5" class="no-data">사용 가능한 상품권이 없습니다.</td>
                    </tr>
                </tbody>
            </table>
        </div>

        <div class="content" id="unavailable" style="display: none;">
            <table>
                <thead>
                    <tr>
                        <th>등록일자</th>
                        <th>상품권명</th>
                        <th>유효기간</th>
                        <th>잔액</th>
                        <th>상태</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td colspan="5" class="no-data">사용 불가능한 상품권이 없습니다.</td>
                    </tr>
                </tbody>
            </table>
        </div>

        <div class="content" id="history" style="display: none;">
            <table>
                <thead>
                    <tr>
                        <th>일자</th>
                        <th>처리상태</th>
                        <th>사용 주문번호</th>
                        <th>상품권번호</th>
                        <th>금액</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td colspan="5" class="no-data">사용 내역이 없습니다.</td>
                    </tr>
                </tbody>
            </table>
        </div>

                <!-- 상품권 안내 -->
                <div class="info-box">
				    <h5 class="info-title" onclick="toggleInfo()">상품권 안내 <span id="toggle-icon" style="float: right;">&#9660;</span></h5>
				    <ul id="info-details" class="info-details">
				        <li>이 상품권은 레브 공식 온라인몰에서만 사용하실 수 있습니다.</li>
				        <li>등록한 상품권 액면가의 60% 이상 사용한 경우 현금으로 그 잔액을 돌려받을 수 있습니다.</li>
				        <li>이 상품권의 도난, 분실, 훼손 시 당사는 일체의 책임을 지지 않습니다.</li>
				        <li>이 상품권은 카드 대금 납부 및 순금 구입에는 사용하실 수 없습니다.</li>
				        <li>이 상품권은 별도의 지급보증 및 피해보상보험 없이 안다르의 신용으로 발행되었습니다.</li>
				        <li>이 상품권은 구매 시 세금계산서 및 소득공제용 현금영수증이 발행되지 않습니다.</li>
				    </ul>
				</div>
            </div>
        </div>
    </div>

    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script>
        function showContent(id, event) {
            event.preventDefault();
            const contents = document.querySelectorAll('.content');
            contents.forEach((content) => content.style.display = 'none');

            document.getElementById(id).style.display = 'block';

            const tabs = document.querySelectorAll('.nav-link');
            tabs.forEach((tab) => tab.classList.remove('active'));

            event.target.classList.add('active');
        }
        function toggleInfo() {
            const details = document.getElementById('info-details');
            const icon = document.getElementById('toggle-icon');
            if (details.classList.contains('open')) {
                details.classList.remove('open');
                icon.innerHTML = '&#9660;'; // 아래 화살표
            } else {
                details.classList.add('open');
                icon.innerHTML = '&#9650;'; // 위 화살표
            }
        }
    </script>
</body>
</html>
