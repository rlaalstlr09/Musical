<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HALL 수정</title>
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
		<h4>홀 수정</h4>


	<!-- /.box-header -->
	<!-- action에 경로가 없으면 현재 페이지 주소로 이동한다.-->
	<form role="form" action="hall_modify" onsubmit='return checkHall()' method="post">
	<input type="hidden" name="fileName" value="${fileName}">
		<label>홀 이름</label> <input type="text" name='hall_name' placeholder="이름 입력" value="${hall_read.hall_name}" required
				style="width: 100%">
			
		
		<label>총 좌석 수</label> <input type="text" name='hall_total_seat' placeholder="총 좌석 수입력" value="${hall_read.hall_total_seat}"
			required style="width: 100%">
		
		<button type="submit" class="signup">저장</button>

	</form>
	</div>
	<jsp:include page="../layout/footer.jsp"></jsp:include>
</body>
</html>