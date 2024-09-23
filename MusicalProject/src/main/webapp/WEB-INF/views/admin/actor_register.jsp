<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>배우 정보 등록</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src='<%=request.getContextPath()%>/resources/script/admin_register.js'></script>
<script src='<%=request.getContextPath()%>/resources/script/admin_check.js'></script>
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/help_sytle.css">
</head>
<body>
<jsp:include page="../layout/admin_header.jsp"/>
<div class="container">
<button type="button" class="btn btn-warning">&lt; 이전</button>
<button class="viewBtn" value="${searchType}" data-file="${fileName}">view</button>
		<h4>배우 등록</h4>	
	
	<form role="form" action='actor_register' onsubmit='return checkActor()' method="POST" enctype="multipart/form-data">
		<input type="hidden" name="fileName" value="${fileName}">
		<input type="hidden" name="searchType" value="${searchType}">
		<label>
			배우 이름</label> <input type="text" name="actor_name" placeholder="이름 입력" required>
				
		<div id="datetimeContainer">
			<label>생년월일</label>
    <input type="date"  name="birthday" required>
			
			
			</div>
		<label>키</label> 
		<input type="text" name="height" placeholder="키 입력" required>
		
		
		<label>몸무게</label> 
		<input type="text" name="weight" placeholder="몸무게 입력" required>
		
		
		<label>배우 이미지 파일 업로드</label> 
		<input type="file" name="file" accept="image/png, image/jpeg" required>
		
		<button type="submit" class="signup">저장</button>

	</form>
	
	</div>
	<jsp:include page="../layout/footer.jsp"></jsp:include>
</body>
</html>