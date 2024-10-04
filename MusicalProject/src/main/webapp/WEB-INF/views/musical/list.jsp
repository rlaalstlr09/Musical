<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<!DOCTYPE html>
<html>
<head>
 <link rel="stylesheet" href="/ex/resources/css/musical_list.css">
	<style>
    </style>
    <title>뮤지컬 목록</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
 
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@8/swiper-bundle.min.css">
<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
<script src="/ex/resources/script/musical_list.js"></script>
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20,400,0,0" />
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>
<body>
<jsp:include page="../layout/header.jsp"/>
<div id = container>

   <h1>뮤지컬 목록</h1>
   
   <div class="swiper musical-like">
   <h2>인기 뮤지컬</h2>
	    <div class="swiper-wrapper">
	        <c:forEach var="likeMusical" items="${likeMusicals}">
	            <div class="swiper-slide">
	                <a class="link-container" href="detail/${likeMusical.musical_id}">
	                    <div class="musical-img-item" data-poster="/ex/resources/img/musical/${likeMusical.musical_poster}">
	                    	<p class = "img-like"><span class="lp">❤</span>&nbsp;${likeMusical.total_likes}</p>	                    
	                        <p>${likeMusical.venue_name}&nbsp;${likeMusical.hall_name}</p>
	                        <p class = "l-grey"><fmt:formatDate value="${likeMusical.musical_period_start}" pattern="yyyy-MM-dd" /> ~ <fmt:formatDate value="${likeMusical.musical_period_end}" pattern="yyyy-MM-dd"/></p>
	                        
	                    </div>
	                </a>
	            </div>
	        </c:forEach>
	    </div>
	    <!-- 추가 네비게이션 -->
	    <div class="swiper-pagination page-like"></div>
	    <div class="swiper-button-next next-like"></div>
	    <div class="swiper-button-prev prev-like"></div>
    </div>
  	
  	<div class="swiper musical-date">
  	<h2>최근 오픈</h2>
	    <div class="swiper-wrapper">
	        <c:forEach var="dateMusical" items="${dateMusicals}">
	            <div class="swiper-slide">
	                <a class="link-container" href="detail/${dateMusical.musical_id}">
	                    <div class="musical-img-item" data-poster="/ex/resources/img/musical/${dateMusical.musical_poster}">
	                        <p class = "img-like"><span class="lp">❤</span>&nbsp;${dateMusical.total_likes}</p>
	                        <p>${dateMusical.venue_name}&nbsp;${dateMusical.hall_name}</p>
	                        <p class = "l-grey"><fmt:formatDate value="${dateMusical.musical_period_start}" pattern="yyyy-MM-dd" /> ~ <fmt:formatDate value="${dateMusical.musical_period_end}" pattern="yyyy-MM-dd"/></p>
	                        
	                    </div>
	                </a>
	            </div>
	        </c:forEach>
	    </div>
	    <!-- 추가 네비게이션 -->
	    <div class="swiper-pagination page-date"></div>
	    <div class="swiper-button-next next-date"></div>
	    <div class="swiper-button-prev prev-date"></div>
    </div>
	
	<div class = "list-title">
		<h2>전체 뮤지컬</h2>
		<div class="sort-container">
		    <button class="filter-button btn btn-outline-primary"><span class="material-symbols-outlined">tune</span></button>
	    </div>
    </div>
   
   	  
	<div class="filter-panel">
		
			
		<select id = "sortSelect" class="custom-select">
		   	<option class="sort-link" value = "">기본정렬</option>
		   	<option class="sort-link" value = "title">이름순</option>
		   	<option class="sort-link" value = "like">좋아요순</option>
		   	<option class="sort-link" value = "period">공연날짜순</option>
		</select>
		   
	    <select id="ageSelect" class="custom-select filter-item">
	      <option value="0">전체 연령</option>
	      <option value="5">5세 이상</option>
	      <option value="7">7세 이상</option>
	      <option value="12">12세 이상</option>
	      <option value="15">15세 이상</option>
	      <option value="18">18세 이상</option>
	    </select>
	  
		
		  
	    <select id="runningTimeSelect" class="custom-select filter-item">
	      <option value="0">전체 공연 시간</option>
	      <option value="90">~ 90분</option>
	      <option value="91">91분 ~ 120분</option>
	      <option value="121">121분 ~ 150분</option>
	      <option value="151">151분 ~ 180분</option>
	      <option value="181">180분 ~</option>
	    </select>
		  
		  
	    <select id="locationSelect" class="custom-select filter-item">
	      <option value="">전체 지역</option>
	      <option value="서울">서울</option>
	      <option value="경기">경기</option>
	      <option value="인천">인천</option>
	      <option value="강원">강원</option>
	      <option value="경상">경상</option>
	      <option value="전라">전라</option>
	      <option value="충청">충청</option>
	    </select>
		   
		<input type="date" name = "startDate" class = "filter-item">
		<input type="date" name = "endDate" class = "filter-item">
		
		<button class = "btn btn-danger reset">초기화</button>
	</div>
	
	 <data id = "currentData" 
			data-keyword = "${filter.keyword }" 
			data-age = "${filter.age }" 
			data-min = "${filter.minRunningtime }" 
			data-location = "${filter.location }" 
			data-start = "${filter.startDate }" 
			data-end = "${filter.endDate }"
			data-sort = "${filter.sort }">
	</data>
  
   	<div class="musical-grid">
   	
        <c:forEach var="musical" items="${musicals}">
            <div class="card musical-item">
                <a href="detail/${musical.musical_id}">
                    <img src="/ex/resources/img/musical/${musical.musical_poster}" class = "card-img-top" alt="poster">
                </a>
                <div class = "card-body">
                    <a href="detail/${musical.musical_id}">
                        <strong class = "card-title">${musical.musical_title}</strong>
                    </a>
                
	                <p class = "card-text">${musical.venue_name}&nbsp;${musical.hall_name }</p>
	                <p class = "card-text d-grey"><fmt:formatDate value="${musical.musical_period_start}" pattern="yyyy-MM-dd" /> ~ <fmt:formatDate value="${musical.musical_period_end }" pattern = "yyyy-MM-dd"/></p>
	                <p class = "card-text"><span class="lp">❤</span>&nbsp;${musical.total_likes }</p>
                </div>
            </div>
        </c:forEach>
    </div>
   	<div id = "search-container">
   		<input type = "text" class = "keyword" value = "${filter.keyword }">
   		<button class = "search-button"><span class="material-symbols-outlined">
			search
		</span></button>
   	</div>
    
    <!-- 페이지 네비게이션 -->
	<nav aria-label="Page navigation">
        <ul class="pagination">
            <c:if test="${boardVo.page != 1}">
                <li class="page-item">
                    <a class="page-link" href="#" data-page="1">&lt;&lt;</a>
                </li>
            </c:if>
            <c:if test="${boardVo.page != 1}">
                <li class="page-item">
                    <a class="page-link" href="#" data-page="${boardVo.page - 1}">&lt;</a>
                </li>
            </c:if>
            <c:forEach begin="${boardVo.startPage}" end="${boardVo.endPage}" var="idx">
                <li class="page-item ${boardVo.page == idx ? 'active' : ''}">
                    <a class="page-link" href="#" data-page="${idx}">${idx}</a>
                </li>
            </c:forEach>
            <c:if test="${boardVo.page != boardVo.totalEndPage}">
                <li class="page-item">
                    <a class="page-link" href="#" data-page="${boardVo.page + 1}">&gt;</a>
                </li>
            </c:if>
            <c:if test="${boardVo.page != boardVo.totalEndPage}">
                <li class="page-item">
                    <a class="page-link" href="#" data-page="${boardVo.totalEndPage}">&gt;&gt;</a>
                </li>
            </c:if>
        </ul>
    </nav>
    <div class="scroll-controls">
        <button class="scroll-to-top" id="scrollToTopBtn">
	        <span class="material-symbols-outlined">
				arrow_drop_up
			</span>
		</button>
        <button class="scroll-to-bottom" id="scrollToBottomBtn">
			<span class="material-symbols-outlined">
				arrow_drop_down
			</span>
			
		</button>
    </div>
    
</div>
<jsp:include page="../layout/footer.jsp"></jsp:include>
</body>
</html>