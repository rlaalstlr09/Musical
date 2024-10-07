<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>필모그래피</title>
</head>
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/notice.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src='<%=request.getContextPath()%>/resources/script/actor_read.js'></script>
<body>
<jsp:include page="../layout/admin_header.jsp"/>
<div id="wrap">
		<div id="contents">
			<div id="content">
				<div class="board_qna">
				<div id=img-box>
				<img src='<%=request.getContextPath()%>/resources/img/actor/${actor_read.actor_img }'  width='250px'>
				</div>
				<div id="List-wrapper">
				<h2>${actor_read.actor_name } 필모그래피 목록</h2>
				</div>
					<input type="hidden" id="actor_id" value="${actor_read.actor_id }">

					<div id="qnaList-wrapper">
						<table class="tb_board tb_qna">
							<colgroup>
								<col width="40%">
								<col width="40%">
								<col width="20%">
							</colgroup>
							<thead>
								<tr class="">
									<th scope="col">작품명</th>
									<th scope="col">배역 이름</th>	
									<th scope="col">수정/삭제</th>
								</tr>
							</thead>
							<tbody>
								<%--게시글 테이블 불러오는 코드 삽입--%>
								<c:forEach items="${character_list }" var='boardDtos' varStatus='status'>
									<tr class="admin_table">
										<td>${boardDtos.musical_title }</td>
										<td>${boardDtos.character_name }</td>										
										<td><button class="modifyBtn"
												value="${boardDtos.musical_id }">수정</button>
										<button class="deleteBtn"
												value="${boardDtos.character_id }">삭제</button></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
						

						<!--pagination-->
						<div class="pagination">
							<c:if test="${boardVo.page !=1}">
								<a href='actor_read${boardVo.makeSearch1(1)}&actor_id=${actor_read.actor_id }'>&lt;&lt;&lt;</a>
							</c:if>
							<!-- 앞전 page 모양을 클릭하면 pageMarker.startPage에 -1을 처리해준다.-->
							<c:if test="${boardVo.prev }">
								<a href='actor_read${boardVo.makeSearch1(boardVo.startPage-1)}&actor_id=${actor_read.actor_id }'>&lt;&lt;</a>
							</c:if>
							<c:if test="${boardVo.page != 1}">
								<a href='actor_read${boardVo.makeSearch1(boardVo.page-1)}&actor_id=${actor_read.actor_id }'>&lt;</a>
							</c:if>
							<c:forEach begin="${boardVo.startPage }"
								end="${ boardVo.endPage}" var="idx">
								<a href='actor_read${boardVo.makeSearch1(idx)}&actor_id=${actor_read.actor_id }'
									<c:out value="${boardVo.page==idx?' class=active ':'' }"/>>
									${idx}</a>
							</c:forEach>
							

							<c:if test="${boardVo.page != boardVo.totalEndPage}">
								<a href='actor_read${boardVo.makeSearch1(boardVo.page+1)}&actor_id=${actor_read.actor_id }'>&gt;</a>
							</c:if>
							<c:if test="${boardVo.next }">
								<a href='actor_read${boardVo.makeSearch1(boardVo.endPage+1)}&actor_id=${actor_read.actor_id }'>&gt;&gt;</a>

							</c:if>


							<c:if test="${boardVo.page != boardVo.totalEndPage}">
								<a href='actor_read${boardVo.makeSearch1(boardVo.totalEndPage)}&actor_id=${actor_read.actor_id }'>&gt;&gt;&gt;</a>
							</c:if>

						</div>
					</div>


				</div>

			</div>

		</div>

	</div>
<jsp:include page="../layout/footer.jsp"></jsp:include>
</body>
</html>