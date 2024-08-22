

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
				minRunningtime:$('[name=minRunningtime]').val()
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
                minRunningtime: $('#currentMinRunningtime').val() 
            },
	  			success:function(data){
	  				$('body').html(data);
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
	
});