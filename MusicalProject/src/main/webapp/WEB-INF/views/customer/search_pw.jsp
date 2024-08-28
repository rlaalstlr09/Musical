<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
비밀번호 찾기
<c:if test="${not empty msg }">
	<p>${msg }</p>
</c:if>
	<form id="findForm" action="findPwCheck" method="post">
		<div>
			<input type="text" name="customer_id" id="customer_id" placeholder="아이디">
		</div>
		<div class="form-group">
			<input type="email" name="customer_email" id="customer_email" placeholder="이메일">
		</div>
		<input type="submit" id="pw-find" onclick="findSubmit(); return false;" value="비밀번호 찾기">
	</form>
</body>
</html>