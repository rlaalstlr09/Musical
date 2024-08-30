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
			새 글쓰기
			</h3>
	</div>
	<!-- /.box-header -->
	<!-- action에 경로가 없으면 현재 페이지 주소로 이동한다.-->
	<form role="form" method="post" onsubmit='return checkFaq()'>

		<h3>
			제목 <input type="text" name='fTitle' placeholder="제목 입력"
				style="width: 100%">
		</h3>
		<h2>
			카테고리<select name="fGroupKind">
				<option value="예매/취소">예매/취소</option>
				<option value="결제">결제</option>
				<option value="회원">회원</option>
				<option value="기타">기타</option>
			</select>
		</h2>
		<h2>
			내용
			<textarea name="fContent" rows="8" style="width: 100%"
				placeholder="내용 입력"></textarea>
		</h2>
		<!-- /.box-body -->
		<button type="submit" class="btn btn-primary">글쓰기</button>

	</form>
</body>
</html>