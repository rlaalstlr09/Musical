<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지 등록</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src='<%=request.getContextPath()%>/resources/script/help_check.js'></script>
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/help_sytle.css">
</head>
<body>
<jsp:include page="../layout/header.jsp"/>
	<div class="container">
	<button type="submit" class="btn btn-warning" style="" >&lt; 이전</button>
			<h4>공지 등록</h4>
		<form role="form" method="post" onsubmit='return checkNotice()'>

			<label>제목</label>
				 <input type="text" name='nTitle' placeholder="제목 입력" required
					style="width: 100%">
			<label>카테고리</label>
				<select name="nGroupKind" required>
					<option value="티켓오픈">티켓오픈</option>
					<option value="스포츠">스포츠</option>
					<option value="변경/취소">변경/취소</option>
					<option value="시스템관련">시스템관련</option>
					<option value="기타">기타</option>
				</select>			
			
			<div id="datetimeContainer">
			<label>오픈 시간</label>
    <input type="datetime-local" id="nOpenTime" name="nOpenTime" required>
			
			</div>
			<label>내용</label>
				<textarea name="nContent" rows="18" style="width: 100%" required
					placeholder="내용 입력"></textarea>
			
			<button type="submit" class="signup">등록</button>

		</form>
	</div>
	<jsp:include page="../layout/footer.jsp"></jsp:include>
</body>
</html>