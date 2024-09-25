<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
	padding: 20px;
	background: linear-gradient(to right, #f8f8f8, #eaeaea);
	min-height: 100vh;
	box-shadow: 0 0 20px rgba(0,0,0,0,.1);
}
</style>
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
		<form action="delete" method="post">
			정말로 삭제하시겠습니까?
			<input type="hidden" name="customer_id" value="${pageContext.request.userPrincipal.name }">
			<input type="submit" value="확인">
		</form>
	</div>
</body>
</html>









