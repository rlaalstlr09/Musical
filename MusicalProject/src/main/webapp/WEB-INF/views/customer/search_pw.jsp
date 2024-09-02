<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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

input[type="text"], input[type="email"] {
	width: 100%;
	height: 40px;
	padding: 0 10px;
	border-radius: 5px;
	border: 1px solid #ddd;
	font-size: 16px;
	box-sizing: border-box;
}

input[type="text"]:focus, input[type="email"]:focus {
	border-color: #0D72FF;
	outline: none;
	box-shadow: 0 0 5px rgba(13, 114, 255, 0.5);
}

#pw-find {
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

#pw-find:hover {
	background-color: #0056d2;
}

p {
	color: red;
	font-size: 14px;
	margin-top: 10px;
}
</style>
</head>
<body>
	<div class="container">
		<h2>비밀번호 찾기</h2>
		<c:if test="${not empty msg }">
			<p>${msg }</p>
		</c:if>
		<form id="findForm" action="findPwCheck" method="post">
			<div>
				<input type="text" name="customer_id" id="customer_id"
					placeholder="아이디">
			</div>
			<div class="form-group">
				<input type="email" name="customer_email" id="customer_email"
					placeholder="이메일">
			</div>
			<input type="submit" id="pw-find"
				onclick="findSubmit(); return false;" value="비밀번호 찾기">
		</form>
	</div>
</body>
</html>