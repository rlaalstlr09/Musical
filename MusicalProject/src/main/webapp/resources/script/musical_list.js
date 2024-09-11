

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
	
	//이전에 선택한 검색어, 정렬, 필터 유지
	 function setFilterSortValues(filters) {
		    $('#ageSelect').val(filters.age);
		    $('#runningTimeSelect').val(filters.minRunningtime);
		    $('#locationSelect').val(filters.location);
		    $('input[name="startDate"]').val(filters.startDate);
		    $('input[name="endDate"]').val(filters.endDate);
		    
		    $('#sortSelect').val(filters.sort);
		    
		    $('.filter-panel').addClass('show');
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
		      filter(filters);
		});
		
		//검색, 필터, 정렬 데이터 가져옴
		function filter(filters){
			$.ajax({
				url : '/ex/musical/listAll',
				method : 'GET',
				data: filters,
				success:function(data){
					
	  				$('body').html(data);
	  				setFilterSortValues(filters);
	  				
	  			},
	  			error:function(error){
	  				console.error('Error loading content : ', error);
	  			}
			});
		}
	  				
	  				
//	function sort(filters){
//		$.ajax({
//			url: '/ex/musical/listAll',
//			method : 'GET',
//			data: filters,
//	  			success:function(data){
//	  				$('body').html(data);
//	  				
//	  		        setFilterSortValues(filters);
//	  			},
//	  			error:function(error){
//	  				console.error('Error loading content : ', error);
//	  			}
//		});	
//	}
		
	//정렬
	 $('#sortSelect').change(function(event) {
         filters.sort = $(this).val();
         filter(filters);
     });
	 
	 //뮤지컬 검색
	 $('.search').click(()=>{
		filters.keyword = $('.keyword').val();
		filter(filters); 
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
		 filter(filters);
	 });
	 
	 //페이지 버튼 누르면 전체 뮤지컬 목록으로 스크롤 이동
//	 $('.pagination a').click(function(e) {
//		    e.preventDefault();
//		    $('html, body').animate({
//		        scrollTop: $('#container').offset().top
//		    }, 500);
//	});
	 
    const filterButton = document.querySelector('.filter-button');
    const filterPanel = document.querySelector('.filter-panel');

    //필터 버튼 누르면 필터링 옵션들 있는 div 생김
    filterButton.addEventListener('click', function () {
        if (filterPanel.classList.contains('show')) {
            filterPanel.classList.remove('show');
        } else {
            filterPanel.classList.add('show');
        }
    });
    
    //인기뮤지컬, 최근오픈 뮤지컬 swiper에 쓸 이미지 a태그
    $('.musical-img-item').each(function() {
        var posterUrl = $(this).data('poster'); 
        $(this).css({
            'background-image': 'url(' + posterUrl + ')',
            'background-size': 'cover',
            'background-position': 'center',
            'background-repeat': 'no-repeat',
            'border-radius' : '16px'
        });
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