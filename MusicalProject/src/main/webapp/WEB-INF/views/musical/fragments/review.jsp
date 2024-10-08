<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<html>
<head>
<title>rivew_page</title>
<style>

body {
    font-family: Arial, sans-serif; /* 기본 폰트 변경 */
    line-height: 1.6; /* 기본 줄 높이 */
    margin: 0;
    padding: 0;
}

.main {
    max-width: 1200px; /* 최대 너비를 설정하여 콘텐츠 중앙 정렬 */
    margin: 0 auto; /* 중앙 정렬 */
    padding: 20px;
}

/* 리뷰 내용 스타일 */
.review_content {
    margin-top: 20px; /* 여백 줄이기 */
    margin-bottom: 20px; /* 여백 줄이기 */
    background-color: #ffffff; /* 배경색 */
    padding: 5px;20px;20px;20px; /* 내부 여백 */
    border: 1px solid #ddd; /* 테두리 */
    border-radius: 8px; /* 모서리 둥글게 */
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); /* 그림자 */
    transition: box-shadow 0.3s ease, transform 0.3s ease; /* 부드러운 전환 효과 */
    width:90%;
}

.review_content:hover {
    box-shadow: 0 6px 12px rgba(0, 0, 0, 0.2); /* 호버 시 그림자 효과 */
    transform: translateY(-5px); /* 호버 시 약간 위로 이동 */
}

/* 리뷰 제목 */
.reviw_title {
    margin-bottom: 10px; /* 제목과 내용 사이 여백 */
    font-size: 1.1em; /* 제목 폰트 크기 */
    font-weight: bold; /* 제목 굵게 */
    color: #333; /* 제목 색상 */
}
#reviewForm{
display:none;
}
 .star_rating {
        display: inline-flex;
        flex-direction: row;
    }
.avg_main{
 display: flex;
  flex-direction: row;
  justify-content: center;
 
}
    .star_rating .star {
        width: 25px;
        height: 27px;
        margin-right: 0px;
        background: url('/ex/resources/img/star.png') no-repeat;
        background-size: cover;
        cursor: pointer;
    }
     .star.big_star {
     width:80px;
     height:80px;
     }

    .star_rating .star.on {
        background: url('/ex/resources/img/full_star.png') no-repeat;
        background-size: cover;
    }
	.star.on.big_star{
	height:30px;
	}
.star.big_star.bstar{
height:80px;}

	.star_rating.read-only .star {
            pointer-events: none; /* 클릭 이벤트를 비활성화합니다 */
        }
     #starstar{
     margin-top:0px;
     margin-bottom:0px;
     }
   .sttar{
   margin-top:0px;
   margin-left:8px;
   }
        
    
.pagination {
  display: inline-block;
}
.average-rating{
text-align:center;
font-size:1.5em;
font-weight:bold;
}


.pagination a {
  color: black;
  float: left;
  padding: 8px 16px;
  text-decoration: none;
  border: 1px solid #ddd;
}

.pagination a.active {
  background-color: #000;
  color: white;
  border: 1px solid #fff;
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
text-align:right;
width:95%;
}

.card-body {
    /* 탭 부분이 고정된 위치에 있거나 페이지 상단에 있을 때 */
    position: relative; /* 또는 fixed */
    top: 0;
    width: 100%;
    /* 기타 필요한 스타일 */
}

.review_body{
margin-top:20px;
}

#reviewForm {
    display: none; /* 기본적으로 숨김 상태 */
    border: 1px solid #ddd; /* 경계 추가 */
    border-radius: 8px; /* 경계 반경 추가 */
    padding: 20px; /* 내부 여백 추가 */
    background-color: #fff; /* 배경 색상 변경 */
    box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1); /* 그림자 추가 */
    height:400px;
}

#reviewForm textarea {
    width: 100%; /* 전체 너비 설정 */
    height: 100px; /* 높이 설정 */
    padding: 10px; /* 내부 여백 추가 */
    border: 1px solid #ddd; /* 경계 추가 */
    border-radius: 5px; /* 경계 반경 추가 */
    margin-bottom: 10px; /* 하단 여백 추가 */
}

#reviewForm button {
    background-color: #4CAF50; /* 버튼 배경 색상 변경 */
    color: white; /* 버튼 텍스트 색상 변경 */
    border: none; /* 경계 제거 */
    padding: 10px 20px; /* 패딩 추가 */
    border-radius: 5px; /* 경계 반경 추가 */
    cursor: pointer; /* 커서 모양 변경 */
    font-size: 1em; /* 글씨 크기 설정 */
}

#reviewForm button:hover {
    background-color: #45a049; /* 버튼 호버 시 배경 색상 변경 */
}

/* 리뷰 작성 버튼 스타일 */
#openReview {
    background-color: #000; /* 버튼 배경 색상 변경 */
    color: white; /* 버튼 텍스트 색상 변경 */
    border: none; /* 경계 제거 */
    padding: 20px 20px 20px 17px; /* 패딩 추가 */
    border-radius: 5px; /* 경계 반경 추가 */
    cursor: pointer; /* 커서 모양 변경 */
    font-size: 17px; 
    width:100px;
    height:50px;
    line-height: 17px; /* 버튼 높이와 동일하게 설정하여 텍스트 수직 중앙 정렬 */
    text-align: center;
}
#open-Review {
    position: absolute;
    right:50px; /* 오른쪽 끝으로 배치 */
    
}
#openReview:hover {
    background-color: lightpink; /* 버튼 호버 시 배경 색상 변경 */
}


/* 업데이트 폼 스타일 */
[id^="updateForm"] {
    display: none; /* 기본적으로 숨김 상태 */
    border: 1px solid #ddd; /* 경계 추가 */
    border-radius: 8px; /* 경계 반경 추가 */
    padding: 15px; /* 내부 여백 추가 */
    background-color: #fff; /* 배경 색상 변경 */
    box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1); /* 그림자 추가 */
}

[id^="updateForm"] input {
    display: block; /* 블록 요소로 변경 */
    width: calc(100% - 20px); /* 너비 설정 */
    margin: 10px 0; /* 상하 여백 추가 */
    padding: 10px; /* 내부 여백 추가 */
    border: 1px solid #ddd; /* 경계 추가 */
    border-radius: 5px; /* 경계 반경 추가 */
}

[id^="updateForm"] input[type="date"] {
    width: auto; /* 날짜 입력 필드 너비 설정 */
}
.review_header {
    display: flex; /* 플렉스 박스를 활성화 */
    justify-content: space-between; /* 두 요소를 양쪽 끝으로 정렬 */
    align-items: center; /* 수직 정렬을 중앙으로 */
   
    
}
.nick_name{
font-size:85%;
margin-right:10px;

}
.review_text{
font-size:80%;
margin-left:10px;
text-align:left;
margin-top:10px;
}
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
	                musical_id: $('#musical_id').val() 
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
					$('.card-body').html(response);
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
             
             var islogin = '${customer_id}';
            
			 if(islogin===""){
				 alert("로그인 후 가능합니다");
				 return;
			 }else{
				 $("#reviewForm").show();
				 var offset = 700; // 하단에서 위로 이동할 거리 (픽셀 단위)
	             var scrollToPosition = $('.card-body').offset().top + $('.card-body').outerHeight() - offset;
	             $('html, .card-body').animate({
	                 scrollTop: scrollToPosition
	             }, 500);
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
	
<div class="main"> 
	
	    <c:if test = "${roundRating == null && avgRating == null }">
	    	<p>등록된 리뷰가 없습니다.</p><div id="open-Review"><input type="button" value="리뷰작성" id="openReview"></div>
	    </c:if>
	    <c:if test="${roundRating ne null && avgRating ne null }">
		    <div class="average-rating">
		    <p>총 ${boardVo.totalCount }개의 리뷰가 등록되었습니다</p>
				<div class="avg_main">
				<p>평균 평점:</p>&nbsp;
				<p >${avgRating }</p>&nbsp;&nbsp;
				<div class="star_rating read-only" id="starstar">
						
						 <span class="star on big_star" style="width: ${roundRating >= 1 ? '30px' : '0'};"></span>
						 <span class="star on big_star" style="width: ${roundRating >= 2 ? '30px' : '0'};"></span>
						 <span class="star on big_star" style="width: ${roundRating >= 3 ? '30px' : '0'};"></span>
						 <span class="star on big_star" style="width: ${roundRating >= 4 ? '30px' : '0'};"></span>
						 <span class="star on big_star" style="width: ${roundRating >= 5 ? '30px' : '0'};"></span>
						
					
				</div>
				
				<div id="open-Review"><input type="button" value="리뷰작성" id="openReview"></div>
			</div>
			
			</div>
			<div class="sort-options">
	    <label for="sort">정렬 기준:</label>
	    <select id="sort" name="sort">
	        <option value="date" ${param.sort == 'date' ? 'selected' : ''}>최신순</option>
	        <option value="rating" ${param.sort == 'rating' ? 'selected' : ''}>평점순</option>
	    </select>
	    </div>
		<c:forEach items="${List }" var="reviewDto">
			<div class="review_content">
				<div class="reviw_title">
					<div class="review_header">
						<div class="star_rating read-only sttar">
	                    	<span class="star  ${reviewDto.rating >= 1 ? 'on' : '0'}"></span>
	                    	<span class="star  ${reviewDto.rating >= 2 ? 'on' : '0'}"></span>
	                    	<span class="star  ${reviewDto.rating >= 3 ? 'on' : '0'}"></span>
	                    	<span class="star  ${reviewDto.rating >= 4 ? 'on' : '0'}"></span>
	                    	<span class="star  ${reviewDto.rating >= 5 ? 'on' : '0'}"></span>
	                	</div>
	                
						<div class="nick_name">아이디: ${reviewDto.customer_id} &nbsp;|&nbsp; 
					
					
					 	<fmt:formatDate pattern="yyyy-MM-dd"
							value="${reviewDto.review_date}" />
						</div>
	                
	                </div>
	                <div class="review_body">
	                	<p class="review_text">${reviewDto.content}</p>
					</div>
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
	
		 <div class="star_rating restar">
               <span class="star big_star bstar" data-value="1"></span>
               <span class="star big_star bstar" data-value="2"></span>
               <span class="star big_star bstar" data-value="3"></span>
               <span class="star big_star bstar" data-value="4"></span>
               <span class="star big_star bstar" data-value="5"></span>
           </div>
		<br>
        <input type="hidden" id="rating"  value="0">
		 
		
		<input type="hidden"name="musical_id" id="musical_id" value='${musical_id }'>
		<textarea id="content" name="content" placeholder="댓글을 입력하세요"></textarea>


		<br> <button id="insertReview">리뷰 제출</button>
	
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