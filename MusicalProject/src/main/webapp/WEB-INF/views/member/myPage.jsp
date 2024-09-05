<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,400,0,0" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/WEB-INF/resources/css/header.css">
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
	width: calc(100% - 250px);
	padding: 20px;
	background-color: #f8f8f8;
	min-height: 100vh;
}
.profile-info{
	background-color: #f8f8f8;
	color: #333;
	padding: 15px;
	margin-top: 20px;
	font-size: 1.1em;
	border: 1px solid #ddd;
	border-radius: 4px;
}
.links{
	display: flex;
	flex-wrap: wrap;
	gap: 15px;
	margin-top: 20px;
}
.links a{
	text-decoration: none;
	color: #555;
	background-color: #fff;
	padding: 12px 20px;
	border: 1px solid #ddd;
	border-radius: 4px;
	transition: background-color 0.3s ease, color 0.3s ease;
	flex: 1 1 calc(50% - 30px);
	text-align: center;
}
.links a:hover{
	background-color: #f0f0f0;
	color: #000;
}
.logout-button{
	text-align: center;
	margin-top: 30px;
}
.logout-button input[type="submit"]{
	background-color: #d9534f;
	color: #fff;
	border: none;
	padding: 10px 20px;
	font-size: 1em;
	cursor: pointer;
	border-radius: 4px;
	transition: background-color 0.3s ease;
}
.logout-button input[type="submit"]:hover{
	background-color: #c9302c;
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

		<div class="profile-info">아이디:
			${pageContext.request.userPrincipal.name }</div>

		<div class="links">
			<a href="read?customer_id=${pageContext.request.userPrincipal.name }">회원 정보</a> 
			<a href="write">1:1문의</a> 
			<a href="qa_list?customer_id=${pageContext.request.userPrincipal.name }">1:1문의내역</a> 
      		<a href="${pageContext.request.contextPath }/review/myReview">내가 쓴 리뷰</a>
			<a href="#">장바구니</a>
			<a href="remove">회원탈퇴</a>
		</div>
		<div class="logout-button">
			<form:form
				action="${pageContext.request.contextPath}/customer/logout"
				method="POST">
				<input type="submit" value="로그아웃" />
			</form:form>
		</div>

	</div>
</body>
</html>