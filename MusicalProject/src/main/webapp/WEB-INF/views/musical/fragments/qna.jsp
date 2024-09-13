<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<html>
<head>
<title>qna_page</title>
<style>


</style>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
	$(document).ready(function() {
		$('.pagination a').on('click', function(e) {
	        e.preventDefault(); // 기본 링크 동작 방지

	        var page = $(this).data('page'); // 클릭한 페이지 번호
	        loadPage(page);
	    });
		
		
		function loadPage(page) {
	        $.ajax({
	            url: '/ex/tab/review', // 페이지 로드 요청 URL
	            type: 'GET',
	            data: {
	                page: page, // 현재 페이지 번호
	                sort: $('#sort').val(), // 정렬 기준
	                musical_id: $('#musical_id').val() // 음악 ID
	            },
	            success: function(response) {
	                $('.card-body').html(response); // 받은 데이터를 콘텐츠에 업데이트


	              $('html, body').animate({
	                    scrollTop: $('.card-body').offset().top
	                }, 5); // 500ms 동안 스크롤 이동
	            },
	            error: function(xhr, status, error) {
	                console.error('AJAX 요청 실패:', status, error);
	            }
	        });
	    }
		
			
		
		$('#insertReview').click(function(e){
			e.preventDefault();
			var ratingValue = $('#rating').val();
		    if (ratingValue === "0") {
		        alert('별점을 설정해주세요');
		        return
		    }
			
			
			$.ajax({
				
				url:'/ex/review/insertReview',
				type:'GET',
				data:{
					content: $('#content').val(), 
					musical_id : $('#musical_id').val(),
					customer_id:$('#customer_id').val(),
					rating:$('#rating').val()
					
				},
				success:function(response){
					$('.card-body').html(response);
					 $("#reviewForm").hide();
				},
				error: function(xhr, status, error) {
	                console.error('AJAX 요청 실패:', status, error);
			
				}
			});
			
		});
		
			
		 	
		
		 $("#openReview").click(function() {
             $("#reviewForm").show();
             
             var offset = 500; // 하단에서 위로 이동할 거리 (픽셀 단위)
             var scrollToPosition = $('.card-body').offset().top + $('.card-body').outerHeight() - offset;

             $('html, body').animate({
                 scrollTop: scrollToPosition
             }, 500);
         });
		 
		 
		 
		
		 	
		
	});
</script>
</head>
<body>
	
<div class="main"> 
	
	    <c:if test = "${vo.totalcount == null  }">
	    	<p>등록된 QnA가 없습니다.</p><div id="open_qna"><input type="button" value="qna작성" id="openQna"></div>
	    </c:if>
	    <c:if test="${vo.totalcount ne null}">
		   <div class="qna_head">
		    
				
				
					<p>총 ${boardVo.totalCount }개의 리뷰가 등록되었습니다</p>
				
					<div id="open_Qna"><input type="button" value="QnA작성" id="openQna"></div>
				
			
			</div>
			
		<c:forEach items="${List }" var="QnaDto">
			<div class="qna_body">
				<div class="qna_title">
					<div class="qna_title">
						
	                
						<div class="nick_name">닉네임: ${QnaDto.customer_id} &nbsp;|&nbsp; 
					
					
					 	<fmt:formatDate pattern="yyyy-MM-dd"
							value="${QnaDto.qa_date}" />
						</div>
	                
	                </div>
	                <div class="qna_body">
	                	<p class="qna_text">${QnaDto.content}</p>
					</div>
					<div class="qna_response">
						<p> ${QnaDto.response}</p>
					</div>
				</div>
				<div id="updateForm_${QnaDto.qa_id}">
					<form action="updateQna">
						<input type="hidden" value=${QnaDto.qa_id } name="review_id" readonly>
						<input type="hidden" value=${QnaDto.customer_id } name="customer_id">
						<input type="hidden" value=${QnaDto.musical_id } name="musical_id">
						<input type="text" value=${QnaDto.title } name="content">
						<input type="text" value=${QnaDto.content } name="content">
						<input type="hidden" value=${QnaDto.response } name="response">
						<input type="date" value="<fmt:formatDate value='${reviewDto.review_date}' pattern='yyyy-MM-dd'/>" readonly >
						<label>비밀글</label>
						<input type="radio" value=${QnaDto.content } name="display">
						
	
					</form>
				</div>
				
	
			</div>
			
		</c:forEach>
	</c:if>
	<div id="qnaForm">
	
		
		
        <input type="hidden" id="rating"  value="0">
		<input type="hidden" name="customer_id" id="customer_id" value="test"> 
		
		<input type="hidden"name="musical_id" id="musical_id" value='${musical_id }'>
		<textarea id="content" name="content" placeholder="댓글을 입력하세요"></textarea>


		<br> <button id="insertQna">Qna 제출</button>
	
	</div>
	
	
	<div class="pagination">
    <c:if test="${boardVo.page != 1}">
        <a href="#" data-page="1">&lt;&lt;&lt;</a>
    </c:if>
    <c:if test="${boardVo.prev }">
        <a href="#" data-page="${boardVo.startPage-1}">&lt;&lt;</a>
    </c:if>
    <c:if test="${boardVo.page != 1}">
        <a href="#" data-page="${boardVo.page-1}">&lt;</a>
    </c:if>
    <c:forEach begin="${boardVo.startPage}" end="${boardVo.endPage}" var="idx">
        <a href="#" data-page="${idx}" class="${boardVo.page == idx ? 'active' : ''}">
            ${idx}
        </a>
    </c:forEach>
    <c:if test="${boardVo.page != boardVo.totalEndPage}">
        <a href="#" data-page="${boardVo.page+1}">&gt;</a>
    </c:if>
    <c:if test="${boardVo.next }">
        <a href="#" data-page="${boardVo.endPage+1}">&gt;&gt;</a>
    </c:if>
    <c:if test="${boardVo.page != boardVo.totalEndPage}">
        <a href="#" data-page="${boardVo.totalEndPage}">&gt;&gt;&gt;</a>
    </c:if>
</div>

</div>
</body>
</html>