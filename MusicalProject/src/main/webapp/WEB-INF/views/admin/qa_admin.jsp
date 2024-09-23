<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>QA 관리</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/notice.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src='<%=request.getContextPath()%>/resources/script/admin_qa.js'></script>

</head>
<body>
<jsp:include page="../layout/admin_header.jsp"/>
	<div id="wrap">
		<div id="contents">
			<div id="content">

				<div class="board_qna">
				<h1 id="qna_head"><a href='qa_admin'>QA 관리 페이지</a></h1>
					<div class="search_faq">
						<select name="fGroupKind">
							<option value="전체"
								<c:out value="${boardVo.fGroupKind eq '전체'?'selected':'' }"/>>전체</option>
							<!-- <option value="n" selected>----</option>
    		<option value="n">----</option> -->
							<option value="예매/취소"
								<c:out value="${boardVo.fGroupKind eq '예매/취소'?'selected':'' }"/>>예매/취소</option>
							<option value="결제"
								<c:out value="${boardVo.fGroupKind eq '결제'?'selected':'' }"/>>결제</option>
							<option value="회원"
								<c:out value="${boardVo.fGroupKind eq '회원'?'selected':'' }"/>>회원</option>
							<option value="기타"
								<c:out value="${boardVo.fGroupKind eq '기타'?'selected':'' }"/>>기타</option>
						</select>
						<!-- input 에 text를 입력하면 value로 설정된 pageMaker에 keyword의 값이 id값으로 들어간다.
    	입력값이 쿼리 스트링에 들어간다. -->
						<input type="text" name="keyword" id="keywordInput" placeholder="검색어 입력"
							value="${boardVo.keyword}">
						<button id="searchBtn">검색</button>
					</div>

					<div class="cs_board">
						<ul class="list_board_sort">
							<li class="_cat02" data-cat="02"><a href="qa_admin"
								class="link_tab _faqCategory">전체</a></li>
							<li class="_cat06" data-cat="06"><a
								href="qa_admin?fGroupKind=예매/취소" class="link_tab _faqCategory">예매/취소</a></li>
							<li class="_cat01" data-cat="01"><a
								href="qa_admin?fGroupKind=결제" class="link_tab _faqCategory">결제</a></li>
							<li class="_cat09" data-cat="09"><a
								href="qa_admin?fGroupKind=회원" class="link_tab _faqCategory">회원</a></li>
							<li class="_cat10" data-cat="10"><a 
							href="qa_admin?fGroupKind=기타" class="link_tab _faqCategory">기타</a></li>
						</ul>
					</div>
					
					<div id="qnaList-wrapper">
						<table  class="tb_board tb_qna">
							<colgroup>
								<col width="5%">
								<col width="15%">
								<col width="45%">
								<col width="20%">
								<col width="15%">
							</colgroup>
							<thead>
								<tr class="">
									<th scope="col">번호</th>
									<th scope="col">카테고리</th>
									<th scope="col">제목</th>
									<th scope="col">아이디</th>
									<th scope="col">
										<select id="res_state">
    									<option value="" <c:out value="${boardVo.nGroupKind eq ''?'selected':'' }"/>>전체</option>
        								<option value="res_wait" <c:out value="${boardVo.nGroupKind eq 'res_wait'?'selected':'' }"/>>답변대기중</option>
        								<option value="res_comp" <c:out value="${boardVo.nGroupKind eq 'res_comp'?'selected':'' }"/>>답변완료</option>
    									</select>
									</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${list }" var='boardDtos' varStatus='status'>
									<tr class="item">
										<td>${boardDtos.qa_id }</td>
										<td style='text-align: center;'>${boardDtos.qa_type }</td>
										<td>${boardDtos.title }</td>
										<td style='text-align: center;'>${boardDtos.customer_id}</td>
										<td id="state${boardDtos.qa_id}"><c:if test="${boardDtos.display ==0}">
								답변대기중
							</c:if>
							<c:if test="${boardDtos.display ==1}">
								답변완료
							</c:if>
							</td>
							</tr>
									<tr class="hide">

										<td colspan="5">
										<pre><c:out value="${boardDtos.content}" escapeXml="false" /></pre>
										<c:if test="${boardDtos.display ==1}">									
											<pre id="pre${boardDtos.qa_id}"><br><hr><hr><br><c:out value="${boardDtos.response}" escapeXml="false" /></pre>
											<button  class="res_modify" value="${boardDtos.qa_id}">답변수정</button>													
											<button  class="res_remove" value="${boardDtos.qa_id}">답변삭제</button>	
										</c:if>								
											<c:if test="${boardDtos.display ==0}">
											<button class="newBtn" value="${boardDtos.qa_id}">답변</button>	
											</c:if>	
											<div class="addRes" value="${boardDtos.qa_id}" ></div>
											</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>

						<!--pagination-->
						<div class="pagination">
							<c:if test="${boardVo.page !=1}">
								<a href='qa_admin${boardVo.makeSearch1(1)}'>&lt;&lt;&lt;</a>
							</c:if>
							<!-- 앞전 page 모양을 클릭하면 pageMarker.startPage에 -1을 처리해준다.-->
							<c:if test="${boardVo.prev }">
								<a href='qa_admin${boardVo.makeSearch1(boardVo.startPage-1)}'>&lt;&lt;</a>
							</c:if>
							<c:if test="${boardVo.page != 1}">
								<a href='qa_admin${boardVo.makeSearch1(boardVo.page-1)}'>&lt;</a>
							</c:if>
							<c:forEach begin="${boardVo.startPage }"
								end="${ boardVo.endPage}" var="idx">
								<a href='qa_admin${boardVo.makeSearch1(idx)}'
									<c:out value="${boardVo.page==idx?' class=active ':'' }"/>>
									${idx}</a>
							</c:forEach>


							<c:if test="${boardVo.page != boardVo.totalEndPage}">
								<a href='qa_admin${boardVo.makeSearch1(boardVo.page+1)}'>&gt;</a>
							</c:if>
							<c:if test="${boardVo.next }">
								<a href='qa_admin${boardVo.makeSearch1(boardVo.endPage+1)}'>&gt;&gt;</a>

							</c:if>


							<c:if test="${boardVo.page != boardVo.totalEndPage}">
								<a href='qa_admin${boardVo.makeSearch1(boardVo.totalEndPage)}'>&gt;&gt;&gt;</a>
							</c:if>

						</div>

						<script type="text/javascript">
							
						</script>
					</div>
					
				</div>

			</div>

		</div>

	</div>
	<jsp:include page="../layout/footer.jsp"></jsp:include>
</body>
</html>