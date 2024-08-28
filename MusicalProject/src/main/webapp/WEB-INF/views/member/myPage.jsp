<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
마이페이지<br>
CUSTOMER_ID: ${pageContext.request.userPrincipal.name }<br>

<form:form action="${pageContext.request.contextPath}/customer/logout" method="POST">
    <input type="submit" value="로그아웃" />
</form:form>

<a href="/ex/member/read?customer_id=${pageContext.request.userPrincipal.name }">회원 정보</a>
<a href="/ex/qna/write">1:1 문의하기</a>
<a href="/ex/qna/qa_list?customer_id=${pageContext.request.userPrincipal.name }">문의 내용보기</a>
<a href="remove">회원탈퇴</a>

</body>
</html>