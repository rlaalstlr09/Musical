<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 메인 페이지</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/help_main.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/notice.css">
</head>
<body>
<jsp:include page="../layout/admin_header.jsp"/>
<div id="wrap">
<div id='content'>
<div class='noticeBox'>
			<div class='noticeTop'>
				<strong><a href='qa_admin'>최근 1:1문의</a></strong>							
			</div>
			<ul>
			<c:forEach items="${list }" var='boardDtos' varStatus='status'>
				<li>
				<a href='qa_admin'>${boardDtos.title }</a>
				</li>
			</c:forEach>
			</ul>
		</div>
		
<div class='noticeBox'>
			<div class='noticeTop'>
				<strong><a href='admin_admin'>최근 관리 작업</a></strong>							
			</div>
			
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
									테이블
									</th>
									<th scope="col" style='text-align: center;'>
									작업
									</th>									
									<th scope="col" style='text-align: center;'>기록내용</th>
									<th scope="col" style='text-align: center;'>작업사유</th>
									<th scope="col" style='text-align: center;'>작업일자</th>
								</tr>
							</thead>
							<tbody>
								<%--게시글 테이블 불러오는 코드 삽입--%>
								<c:forEach items="${alist }" var='boardDtos' varStatus='status'>
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
		</div>
</div>
</div>
<jsp:include page="../layout/footer.jsp"></jsp:include>
</body>
</html>