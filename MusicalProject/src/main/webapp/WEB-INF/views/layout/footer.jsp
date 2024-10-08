<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/ex/resources/css/footer.css"> 
</head>
<body>
<footer>
      <nav class="footer-nav">
        <a href='#' target='_blank'>회사소개</a> |
        <a href='#' target='_blank'>개인정보 처리방침</a>|
        <a href='#' target='_blank'>이용약관</a> |
        <a href='#' target='_blank'>청소년보호정책</a>|
        <a href='#' target='_blank'>티켓이용안내</a>|  
        <sec:authorize access="hasAnyRole('ROLE_ADMIN','ROLE_SUPERADMIN')">
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>      
        <a href='<%=request.getContextPath()%>/admin/admin_main' target='_blank'>ADMIN</a>|
        </sec:authorize>
      </nav>
       <div class="footer-left">
      <p>
        <span>대표이사 더조은</span><br />
        <span>인천 부평구 부평동 534-48 705호​</span><br />
        <span>사업자등록번호 : 665-86-000000 통신판매업신고 : 제 2024-부평-0000호</span><br />
        <span>​티켓베이는 통신판매 중개자이며, 통신판매의 당사자가 아닙니다.</span><br />
        <span>따라서 티켓보라는 상품 거래정보 및 거래에 대하여 책임을 지지 않습니다.<br></span><br>
        <span>E-mail:help@ticketbora.co.kr</span>
        <span>Fax:032-000-00000</span>
        <span>제휴문의:partner@ticketbora.co.kr</span><br>
        <span>Copyright 2024. cocoder. All Rights Reserved.</span>
      </p>
    </div>

      <div class="contact-info">
        <p><span class="title">고객센터</span></p>
        <p><span class="phone">전화: 1644-0000</span></p><br>
        <p><span class="hours">운영시간: 09:00 ~ 18:00<br> (평일/주말/공휴일)</span></p>
        <p><span class="hours">점심시간: 12:00 ~ 13:00</span></p>
</body>
</html>