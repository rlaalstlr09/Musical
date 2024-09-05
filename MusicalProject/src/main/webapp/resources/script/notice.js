

$(document).ready(function() {
	var urlParams = new URLSearchParams(window.location.search);
    var category = urlParams.get('nGroupKind');
    if (category) {
        $('a[href="notice?nGroupKind=' + category + '"]').parent('li').attr('id', 'on');
    }else if(category==null){
    	$('a[href="notice"]').parent('li').attr('id', 'on');
    }

    $('.link_tab._faqCategory').click(function(event) {
        var $parentLi = $(this).parent('li');
        $('.list_board_sort li').removeAttr('id');
    });
		
		
		$('#searchBtn').click(function(event) {		
						window.location.href = "notice?" 
								+"&page=1"
								+ "&perPageNum=10"	 
								+ '&searchType='
								+ $("select option:selected").val()
								+ "&keyword=" + $('#keywordInput').val();
					})

		$('.newBtn').on("click", function(event) {
				location.href = "notice_register";
			
		});
	
		var formObj = $("form[role='form']");


		$(".btn-primary").on("click", function() {
			formObj.attr("action", "notice_modify");
			formObj.submit();
		});

		$(".btn-danger").on("click", function() {
			formObj.attr("action", "notice_remove");
			formObj.attr("method", "post");	
			formObj.submit();
		});

		$(".go_notice").on("click", function() {
			window.history.back();
		});
});