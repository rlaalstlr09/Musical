<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<html>
<head>
<title>rivew_page</title>
<style>

.review_content {
	margin-top: 40px;
	margin-bottom: 40px
}
#reviewForm{
display:none;
}
 .star_rating {
        display: inline-flex;
        flex-direction: row;
    }
.avg_main{
 display: inline-flex;
  flex-direction: row;
}
    .star_rating .star {
        width: 30px;
        height: 30px;
        margin-right: 5px;
        background: url('/ex/resources/img/star.png') no-repeat;
        background-size: cover;
        cursor: pointer;
    }

    .star_rating .star.on {
        background: url('/ex/resources/img/full_star.png') no-repeat;
        background-size: cover;
    }

	.star_rating.read-only .star {
            pointer-events: none; /* 클릭 이벤트를 비활성화합니다 */
        }
     #starstar{
     margin-top:10px;
     margin-bottom:20px;
     }
   
        
    
.pagination {
  display: inline-block;
}


.pagination a {
  color: black;
  float: left;
  padding: 8px 16px;
  text-decoration: none;
  border: 1px solid #ddd;
}

.pagination a.active {
  background-color: #4CAF50;
  color: white;
  border: 1px solid #4CAF50;
}

.pagination a:hover:not(.active) {background-color: #ddd;}

.pagination a:first-child {
  border-top-left-radius: 5px;
  border-bottom-left-radius: 5px;
}

.pagination a:last-child {
  border-top-right-radius: 5px;
  border-bottom-right-radius: 5px;
}
[id^="updateForm"]{
display:none;
}
.sort-options{
margin-left:200px;}


#tab-content {
    /* 탭 부분이 고정된 위치에 있거나 페이지 상단에 있을 때 */
    position: relative; /* 또는 fixed */
    top: 0;
    width: 100%;
    /* 기타 필요한 스타일 */
}
</style>
<script>
	$(document).ready(function() {
		$(document).on('click', '.pagination a', function(e) {
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
	                $('#tab-content').html(response); // 받은 데이터를 콘텐츠에 업데이트

	                $('html, body').animate({
	                    scrollTop: $('#tab-content').offset().top
	                }, 5); // 500ms 동안 스크롤 이동
	            },
	            error: function(xhr, status, error) {
	                console.error('AJAX 요청 실패:', status, error);
	            }
	        });
	    }
		
		
		$('#sort').change(function(){
			var sortBy=$(this).val();
			$.ajax({
				
				url:'/ex/tab/review',
				type:'GET',
				data:{
					sort:sortBy,
					musical_id : '${musical_id}'	
				},
				success:function(response){
					$('#tab-content').html(response);
				},
				error: function(xhr, status, error) {
	                console.error('AJAX 요청 실패:', status, error);
			
				}
			});
		});
		
		
		
			    
		
		
		
		
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
					$('#tab-content').html(response);
					 $("#reviewForm").hide();
				},
				error: function(xhr, status, error) {
	                console.error('AJAX 요청 실패:', status, error);
			
				}
			});
			
		});
		
			
		 	
		
		 $("#openReview").click(function() {
             $("#reviewForm").toggle();
         });
		 
		 $(".updateReview").click(function() {
             var updateForm="#updateForm_"+$(this).data("id");
             
			 $(updateForm).toggle();
         });
		 
		 $(".deleteReview").click(function() {
				var review_id = $(this).data('review-id');
				if (confirm('정말로 삭제하시겠습니까?')) {
					window.location.href = "deleteReview?review_id=" + review_id;
				}
			});
		 
		 $('.star_rating.read-only .star').off('click');
		 
		 $('.star_rating .star').click(function() {
	            var value = $(this).data('value');
	            $(this).siblings().removeClass('on');
	            $(this).addClass('on').prevAll('.star').addClass('on');
	            $('#rating').val(value);
	        });
		
		 	
		
	});
</script>
</head>
<body>
	<h1>리뷰</h1>
<div class="main"> 
	<div class="sort-options">
	    <label for="sort">정렬 기준:</label>
	    <select id="sort" name="sort">
	        <option value="date" ${param.sort == 'date' ? 'selected' : ''}>최신순</option>
	        <option value="rating" ${param.sort == 'rating' ? 'selected' : ''}>평점순</option>
	    </select>
	    </div>
	    <c:if test = "${roundRating == null && avgRating == null }">
	    	<p>등록된 리뷰가 없습니다.</p>
	    </c:if>
	    <c:if test="${roundRating ne null && avgRating ne null }">
		    <div class="average-rating">
		    <p>총 ${boardVo.totalCount }개의 리뷰가 등록되었습니다</p>
				<div class="avg_main">
				<p>평균 평점:</p>
				<div class="star_rating read-only" id="starstar">
						
						 <span class="star on " style="width: ${roundRating >= 1 ? '30px' : '0'};"></span>
						 <span class="star on " style="width: ${roundRating >= 2 ? '30px' : '0'};"></span>
						 <span class="star on " style="width: ${roundRating >= 3 ? '30px' : '0'};"></span>
						 <span class="star on " style="width: ${roundRating >= 4 ? '30px' : '0'};"></span>
						 <span class="star on " style="width: ${roundRating >= 5 ? '30px' : '0'};"></span>
						
					
				</div>
				<p >${avgRating }</p>
			</div>
			</div>
		<c:forEach items="${List }" var="reviewDto">
			<div class="review_content">
				<div class="reviw_title">
					닉네임: ${reviewDto.customer_id}&nbsp;&nbsp;|&nbsp;&nbsp;
					<fmt:formatDate pattern="yyyy-MM-dd"
						value="${reviewDto.review_date}" />
					&nbsp;&nbsp;|&nbsp;&nbsp; 평점:
					 <div class="star_rating read-only">
	                    <span class="star on " style="width: ${reviewDto.rating >= 1 ? '30px' : '0'};"></span>
	                    <span class="star on" style="width: ${reviewDto.rating >= 2 ? '30px' : '0'};"></span>
	                    <span class="star on" style="width: ${reviewDto.rating >= 3 ? '30px' : '0'};"></span>
	                    <span class="star on" style="width: ${reviewDto.rating >= 4 ? '30px' : '0'};"></span>
	                    <span class="star on" style="width: ${reviewDto.rating >= 5 ? '30px' : '0'};"></span>
	                </div>
	                <p class="review_text">${reviewDto.content}</p>
				</div>
				
				<div id="updateForm_${reviewDto.review_id}">
				<form action="updateReview">
				<input type="hidden" value=${reviewDto.review_id } name="review_id" readonly>
				<input type="hidden" value=${reviewDto.customer_id } name="customer_id">
				<input type="hidden" value=${reviewDto.musical_id } name="musical_id">
				<input type="text" value=${reviewDto.content } name="content">
				<input type="hidden" value=${reviewDto.rating } name="rating">
				<input type="date" value="<fmt:formatDate value='${reviewDto.review_date}' pattern='yyyy-MM-dd'/>" >
				</form>
				</div>
				
	
			</div>
			
		</c:forEach>
	</c:if>
	<div id="reviewForm">
	
		 <div class="star_rating">
               <span class="star" data-value="1"></span>
               <span class="star" data-value="2"></span>
               <span class="star" data-value="3"></span>
               <span class="star" data-value="4"></span>
               <span class="star" data-value="5"></span>
           </div>
		
        <input type="hidden" id="rating"  value="0">
		<input type="hidden" name="customer_id" id="customer_id" value="test"> 
		
		<input type="hidden"name="musical_id" id="musical_id" value='${musical_id }'>
		<textarea id="content" name="content" placeholder="댓글을 입력하세요"></textarea>


		<br> <button id="insertReview">리뷰 제출</button>
	
	</div>
	<div><input type="button" value="리뷰작성" id="openReview"></div>
	
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