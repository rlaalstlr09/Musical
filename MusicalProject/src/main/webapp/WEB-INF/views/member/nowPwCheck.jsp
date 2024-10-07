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
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,400,0,0" />
</head>
<style>
	body{
	margin: 0;
	font-family: Arial, sans-serif;
	background-color: #f0f0f0;
	color: #333;
	}

    .container {
        margin-left: 250px;
        padding: 40px;
        background-color: white;
        text-align: center;
        min-height: 100vh;
        box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        margin-top: 100px;
    }

    .container h2 {
        font-size: 24px;
        margin-bottom: 20px;
        left: 100px;
    }

    .container span {
        margin-bottom: 20px;
    }

    .container p {
        font-size: 16px;
        color: #888;
        margin-bottom: 30px;
    }

    .container form {
        display: inline-block;
        width: 100%;
        max-width: 400px;
        margin-top: 20px;
    }

    .container input[type="password"] {
        width: 90%;
        padding: 12px 20px;
        margin-bottom: 20px;
        border: 1px solid #ccc;
        border-radius: 4px;
        font-size: 16px;
    }

    .container .btn {
        padding: 12px 30px;
        font-size: 16px;
        border: none;
        border-radius: 4px;
        cursor: pointer;
        width: 48%;
    }

    .container .btn-cancel {
        background-color: #f2f2f2;
        color: #333;
    }

    .container .btn-cancel:hover {
        background-color: #ddd;
    }

    .container .btn-confirm {
        background-color: #e21e25;
        color: white;
    }

    .container .btn-confirm:hover {
        background-color: #c61b22;
    }
    
    .alert {
        color: red;
        font-weight: bold;
        margin-bottom: 20px;
    }
	hr{
		max-width: 450px;
		width: 100%;
	}
</style>
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
	<h2>비밀번호 인증</h2><hr>
   	<span class="material-symbols-outlined">
	lock
	</span>
    <p>정보를 안전하게 보호하기 위해<br><strong style="color: red;">비밀번호를 다시 한번 확인</strong>합니다.</p>
    <p>비밀번호가 타인에게 노출되지 않도록 항상 주의해 주세요.</p>
        <c:if test="${not empty errorMessage}">
            <div class="alert">${errorMessage}</div>
        </c:if>
        <form:form action="nowPwCheck" method="post">
            <input type="password" name="customer_pw" id="nowPw" placeholder="비밀번호를 입력하세요">
            <div style="display: flex; justify-content: space-between;">
                <button type="button" class="btn btn-cancel" onclick="history.back()">취소</button>
                <button type="submit" class="btn btn-confirm">확인</button>
            </div>
        </form:form>
	</div>
</body>
</html>