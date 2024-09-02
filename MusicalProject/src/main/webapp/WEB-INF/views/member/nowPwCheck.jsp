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
비밀번호 확인
    <c:if test="${not empty errorMessage}">
        <div class="alert alert-danger">
            ${errorMessage}
        </div>
  	</c:if>
	<form action="/ex/member/nowPwCheck" method="post">
		<div>
			<label>아이디</label>
			<input type="text" name="customer_id"
				value="${customerDto.customer_id }" readonly>
		</div>
		<div>
			<label>현재 비밀번호</label> <input type="password" name="customer_pw"
				id="nowPw">
		</div>
		<input type="submit" value="확인">
	</form>
</body>
</html>