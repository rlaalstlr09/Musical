<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>극장 관리</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/notice.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src='<%=request.getContextPath()%>/resources/script/admin_venue.js'></script>
<script>
var result = '${msg}';
if (result == 'success') {
	alert("처리가 완료되었습니다.");
}
</script>
</head>
<body>
<jsp:include page="../layout/admin_header.jsp"/>
	<div id="wrap">
			<div id="content">
				<div class="board_qna">
					<h1 id="qna_head">극장 관리 페이지</h1>

					<div class="search_id">
							<label for="region">지역</label>
    <select id="region">
    <option value="">전체</option>
        <option value="경기">경기</option>
        <option value="서울">서울</option>
        <option value="인천">인천</option>
        <option value="부산">부산</option>
        <option value="대구">대구</option>
        <option value="대전">대전</option>
        <option value="광주">광주</option>
        <option value="울산">울산</option>
        <option value="세종">세종</option>
        <option value="충북">충북</option>
        <option value="충남">충남</option>
        <option value="전남">전남</option>        
        <option value="전북">전북</option>
        <option value="경북">경북</option>
        <option value="경남">경남</option>
        <option value="강원">강원</option>        
        <option value="제주">제주</option>        
    </select>


					</div>

					<div id="qnaList-wrapper">
						<table cellspacing="0" border="0" class="tb_board tb_qna">
							<colgroup>
								<col width="30%">
								<col width="46%">
								<col width="8%">
								<col width="8%">
								<col width="8%">
							</colgroup>
							<thead>
								<tr class="">
									<th scope="col">이름</th>
									<th scope="col">주소</th>
									<th scope="col">홀</th>
									<th scope="col">수정</th>
									<th scope="col">삭제</th>
								</tr>
							</thead>
							<tbody>
								<%--게시글 테이블 불러오는 코드 삽입--%>
								<c:forEach items="${list }" var='boardDtos' varStatus='status'>
									<tr class="admin_table">
										<td>${boardDtos.venue_name }</td>
										<td>${boardDtos.venue_address }</td>	
										<td><button class="readBtn" value="${boardDtos.venue_id }">보기</button></td>	
										<td>
										<button class="modifyBtn" value="${boardDtos.venue_id }">수정</button></td>
										<td><button class="deleteBtn" value="${boardDtos.venue_id }">삭제</button></td>
																		
									</tr>
								</c:forEach>
							</tbody>
						</table>
						

						<!--pagination-->
						<div class="pagination">
							<c:if test="${boardVo.page !=1}">
								<a href='admin_venue${boardVo.makeSearch1(1)}'>&lt;&lt;&lt;</a>
							</c:if>
							<!-- 앞전 page 모양을 클릭하면 pageMarker.startPage에 -1을 처리해준다.-->
							<c:if test="${boardVo.prev }">
								<a href='admin_venue${boardVo.makeSearch1(boardVo.startPage-1)}'>&lt;&lt;</a>
							</c:if>
							<c:if test="${boardVo.page != 1}">
								<a href='admin_venue${boardVo.makeSearch1(boardVo.page-1)}'>&lt;</a>
							</c:if>
							<c:forEach begin="${boardVo.startPage }"
								end="${ boardVo.endPage}" var="idx">
								<a href='admin_venue${boardVo.makeSearch1(idx)}'
									<c:out value="${boardVo.page==idx?' class=active ':'' }"/>>
									${idx}</a>
							</c:forEach>
							

							<c:if test="${boardVo.page != boardVo.totalEndPage}">
								<a href='admin_venue${boardVo.makeSearch1(boardVo.page+1)}'>&gt;</a>
							</c:if>
							<c:if test="${boardVo.next }">
								<a href='admin_venue${boardVo.makeSearch1(boardVo.endPage+1)}'>&gt;&gt;</a>

							</c:if>


							<c:if test="${boardVo.page != boardVo.totalEndPage}">
								<a
									href='admin_venue${boardVo.makeSearch1(boardVo.totalEndPage)}'>&gt;&gt;&gt;</a>
							</c:if>

						</div>
						
						<div class="search_id">
							<input type="text" name="keyword" id="keywordInput" placeholder="검색어 입력"
								value="${boardVo.keyword}">
							<button id="searchBtn">검색</button>
						</div>
						<button class="newBtn">추가</button>
						
					</div>					
					
					</div>

				</div>
			
			
		

	</div>
<jsp:include page="../layout/footer.jsp"></jsp:include>
</body>
</html>