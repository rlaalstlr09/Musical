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
.sidebar .a:hover{
	background-color: #f7f7f7;
	color: #333;
}
.container{
	margin-left: 250px;
	padding: 20px;
	background: linear-gradient(to right, #f8f8f8, #eaeaea);
	min-height: 100vh;
	box-shadow: 0 0 20px rgba(0,0,0,0,.1);
}
.container h2{
	font-size: 2em;
	margin-bottom: 20px;
	color: #333;
}
.profile-info{
	background-color: #f8f8f8;
	color: #333;
	padding: 30px;
	margin-top: 20px;
	font-size: 1.1em;
	border: 1px solid #ddd;
	border-radius: 8px;
	box-shadow: 0 4px 8px rgba(0,0,0,0.1);
	transition: box-shadow 0.3s ease;
}
.profile-info hr{
	margin: 20px 0;
	border: none;
	border-top: 1px solid #ddd;
}
.profile-info a{
	display: inline-block;
	margin-top: 10px;
	padding: 10px 15px;
	background-color: #ccc;
	color: #333;
	text-decoration: none;
	border-radius: 4px;
	transition: background-color 0.3s ease;
}
.profile-info a:hover{
	background-color: #aaa;
	color: #fff;
}
.button-group{
	margin-top: 20px;
	display: flex;
	gap: 15px;
}
</style>
<body>
	<div class="sidebar">
		<a href="myPage" class="mypage">마이페이지</a>
		<a href="read?customer_id=${pageContext.request.userPrincipal.name }" class="a">회원 정보</a>
		<a href="write" class="a">1:1문의</a>
		<a href="qa_list?customer_id=${pageContext.request.userPrincipal.name }" class="a">1:1문의내역</a>
		<a href="#" class="a">장바구니</a>
		<a href="remove" class="a">회원탈퇴</a>
	</div>
	<div class="container">
		<h2>회원 정보</h2>
		<div class="profile-info">
			ID: ${customerDto.customer_id }<hr><br>
			전화번호: ${customerDto.customer_phone }<hr><br>
			이메일: ${customerDto.customer_email }<hr><br>
			주소: ${customerDto.customer_address }<hr><br>
			생년월일: <fmt:formatDate pattern="yyyy년 MM월 dd일" value="${customerDto.customer_birth }" /><hr><br>
			<div class="button-group">
				<a href="update?customer_id=${customerDto.customer_id }&customer_birth=${customerDto.customer_birth }">수정</a>
				<a href="nowPwCheck?customer_id=${customerDto.customer_id }">비밀번호 변경</a>
			</div>
		</div>
	</div>
</body>
</html>
