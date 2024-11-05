<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- loginForm.jsp -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 폼</title>

<style type="text/css">
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}

@font-face {
	font-family: 'Chosunilbo_myungjo';
	src:
		url('https://fastly.jsdelivr.net/gh/projectnoonnu/noonfonts_one@1.0/Chosunilbo_myungjo.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
}

body {
	font-family: 'Chosunilbo_myungjo';
	overflow-x: hidden;
}

ul, li, ol {
	list-style: none;
}

a {
	text-decoration: none;
	color: inherit;
}

.container {
	width: 100%;
	height: 100vh;
	position: relative;
}

.login_wrap {
	width: 60%;
	display: flex;
	justify-content: center;
	align-items: center;
	position: absolute;
	top: 40%;
	left: 50%;
	transform: translate(-50%, -50%);
}

.loginForm {
	width: 450px;
	height: 330px;
	margin: 0 auto;
}

.tab-buttons {
	display: flex;
	margin-bottom: 15px;
}

.tab-buttons button, .tip {
	flex: 1;
	padding: 10px;
	cursor: pointer;
	border: none;
	background-color: #fff;
	font-weight: bold;
	transition: background-color 0.3s;
}

.tab-buttons .active {
	border-bottom: 1px solid #ccc;
	color: #000;
}

.tab-content {
	display: none;
}

.tab-content.active {
	display: block;
}

.form-group {
	margin-bottom: 15px;
}

.form-group label {
	display: block;
	margin-bottom: 5px;
	font-size: 0.9em;
}

.form-group input {
	width: 100%;
	padding: 8px;
	box-sizing: border-box;
	border: 1px solid #ccc;
	border-radius: 4px;
}

select#gender {
	width: 450px;
	height: 33px;
	border: 1px solid #ccc;
}

button[type='submit'] {
	width: 100%;
	padding: 10px;
	border: none;
	border-radius: 4px;
	cursor: pointer;
}

.register_btn {
	background-color: #a48374;
	color: #fff;
}

.or {
	width: 100%;
	height: 70px;
	text-align: center;
	gap: 10px;
	display: flex;
	align-items: center;
	justify-content: center;
	flex-wrap: nowrap;
}

.line {
	width: 100%;
}

.kakao_login {
	background-color: #fee500;
}

.naver_login {
	background-color: #03c75a;
	color: #fff;
}

.login {
	background-color: #a48374;
	color: #fff;
}

.login_btn {
	display: flex;
	flex-direction: column;
	gap: 10px;
}

.login_btn button {
	gap: 10px;
}
</style>

</head>
<body>
	<div class="container">
		<div class="login_wrap">
			<div class="loginForm">
				<!-- 탭 버튼 -->
				<div class="tab-buttons">
					<button class="active" onclick="showTab('login')">로그인</button>
					<button onclick="showTab('register')">회원가입</button>
				</div>

				<!-- 로그인 폼 -->
				<div id="login" class="tab-content active">
					<form action="login.do" method="post">
						<div class="login_btn">
							<button type="submit" class="kakao_login">카카오계정 로그인</button>
							<button type="submit" class="naver_login">네이버 로그인</button>
						</div>
						<div class="or">
							<div class="line">
								<hr />
							</div>
						</div>
						<div class="form-group">
							<input type="text" name="id" id="id" placeholder="ID 입력" required />
						</div>
						<div class="form-group">
							<input type="password" name="pw" id="pw" placeholder="password 입력" required />
						</div>

						<button type="submit" class="login">로그인</button>
					</form>
				</div>

				<!-- 회원가입 폼 -->
				<div id="register" class="tab-content">
					<form action="/member/write.do" method="post">
						<div class="form-group">
							<label for="id">ID</label>
							<input type="text" name="id" id="id" placeholder="ID 입력" required />
						</div>
						<div class="form-group">
							<label for="pw">Password</label>
							<input type="password" name="pw" id="pw" placeholder="password 입력" required />
						</div>
						<div class="form-group">
							<label for="email">Email</label>
							<input type="email" name="email" id="email" placeholder="이메일 입력" required />
						</div>
						<div class="form-group">
							<label for="name">Name</label>
							<input type="text" name="name" id="name" placeholder="이름 입력" required />
						</div>
						<div class="form-group">
							<label for="gender">Gender</label>
							<select name="gender" id="gender" required>
								<option value="">성별 선택</option>
								<option value="male">남성</option>
								<option value="female">여성</option>
							</select>
						</div>
						<div class="form-group">
							<label for="birth">Birthdate</label>
							<input type="date" name="birth" id="birth" required />
						</div>
						<div class="form-group">
							<label for="tel">Phone Number</label>
							<input type="tel" name="tel" id="tel" placeholder="전화번호 입력" required />
						</div>
						<button type="submit" class="register_btn">회원가입</button>
					</form>
				</div>
			</div>
		</div>
	</div>
	<script>
		function showTab(tabId) {
			// 모든 탭 콘텐츠 숨기기
			document.querySelectorAll('.tab-content').forEach(
					function(content) {
						content.classList.remove('active');
					});

			// 모든 탭 버튼 비활성화
			document.querySelectorAll('.tab-buttons button').forEach(
					function(button) {
						button.classList.remove('active');
					});

			// 선택한 탭 콘텐츠 및 버튼 활성화
			document.getElementById(tabId).classList.add('active');
			document
					.querySelector(`.tab-buttons button[onclick="showTab('${tabId}')"]`).classList
					.add('active');
		}
	</script>
</body>
</html>