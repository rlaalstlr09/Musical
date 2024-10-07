<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>배역/출연 정보</title>
</head>
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/notice.css">
<link href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.13/css/select2.min.css" rel="stylesheet" />
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.13/js/select2.min.js"></script>
<script src='<%=request.getContextPath()%>/resources/script/character_read.js'></script>

<body>
<jsp:include page="../layout/admin_header.jsp"/>
<div id="wrap">
		<div id="contents">
			<div id="content">
				<div class="board_qna">					
					<div id=img-box>	
						<img src='<%=request.getContextPath()%>/resources/img/musical/${list.musical_poster }' style="justify-content: center;"  width='250px'>
						</div>
					<div id="List-wrapper">
					<h2>${list.musical_title } 배역/출연 배우 정보</h2>					
					</div>
					<button class="viewBtn" data-file="${fileName}">view</button>

					<div id="qnaList-wrapper">
						<table cellspacing="0" border="0" class="tb_board tb_qna">
							<colgroup>
								<col width="40%">
								<col width="40%">
								<col width="20%">
							</colgroup>
							<thead>
								<tr class="">
									<th scope="col">배역명</th>
									<th scope="col">배우 이름</th>	
									<th scope="col">수정/삭제</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${character_list }" var='boardDtos' varStatus='status'>
									<tr class="admin_table">
										<td style='text-align: center;'>${boardDtos.character_name }</td>
										<td style='text-align: center;'>${boardDtos.actor_name }</td>										
										<td>
										<button class="modifyBtn"
												value="${boardDtos.character_id }">수정</button>
										<button class="deleteBtn"
												value="${boardDtos.character_id }">삭제</button></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
						

						<!--pagination-->
						<div class="pagination">
							<c:if test="${boardVo.page !=1}">
								<a href='character_read${boardVo.makeSearch1(1)}&musical_id=${list.musical_id }'>&lt;&lt;&lt;</a>
							</c:if>
							<!-- 앞전 page 모양을 클릭하면 pageMarker.startPage에 -1을 처리해준다.-->
							<c:if test="${boardVo.prev }">
								<a href='character_read${boardVo.makeSearch1(boardVo.startPage-1)}&musical_id=${list.musical_id }'>&lt;&lt;</a>
							</c:if>
							<c:if test="${boardVo.page != 1}">
								<a href='character_read${boardVo.makeSearch1(boardVo.page-1)}&musical_id=${list.musical_id }'>&lt;</a>
							</c:if>
							<c:forEach begin="${boardVo.startPage }"
								end="${ boardVo.endPage}" var="idx">
								<a href='character_read${boardVo.makeSearch1(idx)}&musical_id=${list.musical_id }'
									<c:out value="${boardVo.page==idx?' class=active ':'' }"/>>
									${idx}</a>
							</c:forEach>
							

							<c:if test="${boardVo.page != boardVo.totalEndPage}">
								<a href='character_read${boardVo.makeSearch1(boardVo.page+1)}&musical_id=${list.musical_id }'>&gt;</a>
							</c:if>
							<c:if test="${boardVo.next }">
								<a href='character_read${boardVo.makeSearch1(boardVo.endPage+1)}&musical_id=${list.musical_id }'>&gt;&gt;</a>

							</c:if>


							<c:if test="${boardVo.page != boardVo.totalEndPage}">
								<a href='character_read${boardVo.makeSearch1(boardVo.totalEndPage)}&musical_id=${list.musical_id }'>&gt;&gt;&gt;</a>
							</c:if>

						</div>
						<button class="newBtn" value="${list.musical_id}">배역 추가</button>
						
					</div>


				</div>

			</div>

		</div>

	</div>
<jsp:include page="../layout/footer.jsp"></jsp:include>
</body>
</html>