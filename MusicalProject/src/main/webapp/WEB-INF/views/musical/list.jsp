<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<!DOCTYPE html>
<html>
<head>
 <link rel="stylesheet" href="/ex/resources/css/styles.css">
	<style>
		
        
    </style>
    <title>뮤지컬 목록</title>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script>
  
    	   
    </script>
</head>
<body>
<div id = container>
    <h1>뮤지컬 목록</h1>
    <ul>
    	<li><a href = "#" class="sort-link" data-sort = "">기본정렬</a></li>
    	<li><a href = "#" class="sort-link" data-sort = "title">이름순</a></li>
    	<li><a href = "#" class="sort-link" data-sort = "likes">좋아요순</a></li>
    	<li><a href = "#" class="sort-link" data-sort = "period">공연날짜순</a></li>
    </ul>
    
     <button class="filter-button">필터</button>
	    	  
        <div class="filter-panel">
            <table>
                <tr>
                	<th>연령 제한</th>
                	<th>공연시간</th>
                	<th>공연기간</th>
                </tr>
                <tr>
                	<td>
                		<select name = "age" class="form-select"  aria-label="Multiple select example">
						  <option value="0" selected>전체</option>
						  <option value="5">5세 이상</option>
						  <option value="7">7세 이상</option>
						  <option value="12">12세 이상</option>
						  <option value="15">15세 이상</option>
						  <option value="18">18세 이상</option>
						</select>
                	</td>
                	<td>
                		<select name = "minRunningtime" class="form-select"  aria-label="Multiple select example">
						  <option value = "0" selected>전체</option>
						  <option value="1"> ~ 90분</option>
						  <option value="91">91분 ~ 120분</option>
						  <option value="121">121분 ~ 150분</option>
						  <option value="151">151분 ~ 180분</option>
						  <option value="181">180분 ~ </option>
						</select>
                	</td>
                	<td>
                		<input type="date" name = "startDate">
                		<input type="date" name = "endDate">
                	</td>
                </tr>
            </table>
            <button class="filter">적용</button>
        </div>
    
	    <script src="/ex/resources/script/musicalList.js"></script>
    
     <div class="musical-grid">
        <c:forEach var="musical" items="${musicals}">
            <div class="musical-item">
                <a href="detail/${musical.musical_id}">
                    <img src="/ex/resources/${musical.musical_poster}" alt="poster">
                </a>
                <div>
                    <a href="detail/${musical.musical_id}">
                        <strong>${musical.musical_title}</strong>
                    </a>
                </div>
                <div>${musical.venue_name}&nbsp;${musical.hall_name }</div>
                <div><fmt:formatDate value="${musical.musical_period_start}" pattern="yyyy-MM-dd" /> ~ <fmt:formatDate value="${musical.musical_period_end }" pattern = "yyyy-MM-dd"/></div>
                <div>♥&nbsp;${musical.total_likes }</div>
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
    </div>
</div>
</body>
</html>