<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

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
	.container p{
		margin-right: 90%;
	}
	.container input{
		width: 90%;
		height: 2.5em;
		border: 1px solid gray;
		border-radius: 15px;
		padding: 5px;
	}
	.container select{
		width: 90%;
		height: 3em;
		border-radius: 15px;
		padding: 5px;
	}
	.container textarea{
		width: 90%;
		height: 10em;
		border-radius: 15px;
		padding: 5px;
		resize: none;
	}
	.container .btn{
		background-color: #aaa;
		color: white;
		transition: background-color 0.3s;
	}
	.container .btn:hover{
		background-color: #888;
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
<h2>1:1 문의하기</h2>
<form role="form" method="post">
<p>아이디  </p>
<input type="text" name="customer_id" value="${pageContext.request.userPrincipal.name }" readonly><br>
<p>문의 유형</p>
<select name="qa_type">
	<option value="예매/취소"> 예매/취소
	<option value="결제"> 결제
	<option value="회원"> 회원
	<option value="기타"> 기타
</select><br>
<p>문의 내용</p>
<input type="text" id="title" name="title" placeholder="제목을 입력해주세요"><br>
<span id="check"></span><br>
<textarea id="content" name="content" placeholder="문의 내용을 입력해주세요"></textarea><br>
<span id="check1"></span><br>
<input type="submit" class="btn" value="문의하기">
</form>
</div>
</body>
</html>