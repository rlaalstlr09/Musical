<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/admin_header.css"> 
<script>
var ContextPath= '<%=request.getContextPath()%>';

</script>
  
</head>
<body>
<header class="header-background">
    <div class="header-container">
      <div class="logo">
        <a href="${pageContext.request.contextPath }/">
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
          <sec:authorize access="isAnonymous()">
            <a href="${pageContext.request.contextPath }/customer/login">로그인</a>
          </sec:authorize>
          <sec:authorize access="isAuthenticated()">
             <form:form action="${pageContext.request.contextPath }/customer/logout" method="POST">
              	<input type="submit" class="logout_header" value="로그아웃">
             </form:form>
          </sec:authorize>
            <ul class="submenu">
            <sec:authorize access="isAnonymous()">
              <li><a href="${pageContext.request.contextPath }/customer/login">로그인</a></li>
            </sec:authorize>
              <li><a href="${pageContext.request.contextPath }/member/myPage">마이페이지</a></li>
              <sec:authorize access="isAuthenticated()">
              	<form:form action="${pageContext.request.contextPath }/customer/logout" method="POST">
              		<li>
              			<input type="submit" class="logout_header" value="로그아웃">
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
              <li><a href="${pageContext.request.contextPath }/member/qa_list?customer_id=${pageContext.request.userPrincipal.name }">1:1</a></li>
            </ul>
          </li>
          <li class="has-submenu">
          <sec:authorize access="isAnonymous()">
            <a href="${pageContext.request.contextPath }/customer/joinUs">회원가입</a>
          </sec:authorize>
          <sec:authorize access="isAuthenticated()">
          	<a href="${pageContext.request.contextPath }/member/read?customer_id=${pageContext.request.userPrincipal.name }">회원정보</a>
          </sec:authorize>
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
            <a href="${pageContext.request.contextPath }/">Home</a>
            <ul class="submenul">
            <sec:authorize access="isAnonymous()">
              <li><a href="${pageContext.request.contextPath }/customer/login">로그인</a></li>
            </sec:authorize>
            </ul>
          </li>
          <li>
            <a href="${pageContext.request.contextPath }/admin/admin">관리자페이지</a>
            <ul class="submenul">
              <li><a href="${pageContext.request.contextPath }/admin/admin_admin">관리 내역</a></li>
              <li><a href="${pageContext.request.contextPath }/admin/admin_files">팩스 문서함</a></li>
            </ul>
          </li>
          <li>
            <a href="${pageContext.request.contextPath }/admin/admin_users">회원 관리</a>
            <ul class="submenul">
              <li><a href="${pageContext.request.contextPath }/admin/qa_admin">QA 관리</a></li>
              <li><a href="${pageContext.request.contextPath}/reser_admin/reservation_list_admin">예약내역 관리</a></li>
              <li><a href="${pageContext.request.contextPath}/admin/admin_review">리뷰 관리</a></li>
            </ul>
          </li>
          <li>
            <a href="#">테이블 관리</a>
            <ul class="submenul">
              <li><a href="${pageContext.request.contextPath }/admin/admin_musical">뮤지컬/배역 관리</a></li>
              <li><a href="${pageContext.request.contextPath }/admin/admin_venue">극장/홀 관리</a></li>
              <li><a href="${pageContext.request.contextPath }/admin/admin_actor">배우정보 관리</a></li>
              <li><a href="${pageContext.request.contextPath }/reser_admin/mu_sch_admin">스케줄 추가</a></li>
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
<script src="<%=request.getContextPath()%>/resources/script/header.js"></script>
</body>
</html>
