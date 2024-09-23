<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰 관리</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/notice.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src='<%=request.getContextPath()%>/resources/script/admin_review.js'></script>
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
		<div id="contents">
			<div id="content">
				<div class="board_qna">
					<h1 id="qna_head">리뷰 관리 페이지</h1>

					<div class="search_faq">
						<select name="searchM_id">
							<option value="전체" <c:out value="${boardVo.nGroupKind eq '전체'?'selected':'' }"/>>아이디</option>
							<c:forEach items="${Cidlist}" var="customer_id">
								<option value="${customer_id}"
									<c:out value="${boardVo.nGroupKind eq '${customer_id}'?'selected':'' }"/>>${customer_id}</option>
							</c:forEach>
						</select> 
						<select name="searchC_id">
    <option value="전체" ${boardVo.searchType eq '전체' ? 'selected' : ''}>뮤지컬</option>
    <c:forEach items="${Midlist}" var="musical_title">
        <option value="${musical_title}" <c:out value="${boardVo.searchType eq '${musical_title}' ? 'selected' : ''}"/>>${musical_title}</option>
    </c:forEach>
</select>

					</div>

					<div id="qnaList-wrapper">
						<table cellspacing="0" border="0" class="tb_board tb_qna">
							<colgroup>
								<col width="10%">
								<col width="15%">
								<col width="10%">
								<col width="50%">
								<col width="7%">
								<col width="8%">
							</colgroup>
							<thead>
								<tr class="">
									<th scope="col">아이디</th>
									<th scope="col">뮤지컬</th>
									<th scope="col">등록일</th>
									<th scope="col">내용</th>
									<th scope="col">평점</th>
									<th scope="col">삭제</th>
								</tr>
							</thead>
							<tbody>
								<%--게시글 테이블 불러오는 코드 삽입--%>
								<c:forEach items="${list }" var='boardDtos' varStatus='status'>
									<tr class="admin_table">
										<td>${boardDtos.customer_id }</td>
										<td>${boardDtos.musical_title }</td>
										<td>
<fmt:formatDate value="${boardDtos.review_date}" pattern="yy.MM.dd(E) HH:mm:ss" />
										</td>
										<td>${boardDtos.content }</td>
										<td>${boardDtos.rating }</td>
										<td><button class="deleteBtn"
												value="${boardDtos.review_id }">삭제</button></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
						

						<!--pagination-->
						<div class="pagination">
							<c:if test="${boardVo.page !=1}">
								<a href='admin_review${boardVo.makeSearch1(1)}'>&lt;&lt;&lt;</a>
							</c:if>
							<!-- 앞전 page 모양을 클릭하면 pageMarker.startPage에 -1을 처리해준다.-->
							<c:if test="${boardVo.prev }">
								<a href='admin_review${boardVo.makeSearch1(boardVo.startPage-1)}'>&lt;&lt;</a>
							</c:if>
							<c:if test="${boardVo.page != 1}">
								<a href='admin_review${boardVo.makeSearch1(boardVo.page-1)}'>&lt;</a>
							</c:if>
							<c:forEach begin="${boardVo.startPage }"
								end="${ boardVo.endPage}" var="idx">
								<a href='admin_review${boardVo.makeSearch1(idx)}'
									<c:out value="${boardVo.page==idx?' class=active ':'' }"/>>
									${idx}</a>
							</c:forEach>
							

							<c:if test="${boardVo.page != boardVo.totalEndPage}">
								<a href='admin_review${boardVo.makeSearch1(boardVo.page+1)}'>&gt;</a>
							</c:if>
							<c:if test="${boardVo.next }">
								<a href='admin_review${boardVo.makeSearch1(boardVo.endPage+1)}'>&gt;&gt;</a>

							</c:if>


							<c:if test="${boardVo.page != boardVo.totalEndPage}">
								<a
									href='admin_review${boardVo.makeSearch1(boardVo.totalEndPage)}'>&gt;&gt;&gt;</a>
							</c:if>

						</div>
						
						<div class="search_id">
							<input type="text" name="keyword" id="keywordInput" placeholder="검색어 입력"
								value="${boardVo.keyword}">
							<button id="searchBtn">검색</button>
						</div>
						
					</div>


				</div>

			</div>

		</div>

	</div>
<jsp:include page="../layout/footer.jsp"></jsp:include>
</body>
</html>