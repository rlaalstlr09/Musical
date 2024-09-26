<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="false"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<fmt:setLocale value="ko" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src='<%=request.getContextPath()%>/resources/script/notice.js'></script>
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/help_sytle.css">

</head>
<body>
<jsp:include page="../layout/header.jsp"/>
<div class="container">
	<form role="form" method="get">
		<input type='hidden' name='nId' value="${noticeDto.nId}">
	</form>
	<input type="text" name='nTitle' style="width: 100%" class='read_title'
			value="${noticeDto.nTitle}" readonly="readonly">
			
	<label>${noticeDto.nGroupKind} | <fmt:formatDate value="${noticeDto.nWriteTime}" pattern="yyyy.MM.dd(E) HH:mm" />
	<c:if test="${not empty noticeDto.nOpenTime}">
	 | 오픈일 <fmt:formatDate value="${noticeDto.nOpenTime}" pattern="yyyy.MM.dd(E) HH:mm" /><br/>
	</c:if>
	</label>
<label>조회수 : ${noticeDto.nHit} </label> 
<br>
	<hr>
	<br>
		<textarea name="nContent" rows="3" class='read_board'
			readonly="readonly">${noticeDto.nContent}</textarea>
	
<hr>

	<div class="box-footer">
	<button type="submit" class="go_notice" id='go_notice'>이전</button>
		<sec:authorize access="hasAnyRole('ROLE_ADMIN','ROLE_SUPERADMIN')">
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
		<button type="submit" class="btn btn-primary">수정</button>
		<button type="submit" class="btn btn-danger">삭제</button>		
		</sec:authorize> 
		
	</div>
	
</div>
<jsp:include page="../layout/footer.jsp"></jsp:include>
</body>
</html>