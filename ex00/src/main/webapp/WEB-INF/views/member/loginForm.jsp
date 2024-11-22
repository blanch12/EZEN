<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- loginForm.jsp -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>

<script>
    // SDK 초기화 (여기에 본인의 JavaScript 키를 입력)
    Kakao.init('dadea2157d4018ddf3d6a47f7fbf5cef');

    function kakaoLogin() {
	Kakao.Auth.authorize({
	    redirectUri : 'http://localhost/member/kakao/callback' // 설정한 Redirect URI 입력
	});
    }
</script>

<style type="text/css">
.container {
	width: 100%;
	min-height: 66vh;
}

.login_wrap {
	width: 28%;
	min-width: 100%;
	display: flex;
	align-items: center;
	position: absolute;
	top: 60%;
	left: 50%;
	transform: translate(-50%, -50%);
	justify-content: center;
	z-index: 3;
	height: auto;
	min-height: 60vh;
}

.loginForm {
	width: 450px;
	height: 330px;
}

.login_bg {
	width: 450px;
	height: 350px;
	position: relative;
	margin-left: 10px;
	position: fixed;
	right: -100px;
}

.login_bg>a {
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	width: 200px;
}

.login_bg img {
	width: 100%;
	height: 100%;
	object-fit: cover;
	display: block;
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

.loginForm_btn {
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



<title>로그인 폼</title>



</head>
<body class="body" id="body">
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
							<button type="submit" class="kakao_login"
								onclick="location.href='/member/kakao/login'">카카오계정 로그인</button>
							<button type="submit" class="naver_login"
								onclick="location.href='/member/naver/login'">네이버 로그인</button>
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
							<input type="password" name="pw" id="pw"
								placeholder="password 입력" required />
						</div>

						<button type="submit" class="loginForm_btn">로그인</button>


					</form>
				</div>

				<!-- 회원가입 폼 -->
				<div id="register" class="tab-content">
					<form action="/member/write.do" method="post">
						<div class="form-group">
							<label for="id">ID</label> <input type="text" name="id" id="id"
								placeholder="ID 입력" required />
						</div>
						<div class="form-group">
							<label for="pw">Password</label> <input type="password" name="pw"
								id="pw" placeholder="password 입력" required />
						</div>
						<div class="form-group">
							<label for="email">Email</label> <input type="email" name="email"
								id="email" placeholder="이메일 입력" required />
						</div>
						<div class="form-group">
							<label for="name">Name</label> <input type="text" name="name"
								id="name" placeholder="이름 입력" required />
						</div>
						<div class="form-group">
							<label for="gender">Gender</label> <select name="gender"
								id="gender" required>
								<option value="">성별 선택</option>
								<option value="male">남성</option>
								<option value="female">여성</option>
							</select>
						</div>
						<div class="form-group">
							<label for="birth">Birthdate</label> <input type="date"
								name="birth" id="birth" required />
						</div>
						<div class="form-group">
							<label for="tel">Phone Number</label> <input type="tel"
								name="tel" id="tel" placeholder="전화번호 입력" required />
						</div>
						<button type="submit" class="register_btn">회원가입</button>
					</form>
				</div>

			</div>

		</div>

	</div>

</body>
</html>