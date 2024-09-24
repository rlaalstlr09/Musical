<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>원격 문서함</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/notice.css">
<link href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.13/css/select2.min.css" rel="stylesheet" />
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.13/js/select2.min.js"></script>
<script src='<%=request.getContextPath()%>/resources/script/admin_files.js'></script>
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
<h1>문서함</h1>
<div class="select">
						<select name="select">
							<option value="scan" ${boardVo.searchType eq 'scan' ? 'selected' : ''}>스캔문서함</option>
    
        <option value="document" ${boardVo.searchType eq 'document' ? 'selected' : ''}>등록문서함</option>
    
						</select>
</div>

<div id="qnaList-wrapper">
						<table cellspacing="0" border="0" class="tb_board tb_qna">
    <thead>
    <tr>
        <th>파일명</th>
        <th>생성 날짜</th>
        <th>보기(새탭)</th>
        <th>등록/삭제</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="fileInfo" items="${filesList}">
        <tr class=admin_table>
            <td>${fileInfo.fileName}</td>
            <td>
            <fmt:formatDate value="${fileInfo.creationDate}" pattern="yy.MM.dd(E) HH:mm:ss" />
            </td>
            <td>
                <button class="viewBtn" data-file="${fileInfo.fileName}">View</button>
            </td>
            <td><button class="addBtn" data-file="${fileInfo.fileName}">등록</button>
                <button class="deleteBtn" data-file="${fileInfo.fileName}">삭제</button>
                </td>
        </tr>
    </c:forEach>
    </tbody>
</table>
</div>
<!--pagination-->
						<div class="pagination">
							<c:if test="${boardVo.page !=1}">
								<a href='admin_files${boardVo.makeSearch1(1)}'>&lt;&lt;&lt;</a>
							</c:if>
							<!-- 앞전 page 모양을 클릭하면 pageMarker.startPage에 -1을 처리해준다.-->
							<c:if test="${boardVo.prev }">
								<a href='admin_files${boardVo.makeSearch1(boardVo.startPage-1)}'>&lt;&lt;</a>
							</c:if>
							<c:if test="${boardVo.page != 1}">
								<a href='admin_files${boardVo.makeSearch1(boardVo.page-1)}'>&lt;</a>
							</c:if>
							<c:forEach begin="${boardVo.startPage }"
								end="${ boardVo.endPage}" var="idx">
								<a href='admin_files${boardVo.makeSearch1(idx)}'
									<c:out value="${boardVo.page==idx?' class=active ':'' }"/>>
									${idx}</a>
							</c:forEach>
							

							<c:if test="${boardVo.page != boardVo.totalEndPage}">
								<a href='admin_files${boardVo.makeSearch1(boardVo.page+1)}'>&gt;</a>
							</c:if>
							<c:if test="${boardVo.next }">
								<a href='admin_files${boardVo.makeSearch1(boardVo.endPage+1)}'>&gt;&gt;</a>

							</c:if>


							<c:if test="${boardVo.page != boardVo.totalEndPage}">
								<a
									href='admin_files${boardVo.makeSearch1(boardVo.totalEndPage)}'>&gt;&gt;&gt;</a>
							</c:if>

						</div>
</div>
</div>
</div>
<jsp:include page="../layout/footer.jsp"></jsp:include>
</body>
</html>