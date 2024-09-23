<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>극장 수정</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://dapi.kakao.com/v2/maps/sdk.js?appkey=f51073ce5f2e4b9045c855f6e899592f&libraries=services"></script>
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/help_sytle.css">        
        <script src='<%=request.getContextPath()%>/resources/script/address_search.js'></script>
        <script src='<%=request.getContextPath()%>/resources/script/admin_modify.js'></script>
        <script src='<%=request.getContextPath()%>/resources/script/admin_check.js'></script>
<style>
        /* 카카오 지도 스타일 설정 */
        #map { width: 100%; height: 400px; }
        .places { list-style: none; padding: 0; margin: 0; }
        .places li { padding: 10px; border-bottom: 1px solid #ddd; cursor: pointer; }
        .places li:hover { background-color: #f0f0f0; }
    </style>

</head>
<body>
<jsp:include page="../layout/admin_header.jsp"/>
<div class="container">
    <button type="submit" class="btn btn-warning" style="" >&lt; 이전</button>
<br>
    <button class="viewBtn" value="${searchType}" data-file="${fileName}">view</button>
        <h4>극장 수정</h4>
    

    <form role="form" action="venue_modify" onsubmit='return checkVenue()' method="post" >
        <input type="hidden" name="fileName" value="${fileName}">
        
        <label>
            극장명 </label>
            <input type="text" id="place-name" name='venue_name' value="${VenueDto.venue_name}"  required>
            <button type="button" id="search-address">주소 검색</button>
        
        <br>
        <label for="address">주소:</label>
        <input type="text" id="address" name="venue_address" value="${VenueDto.venue_address}" readonly>
        <input type="hidden" id="longitude" name="longitude">
        <input type="hidden" id="latitude" name="latitude">
        <br>
        <button type="submit" class="signup">저장</button>
    </form>
</div>
<jsp:include page="../layout/footer.jsp"></jsp:include>
</body>
</html>
