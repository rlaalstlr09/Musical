<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,400,0,0" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/notice.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/myPage_sidebar.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<script>

$(function() {
	var article = (".tb_board .show");
	$(".tb_board .item  td").click(
			function() {
				var myArticle = $(this).parents()
						.next("tr");
				if ($(myArticle).hasClass('hide')) {
					$(article).removeClass('show')
							.addClass('hide');
					$(myArticle)
							.removeClass('hide')
							.addClass('show');
				} else {
					$(myArticle).addClass('hide')
							.removeClass('show');
				}
			});
});
</script>
</head>
<body>
	<jsp:include page="../layout/header.jsp"/>
	<div class="my_sidebar">
		<a href="read"><span class="material-symbols-outlined">id_card</span>회원 정보</a> 
		<a href="write"><span class="material-symbols-outlined">support_agent</span>1:1문의</a> 
		<a href="qa_list"><span class="material-symbols-outlined">forum</span>1:1문의내역</a> 
      	<a href="myReview"><span class="material-symbols-outlined">rate_review</span>내가 쓴 리뷰</a>
      	<a href="myQna"><img src="${pageContext.request.contextPath }/resources/img/qna.png" class="qna_icon">내가 쓴 Qna</a>
		<a href="cart"><span class="material-symbols-outlined">shopping_bag</span>장바구니</a>
		<a href="remove"><span class="material-symbols-outlined">person_remove</span>회원탈퇴</a>
	</div>
	<div id="wrap" style="margin-left: 250px;">
		<div id="contents">
			<div id="content">

				<div class="board_qna">
				<h1 id="qna_head">문의내역</h1>
				<h3>
					<a href="write" style="float:right;">글쓰기</a>
				</h3>
					<div id="qnaList-wrapper">
						<table cellspacing="0" border="0" class="tb_board tb_qna">
							<colgroup>
								<col width="15%">
								<col width="70%">
								<col width="15%">
							</colgroup>
							<thead>
								<tr class="">
									<th scope="col">카테고리</th>
									<th scope="col">제목</th>
									<th scope="col">상태</th>
								</tr>
							</thead>
							<tbody>
								<%--게시글 테이블 불러오는 코드 삽입--%>
								<c:forEach items="${list }" var='boardDtos' varStatus='status'>
									<tr class="item">
										<td>${boardDtos.qa_type }</td>
										<td>${boardDtos.title }</td>
										<td><c:if test="${boardDtos.display ==0}">
								답변대기중
							</c:if>
							<c:if test="${boardDtos.display ==1}">
								답변완료
							</c:if>
							</td>
									</tr>
									<tr class="hide">

										<td colspan="3"><pre><c:out value="${boardDtos.content}" escapeXml="false" /></pre>
										<br><hr><hr><br>
										<c:if test="${boardDtos.display ==1}">
										<pre><c:out value="${boardDtos.response}" escapeXml="false" /></pre> 
										</c:if>										
											
											</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>

						<!--pagination-->
						<div class="pagination">
							<c:if test="${boardVo.page !=1}">
								<a href='qa_list${boardVo.makeSearch(1)}&customer_id=${pageContext.request.userPrincipal.name }'>&lt;&lt;&lt;</a>
							</c:if>
							<!-- 앞전 page 모양을 클릭하면 pageMarker.startPage에 -1을 처리해준다.-->
							<c:if test="${boardVo.prev }">
								<a href='qa_list${boardVo.makeSearch(boardVo.startPage-1)}&customer_id=${pageContext.request.userPrincipal.name }'>&lt;&lt;</a>
							</c:if>
							<c:if test="${boardVo.page != 1}">
								<a href='qa_list${boardVo.makeSearch(boardVo.page-1)}&customer_id=${pageContext.request.userPrincipal.name }'>&lt;</a>
							</c:if>
							<c:forEach begin="${boardVo.startPage }"
								end="${ boardVo.endPage}" var="idx">
								<a href='qa_list${boardVo.makeSearch(idx)}&customer_id=${pageContext.request.userPrincipal.name }'
									<c:out value="${boardVo.page==idx?' class=active ':'' }"/>>
									${idx}</a>
							</c:forEach>

							<%--<a href='#'>1</a>
    	 <a href='list${pageMaker.makeSearch(2)}'>2</a>
    	<a href='#' class="active">3</a> --%>

							<c:if test="${boardVo.page != boardVo.totalEndPage}">
								<a href='qa_list${boardVo.makeSearch(boardVo.page+1)}&customer_id=${pageContext.request.userPrincipal.name }'>&gt;</a>
							</c:if>
							<c:if test="${boardVo.next }">
								<a href='qa_list${boardVo.makeSearch(boardVo.endPage+1)}&customer_id=${pageContext.request.userPrincipal.name }'>&gt;&gt;</a>

							</c:if>


							<c:if test="${boardVo.page != boardVo.totalEndPage}">
								<a href='qa_list${boardVo.makeSearch(boardVo.totalEndPage)}&customer_id=${pageContext.request.userPrincipal.name }'>&gt;&gt;&gt;</a>
							</c:if>

						</div>

						<script type="text/javascript">
							
						</script>
					</div>
					
				</div>

			</div>

		</div>

	</div>
</body>
</html>