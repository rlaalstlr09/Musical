<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FAQ 수정</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src='<%=request.getContextPath()%>/resources/script/help_check.js'></script>
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/help_sytle.css">
</head>
<body>
<jsp:include page="../layout/header.jsp"/>
<div class="container">

		<button type="submit" class="btn btn-warning" style="" >&lt; 이전</button>

		<h4>FAQ 수정</h4>
	<form role="form" method="post" onsubmit='return checkFaq()'>

		<label>제목</label>
			 <input type="text" name='fTitle' value="${FaqDto.fTitle}" required
				style="width: 100%">
		<label>카테고리</label>
			<select name="fGroupKind" required>
    		<option value="예매/취소" <c:out value="${FaqDto.fGroupKind eq '예매/취소'?'selected':'' }"/>>예매/취소</option>
    		<option value="결제" <c:out value="${FaqDto.fGroupKind eq '결제'?'selected':'' }"/>>결제</option>
    		<option value="회원" <c:out value="${FaqDto.fGroupKind eq '회원'?'selected':'' }"/>>회원</option>
    		<option value="기타" <c:out value="${FaqDto.fGroupKind eq '기타'?'selected':'' }"/>>기타</option>
			</select>
		<label>내용</label>
			<textarea name="fContent" rows="18" style="width: 100%" required
				>${FaqDto.fContent}</textarea>
		
		<button type="submit" class="signup">완료</button>

	</form>
	
	</div>
	<jsp:include page="../layout/footer.jsp"></jsp:include>
</body>
</html>