<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
User 페이지<br>
로그인 아이디: ${pageContext.request.userPrincipal.name }


<sec:authorize access="isAnonymous()">
		<p>
			<a href="<c:url value="/customer/login" />">로그인</a>
		</p>
	</sec:authorize>

	<sec:authorize access="isAuthenticated()">
		<form:form action="${pageContext.request.contextPath}/customer/logout" method="POST">
			<input type="submit" value="로그아웃" />
		</form:form>
	</sec:authorize>

	<h3>
	<a href="<c:url value="/customer/joinUs" />">회원 가입</a>
	<a href="<c:url value="/member/myPage" />">마이페이지</a> 
	<sec:authorize access="hasRole('ROLE_ADMIN')">
	<a href="<c:url value="/admin/admin" />">관리자 홈</a>
	</sec:authorize>
	</h3>
</body>
</html>