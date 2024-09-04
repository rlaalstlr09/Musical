<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
body{
	margin: 0;
	font-family: Arial, sans-serif;
	background-color: #f0f0f0;
	color: #333;
}
.sidebar{
	width: 250px;
	background-color: #fff;
	color: #000;
	height: 100vh;
	position: fixed;
	top: 0;
	left: 0;
	padding-top: 20px;
	border-right: 1px solid #ddd;
	box-shadow: 2px 0 5px rgba(0,0,0,0.1);
}
.sidebar h2{
	text-align: center;
	margin-bottom: 30px;
	font-size: 1.5em;
	padding-bottom: 10px;
	color: #333;
}
.sidebar a{
	display: block;
	color: #555;
	text-decoration: none;
	padding: 15px 20px;
	font-size: 1em;
	transition: background-color 0.3s ease;
	border-bottom: 1px solid #eee;
}
.sidebar a:hover{
	background-color: #f7f7f7;
	color: #333;
}
.container{
	margin-left: 250px;
	width: calc(100% - 250px);
	padding: 20px;
	background-color: #f8f8f8;
	min-height: 100vh;
}
</style>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.8.1/jquery.min.js"></script>
<script>
window.onload = function() {
	$(document).ready(function() {
		function pwCheck() {
			console.log("pwCheck");
			if ($('input[name=customer_pw]').val() === $('#pw2').val()) {
				console.log("1");
				$('#pwConfirm').text('비밀번호 일치').css('color', 'green')
				return true;
			} else {
				console.log("0");
				$('#pwConfirm').text('비밀번호 불일치').css('color', 'red')
				return false;
			}
		}

		$('form').on('submit', function(event) {
			console.log('form submit');
			if (!pwCheck()) {
				console.log("not form");
				event.preventDefault();
			}
		})
	})
}
</script>
</head>
<body>
	<div class="sidebar">
		<h2>마이페이지</h2>
		<a href="/ex/member/read?customer_id=${pageContext.request.userPrincipal.name }">회원 정보</a>
		<a href="/ex/member/write">1:1문의</a>
		<a href="/ex/member/qa_list?customer_id=${pageContext.request.userPrincipal.name }">1:1문의내역</a>
		<a href="#">장바구니</a>
		<a href="remove">회원탈퇴</a>
	</div>
	<div class="container">
	<form action="/ex/member/pwUpdate" method="post">
		<input type="hidden" name="customer_id" value="${customerDto.customer_id }">
		<div>
			<label>새 비밀번호</label>
			<input type="password" name="customer_pw" id="newPw">
		</div>
		<div>
			<label>새 비밀번호 확인</label>
			<input type="password" id="pw2">
			<span id="pwConfirm"></span>
		</div>
		<input type="submit" value="변경하기">
	</form>
	</div>
</body>
</html>