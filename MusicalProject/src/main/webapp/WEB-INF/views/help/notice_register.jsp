<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
				새 공지 글쓰기
				</h3>
		</div>
		<!-- /.box-header -->
		<!-- action에 경로가 없으면 현재 페이지 주소로 이동한다.-->
		<form role="form" method="post" onsubmit='return checkNotice()'>

			<h3>
				제목 <input type="text" name='nTitle' placeholder="제목 입력"
					style="width: 100%">
			</h3>
			<h2>
				카테고리<select name="nGroupKind">
					<option value="티켓오픈">티켓오픈</option>
					<option value="스포츠">스포츠</option>
					<option value="변경/취소">변경/취소</option>
					<option value="시스템관련">시스템관련</option>
					<option value="기타">기타</option>
				</select>
			</h2>
			
			<div id="datetimeContainer">
			<h2>오픈 시간
    <input type="datetime-local" id="nOpenTime" name="nOpenTime">
			</h2>
			</div>
			<h2>
				내용
				<textarea name="nContent" rows="8" style="width: 100%"
					placeholder="내용 입력"></textarea>
			</h2>
			
			<!-- /.box-body -->
			<button type="submit" class="btn btn-primary">글쓰기</button>

		</form>
	</div>
</body>
</html>