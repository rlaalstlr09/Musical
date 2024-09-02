<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="false"%>
<fmt:setLocale value="ko" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
	$(document).ready(function() {

		var formObj = $("form[role='form']");

		console.log(formObj);

		$(".btn-warning").on("click", function() {
			formObj.attr("action", "notice_modify");
			formObj.submit();
		});

		$(".btn-danger").on("click", function() {
			formObj.attr("action", "notice_remove");
			formObj.submit();
		});

		$(".btn-primary").on("click", function() {
			self.location = "notice";
		});

	});
</script>
</head>
<body>
<div class="main">

	<form role="form" method="get">
		<input type='hidden' name='nId' value="${noticeDto.nId}">
	</form>
	<h2>
		카테고리 <input type="text" name='nGroupKind' style="width: 100%"
			value="${noticeDto.nGroupKind}" readonly="readonly">
	</h2>

	</h2>
	<h1>제목</h1>
	<h2>
		<input type="text" name='nTitle' style="width: 100%"
			value="${noticeDto.nTitle}" readonly="readonly">
	</h2>
	<c:if test="${not empty noticeDto.nOpenTime}">
	오픈일 : <fmt:formatDate value="${noticeDto.nOpenTime}" pattern="yyyy.MM.dd(E) HH:mm" /><br/>
	</c:if>
등록일 : <fmt:formatDate value="${noticeDto.nWriteTime}" pattern="yyyy.MM.dd(E) HH:mm" />|
조회수 : ${noticeDto.nHit}<br/>
	<h2>
		내용
		<textarea style="width: 100%" name="nContent" rows="3"
			readonly="readonly">${noticeDto.nContent}</textarea>
	</h2>


	<!-- /.box-body -->
	<div class="box-footer">
		<!--  <sec:authorize access="hasRole('ROLE_ADMIN')"> -->
		<button type="submit" class="btn btn-warning">수정</button>
		<button type="submit" class="btn btn-danger">삭제</button>		
		<!-- </sec:authorize> -->
		<button type="submit" class="btn btn-primary">전체글보기</button>
		</form>
	</div>
</div>
</body>
</html>