<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,400,0,0" />
</head>
<style>
body {
	font-family: Arial, sans-serif;
	margin: 0;
	padding: 0;
	background-color: #f4f4f4;
	color: #333;
}

.container {
	max-width: 800px;
	margin: 50px auto;
	padding: 20px;
	background: #ffffff;
	border-radius: 12px;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
}
.header{
	text-align: center;
	margin-bottom: 30px;
}
.header h1{
	font-size: 32px;
	font-weight: 700;
	color: #333;
}
.profile-info{
	font-size: 18px;
	font-weight: 500;
	color: #555;
	text-align: center;
	margin-bottom: 30px;
}
.links{
	display: flex;
	flex-direction: column;
	align-items: center;
	gap: 15px;
	margin-bottom: 40px;
}
.links a{
	display: block;
	width: 100%;
	max-width: 300px;
	padding: 12px;
	text-align:: center;
	text-decoration: none;
	font-size: 16px;
	color: #007BFF;
	background-color: #f9f9f9;
	border: 1px solid #ddd;
	border-radius: 8px;
	transition: background-color 0.3s, color 0.3s;
}
.links a:hover{
	background-color: #007BFF;
	color: #ffffff;
}
.logout-button{
	text-align: center;
}
.logout-button form input[type="submit"]{
	background-color: #d9534f;
	color: white;
	font-size: 16px;
	padding: 12px 20px;
	border: none;
	border-radius: 8px;
	cursor: pointer;
	transition: background-color 0.3s;
}
.logout-button form input[type="submit"]:hover{
	background-color: #c9302c;
}
</style>
<body>
	<div class="container">
		<div class="header">
			<h1>마이페이지</h1>
		</div>
		<div class="profile-info">아이디:
			${pageContext.request.userPrincipal.name }</div>

		<div class="links">
			<a
				href="/ex/member/read?customer_id=${pageContext.request.userPrincipal.name }">회원
				정보</a> <a href="/ex/member/write">1:1 문의하기</a> <a
				href="/ex/member/qa_list?customer_id=${pageContext.request.userPrincipal.name }">문의
				내용보기</a> <a href="remove">회원탈퇴</a>
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