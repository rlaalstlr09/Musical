<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<html>
<head>
<title>my_qna_page</title>
<style>
body {
    font-family: Arial, sans-serif;
    background-color: #f4f4f4;
    margin: 0;
}

.main {
    margin-left: 280px;
    width: calc(100% - 280px);
    padding: 20px;
    background-color: #ffffff;
    box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
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
    background-color: #eaeaea;
    color: #333;
}

.qna_body {
    border: 1px solid #ddd;
    border-radius: 5px;
    margin-bottom: 20px;
    padding: 15px;
    background-color: #fafafa;
    box-shadow: 0 6px 12px rgba(0, 0, 0, 0.2);
   	transition: transform 0.2s ease;
    z-index:1;
}
.qna_body:hover{
transform: translateY(-5px);
}

.qna_title {
    display: flex;
    justify-content: space-between;
    align-items: center;
    margin-bottom: 10px;
}

.qna_text {
    display: flex;
    justify-content: space-between; /* 양쪽 끝에 정렬 */
    align-items: center; /* 수직 중앙 정렬 */
    margin-bottom: 10px;
}

.buttons {
    display: flex;
    gap: 10px; /* 버튼 사이 간격 추가 */
}

.qna_response {
    margin-top: 10px;
    font-style: italic;
    color: #777;
}

.update_qna, .delete_qna {
    background-color: #4CAF50;
    color: white;
    border: none;
    padding: 8px 12px;
    border-radius: 5px;
    cursor: pointer;
    transition: background-color 0.3s ease;
}

.update_qna:hover, .delete_qna:hover {
    background-color: #45a049;
}

.pagination {
    display: inline-block;
    margin-top: 20px;
}

.pagination a {
    color: black;
    float: left;
    padding: 8px 12px;
    text-decoration: none;
    border: 1px solid #ddd;
    margin: 0 2px;
    border-radius: 5px;
    transition: background-color 0.3s ease;
}

.pagination a.active {
    background-color: #4CAF50;
    color: white;
}

.pagination a:hover:not(.active) {
    background-color: #ddd;
}
[id^="isHide"]{
	
}
.qna_body:hover [id^="isHide"] {
    display: block; /* 호버 시 보이도록 설정 */
}
.qna_body{
width:800px;
}
.update-form {
    display: none;
    margin-top: 20px;
    padding: 15px;
    border: 1px solid #ddd;
    background: #f9f9f9;
    border-radius: 8px;
    box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
}

.update-form input[type="text"] {
    width: calc(100% - 22px);
    padding: 10px;
    border: 1px solid #ddd;
    border-radius: 5px;
    margin-bottom: 10px;
    font-size: 16px; /* 제목의 폰트 크기를 조정 */
    height: 30px; /* 제목의 높이를 조정 */
    transition: border-color 0.3s;
}

.update-form textarea {
    width: calc(100% - 22px);
    padding: 10px;
    border: 1px solid #ddd;
    border-radius: 5px;
    margin-bottom: 10px;
    font-size: 18px; /* 내용의 폰트 크기를 조정 */
    height: 120px; /* 내용의 높이를 조정 */
    transition: border-color 0.3s;
}

.update-form input[type="text"]:focus, 
.update-form textarea:focus {
    border-color: #007BFF;
    outline: none;
}

.update-form input[type="submit"] {
    width: 100%;
    padding: 10px;
    background: #007BFF;
    color: #fff;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    font-size: 16px;
    font-weight: bold;
    transition: background-color 0.3s;
}

.update-form input[type="submit"]:hover {
    background: #0056b3;
}
 .qna_response {
		    margin-top: 10px;
		    padding: 10px;
		    background: #e1e1e1; /* 연한 회색으로 변경 */
		    color: rgba(0, 0, 0, 0.5); /* 검정색을 50% 투명하게 */
		    border-radius: 5px;
		    
}
.title{
font-size: x-large;}


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

    $(".update_qna").click(function() {
        var updateForm = "#update_form_" + $(this).data("id");
        $(updateForm).toggle();
    });

    $(".delete_qna").click(function() {
        var qa_id = $(this).data("id");
        if (confirm('정말로 삭제하시겠습니까?')) {
        	$.ajax({
    			
    			url:'/ex/member/deleteQna',
    			type:'GET',
    			data:{
    				
    				
    				
    				qa_id:qa_id
    				
    				
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

   

    $('form').on('submit', function(e) {
    	e.preventDefault();
	    $.ajax({
			
			url:'/ex/member/updateQna',
			type:'GET',
			data:{
				content: $('[name=content]').val(), 
				musical_id : $('[name=musical_id]').val(),
				customer_id:$('[name=customer_id]').val(),
				title:$('[name=title]').val(),
				qa_date:$('[name=qa_date]').val(),
				display:$('[name=display]').val(),
				
				qa_id:$('[name=qa_id]').val(),
				
				
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

    <a href="myPage" class="mypage">마이페이지</a>
    <a href="read" class="a">회원 정보</a>
    <a href="write" class="a">1:1문의</a>
    <a href="qa_list" class="a">1:1문의내역</a>
    <a href="myReview">내가 쓴 리뷰</a>
    <a href="myQna">내가 쓴 Qna</a>
    <a href="#" class="a">장바구니</a>
    <a href="remove" class="a">회원탈퇴</a>
</div>


<div class="main"> 
    <h2>내가 쓴 Q&A</h2>
    <c:if test="${boardVo.totalCount == 0}">
        <p>등록된 Qna가 없습니다.</p>
    </c:if>
    <c:if test="${boardVo.totalCount ne 0}">
        <c:forEach items="${List }" var="QnaDto">
            	<div class="qna_body">
	                    <div class="qna_title" data-id="${QnaDto.qa_id }">
	                    	<div class="title" ><strong>${QnaDto.title }</strong></div>
	                        <div class="nick_name">
	                           <p>뮤지컬: ${QnaDto.musical_title }&nbsp;&nbsp;<fmt:formatDate pattern="yyyy-MM-dd" value="${QnaDto.qa_date}" /></p>
	                        </div>
	                    </div>
	                    <div id="isHide_${QnaDto.qa_id }">
		                    <div class="qna_text">
							    <div class="content">${QnaDto.content}</div>
							    <div class="buttons">
							        <c:if test="${QnaDto.customer_id == customer_id}">
							            <button class="update_qna" data-id="${QnaDto.qa_id}">수정</button>
							            <button class="delete_qna" data-id="${QnaDto.qa_id}">
							                <svg xmlns="http://www.w3.org/2000/svg" height="24px" viewBox="0 -960 960 960" width="24px" fill="#ffffff">
							                    <path d="M280-120q-33 0-56.5-23.5T200-200v-520h-40v-80h200v-40h240v40h200v80h-40v520q0 33-23.5 56.5T680-120H280Zm400-600H280v520h400v-520ZM360-280h80v-360h-80v360Zm160 0h80v-360h-80v360ZM280-720v520-520Z"/>
							                </svg>
								            </button>
								        </c:if>
								    </div>
								</div>
		                    <div class="qna_response">
			                    <c:if test="${QnaDto.response ne null}">
			                        <p>${QnaDto.response}</p>
			                    </c:if>
			                    <c:if test="${QnaDto.response == null}">
			                        <p>등록된 답변이 없습니다.</p>
			                    </c:if>
		                    </div>
	                    </div>
	                    	
		                    <div id="update_form_${QnaDto.qa_id }" class="update-form" data-id="${QnaDto.qa_id }">
   								<form action="/ex/qna/updateQna">
							        <input type="hidden" value="${QnaDto.qa_id }" name="qa_id">
							        <input type="hidden" value="${QnaDto.customer_id }" name="customer_id">
							        <input type="hidden" value="${QnaDto.musical_id }" name="musical_id">
							        <input type="hidden" value="<fmt:formatDate pattern="yyyy-MM-dd" value="${QnaDto.qa_date}" />" name="qa_date">
							        <input type="hidden" value="${QnaDto.display }" name="display">
							        <input type="text" value="${QnaDto.title }" name="title" placeholder="제목을 입력하세요">
							        <textarea name="content" placeholder="내용을 입력하세요">${QnaDto.content }</textarea>
							        <input type="submit" value="수정하기">
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
