<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>배송지 등록</title>
    <!-- Google Fonts 및 Bootstrap CSS 추가 -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500&display=swap">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <!-- Daum 주소 검색 API 추가 -->
    <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

    <style>
    /* 링크 기본 색상 변경 */
	    a {
	        color: #333; /* 원하는 색상으로 변경 */
	        text-decoration: none; /* 링크 밑줄 없애기 */
	    }
	    a:hover {
	        color: #555; /* 원하는 호버 색상으로 변경 */
	    }
	
	    /* 버튼 텍스트 색상 변경 */
	    .btn-primary {
	        background-color: #4e73df; /* 기본 배경색 */
	        color: white; /* 버튼 텍스트 색상 */
	    }
	    .btn-primary:hover {
	        background-color: #375a7f;
	    }
    
    
        /* 기본 스타일 설정 */
        body {
            font-family: 'Noto Sans KR', sans-serif;
            background-color: #fafafa;
            color: #333;
        }

        /* 컨테이너 스타일 */
        .container {
            max-width: 600px;
            margin-top: 50px;
            padding: 40px;
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

        /* 폼 그룹 및 레이블 스타일 */
        .form-group label {
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
        .btn-container button {
            font-weight: 500;
            font-size: 1rem;
            transition: background-color 0.3s;
            border-radius: 0;
            padding: 10px 20px;
            margin-top: 15px;
        }

        .btn-submit {
            background-color: #333;
            color: #fff;
            border: none;
        }

        .btn-submit:hover {
            background-color: #555;
        }

        .btn-cancel {
            background-color: #f1f1f1;
            color: #333;
            border: 1px solid #ccc;
        }

        .btn-cancel:hover {
            background-color: #e0e0e0;
        }

        /* 주소 검색 버튼 */
        .input-group-append .btn {
            background-color: #333;
            color: #fff;
            border: none;
        }

        .input-group-append .btn:hover {
            background-color: #555;
        }

        /* 필수 표시 스타일 */
        .required {
            color: red;
        }

        /* 체크박스 스타일 */
        .form-check-input {
            accent-color: #333;
        }
    </style>

    <script>
        // 전화번호 형식 검증 함수
        function validatePhoneNumber() {
            const phoneInput = document.getElementById("phoneNumber");
            const phonePattern = /^[0-9]{3}-[0-9]{3,4}-[0-9]{4}$/; // 전화번호 형식: 000-0000-0000
            
            if (!phonePattern.test(phoneInput.value)) {
                alert("전화번호 형식이 올바르지 않습니다. 예: 010-1234-5678");
                phoneInput.focus();
                return false;
            }
            return true;
        }
        
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
    </script>
</head>
<body>
    <div class="container" style="padding-top: 100px;">
        <h2>배송지 등록</h2>
        <form action="/member/addr/register.do" method="post" onsubmit="return validatePhoneNumber()">
            <div class="form-group">
                <label for="addrName">배송지명 <span class="required">*</span></label>
                <input type="text" id="addrName" name="addrName" class="form-control" placeholder="ex) 집, 회사..." required>
            </div>

            <div class="form-group">
                <label for="recipientName">수령인 <span class="required">*</span></label>
                <input type="text" id="recipientName" name="recipientName" class="form-control" placeholder="수령하는 사람의 이름을 적어주세요." required>
            </div>

            <div class="form-group">
                <label for="phoneNumber">연락처 <span class="required">*</span></label>
                <input type="text" id="phoneNumber" name="phoneNumber" class="form-control" placeholder="예: 010-1234-5678" required>
            </div>

            <div class="form-group">
                <label for="postalCode">우편번호 <span class="required">*</span></label>
                <div class="input-group">
                    <input type="text" id="postalCode" name="postalCode" class="form-control" placeholder="우편번호를 검색하세요" required readonly>
                    <div class="input-group-append">
                        <button type="button" class="btn btn-dark" onclick="openAddrPopup()">주소 검색</button>
                    </div>
                </div>
            </div>

            <div class="form-group">
                <label for="addr">주소 <span class="required">*</span></label>
                <input type="text" id="addr" name="addr" class="form-control" placeholder="주소 검색 버튼을 클릭하세요." required readonly>
            </div>

            <div class="form-group">
                <label for="addrDetail">상세 주소</label>
                <input type="text" id="addrDetail" name="addrDetail" class="form-control" placeholder="상세 주소를 입력하세요">
            </div>

            <div class="form-check mb-4">
                <input type="checkbox" id="isDefault" name="isDefault" value="true" class="form-check-input">
                <label for="isDefault" class="form-check-label">기본 주소로 설정</label>
            </div>

            <div class="btn-container d-flex justify-content-between">
                <button type="button" class="btn btn-cancel" onclick="window.location.href='http://localhost/member/addr.do'">취소</button>
                <button type="submit" class="btn btn-submit">등록</button>
            </div>
        </form>
    </div>
</body>
</html>
