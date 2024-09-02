<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	body{
		text-align: center;
		margin: 0;
		padding: 0;
	}
	p{
		margin-right: 90%;
	}
	input{
		width: 90%;
		height: 2.5em;
		border: 1px solid gray;
		border-radius: 15px;
		padding: 5px;
	}
	select{
		width: 90%;
		height: 3em;
		border-radius: 15px;
		padding: 5px;
	}
	textarea{
		width: 90%;
		height: 10em;
		border-radius: 15px;
		padding: 5px;
		resize: none;
	}
	.btn{
		background-color: #aaa;
		color: white;
		transition: background-color 0.3s;
	}
	.btn:hover{
		background-color: #888;
	}
</style>
</head>
<body>
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
</body>
</html>