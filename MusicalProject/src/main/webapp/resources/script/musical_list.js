

$(document).ready(function(){
	let filters = {
			keyword: $('#currentData').data('keyword'),
			age: $('#currentData').data('age'),
			minRunningtime : $('#currentData').data('min'),
			location: $('#currentData').data('location'),
			startDate : $('#currentData').data('start'),
			endDate : $('#currentData').data('end'),
			sort : $('#currentData').data('sort')
	};
	
	// 필터 패널 상태 변수
    let isFilterPanelOpen = $('.filter-panel').hasClass('show');
	
	//이전에 선택한 검색어, 정렬, 필터 유지
	 function setFilterSortValues(filters) {
		    $('#ageSelect').val(filters.age);
		    $('#runningTimeSelect').val(filters.minRunningtime);
		    $('#locationSelect').val(filters.location);
		    $('input[name="startDate"]').val(filters.startDate);
		    $('input[name="endDate"]').val(filters.endDate);
		    
		    $('#sortSelect').val(filters.sort);
		    
		    $('.filter-panel').toggleClass('show', isFilterPanelOpen);
		    
		    console.log(isFilterPanelOpen);
	 }
		
	 	//필터링
		$('.filter-item').on('change', function() {
		      
		      filters.age = $('#ageSelect').val();
		      filters.minRunningtime = $('#runningTimeSelect').val();
		      filters.location = $('#locationSelect').val();
		      filters.startDate = $('input[name="startDate"]').val();
		      filters.endDate = $('input[name="endDate"]').val();

		      // 선택된 필터 항목 표시
		      console.log(filters);
		      // 서버에 필터 적용된 목록 요청
		      filter(1);
		});
		
		//검색, 필터, 정렬 데이터 가져옴
		function filter(page){
			 let requestData = Object.assign({}, filters, { page: page });
			
			$.ajax({
				url : '/ex/musical/listAll',
				method : 'GET',
				data: requestData,
				success:function(data){
					
	  				$('body').html(data);
	  				setFilterSortValues(filters);
	  				setTimeout(function() {
	  			        $('html, body').animate({
	  			            scrollTop: $('.list-title').offset().top - 20
	  			        }, 500);
	  			    }, 10); 
	  			
	  			},
	  			error:function(error){
	  				console.error('Error loading content : ', error);
	  			}
			});
		}
		
	//정렬
	 $('#sortSelect').change(function(event) {
         filters.sort = $(this).val();
         filter(1);
     });
	 
	 //뮤지컬 검색
	 $('.search-button').click(()=>{
		filters.keyword = $('.keyword').val();
		filter(1); 
	 });
	 
	 //필터 초기화 버튼
	 $('.reset').click(()=>{
		 filters = {
			keyword: "",
			age: 0,
			minRunningtime : 0,
			location: "",
			startDate : "",
			endDate : "",
			sort : ""
		 };
		 filter(1);
	 });
	 
	 $('.pagination a').on('click', function(e) {
	        e.preventDefault(); // 기본 링크 동작 방지

	        var page = $(this).data('page'); // 클릭한 페이지 번호
	        filter(page);
	    });

	 $('.filter-button').click(function() {
	        isFilterPanelOpen = !isFilterPanelOpen; // 상태 토글
	        $('.filter-panel').toggleClass('show', isFilterPanelOpen);
	 });
    
    //인기뮤지컬, 최근오픈 뮤지컬 swiper에 쓸 이미지 a태그
    $('.musical-img-item').each(function() {
        var posterUrl = $(this).data('poster'); 
        $(this).css({
            'background-image': 'linear-gradient(to top, rgba(0, 0, 0, 0.5), transparent), url(' + posterUrl + ')',
            'background-size': 'cover',
            'background-position': 'center',
            'background-repeat': 'no-repeat',
            'border-radius' : '16px',
            'box-shadow': '0 4px 10px rgba(0, 0, 0, 0.5)'
        });
    });
    
    $('#scrollToTopBtn').click(function() {
        $('html, body').animate({ scrollTop: 0 }, 600);
    });

    $('#scrollToBottomBtn').click(function() {
        $('html, body').animate({ scrollTop: $(document).height() }, 600);
    });
    
    
    var swiper1 = new Swiper('.musical-like', {
        
        loop:true,
        effect: 'coverflow',
        coverflowEffect: {
            rotate: 25,
            stretch: 0,
            depth: 0,
            modifier: 1,
            slideShadows: false,
        },
        centeredSlides: true, // 가운데 슬라이드 강조
        navigation: {
            nextEl: '.next-like',
            prevEl: '.prev-like',
        },
        pagination: {
            el: '.page-like',
            clickable: true,
        },
        autoplay: {
            delay: 5000, // 자동 슬라이드 전환 간격 (밀리초 단위)
        },
        breakpoints: {
        	0: {
        		slidesPerView: 1
        	},
        	501:{
        		slidesPerView: 2,
                spaceBetween: 0
        	},
            768: {
              slidesPerView: 3,
              spaceBetween: 30
            },
            1024: {
              slidesPerView: 3,
              spaceBetween: 50
            },
            1650: {
              slidesPerView: 5,
              spaceBetween : 10
            }
          }
    });
    
    var swiper2 = new Swiper('.musical-date', {
        slidesPerView: 5, // 화면에 보여질 슬라이드 수
        spaceBetween: 0,
        loop:true,
        effect:'slide',
        centeredSlides: true, // 가운데 슬라이드 강조
        navigation: {
            nextEl: '.next-date',
            prevEl: '.prev-date',
        },
        pagination: {
            el: '.page-date',
            clickable: true,
        },
        autoplay: {
            delay: 5000, // 자동 슬라이드 전환 간격 (밀리초 단위)
        },
        breakpoints: {
        	0: {
        		slidesPerView: 1
        	},
        	501:{
        		slidesPerView: 2,
                spaceBetween: 0
        	},
            768: {
              slidesPerView: 3,
              spaceBetween: 30
            },
            1024: {
              slidesPerView: 3,
              spaceBetween: 50
            },
            1650: {
              slidesPerView: 5,
              spaceBetween : 10
            }
          }
    });
});