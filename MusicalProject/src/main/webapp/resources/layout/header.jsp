<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/header.css"> 
   <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  
</head>
<body>
<header class="header-background">
    <div class="header-container">
      <div class="logo">
        <a href="#">
          <img src="<%=request.getContextPath()%>/resources/img/bora_logo.png" alt="home"> </a>
      </div>

      <div class="search">
        <input type="text" placeholder="Search...">
        <button type="submit">
          <img id="default-icon" src="<%=request.getContextPath()%>/resources/img/search_logo.png" alt="Search Icon">
          <img id="scroll-icon" src="<%=request.getContextPath()%>/resources/img/search_logo_black.png" alt="Search Icon">
        </button>
      </div>

      <nav class="navigation">
        <ul>
          <li><span class="new-menu"><span class="hash"># </span> Musical</span></li>
          <li class="has-submenu">
            <a href="#">로그인</a>
            <ul class="submenu">
              <li><a href="#">로그인</a></li>
              <li><a href="#">마이페이지</a></li>
              <li><a href="#">로그아웃</a></li>
            </ul>
          </li>
          <li class="has-submenu">
            <a href="#">고객센터</a>
            <ul class="submenu">
              <li><a href="help/notice">공지사항</a></li>
              <li><a href="help/faq">F&Q</a></li>
              <li><a href="#">1:1</a></li>
            </ul>
          </li>
          <li class="has-submenu">
            <a href="#">회원가입</a>
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
              <li><a href="#">로그인</a></li>
            </ul>
          </li>
          <li>
            <a href="#">마이페이지</a>
            <ul class="submenul">
              <li><a href="#">장바구니</a></li>
              <li><a href="#">회원정보수정</a></li>
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
            <a href="#">고객센터</a>
            <ul class="submenul">
              <li><a href="help/notice">공지사항</a></li>
              <li><a href="help/faq">F&Q</a></li>
              <li><a href="#">1:1문의사항</a></li>
            </ul>
          </li>
          <li class="specialo"><a href="#">공연장 바로가기</a></li>
          <li class="special"><a href="#">로그아웃</a></li>
        </ul>
      </div>
    </div>
  </header>
<script src="<%=request.getContextPath()%>/resources/script/header.js"></script>
</body>
</html>