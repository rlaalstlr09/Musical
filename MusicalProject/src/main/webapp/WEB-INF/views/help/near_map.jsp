<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Nearby Theaters</title>
    <script type="text/javascript">
    var contextPath = '${pageContext.request.contextPath}';
</script>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/map_musical_Info.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://dapi.kakao.com/v2/maps/sdk.js?appkey=f51073ce5f2e4b9045c855f6e899592f"></script>
    <script src='<%=request.getContextPath()%>/resources/script/map_script.js'></script>
        
    <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/slick-carousel/slick/slick.css"/>
	<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/slick-carousel/slick/slick-theme.css"/>
	<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/slick-carousel/slick/slick.min.js"></script>
</head>
<body>
    <h1 style="margin: 20px auto; text-align: left;">Nearby Theaters</h1>
    <div id="map" style="width:800px;height:400px;margin: 0 auto;"></div>
   
    
   <div class="common_wrap"></div>
    
</body>
</html>