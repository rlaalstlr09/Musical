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
403 ERROR 페이지
<br> : 권한 없음
<h2>${SPRING_SECURITY_403_EXCEPTION.message }</h2>

<a href="${pageContext.request.contextPath }/customer/customer">사용자 페이지로 이동</a>

</body>
</html>