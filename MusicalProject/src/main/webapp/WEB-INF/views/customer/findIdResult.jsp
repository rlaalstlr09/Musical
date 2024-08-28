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
<h2>회원님의 아이디를 확인해 주세요</h2>
	<div class="result-box">
		<c:choose>
			<c:when test="${empty findId }">
			<p class="inquiry">조회결과가 없습니다.</p>
			</c:when>
			<c:otherwise>
				<p>${findId.customer_id }</p>
			</c:otherwise>
		</c:choose>			
	</div>
<a href="login">로그인</a>
</body>
</html>