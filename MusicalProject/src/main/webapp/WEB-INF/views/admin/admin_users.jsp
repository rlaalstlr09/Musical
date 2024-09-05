<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보 관리</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/notice.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src='<%=request.getContextPath()%>/resources/script/admin_users.js'></script>
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
					<h1 id="qna_head">회원 정보 관리 페이지</h1>

					

					<div id="qnaList-wrapper">
						<table class="tb_board tb_qna">
							<colgroup>
								<col width="20%">
								<col width="30%">
								<col width="10%">
								<col width="10%">
								<col width="10%">
								<col width="10%">
								<col width="10%">
							</colgroup>
							<thead>
								<tr class="">
									<th scope="col">아이디</th>
									<th scope="col" style='text-align: center;'>EMAIL</th>									
									<th scope="col" style='text-align: center;'>생년월일</th>
									<th scope="col" style='text-align: center;'>상태</th>
									<th scope="col" style='text-align: center;'>권한</th>
									<th scope="col" style='text-align: center;'>수정</th>
									<th scope="col" style='text-align: center;'>삭제</th>
								</tr>
							</thead>
							<tbody>
								<%--게시글 테이블 불러오는 코드 삽입--%>
								<c:forEach items="${list }" var='boardDtos' varStatus='status'>
									<tr class="admin_table">
										<td>${boardDtos.customer_id }</td>
										<td style='text-align: center;'>${boardDtos.customer_email}</td>
										<td style='text-align: center;'><fmt:formatDate value="${boardDtos.customer_birth }" pattern="yyyy.MM.dd"/></td>
										<td style='text-align: center;'>
										<c:if test="${boardDtos.enabled  == 1}">
										활동
										</c:if>
										<c:if test="${boardDtos.enabled  == 0}">
										휴면
										</c:if>
										</td>
										<td style='margin: 0 auto;'>
										<c:if test="${boardDtos.authority == 'ROLE_MEMBER'}">
										회원
										</c:if>
										<c:if test="${boardDtos.authority == 'ROLE_ADMIN'}">
										관리자
										</c:if>
										<c:if test="${boardDtos.authority == 'ROLE_SUPERADMIN'}">
										사장
										</c:if>
										</td>
										<td style='text-align: center;'><button class="modifyBtn"
												value="${boardDtos.customer_id }">수정</button></td>
										<td style='text-align: center;'><button class="deleteBtn"
												value="${boardDtos.customer_id }">삭제</button></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
						
						<!--pagination-->
						<div class="pagination">
							<c:if test="${boardVo.page !=1}">
								<a href='admin_users${boardVo.makeSearch1(1)}'>&lt;&lt;&lt;</a>
							</c:if>
							<!-- 앞전 page 모양을 클릭하면 pageMarker.startPage에 -1을 처리해준다.-->
							<c:if test="${boardVo.prev }">
								<a href='admin_users${boardVo.makeSearch1(boardVo.startPage-1)}'>&lt;&lt;</a>
							</c:if>
							<c:if test="${boardVo.page != 1}">
								<a href='admin_users${boardVo.makeSearch1(boardVo.page-1)}'>&lt;</a>
							</c:if>
							<c:forEach begin="${boardVo.startPage }"
								end="${ boardVo.endPage}" var="idx">
								<a href='admin_users${boardVo.makeSearch1(idx)}'
									<c:out value="${boardVo.page==idx?' class=active ':'' }"/>>
									${idx}</a>
							</c:forEach>
							

							<c:if test="${boardVo.page != boardVo.totalEndPage}">
								<a href='admin_users${boardVo.makeSearch1(boardVo.page+1)}'>&gt;</a>
							</c:if>
							<c:if test="${boardVo.next }">
								<a href='admin_users${boardVo.makeSearch1(boardVo.endPage+1)}'>&gt;&gt;</a>

							</c:if>


							<c:if test="${boardVo.page != boardVo.totalEndPage}">
								<a
									href='admin_users${boardVo.makeSearch1(boardVo.totalEndPage)}'>&gt;&gt;&gt;</a>
							</c:if>

						</div>
						<div class="search_faq">
							<input type="text" name="keyword" id="keywordInput" placeholder="검색어 입력"
								value="${boardVo.keyword}">
							<button id="searchBtn">ID검색</button>
						</div>
						
						
					</div>


				</div>

			</div>

		</div>

	</div>

</body>
</html>