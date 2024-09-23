<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>뮤지컬 관리</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/notice.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src='<%=request.getContextPath()%>/resources/script/admin_musical.js'></script>
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
					<h1 id="qna_head"><a href="admin_musical">뮤지컬 관리 페이지</a></h1>

					<div class="search_period">
						<label for="startYear">년도:</label>
<select id="startYear" 
    name="${boardVo.fGroupKind != null && boardVo.fGroupKind.length() >= 4 ? boardVo.fGroupKind.substring(0, 4) : ''}">
</select>
    
     <c:choose>
        <c:when test="${boardVo.fGroupKind != null && boardVo.fGroupKind.length() >= 5}">
            <c:set var="SM" value="${boardVo.fGroupKind.substring(4, 6)}"/>
        </c:when>
        <c:otherwise>
            <c:set var="SM" value=""/>
        </c:otherwise>
    </c:choose>
    <label for="startMonth">월:</label>
    <select id="startMonth">
    <option value="">선택</option>
        <option value="01" <c:out value="${SM eq '01'?'selected':'' }"/>>1월</option>
        <option value="02" <c:out value="${SM eq '02'?'selected':'' }"/>>2월</option>
        <option value="03" <c:out value="${SM eq '03'?'selected':'' }"/>>3월</option>
        <option value="04" <c:out value="${SM eq '04'?'selected':'' }"/>>4월</option>
        <option value="05" <c:out value="${SM eq '05'?'selected':'' }"/>>5월</option>
        <option value="06" <c:out value="${SM eq '06'?'selected':'' }"/>>6월</option>
        <option value="07" <c:out value="${SM eq '07'?'selected':'' }"/>>7월</option>
        <option value="08" <c:out value="${SM eq '08'?'selected':'' }"/>>8월</option>
        <option value="09" <c:out value="${SM eq '09'?'selected':'' }"/>>9월</option>
        <option value="10" <c:out value="${SM eq '10'?'selected':'' }"/>>10월</option>
        <option value="11" <c:out value="${SM eq '11'?'selected':'' }"/>>11월</option>
        <option value="12" <c:out value="${SM eq '12'?'selected':'' }"/>>12월</option>
    </select>
    
     ~ 
    
    <label for="endYear">년도:</label>
    <select id="endYear" 
    name="${boardVo.nGroupKind != null && boardVo.nGroupKind.length() >= 4 ? boardVo.nGroupKind.substring(0, 4) : ''}">
    </select>
    
    <c:choose>
        <c:when test="${boardVo.nGroupKind != null && boardVo.nGroupKind.length() >= 5}">
            <c:set var="EM" value="${boardVo.nGroupKind.substring(4, 6)}"/>
        </c:when>
        <c:otherwise>
            <c:set var="EM" value=""/>
        </c:otherwise>
    </c:choose>
    <label for="endMonth">월:</label>
    <select id="endMonth">
    <option value="">선택</option>
        <option value="01" <c:out value="${EM eq '01'?'selected':'' }"/>>1월</option>
        <option value="02" <c:out value="${EM eq '02'?'selected':'' }"/>>2월</option>
        <option value="03" <c:out value="${EM eq '03'?'selected':'' }"/>>3월</option>
        <option value="04" <c:out value="${EM eq '04'?'selected':'' }"/>>4월</option>
        <option value="05" <c:out value="${EM eq '05'?'selected':'' }"/>>5월</option>
        <option value="06" <c:out value="${EM eq '06'?'selected':'' }"/>>6월</option>
        <option value="07" <c:out value="${EM eq '07'?'selected':'' }"/>>7월</option>
        <option value="08" <c:out value="${EM eq '08'?'selected':'' }"/>>8월</option>
        <option value="09" <c:out value="${EM eq '09'?'selected':'' }"/>>9월</option>
        <option value="10" <c:out value="${EM eq '10'?'selected':'' }"/>>10월</option>
        <option value="11" <c:out value="${EM eq '11'?'selected':'' }"/>>11월</option>
        <option value="12" <c:out value="${EM eq '12'?'selected':'' }"/>>12월</option>
    </select>
    
    <button id="submit">기간검색</button>
					</div>

					<div id="qnaList-wrapper">
						<table cellspacing="0" border="0" class="tb_board tb_qna">
							<colgroup>
								<col width="29%">
								<col width="30%">
								<col width="10%">
								<col width="10%">
								<col width="7%">
								<col width="7%">
								<col width="7%">
							</colgroup>
							<thead>
								<tr class="">
									<th scope="col">뮤지컬 제목</th>
									<th scope="col">공연 기간</th>									
									<th scope="col">러닝 타임</th>
									<th scope="col">제한 연령</th>
									<th scope="col">배역</th>
									<th scope="col">수정</th>
									<th scope="col">삭제</th>
								</tr>
							</thead>
							<tbody>
								<%--게시글 테이블 불러오는 코드 삽입--%>
								<c:forEach items="${list }" var='boardDtos' varStatus='status'>
									<tr class="admin_table">
										<td>${boardDtos.musical_title }</td>
										<td>${boardDtos.formattedMusical_period_start } ~ ${boardDtos.formattedMusical_period_end }</td>
										<td>${boardDtos.musical_runningtime }</td>
										<td>${boardDtos.musical_agelimit }</td>
										<td><button class="characterBtn"
												value="${boardDtos.musical_id }">보기</button></td>
										<td><button class="modifyBtn"
												value="${boardDtos.musical_id }">수정</button></td>
										<td><button class="deleteBtn" value="${boardDtos.musical_id }">삭제</button></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
						<div class="search_faq">
						<select name="search_keyword">
							<option value="title" ${boardVo.searchType eq 'title' ? 'selected' : ''}>제목</option>    
        					<option value="agelimit" ${boardVo.searchType eq 'document' ? 'selected' : ''}>제한 연령</option>    
						</select>
							<input type="text" name="keyword" id="keywordInput" placeholder="검색어 입력"
								value="${boardVo.keyword}">
							<button id="searchBtn">검색</button>
						</div>

						<!--pagination-->
						<div class="pagination">
							<c:if test="${boardVo.page !=1}">
								<a href='admin_musical${boardVo.makeSearch1(1)}'>&lt;&lt;&lt;</a>
							</c:if>
							<!-- 앞전 page 모양을 클릭하면 pageMarker.startPage에 -1을 처리해준다.-->
							<c:if test="${boardVo.prev }">
								<a href='admin_musical${boardVo.makeSearch1(boardVo.startPage-1)}'>&lt;&lt;</a>
							</c:if>
							<c:if test="${boardVo.page != 1}">
								<a href='admin_musical${boardVo.makeSearch1(boardVo.page-1)}'>&lt;</a>
							</c:if>
							<c:forEach begin="${boardVo.startPage }"
								end="${ boardVo.endPage}" var="idx">
								<a href='admin_musical${boardVo.makeSearch1(idx)}'
									<c:out value="${boardVo.page==idx?' class=active ':'' }"/>>
									${idx}</a>
							</c:forEach>
							

							<c:if test="${boardVo.page != boardVo.totalEndPage}">
								<a href='admin_musical${boardVo.makeSearch1(boardVo.page+1)}'>&gt;</a>
							</c:if>
							<c:if test="${boardVo.next }">
								<a href='admin_musical${boardVo.makeSearch1(boardVo.endPage+1)}'>&gt;&gt;</a>

							</c:if>


							<c:if test="${boardVo.page != boardVo.totalEndPage}">
								<a
									href='admin_musical${boardVo.makeSearch1(boardVo.totalEndPage)}'>&gt;&gt;&gt;</a>
							</c:if>

						</div>
						<button class="newBtn"">추가</button>
						<button class="excelBtn"">엑셀 다운로드</button>
					</div>


				</div>

			</div>

		</div>

	</div>
<jsp:include page="../layout/footer.jsp"></jsp:include>
</body>
</html>