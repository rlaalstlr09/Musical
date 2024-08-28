<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
	input{
		border: 0;
	}
</style>
<body>
	<a href="myPage">마이페이지</a>
	<h2>회원 정보</h2>
	ID: ${customerDto.customer_id }<hr><br>
	전화번호: ${customerDto.customer_phone }<hr><br>
	이메일: ${customerDto.customer_email }<hr><br>
	주소: ${customerDto.customer_address }<hr><br>
	생년월일: <fmt:formatDate pattern="yyyy년 MM월 dd일" value="${customerDto.customer_birth }" /><hr><br>
	<a href="/ex/member/update?customer_id=${customerDto.customer_id }&customer_birth=${customerDto.customer_birth }">수정</a>
	<a href="/ex/member/nowPwCheck?customer_id=${customerDto.customer_id }">비밀번호 변경</a>
</body>
</html>









