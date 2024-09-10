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
</head>
<body>

<div id = container>

   <h1>뮤지컬 목록</h1>
   
   <div class="swiper musical-like">
   <h2>인기 뮤지컬</h2>
	    <div class="swiper-wrapper">
	        <c:forEach var="likeMusical" items="${likeMusicals}">
	            <div class="swiper-slide">
	                <a class="link-container" href="detail/${likeMusical.musical_id}">
	                    <div class="musical-img-item" data-poster="/ex/resources/img/musical/${likeMusical.musical_poster}">
	                        <strong>${likeMusical.musical_title}</strong>
	                        <p>${likeMusical.venue_name}&nbsp;${likeMusical.hall_name}</p>
	                        <p><fmt:formatDate value="${likeMusical.musical_period_start}" pattern="yyyy-MM-dd" /> ~ <fmt:formatDate value="${likeMusical.musical_period_end}" pattern="yyyy-MM-dd"/></p>
	                        <p>♥&nbsp;${likeMusical.total_likes}</p>
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
	                        <strong>${dateMusical.musical_title}</strong>
	                        <p>${dateMusical.venue_name}&nbsp;${dateMusical.hall_name}</p>
	                        <p><fmt:formatDate value="${dateMusical.musical_period_start}" pattern="yyyy-MM-dd" /> ~ <fmt:formatDate value="${dateMusical.musical_period_end}" pattern="yyyy-MM-dd"/></p>
	                        <p>♥&nbsp;${dateMusical.total_likes}</p>
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
	<h2>전체 뮤지컬</h2><br>
	 <div class="sort-container">
	 
	    <ul class="sort-options">
	    	<li><a href = "#" class="sort-link" data-sort = "">기본정렬</a></li>
	    	<li><a href = "#" class="sort-link" data-sort = "title">이름순</a></li>
	    	<li><a href = "#" class="sort-link" data-sort = "like">좋아요순</a></li>
	    	<li><a href = "#" class="sort-link" data-sort = "period">공연날짜순</a></li>
	    </ul>
	    <button class="filter-button">필터</button>
    </div>
    
   	  
	<div class="filter-panel">
			<data id = "currentData" 
				data-keyword = "${keyword }" 
				data-age = "${filter.age }" 
				data-min = "${filter.minRunningtime }" 
				data-location = "${filter.location }" 
				data-start = "${filter.startDate }" 
				data-end = "${filter.endDate }"/>
		 <div class="dropdown mb-3">
		    <a class="dropdown-toggle" id="dropdownMenuAge" data-toggle="dropdown" aria-expanded="false">
		      	전체 연령
		    </a>
		    <ul class="dropdown-menu" aria-labelledby="dropdownMenuAge">
		      <li><a class="dropdown-item" href="#" data-filter="age" data-value="0">전체 연령</a></li>
		      <li><a class="dropdown-item" href="#" data-filter="age" data-value="5">5세 이상</a></li>
		      <li><a class="dropdown-item" href="#" data-filter="age" data-value="7">7세 이상</a></li>
		      <li><a class="dropdown-item" href="#" data-filter="age" data-value="12">12세 이상</a></li>
		      <li><a class="dropdown-item" href="#" data-filter="age" data-value="15">15세 이상</a></li>
		      <li><a class="dropdown-item" href="#" data-filter="age" data-value="18">18세 이상</a></li>
		    </ul>
		  </div>
		
		  <!-- Running Time Dropdown -->
		  <div class="dropdown mb-3">
		    <a class="dropdown-toggle" id="dropdownMenuRunningTime" data-toggle="dropdown" aria-expanded="false">
		      	전체 공연 시간
		    </a>
		    <ul class="dropdown-menu" aria-labelledby="dropdownMenuRunningTime">
		      <li><a class="dropdown-item" href="#" data-filter="minRunningtime" data-value="0">전체 공연 시간</a></li>
		      <li><a class="dropdown-item" href="#" data-filter="minRunningtime" data-value="90"> ~ 90분</a></li>
		      <li><a class="dropdown-item" href="#" data-filter="minRunningtime" data-value="91">91분 ~ 120분</a></li>
		      <li><a class="dropdown-item" href="#" data-filter="minRunningtime" data-value="121">121분 ~ 150분</a></li>
		      <li><a class="dropdown-item" href="#" data-filter="minRunningtime" data-value="151">151분 ~ 180분</a></li>
		      <li><a class="dropdown-item" href="#" data-filter="minRunningtime" data-value="181">180분 ~ </a></li>
		    </ul>
		  </div>
		
		  <!-- Location Dropdown -->
		  <div class="dropdown">
		    <a class="dropdown-toggle" id="dropdownMenuLocation" data-toggle="dropdown" aria-expanded="false">
		     	전체 지역
		    </a>
		    <ul class="dropdown-menu" aria-labelledby="dropdownMenuLocation">
		      <li><a class="dropdown-item" href="#" data-filter="location" data-value="">전체 지역</a></li>
		      <li><a class="dropdown-item" href="#" data-filter="location" data-value="서울">서울</a></li>
		      <li><a class="dropdown-item" href="#" data-filter="location" data-value="경기">경기</a></li>
		      <li><a class="dropdown-item" href="#" data-filter="location" data-value="인천">인천</a></li>
		      <li><a class="dropdown-item" href="#" data-filter="location" data-value="강원">강원</a></li>
		      <li><a class="dropdown-item" href="#" data-filter="location" data-value="경상">경상</a></li>
		      <li><a class="dropdown-item" href="#" data-filter="location" data-value="전라">전라</a></li>
		      <li><a class="dropdown-item" href="#" data-filter="location" data-value="충청">충청</a></li>
		    </ul>
		  </div>
	  		<input type="date" name = "startDate">
	  		<input type="date" name = "endDate">
	  
	</div>
  
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
	                <p class = "card-text"><fmt:formatDate value="${musical.musical_period_start}" pattern="yyyy-MM-dd" /> ~ <fmt:formatDate value="${musical.musical_period_end }" pattern = "yyyy-MM-dd"/></p>
	                <p class = "card-text">♥&nbsp;${musical.total_likes }</p>
                </div>
            </div>
        </c:forEach>
    </div>
   	<div id = "search">
   		<input type = "text" name = "keyword" value = "${keyword }">
   		<button class="filter">검색</button>
   	</div>
    
    <!-- 페이지 네비게이션 -->
    <div class="pagination">
    	<c:if test="${boardVo.page !=1}">
    		<a href='listAll${boardVo.makeSearch(1)}'>&lt;&lt;&lt;</a>
    	</c:if>
    	<!-- 앞전 page 모양을 클릭하면 pageMarker.startPage에 -1을 처리해준다.-->
    	<c:if test="${boardVo.prev }">
    		<a href='listAll${boardVo.makeSearch(boardVo.startPage-1)}'>&lt;&lt;</a>
    	</c:if>
    	<c:if test="${boardVo.page != 1}">
    		<a href='listAll${boardVo.makeSearch(boardVo.page-1)}'>&lt;</a>
    	</c:if>
    	<c:forEach begin="${boardVo.startPage }" end="${ boardVo.endPage}" var="idx">
    		<a href='listAll${boardVo.makeSearch(idx)}' 
    		 <c:out value="${boardVo.page==idx?' class=active ':'' }"/> >
    		 ${idx}</a>
    	</c:forEach>
    	
    	<%--<a href='#'>1</a>
    	 <a href='list${pageMaker.makeSearch(2)}'>2</a>
    	<a href='#' class="active">3</a> --%>
    	
    	<c:if test="${boardVo.page != boardVo.totalEndPage}">
    		<a href='listAll${boardVo.makeSearch(boardVo.page+1)}'>&gt;</a>
    	</c:if>
    	<c:if test="${boardVo.next }">
    		<a href='listAll${boardVo.makeSearch(boardVo.endPage+1)}'>&gt;&gt;</a>
    		
    	</c:if>
    	
    	
    	<c:if test="${boardVo.page != boardVo.totalEndPage}">
    		<a href='listAll${boardVo.makeSearch(boardVo.totalEndPage)}'>&gt;&gt;&gt;</a>
    	</c:if>
    	 <input type="hidden" id="currentKeyword" value="${keyword}">
    	 <input type="hidden" id="currentStartDate" value="${filter.startDate}">
    	 <input type="hidden" id="currentEndDate" value="${filter.endDate}">
    	 <input type="hidden" id="currentAge" value="${filter.age}">
    	 <input type="hidden" id="currentMinRunningtime" value="${filter.minRunningtime}">
    	 <input type="hidden" id="currentLocation" value="${filter.location}">
    </div>
</div>

</body>
</html>