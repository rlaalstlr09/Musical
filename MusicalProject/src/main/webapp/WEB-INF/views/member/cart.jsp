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
    background-color: #f0f0f0;
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
    background-color: #f8f8f8;
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
    padding: 10px 20px;
    background-color: #e74c3c;
    color: white;
    text-decoration: none;
    border-radius: 4px;
    transition: background-color 0.3s ease;
}
.button-group a:hover {
    background-color: #c0392b;
}
.musical-img-item {
    display: flex;
    justify-content: space-between; /* 양쪽 끝으로 정렬 */
    align-items: center;
    margin-bottom: 15px;
}
.musical-img-item img {
    width: 100px; /* 적절한 크기로 조정 */
    height: auto;
    margin-right: 10px;
}
span .musical_title{
	color: #000000;
}
.delete-icon {
    margin-left: auto; /* 아이콘을 오른쪽으로 이동 */
    cursor: pointer;
    color: #e74c3c; /* 삭제 아이콘 색상 */
    transition: color 0.3s ease;
}
.delete-icon:hover {
    color: #c0392b; /* 호버 시 색상 변경 */
}
</style>
<script>
	window.onload = function(){
		var msg = "${msg}";
		if(msg){
			alert(msg);
		}
	}
	
</script>
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
		<h2>장바구니</h2>
		<div class="profile-info">
			<c:forEach var="musical" items="${list}">
				<a href="<%=request.getContextPath()%>/musical/detail/${musical.musical_id}">
				<div class="musical-img-item">
				<img src="${pageContext.request.contextPath}/resources/img/musical/${musical.musical_poster}" alt="${musical.musical_title}">
				<span class="musical_title">${musical.musical_title }</span>
				</a>
				<a href="<%=request.getContextPath()%>/member/cartDelete?musical_id=${musical.musical_id}" class="delete-icon"><span class="material-symbols-outlined">delete</span></a>
				</div>				
				<hr>
			</c:forEach>
		</div>
	</div>
</body>
</html>