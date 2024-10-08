<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<html>
<head>
    <title>QnA Page</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            l	ine-height: 1.6;
            
            margin: 0;
            padding: 0;
        }

        .main {
            max-width: 900px;
            margin: 20px auto;
            padding: 20px;
            background: #fff;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }

        .qna_head {
            margin-bottom: 20px;
        }

        .qna_head p {
            font-size: 1.2em;
            margin: 0;
        }
        

        #openQna {
            margin-top: 10px;
        }

        .qna_body {
            margin-bottom: 20px;
            border: 1px solid #ddd;
            border-radius: 8px;
            background: #fafafa;
            padding: 15px;
            box-shadow: 0 0 5px rgba(0,0,0,0.1);
        }

        .qna_title {
            margin-bottom: 10px;
            border-bottom: 1px solid #ddd;
            padding-bottom: 10px;
            display: flex; /* 플렉스 박스를 활성화 */
    		justify-content: space-between; /* 두 요소를 양쪽 끝으로 정렬 */
        }

        .nick_name {
            font-weight: bold;
        }

        .qna_text {
            margin: 10px 0;
        }

        .qna_response {
		    margin-top: 10px;
		    padding: 10px;
		    background: #e1e1e1; /* 연한 회색으로 변경 */
		    color: rgba(0, 0, 0, 0.5); /* 검정색을 50% 투명하게 */
		    border-radius: 5px;
		    
}

        #updateForm {
            display: none;
            margin-top: 20px;
            padding: 15px;
            border: 1px solid #ddd;
            background: #f9f9f9;
            border-radius: 8px;
        }

        #updateForm input,
        #updateForm textarea {
            width: calc(100% - 22px);
            padding: 10px;
            margin-bottom: 10px;
            border: 1px solid #ddd;
            border-radius: 4px;
        }

        #qna_form {
            display: none;
            padding: 15px;
            border: 1px solid #ddd;
            background: #f9f9f9;
            border-radius: 8px;
        }

        #qna_form textarea {
            width: calc(100% - 22px);
            height: 100px;
        }

        .pagination {
            margin: 20px 0;
            text-align: center;
        }

        .pagination a {
            display: inline-block;
            padding: 10px 15px;
            margin: 0 2px;
            background: #000;
            color: #fff;
            text-decoration: none;
            border-radius: 4px;
        }

        .pagination a.active {
            background: lightgray;
        }

        .pagination a:hover {
            background: #0056b3;
        }

        #openReview {
            margin: 10px 0;
	}
	[id^="isHide"]{
	display:none;
	text-align: left;
}
.nick_name{
 font-weight: bold; /* 굵게 */
        color: rgba(0, 0, 0, 0.5); /* 검정색을 50% 투명하게 */
}
#qna_form {
    display: none;
    margin-top: 20px;
    padding: 15px;
    border: 1px solid #ddd;
    background: #f9f9f9;
    border-radius: 8px;
    box-shadow: 0 2px 8px rgba(0,0,0,0.1);
}

#qna_form input[type="text"]{
width: calc(100% - 22px);
    padding: 12px; /* 패딩 조정 */
    border: 1px solid #ddd;
    border-radius: 5px;
    margin-bottom: 10px;
    font-size: 18px; /* 글자 크기 조정 */
    height: 40px; /* 높이 조정 */
    transition: border-color 0.3s;} 
#qna_form textarea {
   width: calc(100% - 22px);
    padding: 12px; /* 패딩 조정 */
    border: 1px solid #ddd;
    border-radius: 5px;
    margin-bottom: 10px;
    font-size: 18px; /* 글자 크기 조정 */
    height: 120px; /* 높이 조정 */
    transition: border-color 0.3s;
}

#qna_form input[type="text"]:focus, 
#qna_form textarea:focus {
    border-color: #007BFF;
    outline: none;
}

#qna_form button {
    font-size: 16px;
    font-weight: bold;
    transition: background-color 0.3s;
}

#qna_form button:hover {
    background: #0056b3;
}
.display_check{
margin-bottom: 15px;
margin-left:12px;
text-align: left;
}
#insertQna{
width: 100%; 
padding: 10px; 
background: #000; 
color: #fff; 
border: none; 
border-radius: 5px; 
cursor: pointer;
}
.qna_text {
    display: flex; /* 플렉스 박스 사용 */
    justify-content: space-between; /* 양쪽 끝으로 정렬 */
    align-items: center; /* 수직 중앙 정렬 */
}
.qna_text button {
    padding: 8px 12px;
    margin-right: 5px; /* 버튼 간 간격 추가 */
    border: none;
    border-radius: 4px;
    font-size: 14px;
    cursor: pointer;
    transition: background-color 0.3s, color 0.3s;
    margin-left: 5px; /* 버튼 간 간격 */
}
.qna_text .buttons {
    margin-left: auto; /* 버튼을 오른쪽으로 밀어줌 */
}


.qna_text button:active {
    background-color: #0056b3; /* 클릭 시 더 어두운 파란색 */
    transform: scale(0.98); /* 클릭 시 살짝 작아지는 효과 */
}

/* 수정 및 삭제 버튼에 대한 특정 스타일 */
.update_qna {
    background-color: #007BFF; 
    color: white	; 
    height:40px;
    width:52px;
    padding:6px;
    font-weight: bold;
}
.update_qna:hover{
background-color: lightblue;
}

.delete_qna {
    background-color: #DC3545; /* 빨간색 배경 */
    color: #fff; /* 흰색 텍스트 */
    
}
.delete_qna:hover{
background-color: lightpink;
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
	display : block;
    width: 100%;
    padding: 10px;
    border: 1px solid #ddd;
    border-radius: 5px;
    margin-bottom: 10px;
    font-size: 16px; /* 제목의 폰트 크기를 조정 */
    height: 30px; /* 제목의 높이를 조정 */
    transition: border-color 0.3s;
}

.update-form textarea {
	display : block;
    width: 100%;
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
                    url: '/ex/tab/qna', // 페이지 로드 요청 URL
                    type: 'GET',
                    data: {
                        page: page, // 현재 페이지 번호
                        musical_id: $('#musical_id').val() // 음악 ID
                    },
                    success: function(response) {
                        $('.card-body').html(response); // 받은 데이터를 콘텐츠에 업데이트

                        $('html, body').animate({
                            scrollTop: $('.card-body').offset().top
                        }, 500); // 500ms 동안 스크롤 이동
                    },
                    error: function(xhr, status, error) {
                        console.error('AJAX 요청 실패:', status, error);
                    }
                });
            }

            $('#insertQna').click(function(e) {
                e.preventDefault();
                var displayValue = $('#display_checkbox').is(':checked') ? 0 : 1;
                
                $.ajax({
                    url: '/ex/qna/insertQna',
                    type: 'GET',
                    data: {
                    	content: $('#content').val(), 
                        musical_id: $('#musical_id').val(),
                       	title: $('#title').val(),
                        display: displayValue
                    },
                    success: function(response) {
                        $('.card-body').html(response);
                        $("#qna_form").hide();
                        var offset = 1300; // 하단에서 위로 이동할 거리 (픽셀 단위)
                        var scrollToPosition = $('.card-body').offset().top + $('.card-body').outerHeight() - offset;

                        $('html, body').animate({
                            scrollTop: scrollToPosition
                        }, 500);
                    },
                    error: function(xhr, status, error) {
                        console.error('AJAX 요청 실패:', status, error);
                    }
                });
            });

            $("#open_qna").click(function() {
                
				var islogin='${role}';
                var offset = 700; // 하단에서 위로 이동할 거리 (픽셀 단위)
                var scrollToPosition = $('.card-body').offset().top + $('.card-body').outerHeight() - offset;
				
                if(islogin===""){
                	alert("로그인 후 가능합니다.");
                	return;
                }else{
                	$("#qna_form").show();
                	 $('html, body').animate({
                         scrollTop: scrollToPosition
                     }, 500);
                }
               
            });
            
            $(".qna_title").click(function() {
                var hide=$(this).data('id');
            	$("#isHide_"+hide).toggle();


                
            });
            
            $(".update_qna").click(function() {
                var update_form = "#update_form_" + $(this).data("id");
                $(update_form).toggle();
            });
            
            $('form').on('submit', function(e) {
            	e.preventDefault();
        	    $.ajax({
        			
        			url:'/ex/qna/updateQna',
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
        				$('.card-body').html(response);
        				 $(this).hide();
        			},
        			error: function(xhr, status, error) {
                        console.error('AJAX 요청 실패:', status, error);
        		
        			}
        		});
            });

            $(".delete_qna").click(function() {
                var qa_id = $(this).data("id");
                if (confirm('정말로 삭제하시겠습니까?')) {
                	$.ajax({
            			
            			url:'/ex/qna/deleteQna',
            			type:'GET',
            			data:{
            				
            				musical_id:$('[name=musical_id]').val(),
            				
            				qa_id:qa_id
            				
            				
            			},
            			success:function(response){
            				$('.card-body').html(response);
            				 
            			},
            			error: function(xhr, status, error) {
                            console.error('AJAX 요청 실패:', status, error);
            		
            			}
            		});
                }
            });
            
            $(".response_btn").click(function(){
            	var qa_id=$(this).data("id");
            	
            	
            	$.ajax({
            		
            		url:'/ex/qna/adResponse',
            		type:'GET',
            		data:{
            			res:$('#ad_response_'+qa_id).val(),
            			qa_id:qa_id,
            			musical_id:$('#musical_id').val()
            		},
            		success:function(response){
            			$('.card-body').html(response);
            		},
            		error:function(shr, status,error){
            			console.error('실패', status, error);
            		}
            	})
            }
            		);
        });
    </script>
</head>
<body>
    <div class="main">
        <c:if test="${boardVo.totalCount == null}">
            <p>등록된 QnA가 없습니다.</p>
            <div id="open_qna"><input type="button" value="QnA 작성" id="openQna"></div>
        </c:if>
        <c:if test="${boardVo.totalCount ne null}">
            <div class="qna_head">
                <p><strong>총 ${boardVo.totalCount}개의 Qna가 등록되었습니다</strong></p><br>
                <div id="open_qna"><input type="button" value="QnA 작성" ></div>
            </div>
            <c:forEach items="${List}" var="QnaDto">
            	<c:if test="${(QnaDto.display == 0 && QnaDto.customer_id == customer_id) || (QnaDto.display == 0 && role == 'ROLE_ADMIN')}">
	            	
	            	<div class="qna_body">
	                    <div class="qna_title" data-id="${QnaDto.qa_id }">
	                    	<div class="title" ><strong>${QnaDto.title }</strong></div>
	                        <div class="nick_name">닉네임: ${QnaDto.customer_id} &nbsp;|&nbsp;
	                            <fmt:formatDate pattern="yyyy-MM-dd" value="${QnaDto.qa_date}" />
	                        </div>
	                    </div>
	                    <div id="isHide_${QnaDto.qa_id }">
		                    <div class="qna_text">
		                    	<div>${QnaDto.content}</div>
		                   	 	<c:if test="${QnaDto.customer_id == customer_id}">
		                    		<div><button class="update_qna" data-id="${QnaDto.qa_id }">수정</button >
		                    		<button class="delete_qna" data-id="${QnaDto.qa_id }"><svg xmlns="http://www.w3.org/2000/svg" height="24px" viewBox="0 -960 960 960" width="24px" fill="#ffffff"><path d="M280-120q-33 0-56.5-23.5T200-200v-520h-40v-80h200v-40h240v40h200v80h-40v520q0 33-23.5 56.5T680-120H280Zm400-600H280v520h400v-520ZM360-280h80v-360h-80v360Zm160 0h80v-360h-80v360ZM280-720v520-520Z"/></svg></button></div>
		                    	</c:if>
		                    </div>
		                    <div class="qna_response">
			                    <c:if test="${QnaDto.response ne null}">
			                        <p>${QnaDto.response}</p>
			                    </c:if>
			                    <c:if test="${QnaDto.response == null}">
			                        <p>등록된 답변이 없습니다.</p>
			                    </c:if>
			                    <c:if test="${role == 'ROLE_ADMIN'}">
			                    <input type="text" id="ad_response_${QnaDto.qa_id }">
			                    <button class="response_btn" data-id="${QnaDto.qa_id }">답변 달기</button>
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
	            	</c:if>	            	       
            	<c:if test="${QnaDto.display == 1}">
	                <div class="qna_body">
	                    <div class="qna_title" data-id="${QnaDto.qa_id }">
	                    	<div class="title" ><strong>${QnaDto.title }</strong></div>
	                        <div class="nick_name">닉네임: ${QnaDto.customer_id} &nbsp;|&nbsp;
	                            <fmt:formatDate pattern="yyyy-MM-dd" value="${QnaDto.qa_date}" />
	                        </div>
	                    </div>
	                    <div id="isHide_${QnaDto.qa_id }">
	                    <div class="qna_text"><div>${QnaDto.content}</div>
	                    <c:if test="${QnaDto.customer_id == customer_id}">
		                    		<div><button class="update_qna" data-id="${QnaDto.qa_id }">수정</button >
		                    		<button class="delete_qna" data-id="${QnaDto.qa_id }"><svg xmlns="http://www.w3.org/2000/svg" height="24px" viewBox="0 -960 960 960" width="24px" fill="#ffffff"><path d="M280-120q-33 0-56.5-23.5T200-200v-520h-40v-80h200v-40h240v40h200v80h-40v520q0 33-23.5 56.5T680-120H280Zm400-600H280v520h400v-520ZM360-280h80v-360h-80v360Zm160 0h80v-360h-80v360ZM280-720v520-520Z"/></svg></button></div>
		                    	</c:if>
	                    </div>
	                    <div class="qna_response">
	                    <c:if test="${QnaDto.response ne null}">
	                        <p>${QnaDto.response}</p>
	                    </c:if>
	                    <c:if test="${QnaDto.response == null}">
	                        <p>등록된 답변이 없습니다.</p>
	                    </c:if>
	                    <c:if test="${role == 'ROLE_ADMIN'}">
			                    <input type="text" id="ad_response_${QnaDto.qa_id }">
			                    <button class="response_btn" data-id="${QnaDto.qa_id }">답변 달기</button>
			                    </c:if>
	                    </div>
	                    </div>
	                    <c:if test="${QnaDto.customer_id == customer_id}">
	                     <div id="update_form_${QnaDto.qa_id }" class="update-form" data-id="${QnaDto.qa_id }">
   								<form action="/ex/qna/update_qna">
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
		                    </c:if> 
	                </div>
                </c:if>
                <c:if test="${(QnaDto.display == 0 && QnaDto.customer_id != customer_id) && (role != 'ROLE_ADMIN')}">
                <div class="qna_body">
                <p>비밀글 입니다.</p>
                </div>
                </c:if>
            </c:forEach>
            <div id="qna_form">
				    <h3 style="text-align: center;">Qna 작성</h3>
				    <input type="hidden" name="musical_id" id="musical_id" value='${musical_id}'>
				    <input type="text" name="title" id="title" placeholder="제목을 입력하세요" style="margin-bottom: 10px;"><br>
				    <textarea id="content" name="content"  placeholder="댓글을 입력하세요" style="margin-bottom: 10px;"></textarea>
				    <div id="display_check">
				       
				        <label>
				        	
				            <input id="display_checkbox" type="checkbox" name="display" value="0" > 비공개
				        </label>
				        
				    </div>
				    <button id="insertQna" >
				        QnA 제출
				    </button>
					</div>
        </c:if>
		
        

        <div class="pagination">
            <c:if test="${boardVo.page != 1}">
                <a href="#" data-page="1">&lt;&lt;&lt;</a>
            </c:if>
            <c:if test="${boardVo.prev}">
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
            <c:if test="${boardVo.next}">
                <a href="#" data-page="${boardVo.endPage+1}">&gt;&gt;</a>
            </c:if>
            <c:if test="${boardVo.page != boardVo.totalEndPage}">
                <a href="#" data-page="${boardVo.totalEndPage}">&gt;&gt;&gt;</a>
            </c:if>
        </div>
    </div>
</body>
