$(document).ready(function() {
        $('#search-address').on('click', function() {
            const placeName = $('#place-name').val().trim();

            if (placeName) {
                const mapWindow = window.open("", "mapWindow", "width=600,height=500");
                mapWindow.document.write(`
                    <html>
                    <head>
                        <title>지도 검색</title>
                        <style>
                            #map { width: 100%; height: 400px; }
                            .places { list-style: none; padding: 0; margin: 0; }
                            .places li { padding: 10px; border-bottom: 1px solid #ddd; cursor: pointer; }
                            .places li:hover { background-color: #f0f0f0; }
                        </style>
                    </head>
                    <body>
                        <div id="map"></div>
                        <ul id="placesList" class="places"></ul>
                        <script src="https://dapi.kakao.com/v2/maps/sdk.js?appkey=f51073ce5f2e4b9045c855f6e899592f&libraries=services"></script>
                        <script>
                            let map = new kakao.maps.Map(document.getElementById('map'), {
                                center: new kakao.maps.LatLng(33.450701, 126.570667),
                                level: 3
                            });
                            let ps = new kakao.maps.services.Places();
                            let infowindow = new kakao.maps.InfoWindow({zIndex: 1});

                            ps.keywordSearch('${placeName}', function(data, status) {
                                if (status === kakao.maps.services.Status.OK) {
                                    const placesList = document.getElementById('placesList');
                                    placesList.innerHTML = '';
                                    
                                    // 검색 결과 위치에 마커 추가
                                    data.forEach(function(place, index) {
                                        const position = new kakao.maps.LatLng(place.y, place.x);
                                        const marker = new kakao.maps.Marker({
                                            map: map,
                                            position: position
                                        });

                                        // 마커 클릭 이벤트
                                        kakao.maps.event.addListener(marker, 'click', function() {
                                            infowindow.setContent('<div style="padding:5px;">' + place.place_name + '</div>');
                                            infowindow.open(map, marker);
                                            window.opener.document.getElementById('address').value = place.address_name;
                                            window.opener.document.getElementById('longitude').value = place.x; // x좌표 (경도)
                                            window.opener.document.getElementById('latitude').value = place.y; // y좌표 (위도)
                                            window.close(); // 클릭 시 창 닫기
                                        });

                                        // 리스트에 장소 추가
                                        const itemEl = document.createElement('li');
                                        itemEl.innerHTML = '<div class="info"><div class="title">' + place.place_name + '</div><div class="address">' + place.address_name + '</div></div>';
                                        itemEl.onclick = function() {
                                            map.setCenter(position);
                                            infowindow.setContent('<div style="padding:5px;">' + place.place_name + '</div>');
                                            infowindow.open(map, marker);
                                            window.opener.document.getElementById('address').value = place.address_name;
                                            window.opener.document.getElementById('longitude').value = place.x; // x좌표 (경도)
                                            window.opener.document.getElementById('latitude').value = place.y; // y좌표 (위도)
                                            window.close(); // 클릭 시 창 닫기
                                        };
                                        placesList.appendChild(itemEl);
                                    });

                                    // 지도를 첫 번째 검색 결과로 이동
                                    map.setCenter(new kakao.maps.LatLng(data[0].y, data[0].x));
                                }
                            });
                        <\/script>
                    </body>
                    </html>
                `);
            } else {
                alert('장소명을 입력해 주세요.');
            }
        });
    });