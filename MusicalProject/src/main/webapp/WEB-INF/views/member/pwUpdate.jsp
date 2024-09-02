<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
</body>
</html>