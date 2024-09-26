window.onload = () => {
    if (typeof kakao === 'undefined' || !kakao.maps) {
        console.error('Kakao 지도 API가 로드되지 않았습니다.');
        return;
    }

    var mapContainer = document.getElementById('map'),
        mapOption = {
            center: new kakao.maps.LatLng(37.5665, 126.9780),
            level: 5
        };

    var map = new kakao.maps.Map(mapContainer, mapOption);
    var markers = [];
    var currentDistance = 10000; // 기본 거리
    var isInitialLoad = true; // 사용자의 위치로 지도를 초기화했는지 여부를 추적

    if (navigator.geolocation) {
        navigator.geolocation.getCurrentPosition(position => {
            var lat = position.coords.latitude,
                lon = position.coords.longitude;

            var locPosition = new kakao.maps.LatLng(lat, lon);

            displayMarker(locPosition);
            if (isInitialLoad) {
                map.setCenter(locPosition); // 초기 로드 시 사용자 위치로 지도 중심 이동
                isInitialLoad = false;
            }

            loadTheaters(lat, lon, currentDistance);

            // 지도의 중심이 변경될 때
            kakao.maps.event.addListener(map, 'center_changed', () => {
                if (!isInitialLoad) {
                    var center = map.getCenter();
                    loadTheaters(center.getLat(), center.getLng(), currentDistance);
                }
            });

            // 줌 변경 시 거리 조정
            kakao.maps.event.addListener(map, 'zoom_changed', () => {
                if (!isInitialLoad) {
                    var zoomLevel = map.getLevel();
                    currentDistance = 10000 * Math.pow(2, 5 - zoomLevel); // 거리 조정
                    loadTheaters(map.getCenter().getLat(), map.getCenter().getLng(), currentDistance);
                }
            });
        }, error => {
            console.error('위치 정보를 가져올 수 없습니다.', error);
            var locPosition = new kakao.maps.LatLng(37.5665, 126.9780); // 기본 위치 설정
            displayMarker(locPosition);
            loadTheaters(37.5665, 126.9780, currentDistance);
        });
    } else {
        console.error('geolocation을 사용할 수 없습니다.');
        var locPosition = new kakao.maps.LatLng(37.5665, 126.9780); // 기본 위치 설정
        displayMarker(locPosition);
        loadTheaters(37.5665, 126.9780, currentDistance);
    }

    function displayMarker(locPosition, venueName = null, venue_id=null, venue_address=null) {
        var marker = new kakao.maps.Marker({
            map: map,
            position: locPosition
        });

        if (venueName) {
            kakao.maps.event.addListener(marker, 'click', function() {
                displayVenueName(venueName,venue_id,venue_address);
            });
        }

        markers.push(marker);
    }

    function removeMarkers() {
        for (var i = 0; i < markers.length; i++) {
            markers[i].setMap(null);
        }
        markers = [];
    }

    function loadTheaters(lat, lon, distance) {
        $.ajax({
            url: 'getTheaters', 
            type: 'GET',
            data: {
                lat: lat,
                lon: lon,
                distance: distance
            },
            success: function(data) {
                removeMarkers(); // 지도의 기존 마커 제거

                if (Array.isArray(data)) {
                    data.forEach(theater => {
                        var theaterPosition = new kakao.maps.LatLng(theater.y, theater.x);
                        displayMarker(theaterPosition, theater.venue_name, theater.venue_id,theater.venue_address);
                    });
                } else {
                    console.error('Invalid data format: expected an array of theaters');
                }
            },
            error: function(request, status, error) {
                console.error('Error fetching theaters:', error);
            }
        });
    }

    function displayVenueName(venueName,venue_id,venue_address) {
    	if ($('.thearter').length) {
			$('.thearter').remove();
		}  	
    	$.ajax({
    	    url: 'getTheater',
    	    type: 'POST',
    	    data: {
    	        venue_id: venue_id
    	    },
    	    success: function(data) {
    	        var html = `
    	        <main id="content" class="common_container page_main" role="main">
    	            <section class="common_section section_concert_hall">
    	                <div class="main_concert_hall">
    	                    <div class="concert_hall_text">
    	                        <h1>${venueName}</h1>
    	                        <li>${venue_address}</li>
    	                    </div>
    	                    <button class="prev">&lt;</button>
    	                    <div class="product_grid">
    	                        <div class="product_grid_list">`;
    	        console.log(data);
    	        if (Array.isArray(data)) {
    	        	data.forEach(musical => {
    	        	    // 날짜 포맷팅 함수 (YYYY.MM.DD 형식으로 변환)
    	        	    function formatDate(dateStr) {
    	        	        let date = new Date(dateStr);
    	        	        let year = date.getFullYear();
    	        	        let month = (date.getMonth() + 1).toString().padStart(2, '0');
    	        	        let day = date.getDate().toString().padStart(2, '0');
    	        	        return `${year}.${month}.${day}`;
    	        	    }

    	        	    let startDate = formatDate(musical.musical_period_start);
    	        	    let endDate = formatDate(musical.musical_period_end);

    	        	    html += `
    	        	    <div class="product_grid_item">
    	        	        <div class="product_grid_unit">
    	        	            <a class="product_link" href="` + contextPath + `/musical/detail/${musical.musical_id}">
    	        	                <div class="product_imgbox">
    	        	                    <img class="product_img" src="/poster/${musical.musical_poster}">
    	        	                </div>
    	        	                <div class="product_info">
    	        	                    <span class="product_title">${musical.musical_title}</span>
    	        	                    <div class="product_sideinfo">
    	        	                        <span class="product_period">${startDate} ~ ${endDate}</span>
    	        	                    </div>
    	        	                </div>
    	        	            </a>
    	        	        </div>
    	        	    </div>`;
    	        	});

    	            html += `
    	                        </div>
    	                    </div>
    	                    <button class="next">&gt;</button> 
    	                </div>
    	            </section>
    	        </main>
    	        </div>`;

    	            $('.common_wrap').append(html);
    	            
    	            const sliderWrapper = document.querySelector('.product_grid');
    	        	const slides = document.querySelectorAll('.product_grid_item');
    	        	const prevButton = document.querySelector('.prev');
    	        	const nextButton = document.querySelector('.next');

    	        	let index = 0;
    	        	const itemsPerPage = 4; // 한 페이지에 보일 아이템 수
    	        	const slideHeight = 25; // 슬라이드의 이동 폭

    	        	const maxIndex = Math.ceil(slides.length / itemsPerPage) - 1; // 인덱스 범위

    	        	function showSlide(n) {
    	        	    if (n > maxIndex) index = 0;
    	        	    else if (n < 0) index = maxIndex;
    	        	    else index = n;

    	        	    sliderWrapper.style.transform = `translateY(${-index * slideHeight}%)`;
    	        	}

    	        	prevButton.addEventListener('click', () => showSlide(index - 1));
    	        	nextButton.addEventListener('click', () => showSlide(index + 1));
    	        	

    	            
    	        } else {
    	            console.error('Invalid data format: expected an array of theaters');
    	        }
    	    },
    	    error: function(request, status, error) {
    	        console.error('Error fetching theaters:', error);
    	    }
    	});
    	
    }
    
    
    	
    
};
