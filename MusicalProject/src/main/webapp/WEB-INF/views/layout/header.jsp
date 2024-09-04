<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/ex/resources/css/header.css"> 
   <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  
</head>
<body>
<header class="header-background">
    <div class="header-container">
      <div class="logo">
        <a href="#">
          <img src="${pageContext.request.contextPath }/resources/img/bora_logo.png" alt="home"> </a>
      </div>

      <div class="search">
        <input type="text" placeholder="Search...">
        <button type="submit">
          <img id="default-icon" src="${pageContext.request.contextPath }/resources/img/search_logo.png" alt="Search Icon">
          <img id="scroll-icon" src="${pageContext.request.contextPath }/resources/img/search_logo_black.png" alt="Search Icon">
        </button>
      </div>

      <nav class="navigation">
        <ul>
          <li><span class="new-menu"><span class="hash"># </span> Musical</span></li>
          <li class="has-submenu">
            <a href="${pageContext.request.contextPath }/customer/login">로그인</a>
            <ul class="submenu">
              <li><a href="${pageContext.request.contextPath }/customer/login">로그인</a></li>
              <li><a href="${pageContext.request.contextPath }/member/myPage">마이페이지</a></li>
              <sec:authorize access="isAuthenticated()">
              	<form:form action="${pageContext.request.contextPath }/customer/logout" method="POST">
              		<li>
              			<input type="submit" value="로그아웃">
              		</li>
              	</form:form>
              </sec:authorize>
            </ul>
          </li>
          <li class="has-submenu">
            <a href="${pageContext.request.contextPath }/help/help_main">고객센터</a>
            <ul class="submenu">
              <li><a href="${pageContext.request.contextPath }/help/notice">공지사항</a></li>
              <li><a href="${pageContext.request.contextPath }/help/faq">FAQ</a></li>
              <li><a href="${pageContext.request.contextPath }/member/qa_list">1:1</a></li>
            </ul>
          </li>
          <li class="has-submenu">
            <a href="${pageContext.request.contextPath }/customer/joinUs">회원가입</a>
          </li>
        </ul>
      </nav>

      <input type="checkbox" id="menuicon">
      <label for="menuicon">
        <span></span>
        <span></span>
        <span></span>
      </label>

      <div class="slidebar">
        <button class="close-btn">&times;</button>
        <ul class="menu">
          <li>
            <a href="#">Home</a>
            <ul class="submenul">
              <li><a href="${pageContext.request.contextPath }/customer/login">로그인</a></li>
            </ul>
          </li>
          <li>
            <a href="${pageContext.request.contextPath }/member/myPage">마이페이지</a>
            <ul class="submenul">
              <li><a href="#">장바구니</a></li>
              <li><a href="${pageContext.request.contextPath }/member/read?customer_id=${pageContext.request.userPrincipal.name }">회원정보수정</a></li>
            </ul>
          </li>
          <li>
            <a href="#">예약</a>
            <ul class="submenul">
              <li><a href="#">예매확인</a></li>
              <li><a href="#">예매변경</a></li>
              <li><a href="#">예매취소</a></li>
            </ul>
          </li>
          <li>
            <a href="${pageContext.request.contextPath }/help/help_main">고객센터</a>
            <ul class="submenul">
              <li><a href="${pageContext.request.contextPath }/help/notice">공지사항</a></li>
              <li><a href="${pageContext.request.contextPath }/help/faq">FAQ</a></li>
              <li><a href="${pageContext.request.contextPath }/member/qa_list">1:1문의사항</a></li>
            </ul>
          </li>
          <li class="specialo"><a href="${pageContext.request.contextPath }/help/near_map">근처 공연장 보기</a></li>
            <sec:authorize access="isAuthenticated()">
          <form:form action="${pageContext.request.contextPath }/customer/logout" method="POST">
          <li class="special"><input type="submit" value="로그아웃"></li>
          </form:form>
          </sec:authorize>
        </ul>
      </div>
    </div>
  </header>
<script src="/ex/resources/script/header.js"></script>
</body>
</html>