var result = '${msg}';
if (result == 'success') {
	alert("처리가 완료되었습니다.");
}

$(document).ready(function(){
	var urlParams = new URLSearchParams(window.location.search);
    var category = urlParams.get('fGroupKind');
    if (category) {
        $('a[href="faq?fGroupKind=' + category + '"]').parent('li').attr('id', 'on');
    }else if(category==null){
    	$('a[href="faq"]').parent('li').attr('id', 'on');
    }

    $('.link_tab._faqCategory').click(function(event) {
        var $parentLi = $(this).parent('li');
        $('.list_board_sort li').removeAttr('id');
    });
    
	  $('#searchBtn').on("click",function(event){
		  
		  window.location.href= "faq?" 
		  +"&page=1"
      	  + "&perPageNum=10"	
		  +'&fGroupKind='+$("select option:selected").val()
		  +"&keyword="+$('#keywordInput').val();
		  
		  
	  })
	  
	  $('.newBtn').on("click",function(event){
		  location.href="faq_register";
	  });
		
	  var formObj = $("form[role='form']");
					
		$(".btn-warning").on("click", function(){
			formObj.attr("action", "faq_modify");
			formObj.attr("method", "get");		
			formObj.submit();
		});
		
		$(".btn-danger").on("click", function(){
			formObj.attr("action", "faq_remove");
			formObj.attr("method", "post");
			formObj.submit();
		});
	  		  
  });

$(function() {
	var article = (".tb_board .show");
	$(".tb_board .item  td").click(
			function() {
				var myArticle = $(this).parents()
						.next("tr");
				if ($(myArticle).hasClass('hide')) {
					$(article).removeClass('show')
							.addClass('hide');
					$(myArticle)
							.removeClass('hide')
							.addClass('show');
				} else {
					$(myArticle).addClass('hide')
							.removeClass('show');
				}
			});
});