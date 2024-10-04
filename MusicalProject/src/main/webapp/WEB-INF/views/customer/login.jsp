<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8" />
    <title>로그인 페이지</title>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,400,0,0" />
</head>
<style>
	body{
		font-family: 'Arial', sans-serif;
		display: flex;
		flex-direction: column;
		justify-content: center;
		align-items: center;
		background-color: #f5f5f5;
		min-height: 60vh;
		margin: 0;
	}
	.site{
		font-size: 25px;
		margin-top: 10px;
		color: #333;
		margin-bottom: 20px;
	}
	a{	
		font-size: 20px;
		color: #0D72FF;
		text-decoration: none;
		font-size: 14px;
	}
	form{
		background-color: #ffffff;
		padding: 30px;
		border-radius: 10px;
		box-shadow: 0 4px 8px rgba(0,0,0,0.1);
		width: 100%;
		max-width: 400px;
		text-align: left;
	}
	input[type="text"],input[type="password"]{
		width: 100%;
		height: 40px;
		margin-bottom: 15px;
		padding: 0 10px;
		border-radius: 5px;
		border: 1px solid #ddd;
		box-sizing: border-box;
		font-size: 16px;
	}
	input[type="text"]:focus, input[type="password"]:focus{
		border-color: #0D72FF;
		outline: none;
		box-shadow: 0 0 5px rgba(13,114,255,0.5);
	}
	.btn{
		width: 100%;
		height: 40px;
		background-color: #0D72FF;
		border: none;
		border-radius: 5px;
		color: white;
		font-size: 16px;
		cursor: pointer;
		transition: background-color 0.3s;
	}
	.btn:hover{
		background-color: #0056d2;
	}
	p{
		margin: 0;
		color: #555;
	}
	label{
		font-size: 14px;
		color: #333;
		vertical-align: middle;
	}
	input[type="checkbox"]{
		display: none;
	}
	input[type="checkbox"] + label::before{
		content: 'check_circle';
		font-family: 'Material Symbols Outlined';
		font-size: 24px;
		color: #ccc;
		vertical-align: middle;
		cursor: pointer;
		display: inline-block;
		margin-right: 5px;
	}
	input[id="remember-me"]:checked + label::before{
		color: #0D72FF;
	}
	.search_id, .search_pw, .joinUs{
		display: inline-block;
		margin-top: 10px;
		margin-right: 5px;
		margin-left: 5px;
	}
	.search_id, .search_pw{
		color: black;
	}
	.p{
		color: red;
		font-size: 15px;
		margin-bottom: 10px;
	}
	.logo img{
		width: 300px;
		height: 120px;
	}
</style>
<body>
    <c:if test="${param.logout != null}">
        <p>로그아웃 하였습니다.</p>
</c:if>
	<div class="logo">
        <a href="${pageContext.request.contextPath }/">
          <img src="${pageContext.request.contextPath }/resources/img/bora_logo_black.png" alt="home"> </a>
      </div>
<c:url value="/login" var="loginUrl" />
<form name="frmLogin" action="${loginUrl}" method="POST">

	<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }"/>
    <p>
        <input type="text" id="customer_id" name="customer_id" placeholder="아이디" />
    </p>
    <p>
        <input type="password" id="password" name="customer_pw" placeholder="비밀번호"/>
        <c:if test="${param.error != null}">
        <p class="p">아이디와 비밀번호가 잘못되었습니다.</p>
    	</c:if>
    </p>
    <p>
    	<input type="checkbox" id="remember-me" name="remember-me">
    	<label for="remember-me">로그인 상태 유지</label><br>
    </p>
    <button type="submit" class="btn">로그인</button>
</form>
<br>
<div>
<a href="search_id" class="search_id">아이디 찾기</a>
|
<a href="search_pw" class="search_pw">비밀번호 찾기</a>
|
<a href="joinUs" class="joinUs">회원가입</a>
</div>
</body>
</html>
