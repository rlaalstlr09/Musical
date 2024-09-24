<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>배우 정보 수정</title>
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
		<h4>배우 수정</h4>	
	
	<!-- /.box-header -->
	<form role="form" action="actor_modify" onsubmit='return checkActor()' method="post" enctype="multipart/form-data">
	 <input type="hidden" name="actor_id"  value="${actorDto.actor_id}">
		<label>
			배우 이름 </label><input type="text" name="actor_name" placeholder="이름 입력" value="${actorDto.actor_name}" required>
				
		<div id="datetimeContainer">
			<label>생년월일</label>
    <input type="date"  name="birthday" value="${actorDto.birthday}" required>
			
			</div>
		<label>
			키 </label><input type="text" name="height" placeholder="키 입력" value="${actorDto.height}" required>
		
		
		<label>
			몸무게</label> <input type="text" name="weight" placeholder="몸무게 입력" value="${actorDto.weight}" required>
		
		<label>
		배우 이미지 파일 업로드</label> <input type="file" name="file" accept="image/png, image/jpeg" required>
		
		<button type="submit" class="signup">저장</button>

	</form>
	
	</div>
	<jsp:include page="../layout/footer.jsp"></jsp:include>
</body>
</html>