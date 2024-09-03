<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>고객센터</title>
</head>
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/notice.css">
<body>

<jsp:include page="../layout/header.jsp"/>
<br>
<div id='wrap'>
<a href='inform'>예매도움 받기</a>
<a href='qa_admin'>1:1 상담 </a>
<a href='faq'>FAQ보기</a>
<a href='notice'>티켓소식</a>
<a href='near_map'>내주변 뮤지컬정보</a>
<a href='react'>리액트테스트(고객센터)</a>
</div>
</body>
</html>