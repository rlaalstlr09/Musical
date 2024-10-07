<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,400,0,0" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/header.css">
</head>
<style>
body {
    margin: 0;
    font-family: Arial, sans-serif;
    display: flex;
}

.container {
	flex-grow: 1;
    margin-left: 250px;
    margin-right: 250px;
    width: calc(100% - 250px);
    padding: 20px;
    padding-top: 100px;
    min-height: 100vh;
}

.profile-info {
    background-color: #f8f8f8;
    color: #333;
    padding: 15px;
    margin-top: 20px;
    font-size: 1.1em;
    border: 1px solid #ddd;
    border-radius: 4px;
}

.links {
    display: flex;
    flex-wrap: wrap;
    gap: 15px;
    margin-top: 20px;
}

.links a {
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

.links a:hover {
    background-color: #f0f0f0;
    color: #000;
}

.qna_icon{
	width: 25px;
	height: 25px;
}
 

</style>
<body>
<jsp:include page="../layout/header.jsp"/>
	<div class="container"> 
		<div class="profile-info">아이디:
			${pageContext.request.userPrincipal.name }</div>
		<div class="links">
			<a href="read"><span class="material-symbols-outlined">id_card</span><br>회원 정보</a> 
			<a href="write"><span class="material-symbols-outlined">support_agent</span><br>1:1문의</a> 
			<a href="qa_list"><span class="material-symbols-outlined">forum</span><br>1:1문의내역</a> 
      		<a href="myReview"><span class="material-symbols-outlined">rate_review</span><br>내가 쓴 리뷰</a>
      		<a href="myQna"><img src="${pageContext.request.contextPath }/resources/img/qna.png" class="qna_icon"><br>내가 쓴 Qna</a>
			<a href="cart"><span class="material-symbols-outlined">shopping_bag</span><br>장바구니</a>
			<a href="remove"><span class="material-symbols-outlined">person_remove</span><br>회원탈퇴</a>
		</div>

	</div>
</body>
</html>