<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<fmt:setLocale value="ko" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/notice.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="<%=request.getContextPath()%>/resources/script/notice.js"></script>
<script>
var result = '${msg}';
if (result == 'success') {
	alert("처리가 완료되었습니다.");
}
</script>
</head>
<body>
<jsp:include page="../layout/header.jsp"/>
	<div id="wrap">
		<div id="contents">
			<div id="content">

				<div class="board_qna">
					<h1 id="qna_head">공지사항</h1>


					<div class="cs_board">
						<ul class="list_board_sort">
							<li class="_cat02" data-cat="02"><a href="notice"
								class="link_tab _faqCategory">전체</a></li>
							<li class="_cat06" data-cat="06"><a
								href="notice?nGroupKind=티켓오픈" class="link_tab _faqCategory">티켓오픈</a></li>
							<li class="_cat01" data-cat="01"><a
								href="notice?nGroupKind=스포츠" class="link_tab _faqCategory">스포츠</a></li>
							<li class="_cat09" data-cat="09"><a
								href="notice?nGroupKind=변경/취소" class="link_tab _faqCategory">변경/취소</a></li>
							<li class="_cat10" data-cat="10"><a
								href="notice?nGroupKind=시스템관련" class="link_tab _faqCategory">시스템관련</a></li>
							<li class="_cat10" data-cat="10"><a
								href="notice?nGroupKind=기타" class="link_tab _faqCategory">기타</a></li>
						</ul>
					</div>

					<div id="qnaList-wrapper">
						<table border="0" class="tb_board tb_qna">
							<colgroup>
								<col width="15%">
								<col width="63%">
								<col width="15%">
								<col width="7%">
							</colgroup>
							<thead>
								<tr class="">
									<th scope="col">카테고리</th>
									<th scope="col">제목</th>
									<th scope="col">오픈/등록일</th>
									<th scope="col">조회수</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${list }" var='boardDtos' varStatus='status'>
									<tr class="item">
										<td>${boardDtos.nGroupKind }</td>
										<td><a href="notice_read?nId=${boardDtos.nId}">${boardDtos.nTitle }</a></td>

										<td><c:if test="${not empty boardDtos.nOpenTime}">
오픈 : <fmt:formatDate value="${boardDtos.nOpenTime}" pattern="yyyy.MM.dd(E) HH:mm" />
												<br />
											</c:if> <c:if test="${empty boardDtos.nOpenTime}">
${boardDtos.formattedNWriteTime}
</c:if></td>
										<td>${boardDtos.nHit }</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>

						<!--pagination-->
						<div class="pagination">
							<c:if test="${boardVo.page !=1}">
								<a href='notice${boardVo.makeSearch1(1)}'>&lt;&lt;&lt;</a>
							</c:if>
							<c:if test="${boardVo.prev }">
								<a href='notice${boardVo.makeSearch1(boardVo.startPage-1)}'>&lt;&lt;</a>
							</c:if>
							<c:if test="${boardVo.page != 1}">
								<a href='notice${boardVo.makeSearch1(boardVo.page-1)}'>&lt;</a>
							</c:if>
							<c:forEach begin="${boardVo.startPage }"
								end="${ boardVo.endPage}" var="idx">
								<a href='notice${boardVo.makeSearch1(idx)}'
									<c:out value="${boardVo.page==idx?' class=active ':'' }"/>>
									${idx}</a>
							</c:forEach>
							<c:if test="${boardVo.page != boardVo.totalEndPage}">
								<a href='notice${boardVo.makeSearch1(boardVo.page+1)}'>&gt;</a>
							</c:if>
							<c:if test="${boardVo.next }">
								<a href='notice${boardVo.makeSearch1(boardVo.endPage+1)}'>&gt;&gt;</a>
							</c:if>
							<c:if test="${boardVo.page != boardVo.totalEndPage}">
								<a href='notice${boardVo.makeSearch1(boardVo.totalEndPage)}'>&gt;&gt;&gt;</a>
							</c:if>
						</div>
						
						<div class="search_faq">
							<select name="searchType">
								<option value="제목"
									<c:out value="${boardVo.searchType eq '제목'?'selected':'' }"/>>제목</option>
								<option value="내용"
									<c:out value="${boardVo.searchType eq '내용'?'selected':'' }"/>>내용</option>
								<option value="제목내용"
									<c:out value="${boardVo.searchType eq '제목내용'?'selected':'' }"/>>제목+내용</option>
							</select>							
							<input type="text" name="keyword" id="keywordInput" placeholder="검색어 입력"
								value="${boardVo.keyword}">
							<button id="searchBtn">검색</button>
						</div>						
					</div>
					 <sec:authorize access="hasAnyRole('ROLE_ADMIN','ROLE_SUPERADMIN')">
					 <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
					<button class="newBtn">새 글</button>
					</sec:authorize>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="../layout/footer.jsp"></jsp:include>
</body>
</html>