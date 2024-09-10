<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
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
.sidebar .mypage{
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
<body>
	<div class="sidebar">
		<a href="myPage" class="mypage">마이페이지</a>
		<a href="read" class="a">회원 정보</a>
		<a href="write" class="a">1:1문의</a>
		<a href="qa_list" class="a">1:1문의내역</a>

		<a href="myReview">내가 쓴 리뷰</a>

		<a href="#" class="a">장바구니</a>
		<a href="remove" class="a">회원탈퇴</a>
	</div>
	<div class="container">
	비밀번호 확인
    <c:if test="${not empty errorMessage}">
        <div class="alert alert-danger">
            ${errorMessage}
        </div>
  	</c:if>
	<form action="nowPwCheck" method="post">
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
	</div>
</body>
</html>