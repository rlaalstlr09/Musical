<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/myPage_sidebar.css">
</head>
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
<body>
	<div class="sidebar">
		<a href="${pageContext.request.contextPath }/" class="mainpage">메인 페이지</a>
		<a href="myPage" class="mypage">마이페이지</a>
		<a href="read">회원 정보</a>
		<a href="write">1:1문의</a>
		<a href="qa_list">1:1문의내역</a>

		<a href="myReview">내가 쓴 리뷰</a>

		<a href="#">장바구니</a>
		<a href="remove">회원탈퇴</a>
	</div>
	<div class="container">
	비밀번호 확인
    <c:if test="${not empty errorMessage}">
        <div class="alert alert-danger">
            ${errorMessage}
        </div>
  	</c:if>
	<form:form action="nowPwCheck" method="post">
		<input type="password" name="customer_pw" id="nowPw" placeholder="비밀번호를 입력하세요">
		<input type="submit" value="확인">
	</form:form>
	</div>
</body>
</html>