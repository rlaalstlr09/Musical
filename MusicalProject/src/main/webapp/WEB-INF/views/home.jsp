<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.net.URLDecoder" %>
<html>
<head>
	<title>Home</title>
</head>
<body>
  <jsp:include page="/layout/header.jsp" />
<h1>
	Main home  
</h1>
<a href="${pageContext.request.contextPath}/reservation/reservation">예약</a>
<a href="${pageContext.request.contextPath}/reservation/reservation_list">예약체크</a><br>
<a href="${pageContext.request.contextPath}/reservation/seat_update?mu_sch_id=1013&seat_reservation=1021">예약변경</a><br><br>
<a href="${pageContext.request.contextPath}/admin/mu_sch_admin">뮤지컬 스케줄 추가하기</a><br>
<a href="${pageContext.request.contextPath}/admin/reservation_list_admin">관리자예약체크</a>
<a href="${pageContext.request.contextPath}/admin/reservation_mu_sch_seat_admin?mu_sch_id=1">관리자 스케줄 상세 체크</a><br>
<a href="login">로그인</a>
<a href="logout">로그아웃</a>
<br>
<a href="EX">결제연습</a>





</body>
</html>