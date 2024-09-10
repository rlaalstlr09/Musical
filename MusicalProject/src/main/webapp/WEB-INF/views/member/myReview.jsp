<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<html>
<head>
<title>my_review_page</title>
<style>
body {
    margin: 0;
    font-family: Arial, sans-serif;
    background-color: #f0f0f0;
    color: #333;
}

.sidebar {
    width: 250px;
    background-color: #fff;
    color: #000;
    height: 100vh;
    position: fixed;
    top: 0;
    left: 0;
    padding-top: 20px;
    border-right: 1px solid #ddd;
    box-shadow: 2px 0 5px rgba(0,0,0,0.1);
}

.sidebar .mypage {
    text-align: center;
    margin-bottom: 30px;
    font-size: 1.5em;
    padding-bottom: 10px;
    color: #333;
}

.sidebar a {
    display: block;
    color: #555;
    text-decoration: none;
    padding: 15px 20px;
    font-size: 1em;
    transition: background-color 0.3s ease;
    border-bottom: 1px solid #eee;
}

.sidebar a:hover {
    background-color: #f7f7f7;
    color: #333;
}

.main {
    margin-left: 280px;
    width: calc(100% - 280px);
    padding: 20px;
}

.review_content {
    position: relative;
    margin-top: 20px;
    margin-bottom: 20px;
    background-color: #ffffff;
    padding: 10px 20px 20px 20px;
    border: 1px solid #ddd;
    border-radius: 8px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    transition: box-shadow 0.3s ease, transform 0.3s ease;
    width: 800px;
    height: 180px;
}

.review_content:hover {
    box-shadow: 0 6px 12px rgba(0, 0, 0, 0.2);
    transform: translateY(-5px);
    z-index:1;
}

.button-container {
    position: absolute;
    bottom: 10px;
    right: 10px;
    opacity: 0;
    transition: opacity 0.3s ease;
}

.review_content:hover .button-container {
    opacity: 1;
}

.reviw_title {
    margin-bottom: 10px;
    font-size: 1.1em;
    font-weight: bold;
    color: #333;
}

.star_rating {
    display: inline-flex;
    flex-direction: row;
}

.star_rating .star {
    width: 30px;
    height: 30px;
    margin-right: 5px;
    background: url('../resources/img/star.png') no-repeat;
    background-size: cover;
    cursor: pointer;
}

.star_rating .star.on {
    background: url('../resources/img/full_star.png') no-repeat;
    background-size: cover;
}

.star_rating.read-only .star {
    pointer-events: none;
}


.date_star {
    text-align: right;
    font-size:0.9em;
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

.pagination a:hover:not(.active) {
    background-color: #ddd;
}

.pagination a:first-child {
    border-top-left-radius: 5px;
    border-bottom-left-radius: 5px;
}

.pagination a:last-child {
    border-top-right-radius: 5px;
    border-bottom-right-radius: 5px;
}

.update-form {
    display: none;
    position: absolute;
    top: 10px;
    right: 10px;
    width: 100%;
    max-width: 400px;
    background: #fff;
    padding: 20px;
    border-radius: 8px;
    border: 1px solid #ddd;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    z-index: 1000;
}

.update-form h2 {
    margin-top: 0;
    margin-bottom: 20px;
    font-size: 1.2em;
    color: #333;
}

.update-form input[type="text"], .update-form input[type="date"] {
    width: calc(100% - 22px);
    padding: 10px;
    margin-bottom: 15px;
    border: 1px solid #ddd;
    border-radius: 4px;
}

.update-form button {
    background-color: #4CAF50;
    color: white;
    border: none;
    padding: 10px 20px;
    border-radius: 4px;
    cursor: pointer;
    margin-right: 10px;
}

.update-form button.cancel {
    background-color: #f44336;
}

.update-form button:hover {
    opacity: 0.9;
}

.update-form button.cancel:hover {
    opacity: 0.9;
}
h1{
margin:0;
test
}
.content_header{
text-align: center;
}
</style>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
$(document).ready(function() {
    $('.pagination a').on('click', function(e) {
        e.preventDefault(); 

        var page = $(this).data('page');
        loadPage(page);
    });

    function loadPage(page) {
        $.ajax({
            url: 'myReview',
            type: 'GET',
            data: {
                page: page,
                customer_id: $('#customer_id').val()
            },
            success: function(response) {
                $('body').html(response);
            },
            error: function(xhr, status, error) {
                console.error('AJAX 요청 실패:', status, error);
            }
        });
    }

    $(".updateReview").click(function() {
        var updateForm = "#updateForm_" + $(this).data("id");
        $(updateForm).toggle();
    });

    $(".deleteReview").click(function() {
        var review_id = $(this).data("id");
        if (confirm('정말로 삭제하시겠습니까?')) {
        	$.ajax({
    			
    			url:'/ex/member/deleteReview',
    			type:'GET',
    			data:{
    				
    				customer_id:$('[name=customer_id]').val(),
    				
    				review_id:review_id
    				
    				
    			},
    			success:function(response){
    				$('body').html(response);
    				 
    			},
    			error: function(xhr, status, error) {
                    console.error('AJAX 요청 실패:', status, error);
    		
    			}
    		});
        }
    });

    $('.star_rating.read-only .star').off('click');

    $('.star_rating .star').click(function() {
    	 var value = $(this).data('value');
         var reviewId = $(this).closest('.review_content').find('input[name="review_id"]').val();
         var ratingInput = $('#rating_' + reviewId);

         $(this).siblings().removeClass('on');
         $(this).addClass('on').prevAll('.star').addClass('on');
         ratingInput.val(value);
    });

    $('form').on('submit', function(e) {
    	var ratingValue = $('#rating').val();
    	
	    if (ratingValue === "0") {
	        alert('별점을 설정해주세요');
	        return	
	    }
	    $.ajax({
			
			url:'/ex/member/updateReview',
			type:'GET',
			data:{
				content: $('[name=contnet]').val(), 
				musical_id : $('[name=musical_id]').val(),
				customer_id:$('[name=customer]').val(),
				rating:$('[name=rating]').val(),
				
				review_id:$('[name=review_id]').val(),
				review_date:$('[name=review_date]').val()
				
			},
			success:function(response){
				$('body').html(response);
				 $(this).hide();
			},
			error: function(xhr, status, error) {
                console.error('AJAX 요청 실패:', status, error);
		
			}
		});
    });
});
</script>
</head>
<body>
<div class="sidebar">

    <a href="/ex/member/myPage" class="mypage">마이페이지</a>
    <a href="/ex/member/read?customer_id=${pageContext.request.userPrincipal.name }" class="a">회원 정보</a>
    <a href="/ex/member/write" class="a">1:1문의</a>
    <a href="/ex/member/qa_list?customer_id=${pageContext.request.userPrincipal.name }" class="a">1:1문의내역</a>
    <a href="/ex/review/myReview?customer_id=${pageContext.request.userPrincipal.name }">내가 쓴 리뷰</a>
    <a href="#" class="a">장바구니</a>
    <a href="remove" class="a">회원탈퇴</a>
</div>


<div class="main"> 
    <h1>내가 쓴 리뷰</h1>
    <c:if test="${boardVo.totalCount == 0}">
        <p>등록된 리뷰가 없습니다.</p>
    </c:if>
    <c:if test="${roundRating ne 0}">
        <c:forEach items="${List }" var="reviewDto">
            <div class="review_content">
                <div class="reviw_title">
                    <div class="content_header"><h1>${reviewDto.musical_title}</h1></div>
                    <div class="date_star">
                        <fmt:formatDate pattern="yyyy-MM-dd"  value="${reviewDto.review_date}" />
                        &nbsp;&nbsp;|&nbsp;&nbsp; 
                        <div class="star_rating read-only">
                            <span class="star  ${reviewDto.rating >= 1 ? 'on' : '0'}"></span>
                            <span class="star  ${reviewDto.rating >= 2 ? 'on' : '0'}"></span>
                            <span class="star  ${reviewDto.rating >= 3 ? 'on' : '0'}"></span>
                            <span class="star  ${reviewDto.rating >= 4 ? 'on' : '0'}"></span>
                            <span class="star  ${reviewDto.rating >= 5 ? 'on' : '0'}"></span>
                        </div>
                    </div>
                    <div class="review_text">${reviewDto.content}</div>
                </div>
                <div class="button-container">
                    <button class="updateReview" data-id="${reviewDto.review_id}">수정</button>
                    <button class="deleteReview" data-id="${reviewDto.review_id}">삭제</button>
                </div>
                <div id="updateForm_${reviewDto.review_id}" class="update-form">
                    <h2>리뷰 수정</h2>
                    <form action="updateReview">
                    <div class="star_rating">
		                <span class="star ${reviewDto.rating >= 1 ? 'on' : '0'}"  data-value="1"></span>
		                <span class="star ${reviewDto.rating >= 2 ? 'on' : '0'}"  data-value="2"></span>
		                <span class="star ${reviewDto.rating >= 3 ? 'on' : '0'}"   data-value="3"></span>
		                <span class="star ${reviewDto.rating >= 4 ? 'on' : '0'}"  data-value="4"></span>
		                <span class="star ${reviewDto.rating >= 5 ? 'on' : '0'}"  data-value="5"></span>
            		</div>
                        <input type="hidden" value="${reviewDto.review_id}" name="review_id">
                        <input type="hidden" value="${reviewDto.musical_title}" name="musical_title">
                        <input type="hidden" value="${reviewDto.customer_id}" id="customer_id" name="customer_id">
                        <input type="hidden" value="${reviewDto.musical_id}" name="musical_id">
                        <label for="content_${reviewDto.review_id}">리뷰 내용:</label>
                        <input type="text" id="content_${reviewDto.review_id}" value="${reviewDto.content}" name="content">
                        <label for="rating_${reviewDto.review_id}">별점:</label>
                        <input type="hidden" id="rating_${reviewDto.review_id}" value="${reviewDto.rating}" name="rating">
                        <label for="review_date_${reviewDto.review_id}">리뷰 날짜:</label>
                        <input type="hidden" id="review_date_${reviewDto.review_id}" value="<fmt:formatDate value='${reviewDto.review_date}' pattern='yyyy-MM-dd'/>" name="review_date">
                        <button type="submit">수정</button>
                        <button type="button" class="cancel" onclick="$('#updateForm_${reviewDto.review_id}').hide()">취소</button>
                    </form>
                </div>
            </div>
        </c:forEach>
    </c:if>
    
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
