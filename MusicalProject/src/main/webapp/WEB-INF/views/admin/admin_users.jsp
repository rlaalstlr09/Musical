<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보 관리</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/notice.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
var result = '${msg}';
if (result == 'success') {
	alert("처리가 완료되었습니다.");
}
var contextPath = '<%= request.getContextPath() %>';
</script>
<script src='<%=request.getContextPath()%>/resources/script/admin_users.js'></script>

<style>
button {
    width: 100%;
    padding: 10px;
    margin-top: 20px;
    background-color: #007bff;
    color: #fff;
    border: none;
    border-radius: 5px;
    cursor: pointer;
}

button:hover {
    background-color: #0056b3;
}

/* 모달 스타일 */
.modal {
    display: none;
    position: fixed;
    z-index: 1;
    left: 0;
    top: 0;
    width: 100%;
    height: 100%;
    overflow: auto;
    background-color: rgb(0, 0, 0);
    background-color: rgba(0, 0, 0, 0.4);
}

.modal-content {
    background-color: #fff;
    margin: 15% auto;
    padding: 20px;
    border: 1px solid #888;
    width: 80%;
    max-width: 500px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    text-align: center;
}

.close {
    color: #aaa;
    float: right;
    font-size: 28px;
    font-weight: bold;
}

.close:hover,
.close:focus {
    color: #000;
    text-decoration: none;
    cursor: pointer;
}

</style>
</head>
<body>
<jsp:include page="../layout/admin_header.jsp"/>
       <div id="wrap">
		<div id="contents">
			<div id="content">
				<div class="board_qna">
					<h1 id="qna_head">회원 정보 관리 페이지</h1>

					

					<div id="qnaList-wrapper">
						<table class="tb_board tb_qna">
							<colgroup>
								<col width="25%">
								<col width="35%">
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
								</tr>
							</thead>
							<tbody>
								<%--게시글 테이블 불러오는 코드 삽입--%>
								<c:forEach items="${list }" var='boardDtos' varStatus='status'>
									<tr class="admin_table">
										<td>${boardDtos.customer_id }</td>
										<td style='text-align: center;'>${boardDtos.customer_email}</td>
										<td style='text-align: center;'><fmt:formatDate value="${boardDtos.customer_birth }" pattern="yyyy.MM.dd"/></td>
										<td id='${boardDtos.customer_id }' style='text-align: center;'>
										<c:if test="${boardDtos.enabled  eq 1}">
										활동
										</c:if>
										<c:if test="${boardDtos.enabled  eq 0}">
										휴면
										</c:if>
										</td>
										<td class='${boardDtos.customer_id }' style='margin: 0 auto;'>
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
										<td style='text-align: center;'>
										<c:if test="${boardDtos.authority == 'ROLE_MEMBER'}">
										<button class="modifyBtn"
												value="${boardDtos.customer_id }">수정</button>
										</c:if>
										<c:if test="${boardDtos.authority == 'ROLE_ADMIN'}">
										<sec:authorize access="hasRole('SUPERADMIN')">
										<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
										<button class="modifyBtn"
												value="${boardDtos.customer_id }">수정</button>
										</sec:authorize>
										</c:if>
										</td>										
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
 <!-- 모달 창 -->
    <div id="modal" class="modal">
        <div class="modal-content">
            <span class="close">&times;</span>
            <h4>상태 수정</h4>
            <label>ID</label><input type="text" id='cid' name='customer_id' readonly>
            <label>상태</label>
            <select name='enabled' id="enabled">
    		<option value="1">활동</option>
        	<option value="0">휴면</option>
        	</select>
        	<sec:authorize access="hasRole('SUPERADMIN')">
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        	<label>권한</label>
            <select name='authority' id="authority">
    		<option value="ROLE_MEMBER">회원</option>
        	<option value="ROLE_ADMIN">관리자</option>
        	</select>
        	</sec:authorize>
        	<button type="button" class="signup">저장</button>            
        </div>
    </div>
    <jsp:include page="../layout/footer.jsp"></jsp:include>
</body>
</html>