<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src='<%=request.getContextPath()%>/resources/script/help_check.js'></script>
</head>
<body>
<div class="main">
	<div class="box-header">
		<h1 class="box-title">
			 글 수정하기
			</h3>
	</div>
	<!-- /.box-header -->
	<!-- action에 경로가 없으면 현재 페이지 주소로 이동한다.-->
	<form role="form" method="post" onsubmit='return checkFaq()'>

		<h3>
			제목 <input type="text" name='fTitle' value="${FaqDto.fTitle}"
				style="width: 100%">
		</h3>
		<h2>
			카테고리<select name="fGroupKind">
				<option value="전체" <c:out value="${FaqDto.fGroupKind eq '전체'?'selected':'' }"/>>전체</option>
    		<!-- <option value="n" selected>----</option>
    		<option value="n">----</option> -->
    		<option value="예매/취소" <c:out value="${FaqDto.fGroupKind eq '예매/취소'?'selected':'' }"/>>예매/취소</option>
    		<option value="결제" <c:out value="${FaqDto.fGroupKind eq '결제'?'selected':'' }"/>>결제</option>
    		<option value="회원" <c:out value="${FaqDto.fGroupKind eq '회원'?'selected':'' }"/>>회원</option>
    		<option value="기타" <c:out value="${FaqDto.fGroupKind eq '기타'?'selected':'' }"/>>기타</option>
			</select>
		</h2>
		<h2>
			내용
			<textarea name="fContent" rows="8" style="width: 100%"
				>${FaqDto.fContent}</textarea>
		</h2>
		<!-- /.box-body -->
		<button type="submit" class="btn btn-primary">수정하기</button>

	</form>
	<div class="box-footer">
		<button type="submit" class="btn btn-primary">저장</button>
		<button type="submit" class="btn btn-warning">취소</button>
	</div>
</body>
</html>