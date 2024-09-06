$(document).ready(function(){
	var urlParams = new URLSearchParams(window.location.search);
    var category = urlParams.get('fGroupKind');
    if (category) {
        $('a[href="qa_admin?fGroupKind=' + category + '"]').parent('li').attr('id', 'on');
    }else if(category==null){
    	$('a[href="qa_admin"]').parent('li').attr('id', 'on');
    }

    $('.link_tab._faqCategory').click(function(event) {
        var $parentLi = $(this).parent('li');
        $('.list_board_sort li').removeAttr('id');
    });
    
	  $('#searchBtn').on("click",function(event){
		  
		  window.location.href= "qa_admin?"
				+ "&page=1"
          	+ "&perPageNum=10"	
          	+'&nGroupKind='+$('select[id="res_state"]').val()
		  +'&fGroupKind='+$("select option:selected").val()
		  +"&keyword="+$('#keywordInput').val();	  
		  
	  })
	  
	  
	  
	  $(document).on("click", ".newBtn", function(event){
		  var qa_id= $(this).val();
		  if($('.response_write').length>0){
			  $('.response_write').remove();
		  }else{	  
			  var html="<dic class='response_write'><br><hr><br>"
				  +"<textarea class='response_input' rows='8' style='width: 100%' placeholder='답변 입력'></textarea>"
				  +"<button class='res_register' value='"+qa_id+"'>저장</button>	"
				  +"</div>"
				  ;
				  
			  $('div.addRes[value="'+qa_id+'"]').append(html);
		  }
	  });
	  
	  $(document).on("click", ".res_register", function(event){
		  var qa_id= $(this).val();	
		  var response_input=$(".response_input:visible").val();		  
		  if($('pre#pre'+ qa_id).length>0){
			  $('pre#pre'+ qa_id).remove();
		  }
		  
		  $.ajax({
	        type: "POST",
	        url: "res_register",
	        data: {
	            qa_id: qa_id,
	            response_input: response_input
	        },
	        success: function(response) {
	        	$('button.newBtn[value="'+qa_id+'"]').remove();
	        	$(".response_write").remove();
	        	$('#state' + qa_id).text('답변완료');
	        	 var html1="<pre id='pre"+qa_id+"'><br><hr><hr><br>"+response_input+"</pre>";	
				if($('button.res_modify[value="'+qa_id+'"]').length>0){
					$('button.res_modify[value="'+qa_id+'"]').remove();
					$('button.res_remove[value="'+qa_id+'"]').remove();
				}
				html1+="<button  class='res_modify' value='"+qa_id+"'>답변수정</button>"
				+"<button  class='res_remove' value='"+qa_id+"'>답변삭제</button>"
				$('div.addRes[value="'+qa_id+'"]').append(html1);
	            alert("답변이 성공적으로 등록되었습니다.");
	        },
	        error: function(xhr, status, error) {
	            alert("답변  저장 중 오류가 발생했습니다. 다시 시도해주세요.");
	            console.error("Error: " + error);
	        }
	    });
	  });
	  $(document).on("click", ".res_modify", function(event){
		  var qa_id= $(this).val();	
			var pre_response=$('pre#pre'+ qa_id).text();
		  if($('.response_write').length>0){
			  $('.response_write').remove();
			 // console.log($('pre#pre1').length);
			  $('pre#pre'+ qa_id).show();
		  }else{		
			$('pre#pre'+ qa_id).hide();
			var html2="<dic class='response_write'>"
				  +"<textarea class='response_input' rows='8' style='width: 100%' placeholder='답변 입력'>"
				  +pre_response
				  +"</textarea>"
				  +"<button class='res_register' value='"+qa_id+"'>저장</button>	"
				  +"</div>"
				  ;
				  
			  $('div.addRes[value="'+qa_id+'"]').append(html2);
		  }
		});
		
	  $(document).on("click", ".res_remove", function(event){
		  var qa_id= $(this).val();	
		  $.ajax({
		        type: "POST",
		        url: "res_remove",
		        data: {
		            qa_id: qa_id
		        },
		        success: function(response) {
		        	if($('.response_write').length>0){
		  			  $('.response_write').remove();
		        	}
		        	$('pre#pre'+ qa_id).remove();
		        	$('button.res_modify[value="'+qa_id+'"]').remove();
					$('button.res_remove[value="'+qa_id+'"]').remove();
		        	$('#' + qa_id).text('답변대기중');
		        	var html3="<button class='newBtn' value='"+qa_id+"'>답변</button>	"
		        	
		        	 $('div.addRes[value="'+qa_id+'"]').before(html3);
		            alert("답변이 성공적으로 삭제되었습니다.");
		        },
		        error: function(xhr, status, error) {
		            alert("답변  삭제 중 오류가 발생했습니다. 다시 시도해주세요.");
		            console.error("Error: " + error);
		        }
		    });
		});
	  
	  $('select[id="res_state"]').on('change', function() {
		  var nGroupKind=$('select[id="res_state"]').val();
		  window.location.href= "qa_admin?"
				+ "&page=1"
        	+ "&perPageNum=10"	
        	+'&nGroupKind='+$('select[id="res_state"]').val()
		  +'&fGroupKind='+$("select option:selected").val()
		  +"&keyword="+$('#keywordInput').val();
	    });
	  		  
});

$(function() {
	var article = (".tb_board .show");
	$(".tb_board .item  td").click(
			function() {
				var myArticle = $(this).parents()
						.next("tr");
				if ($(myArticle).hasClass('hide')) {
					$('.response_write').remove();
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
