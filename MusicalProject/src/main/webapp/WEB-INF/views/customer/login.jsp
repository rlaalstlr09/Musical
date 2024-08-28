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
  		width:350px;
  		margin: 0 auto;
	}
</style>
<body>
<a href="/ex/">메인화면</a>
 <c:if test="${param.error != null}">
        <p>아이디와 비밀번호가 잘못되었습니다.</p>
    </c:if>
    <c:if test="${param.logout != null}">
        <p>로그아웃 하였습니다.</p>
</c:if>
<h3>아이디와 비밀번호를 입력해주세요.</h3>
<c:url value="/login" var="loginUrl" />
<form name="frmLogin" action="${loginUrl}" method="POST">

	<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }"/>
    <p>
        <input type="text" id="customer_id" name="customer_id" placeholder="아이디" />
    </p>
    <p>
        <input type="password" id="password" name="customer_pw" placeholder="비밀번호"/>
    </p>
    <p>
    	<input type="checkbox" name="remember-me">
    	<label for="remember-me">자동로그인</label><br>
    </p>
    <button type="submit" class="btn">로그인</button>
</form>
<br>
<a href="search_id" class="search_id">아이디 찾기</a>
<a href="search_pw" class="search_pw">비밀번호 찾기</a>
</body>
</html>
