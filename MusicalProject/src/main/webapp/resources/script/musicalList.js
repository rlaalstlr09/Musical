

$(document).ready(function(){
	function filter(){
		$.ajax({
			url : '/ex/musical/listAll',
			method : 'GET',
			data:{
				keyword : $('[name=keyword]').val(),
				startDate : $('[name=startDate]').val(),
				endDate:$('[name=endDate]').val(),
				age:$('[name=age]').val(),
				minRunningtime:$('[name=minRunningtime]').val(),
				location : $('[name=location]').val()
			},
			success:function(data){
  				$('body').html(data);
  			},
  			error:function(error){
  				console.error('Error loading content : ', error);
  			}
		});
	}
	
	function sort(sortId){
		$.ajax({
			url: '/ex/musical/listAll',
			method : 'GET',
			data: {
                sort: sortId,
                keyword: $('#currentKeyword').val() ,
                startDate: $('#currentStartDate').val() ,
                endDate: $('#currentEndDate').val() ,
                age: $('#currentAge').val() ,
                minRunningtime: $('#currentMinRunningtime').val(), 
                location: $('#currentLocation').val() 
            },
	  			success:function(data){
	  				$('body').html(data);
	  				$('a.sort-link').removeClass('active');
	  		         
	  		        $('[data-sort="' + sortId + '"]').addClass('active');
	  			},
	  			error:function(error){
	  				console.error('Error loading content : ', error);
	  			}
		});	
	}
	 $('a.sort-link').click(function(event) {
         event.preventDefault(); // 기본 동작 방지
         
         var sortId = $(this).data('sort'); // 'data-sort' 속성에서 정렬 기준 가져오기
         sort(sortId);
     });
	 
	 $('button.filter').click(function(){
		 filter();
	 })
	 
	 
    const filterButton = document.querySelector('.filter-button');
    const filterPanel = document.querySelector('.filter-panel');

    filterButton.addEventListener('click', function () {
        if (filterPanel.classList.contains('show')) {
            filterPanel.classList.remove('show');
        } else {
            filterPanel.classList.add('show');
        }
    });
	
    
    
    var swiper1 = new Swiper('.musical-like', {
    	direction : 'horizontal',
        slidesPerView: 3, // 화면에 보여질 슬라이드 수
        spaceBetween: 30, // 슬라이드 간의 간격
        loop:true,
        effect:'coverflow',
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
            // 반응형 설정
            768: {
                slidesPerView: 2,
            },
            480: {
                slidesPerView: 1,
            }
        }
    });
    
    var swiper2 = new Swiper('.musical-date', {
    	direction : 'horizontal',
        slidesPerView: 3, // 화면에 보여질 슬라이드 수
        spaceBetween: 30, // 슬라이드 간의 간격
        loop:true,
        effect:'coverflow',
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
            // 반응형 설정
            768: {
                slidesPerView: 2,
            },
            480: {
                slidesPerView: 1,
            }
        }
    });
   
    $('.musical-img-item').each(function() {
        var posterUrl = $(this).data('poster'); // jQuery의 .data() 메서드를 사용하여 data-poster 값을 가져옵니다
        $(this).css({
            'background-image': 'url(' + posterUrl + ')',
            'background-size': 'cover',
            'background-position': 'center',
            'background-repeat': 'no-repeat',
            'padding': '20px' // 스타일 조정
        });
    });
});