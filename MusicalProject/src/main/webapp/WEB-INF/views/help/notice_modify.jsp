<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지 수정</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src='<%=request.getContextPath()%>/resources/script/help_check.js'></script>
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/help_sytle.css">

</head>
<body>
<jsp:include page="../layout/header.jsp"/>
<div class="container">
<button type="submit" class="btn btn-warning" style="" >&lt; 이전</button>
		<h4> 공지 수정</h4>
	<form role="form" method="post" onsubmit='return checkNotice()'>

		<label>제목</label> <input type="text" name='nTitle' value="${noticeDto.nTitle}" required
				style="width: 100%">
		<label>카테고리</label><select name="nGroupKind" required>
				<option value="티켓오픈" <c:out value="${noticeDto.nGroupKind eq '전체'?'selected':'' }"/>>티켓오픈</option>    		
    		<option value="스포츠" <c:out value="${noticeDto.nGroupKind eq '스포츠'?'selected':'' }"/>>스포츠</option>
    		<option value="변경/취소" <c:out value="${noticeDto.nGroupKind eq '변경/취소'?'selected':'' }"/>>변경/취소</option>
    		<option value="시스템관련" <c:out value="${noticeDto.nGroupKind eq '시스템관련'?'selected':'' }"/>>시스템관련</option>
    		<option value="기타" <c:out value="${noticeDto.nGroupKind eq '기타'?'selected':'' }"/>>기타</option>
			</select>
		
								
		<div id="datetimeContainer">
			<label>오픈 시간</label>
    <input type="datetime-local" id="nOpenTime" name="nOpenTime" required>
			</div>
		<label>내용</label>
			<textarea name="nContent" rows="18" style="width: 100%" required
				>${noticeDto.nContent}</textarea>
		
		<button type="submit" class="btn btn-primary">수정완료</button>

	</form>
		
</div>
<jsp:include page="../layout/footer.jsp"></jsp:include>
</body>
</html>