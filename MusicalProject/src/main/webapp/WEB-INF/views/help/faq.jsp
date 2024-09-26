<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자주 묻는 질문</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/notice.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="<%=request.getContextPath()%>/resources/script/faq.js"></script>
<script>
var result = '${msg}';
if (result == 'success') {
	alert("처리가 완료되었습니다.");
}
</script>
<style>
.btn-warning, .btn-danger{
    width: 50px;
    padding: 2px;
    font-size: 13px;
    background: black;
    border: 1px solid #242428;
    color: #fff;
}
</style>
</head>
<body>
<jsp:include page="../layout/header.jsp"/>
	<div id="wrap">
		<div id="contents">
			<div id="content">

				<div class="board_qna">
				<h1 id="qna_head">자주 묻는 질문</h1>
					<div class="search_faq">
						<select name="fGroupKind">
							<option value="전체"
								<c:out value="${boardVo.fGroupKind eq '전체'?'selected':'' }"/>>전체</option>							
							<option value="예매/취소"
								<c:out value="${boardVo.fGroupKind eq '예매/취소'?'selected':'' }"/>>예매/취소</option>
							<option value="결제"
								<c:out value="${boardVo.fGroupKind eq '결제'?'selected':'' }"/>>결제</option>
							<option value="회원"
								<c:out value="${boardVo.fGroupKind eq '회원'?'selected':'' }"/>>회원</option>
							<option value="기타"
								<c:out value="${boardVo.fGroupKind eq '기타'?'selected':'' }"/>>기타</option>
						</select>
						<input type="text" name="keyword" id="keywordInput" placeholder="검색어 입력"
							value="${boardVo.keyword}">
						<button id="searchBtn">검색</button>
					</div>

					<div class="cs_board">
						<ul class="list_board_sort">
							<li class="_cat02" data-cat="02"><a href="faq?fGroupKind=전체"
								class="link_tab _faqCategory">전체</a></li>
							<li class="_cat06" data-cat="06"><a
								href="faq?fGroupKind=예매/취소"  class="link_tab _faqCategory">예매/취소</a></li>
							<li class="_cat01" data-cat="01"><a
								href="faq?fGroupKind=결제" class="link_tab _faqCategory">결제</a></li>
							<li class="_cat09" data-cat="09"><a
								href="faq?fGroupKind=회원" class="link_tab _faqCategory">회원</a></li>
							<li class="_cat10" data-cat="10"><a 
							href="faq?fGroupKind=기타" class="link_tab _faqCategory">기타</a></li>
						</ul>
					</div>
					
					<div id="qnaList-wrapper">
						<table border="0" class="tb_board tb_qna">
							<colgroup>
								<col width="15%">
								<col width="70%">
								<col width="15%">
							</colgroup>
							<thead>
								<tr class="">
									<th scope="col">카테고리</th>
									<th scope="col">제목</th>
									<th scope="col">등록일</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${list }" var='boardDtos' varStatus='status'>
									<tr class="item">
										<td>${boardDtos.fGroupKind }</td>
										<td>${boardDtos.fTitle }</td>
										<td>${boardDtos.formattedFWriteTime}</td>
									</tr>
									<tr class="hide">

										<td colspan="3"><pre><c:out value="${boardDtos.fContent}" escapeXml="false" /></pre> 
										 <sec:authorize access="hasAnyRole('ROLE_ADMIN','ROLE_SUPERADMIN')">
											<form role='form' method="get">
											<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
												<input name="fId" type="hidden" value="${boardDtos.fId}">
												<button type="submit" class="btn btn-warning">수정</button>
												<button type="submit" class="btn btn-danger">삭제</button>
											</form>  </sec:authorize> 
											</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>

						<!--pagination-->
						<div class="pagination">
							<c:if test="${boardVo.page !=1}">
								<a href='faq${boardVo.makeSearch1(1)}'>&lt;&lt;&lt;</a>
							</c:if>
							<!-- 앞전 page 모양을 클릭하면 pageMarker.startPage에 -1을 처리해준다.-->
							<c:if test="${boardVo.prev }">
								<a href='faq${boardVo.makeSearch1(boardVo.startPage-1)}'>&lt;&lt;</a>
							</c:if>
							<c:if test="${boardVo.page != 1}">
								<a href='faq${boardVo.makeSearch1(boardVo.page-1)}'>&lt;</a>
							</c:if>
							<c:forEach begin="${boardVo.startPage }"
								end="${ boardVo.endPage}" var="idx">
								<a href='faq${boardVo.makeSearch1(idx)}'
									<c:out value="${boardVo.page==idx?' class=active ':'' }"/>>
									${idx}</a>
							</c:forEach>

							<c:if test="${boardVo.page != boardVo.totalEndPage}">
								<a href='faq${boardVo.makeSearch1(boardVo.page+1)}'>&gt;</a>
							</c:if>
							<c:if test="${boardVo.next }">
								<a href='faq${boardVo.makeSearch1(boardVo.endPage+1)}'>&gt;&gt;</a>

							</c:if>
							<c:if test="${boardVo.page != boardVo.totalEndPage}">
								<a href='faq${boardVo.makeSearch1(boardVo.totalEndPage)}'>&gt;&gt;&gt;</a>
							</c:if>
						</div>

					</div>
					<sec:authorize access="hasAnyRole('ROLE_ADMIN','ROLE_SUPERADMIN')">
					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
					<button class="newBtn">새글</button>
					</sec:authorize> 
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="../layout/footer.jsp"></jsp:include>
</body>
</html>