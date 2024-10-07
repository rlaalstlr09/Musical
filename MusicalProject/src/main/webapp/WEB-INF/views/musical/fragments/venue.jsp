<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>키워드로 장소검색하기</title>
    <style>
    #map {
    	position: relative; /* 또는 position: absolute; */
    	width: 100%;
    	height: 450px;
    	border : 1px solid #111;
    	border-radius: 16px;
	}
	
	.venue-info p{
		font-size:14px;
		margin-top : 5px;
	}
	
	.venue-info strong{
		font-size : 20px;
	}
    
    </style>
</head>
<body>
<div id="map-detail-info"></div>
<div id="map"></div>
<script type="text/javascript" src="https://dapi.kakao.com/v2/maps/sdk.js?appkey=f19069c7a5e6ecba64f00927cb2c6594&libraries=services"></script>
<script>
// 마커를 클릭하면 장소명을 표출할 인포윈도우입니다

	var infowindow = new kakao.maps.InfoWindow({zIndex:1});
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	    mapOption = {
	        center: new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
	        level: 3 // 지도의 확대 레벨
	    };  
	
	// 지도를 생성합니다    
	var map = new kakao.maps.Map(mapContainer, mapOption); 
	
	// 장소 검색 객체를 생성합니다
	var ps = new kakao.maps.services.Places(); 
	
	// 키워드로 장소를 검색합니다
	ps.keywordSearch('${param.venue_name}', placesSearchCB); 
	
	// 키워드 검색 완료 시 호출되는 콜백함수입니다
	function placesSearchCB(data, status, pagination) {
	    if (status === kakao.maps.services.Status.OK) {
	
	        // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
	        // LatLngBounds 객체에 좌표를 추가합니다
	        var bounds = new kakao.maps.LatLngBounds();
	
	        // 첫 번째 장소를 가져옵니다
	        var place = data[0];
	
	        displayMarker(place);    
	        bounds.extend(new kakao.maps.LatLng(place.y, place.x));
	
	        // 장소의 정보를 표시합니다
	        displayPlaceInfo(place);
	
	        // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
	        map.setBounds(bounds);
	    }
	}
	
	// 지도에 마커를 표시하는 함수입니다
	function displayMarker(place) {
	    
	    // 마커를 생성하고 지도에 표시합니다
	    var marker = new kakao.maps.Marker({
	        map: map,
	        position: new kakao.maps.LatLng(place.y, place.x) 
	    });
	
	    // 마커에 클릭이벤트를 등록합니다
	    kakao.maps.event.addListener(marker, 'click', function() {
	        // 마커를 클릭하면 장소명이 인포윈도우에 표출됩니다
	        infowindow.setContent('<div style="padding:5px;font-size:12px;">' + place.place_name + '</div>');
	        infowindow.open(map, marker);
	    });
	}
	
	// 장소의 정보를 표시하는 함수입니다
	function displayPlaceInfo(place) {
	    var content = '<div class = "venue-info">' +
	                  '<strong>' + place.place_name + '</strong>' +
	                  '<p>주소: ' + place.address_name + '</p>' +
	                  '<p>전화: ' + (place.phone || '정보 없음') + '</p>' +
	                  '<p>상세주소: ' + (place.road_address_name || '정보 없음') + '</p>' +
	                  '<p>카테고리: ' + place.category_name + '</p>' +
	                  '<p>웹사이트: <a href="' + (place.place_url || '#') + '" target="_blank">' + (place.place_url || '정보 없음') + '</a></p></div>';
	    
	    document.getElementById('map-detail-info').innerHTML = content;
	}

function relayout() {    
    
    // 지도를 표시하는 div 크기를 변경한 이후 지도가 정상적으로 표출되지 않을 수도 있습니다
    // 크기를 변경한 이후에는 반드시  map.relayout 함수를 호출해야 합니다 
    // window의 resize 이벤트에 의한 크기변경은 map.relayout 함수가 자동으로 호출됩니다
    ps.keywordSearch('${param.venue_name}' + ' ' + '${param.hall_name}', placesSearchCB); 
    map.relayout();
}

</script>
</body>
</html>
