<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,400,0,0" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/myPage_sidebar.css">
<style>
body {
    margin: 0;
    font-family: Arial, sans-serif;
    background-color: #fff;
    color: #333;
}
.container {
    margin-left: 250px;
    padding: 40px;
    background-color: #fff;
    min-height: 100vh;
    box-shadow: 0 0 20px rgba(0, 0, 0, 0.05);
    margin-top: 100px;
}
.container h2 {
    font-size: 2em;
    margin-bottom: 20px;
    color: #333;
    border-bottom: 2px solid #ddd;
    padding-bottom: 10px;
}
.profile-info {
    background-color: #fff;
    color: #333;
    padding: 20px 30px;
    margin-top: 20px;
    font-size: 1.1em;
    border: 1px solid #ddd;
    border-radius: 8px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
}
.profile-info label {
    font-weight: bold;
    display: inline-block;
    width: 100px;
}
.profile-info span {
    display: inline-block;
    margin-left: 10px;
}
.profile-info hr {
    margin: 20px 0;
    border: none;
    border-top: 1px solid #ddd;
}
.button-group {
    margin-top: 20px;
    display: flex;
    gap: 10px;
}
.button-group a {
    padding: 12px 20px;
    background-color: #007BFF;
    color: white;
    text-decoration: none;
    border-radius: 5px;
    font-size: 16px;
    cursor: pointer;
    transition: background-color 0.3s ease, transform 0.2s ease;
    box-shadow: 0 4px 8px rgba(0, 123, 255, 0.2);
}

.button-group a:hover {
    background-color: #0056d2;
    transform: translateY(-2px);
}

.button-group a:active {
    background-color: #004bb5;
    transform: translateY(0);
}
div p{
	width: 100px;
	margin: 0;
}
.info{
	display: flex;
	padding-bottom: 40px;
}
</style>
</head>
<body>
	<jsp:include page="../layout/header.jsp"/>
	<div class="my_sidebar">
		<a href="read"><span class="material-symbols-outlined">id_card</span>회원 정보</a> 
		<a href="write"><span class="material-symbols-outlined">support_agent</span>1:1문의</a> 
		<a href="qa_list"><span class="material-symbols-outlined">forum</span>1:1문의내역</a> 
      	<a href="myReview"><span class="material-symbols-outlined">rate_review</span>내가 쓴 리뷰</a>
      	<a href="myQna"><img src="${pageContext.request.contextPath }/resources/img/qna.png" class="qna_icon">내가 쓴 Qna</a>
		<a href="cart"><span class="material-symbols-outlined">shopping_bag</span>장바구니</a>
		<a href="remove"><span class="material-symbols-outlined">person_remove</span>회원탈퇴</a>
	</div>
	<div class="container">
		<h2>회원 정보</h2>
		<div class="profile-info">
			<div class="info"><p>ID</p> ${customerDto.customer_id }</div><br>
			<div class="info"><p>전화번호</p> ${customerDto.customer_phone }</div><br>
			<div class="info"><p>이메일</p> ${customerDto.customer_email }</div><br>
			<div class="info"><p>주소</p>${customerDto.customer_address }</div><br>
			<div class="info"><p>생년월일</p> <fmt:formatDate pattern="yyyy년 MM월 dd일" value="${customerDto.customer_birth }" /></div><br>
			<div class="button-group">
				<a href="update?customer_birth=${customerDto.customer_birth }">수정</a>
				<a href="pwUpdate">비밀번호 변경</a>
			</div>
		</div>
	</div>
</body>
</html>
