$(document).ready(function(){
	
	  $('#searchBtn').on("click",function(event){
		  
		  window.location.href= "admin_admin?"
				+ "&page=1"
          	+ "&perPageNum=10"	
          	+'&nGroupKind='+$('select[id="table_crud"]').val()
		  +'&fGroupKind='+$('select[id="table_name"]').val()
		  +"&keyword="+$('#keywordInput').val();	  
		  
	  })
	  
	  
	  $('select[id="table_name"]').on('change', function() {
		  var fGroupKind=$('select[id="table_name"]').val();
		  window.location.href= "admin_admin?"
				+ "&page=1"
        	+ "&perPageNum=10"	
        	+'&nGroupKind='+$('select[id="table_crud"]').val()
		  +'&fGroupKind='+$('select[id="table_name"]').val()
		  +"&keyword="+$('#keywordInput').val();
	    });
	  
	  $('select[id="table_crud"]').on('change', function() {
		  var nGroupKind=$('select[id="table_crud"]').val();
		  window.location.href= "admin_admin?"
				+ "&page=1"
        	+ "&perPageNum=10"	
        	+'&nGroupKind='+$('select[id="table_crud"]').val()
		  +'&fGroupKind='+$('select[id="table_name"]').val()
		  +"&keyword="+$('#keywordInput').val();
	    });
	  		  
});
