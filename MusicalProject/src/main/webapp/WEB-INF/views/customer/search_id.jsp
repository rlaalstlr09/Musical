<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
body {
	font-family: 'Arial', sans-serif;
	background-color: #f5f5f5;
	display: flex;
	justify-content: center;
	align-items: center;
	min-height: 70vh;
	margin: 0;
}

.container {
	background-color: #ffffff;
	padding: 30px;
	border-radius: 10px;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
	width: 100%;
	max-width: 400px;
	text-align: center;
}

h2 {
	margin-bottom: 20px;
	font-size: 24px;
	color: #333;
}

.form-group {
	margin-bottom: 15px;
	text-align: left;
}

input[type="email"], input[type="text"], input[type="hidden"] {
	width: 100%;
	height: 40px;
	padding: 0 10px;
	border-radius: 5px;
	border: 1px solid #ddd;
	font-size: 16px;
	box-sizing: border-box;
}

input[type="email"]:focus, input[type="text"]:focus {
	border-color: #0D72FF;
	outline: none;
	box-shadow: 0 0 5px rgba(13, 114, 255, 0.5);
}

#customer_email{
	margin-bottom: 10px;
}

#send_auth{
	width: 100%;
	height: 40px;
	background-color: #0D72FF;
	border: none;
	border-radius: 5px;
	color: white;
	font-size: 16px;
	cursor: pointer;
	transition: background-color 0.3s;
	margin-top: 10px;
}

#send_auth:hover{
	background-color: #0056d2;
}

#id-find {
	width: 100%;
	height: 40px;
	background-color: #28a745;
	border: none;
	border-radius: 5px;
	color: white;
	font-size: 16px;
	cursor: pointer;
	transition: background-color 0.3s;
	margin-top: 10px;
}

#id-find:hover {
	background-color: #218838;
}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.8.1/jquery.min.js"></script>
<script>

$(document).ready(function() {
	// 이메일 인증 코드 발송 함수
	window.sendAuthCode = function() {
		var email = $("#customer_email").val();
		if (!email) {
			alert("이메일을 입력해주세요.");
			return;
		}

		// 이메일로 인증 코드 발송 요청
		$.post("sendMail.do", {
			customer_email: email
		}, function(result) {
			alert("인증 코드가 발송되었습니다.");
			$("#auth_code").prop('type', 'text'); // 숨겨진 인증 코드 필드 활성화
		}).fail(function() {
			alert("이메일 발송 오류");
		});
	}

	// 인증 코드 확인 함수
	window.checkAuthCode = function(event) {
		event.preventDefault();  // 기본 폼 제출 동작을 막음

		var authCode = $("#auth_code").val();
		if (!authCode) {
			alert("인증 코드를 입력해주세요.");
			return;
		}
		
	}
});
</script>
</head>
<body>
	<div class="container">
		<h2>아이디 찾기</h2>
		<form id="findForm" action="findIdCheck" method="post">
			<div class="form-group">
				<input type="email" name="customer_email" id="customer_email"
					placeholder="이메일">
				<input type="hidden" name="auth_code" id="auth_code"
				placeholder="인증 코드입력">
			
			</div>	
			<input type="button" id="send_auth"
					onclick="sendAuthCode();" value="인증 코드발송">	
			<input type="submit" id="id-find" value="아이디 찾기">
		</form>
	</div>
</body>
</html>