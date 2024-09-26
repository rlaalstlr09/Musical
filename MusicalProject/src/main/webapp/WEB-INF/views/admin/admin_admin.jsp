<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리 이력 페이지</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/notice.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src='<%=request.getContextPath()%>/resources/script/admin_admin.js'></script>
</head>
<body>
<jsp:include page="../layout/admin_header.jsp"/>
       <div id="wrap">
		<div id="contents">
			<div id="content">
				<div class="board_qna">
					<h1 id="qna_head"><a href='admin_admin'>관리 내역 페이지</a></h1>
					<div id="qnaList-wrapper">
						<table class="tb_board tb_qna">
							<colgroup>
								<col width="10%">
								<col width="10%">
								<col width="35%">
								<col width="35%">
								<col width="10%">
							</colgroup>
							<thead>
								<tr class="">
									<th scope="col">
									<select id="table_name">
    									<option value="" <c:out value="${boardVo.fGroupKind eq ''?'selected':'' }"/>>테이블 선택</option>
        								<option value="musical" <c:out value="${boardVo.fGroupKind eq 'musical'?'selected':'' }"/>>뮤지컬</option>
        								<option value="venue" <c:out value="${boardVo.fGroupKind eq 'venue'?'selected':'' }"/>>극장</option>
        								<option value="hall" <c:out value="${boardVo.fGroupKind eq 'hall'?'selected':'' }"/>>홀</option>
        								<option value="actor" <c:out value="${boardVo.fGroupKind eq 'actor'?'selected':'' }"/>>배우</option>
        								<option value="character" <c:out value="${boardVo.fGroupKind eq 'character'?'selected':'' }"/>>캐릭터</option>
        								<option value="review" <c:out value="${boardVo.fGroupKind eq 'review'?'selected':'' }"/>>리뷰</option>
    									</select>
									</th>
									<th scope="col" style='text-align: center;'>
									<select id="table_crud">
    									<option value="" <c:out value="${boardVo.nGroupKind eq ''?'selected':'' }"/>>작업 선택</option>
        								<option value="doc_create" <c:out value="${boardVo.nGroupKind eq 'doc_create'?'selected':'' }"/>>문서</option>
        								<option value="table_delete" <c:out value="${boardVo.nGroupKind eq 'table_delete'?'selected':'' }"/>>삭제</option>
    									</select>
									</th>									
									<th scope="col" style='text-align: center;'>기록내용</th>
									<th scope="col" style='text-align: center;'>작업사유</th>
									<th scope="col" style='text-align: center;'>작업일자</th>
								</tr>
							</thead>
							<tbody>
								<%--게시글 테이블 불러오는 코드 삽입--%>
								<c:forEach items="${list }" var='boardDtos' varStatus='status'>
									<tr class="admin_table">
										<td>${boardDtos.table_name }</td>
										<td style='text-align: center;'>
										<c:if test="${boardDtos.table_crud  == 'doc_create'}">
										문서
										</c:if>
										<c:if test="${boardDtos.table_crud  == 'table_delete'}">
										삭제
										</c:if>
										</td>
										<td style='text-align: center;'>
										<c:if test="${boardDtos.table_content  == null}">
										${boardDtos.fileName}
										</c:if>
										<c:if test="${boardDtos.fileName  == null}">
										${boardDtos.table_content}
										</c:if>
										</td>
										<td style='margin: 0 auto;'>
										${boardDtos.crud_reason }
										</td>										
										<td style='text-align: center;'><fmt:formatDate value="${boardDtos.crud_date }" pattern="yyyy.MM.dd HH:mm:ss"/></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
						
						<!--pagination-->
						<div class="pagination">
							<c:if test="${boardVo.page !=1}">
								<a href='admin_admin${boardVo.makeSearch1(1)}'>&lt;&lt;&lt;</a>
							</c:if>
							<!-- 앞전 page 모양을 클릭하면 pageMarker.startPage에 -1을 처리해준다.-->
							<c:if test="${boardVo.prev }">
								<a href='admin_admin${boardVo.makeSearch1(boardVo.startPage-1)}'>&lt;&lt;</a>
							</c:if>
							<c:if test="${boardVo.page != 1}">
								<a href='admin_admin${boardVo.makeSearch1(boardVo.page-1)}'>&lt;</a>
							</c:if>
							<c:forEach begin="${boardVo.startPage }"
								end="${ boardVo.endPage}" var="idx">
								<a href='admin_admin${boardVo.makeSearch1(idx)}'
									<c:out value="${boardVo.page==idx?' class=active ':'' }"/>>
									${idx}</a>
							</c:forEach>
							

							<c:if test="${boardVo.page != boardVo.totalEndPage}">
								<a href='admin_admin${boardVo.makeSearch1(boardVo.page+1)}'>&gt;</a>
							</c:if>
							<c:if test="${boardVo.next }">
								<a href='admin_admin${boardVo.makeSearch1(boardVo.endPage+1)}'>&gt;&gt;</a>

							</c:if>


							<c:if test="${boardVo.page != boardVo.totalEndPage}">
								<a
									href='admin_admin${boardVo.makeSearch1(boardVo.totalEndPage)}'>&gt;&gt;&gt;</a>
							</c:if>

						</div>
						<div class="search_faq">
							<input type="text" name="keyword" id="keywordInput" placeholder="검색어 입력"
								value="${boardVo.keyword}">
							<button id="searchBtn">내용검색</button>
						</div>
						
						
					</div>


				</div>

			</div>

		</div>

	</div>
<jsp:include page="../layout/footer.jsp"></jsp:include>
</body>
</html>