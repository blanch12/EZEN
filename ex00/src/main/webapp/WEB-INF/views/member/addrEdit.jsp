<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>배송지 수정</title>
    <!-- Google Fonts 및 Bootstrap CSS 추가 -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500&display=swap">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <!-- Daum 주소 검색 API 추가 -->
    <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

    <style>
        /* 기본 스타일 */
        body {
            font-family: 'Noto Sans KR', sans-serif;
            background-color: #fafafa;
            color: #333;
        }

        /* 컨테이너 스타일 */
        .container {
            max-width: 600px;
            margin-top: 50px;
            padding: 30px;
            background-color: #fff;
            border: 1px solid #e0e0e0;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        /* 제목 스타일 */
        h2 {
            font-weight: 500;
            font-size: 1.5rem;
            color: #333;
            margin-bottom: 30px;
            text-align: center;
        }

        /* 라벨 및 인풋 필드 스타일 */
        .form-label {
            font-weight: 500;
            color: #666;
        }

        .form-control {
            border-radius: 0;
            border: 1px solid #e0e0e0;
            background-color: #fafafa;
            color: #333;
            padding: 10px;
            transition: border-color 0.3s;
        }

        .form-control:focus {
            border-color: #333;
            outline: none;
            background-color: #fff;
        }

        /* 버튼 스타일 */
        .btn {
            font-weight: 500;
            font-size: 1rem;
            transition: background-color 0.3s;
            border-radius: 0;
            padding: 10px 20px;
        }

        .btn-black {
            background-color: #333;
            color: #fff;
            border: none;
        }

        .btn-black:hover {
            background-color: #555;
        }

        .btn-outline-black {
            background-color: transparent;
            color: #333;
            border: 1px solid #333;
        }

        .btn-outline-black:hover {
            background-color: #333;
            color: #fff;
        }

        /* 체크박스 스타일 */
        .form-check-input {
            accent-color: #333;
        }

        /* 주소 검색 버튼 스타일 */
        .input-group-append .btn {
            background-color: #333;
            color: #fff;
            border: none;
        }

        .input-group-append .btn:hover {
            background-color: #555;
        }

        /* 인풋 그룹 스타일 */
        .input-group {
            display: flex;
            align-items: center;
        }

        .input-group .form-control {
            flex: 1;
        }

        /* 삭제 버튼 컨테이너 */
        .delete-button-container {
            text-align: center;
            margin-top: 20px;
        }
    </style>

    <script>
        // 주소 검색 팝업을 여는 함수
        function openAddrPopup() {
            new daum.Postcode({
                oncomplete: function(data) {
                    document.getElementById("postalCode").value = data.zonecode;
                    document.getElementById("addr").value = data.roadAddress || data.jibunAddress;
                    document.getElementById("addrDetail").focus();
                }
            }).open();
        }

        // 전화번호 입력 시 숫자와 하이픈만 허용
        function restrictInput(input) {
		    input.value = input.value.replace(/[^0-9-]/g, ''); // 숫자와 '-' 이외의 문자는 제거
		}

        // 삭제 확인 후 폼 제출
        function confirmDelete() {
            if (confirm('정말 삭제하시겠습니까?')) {
                document.getElementById("deleteForm").submit();
            }
        }
    </script>
</head>
<body>

<div class="container">
    <h2>배송지 수정</h2>
    <form action="/member/addr/update.do" method="post">
        <!-- Hidden field to pass the address ID -->
        <input type="hidden" name="id" value="${addr.id}">
        
        <div class="form-group">
            <label for="addrName" class="form-label">배송지명 <span class="text-danger">*</span></label>
            <input type="text" id="addrName" name="addrName" class="form-control" value="${addr.addrName}" required>
        </div>

        <div class="form-group">
            <label for="recipientName" class="form-label">수령인 <span class="text-danger">*</span></label>
            <input type="text" id="recipientName" name="recipientName" class="form-control" value="${addr.recipientName}" required>
        </div>

        <div class="form-group">
		    <label for="phoneNumber" class="form-label">전화번호 <span class="text-danger">*</span></label>
		    <input type="text" id="phoneNumber" name="phoneNumber" class="form-control"
		       value="${addr.phoneNumber}" required
		       placeholder="예: 010-1234-5678"
		       oninput="restrictInput(this)">
		</div>

        <div class="form-group">
            <label for="postalCode" class="form-label">우편번호 <span class="text-danger">*</span></label>
            <div class="input-group">
                <input type="text" id="postalCode" name="postalCode" class="form-control" value="${addr.postalCode}" required readonly>
                <div class="input-group-append">
                    <button type="button" class="btn btn-black" onclick="openAddrPopup()">주소 검색</button>
                </div>
            </div>
        </div>

        <div class="form-group">
            <label for="addr" class="form-label">주소 <span class="text-danger">*</span></label>
            <input type="text" id="addr" name="addr" class="form-control" value="${addr.addr}" required readonly>
        </div>

        <div class="form-group">
            <label for="addrDetail" class="form-label">상세 주소</label>
            <input type="text" id="addrDetail" name="addrDetail" class="form-control" value="${addr.addrDetail}">
        </div>

        <div class="form-check mb-4">
            <input type="checkbox" id="isDefault" name="isDefault" value="true" class="form-check-input" <c:if test="${addr.isDefault == 'Y'}">checked</c:if>>
            <label for="isDefault" class="form-check-label">기본 주소로 설정</label>
        </div>

        <div class="d-flex justify-content-center mt-4">
		    <button type="submit" class="btn btn-black mr-2">수정</button>
		    <button type="button" class="btn btn-outline-black" onclick="confirmDelete()">삭제</button>
		    <button type="button" class="btn btn-outline-secondary ml-2" onclick="window.history.back();">취소</button>
		</div>
    </form>

    <form id="deleteForm" action="/member/addr/delete.do" method="post" style="display: none;">
        <input type="hidden" name="id" value="${addr.id}">
    </form>
</div>

<!-- Bootstrap JS 및 jQuery 추가 -->
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.bundle.min.js"></script>

</body>
</html>
