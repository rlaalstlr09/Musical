<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FAQ 등록</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src='<%=request.getContextPath()%>/resources/script/help_check.js'></script>
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/help_sytle.css">	
</head>
<body>
<jsp:include page="../layout/header.jsp"/>
<div class="container">
<button type="submit" class="btn btn-warning" style="" >&lt; 이전</button>
		<h4>FAQ 등록</h4>
	
	<form role="form" method="post" onsubmit='return checkFaq()'>

		<label>제목</label> <input type="text" name='fTitle' required placeholder="제목 입력"
				style="width: 100%">
		
		<label>카테고리</label><select name="fGroupKind" required>
				<option value="예매/취소">예매/취소</option>
				<option value="결제">결제</option>
				<option value="회원">회원</option>
				<option value="기타">기타</option>
			</select>
		
		<label>내용</label>
			<textarea name="fContent" rows="18" style="width: 100%" required
				placeholder="내용 입력"></textarea>
		
		<button type="submit" class="signup">등록</button>

	</form>
</div>
<jsp:include page="../layout/footer.jsp"></jsp:include>
</body>
</html>