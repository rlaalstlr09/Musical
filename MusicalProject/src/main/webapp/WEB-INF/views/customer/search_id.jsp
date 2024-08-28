<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
아이디 찾기
	<form id="findForm" action="findIdCheck" method="post">
		<div class="form-group">
			<input type="email" name="customer_email" id="customer_email" placeholder="이메일">
		</div>
		<input type="submit" id="id-find" onclick="findSubmit(); return false;" value="아이디 찾기">
	</form>
</body>
</html>