<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>뮤지컬 수정</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src='<%=request.getContextPath()%>/resources/script/admin_modify.js'></script>
<script src='<%=request.getContextPath()%>/resources/script/admin_check.js'></script>
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/help_sytle.css">
</head>
<body>
<jsp:include page="../layout/admin_header.jsp"/>
<div class="container">
	<button type="submit" class="btn btn-warning" style="" >&lt; 이전</button>
<br>
	<button class="viewBtn" value="${searchType}" data-file="${fileName}">view</button>
	<h4>뮤지컬 수정</h4>

	
	<form role="form" action="musical_modify" method="post" onsubmit='return checkMusical()' enctype="multipart/form-data">
		<input type="hidden" name="fileName" value="${fileName}">
		<input type="hidden" name="searchType" value="${searchType}">
		<input type="hidden" name="musical_id" value="${MusicalDto.musical_id}">
		<label>
			뮤지컬 제목</label> <input type="text" name='musical_title' placeholder="제목 입력"
				style="width: 100%" value="${MusicalDto.musical_title}" required>
				
		
		<div id="datetimeContainer">
			<label>시작 날짜</label>
    <input type="date" id="musical_period_start" name="musical_period_start" required>
			
			<label>끝나는 날짜</label>
    <input type="date" id="musical_period_end" name="musical_period_end" required>
			
			</div>
		<label>
			관람시간(분)</label> <input type="text" name='musical_runningtime' placeholder="관람시간 입력"
				style="width: 100%" value="${MusicalDto.musical_runningtime}" required>
		
		
		<label>
			관람등급 <input type="text" name='musical_agelimit' placeholder="'x'세 입력"
				style="width: 100%" value="${MusicalDto.musical_agelimit}" required>
		</label>
		<label>
		  뮤지컬 포스터</label> <input type="file" name="file" accept="image/png, image/jpeg" required>
		 
		
		<button type="submit" class="signup">저장</button>

	</form>
	</div>
	<jsp:include page="../layout/footer.jsp"></jsp:include>
</body>
</html>
