<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/myPage_sidebar.css">
<style>
body{
	margin: 0;
	font-family: Arial, sans-serif;
	background-color: #f0f0f0;
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
		<a href="${pageContext.request.contextPath }/" class="mainpage">메인 페이지</a>
		<a href="myPage" class="mypage">마이페이지</a>
		<a href="read" class="a">회원 정보</a>
		<a href="write" class="a">1:1문의</a>
		<a href="qa_list" class="a">1:1문의내역</a>

		<a href="myReview">내가 쓴 리뷰</a>

		<a href="#" class="a">장바구니</a>
		<a href="remove" class="a">회원탈퇴</a>
	</div>
	<div class="container">
	<form action="pwUpdate" method="post">
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