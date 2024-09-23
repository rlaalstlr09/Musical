<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HALL 추가</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src='<%=request.getContextPath()%>/resources/script/admin_register.js'></script>
<script src='<%=request.getContextPath()%>/resources/script/admin_check.js'></script>
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/help_sytle.css">
</head>
<body>
<jsp:include page="../layout/admin_header.jsp"/>
<div class="container">
<button type="submit" class="btn btn-warning" style="" >&lt; 이전</button>
<br>
	<button class="viewBtn" value="${searchType}" data-file="${fileName}">view</button>	
		<h4>홀 추가</h4>

	<form role="form" action="hall_register" onsubmit='return checkHall()' method="post">
	
	<input type="hidden" name="venue_id" value="${venue_id}">
	<input type="hidden" name="fileName" value="${fileName}">
		<input type="hidden" name="searchType" value="${searchType}">
		<label>
			홀 이름</label> <input type="text" name='hall_name' placeholder="이름 입력"
				style="width: 100%" required>
				
		
		<label>
			총 좌석 수</label> <input type="text" name='hall_total_seat' placeholder="총 좌석 수입력"
				style="width: 100%" required>
		
		
		<button type="submit" class="signup">저장</button>

	</form>
	</div>
	<jsp:include page="../layout/footer.jsp"></jsp:include>
</body>
</html>