
$(document).ready(function() {
		var formObj = $("form[role='form']");
		console.log(formObj);
		$(".btn-warning").on("click", function() {
			window.history.back();
		});
		
		function checkRequiredFields(){
			var allFilled = true;
			
			$("input[required]").each(function(){
				if($(this).val() === ''){
					allFilled = false;
					return false;
				}
			});
			
						
			$("textarea[required]").each(function(){
				if($(this).val() === ''){
					allFilled = false;
					return false;
				}
			});
			
			if(allFilled){
				$(".signup").addClass("active").prop("disabled",false);		
			}else{
				$(".signup").removeClass("active").prop("disabled",true);
			}
		}
		$("input[required]").on("input",checkRequiredFields);
		$("textarea[required]").on("input",checkRequiredFields);
});

function checkFaq() {
	  var isValid = true;
	  
    
    if($("input[name='fTitle']").val().trim() === "") {
            alert("제목을 입력해주세요.");
            isValid = false;
            return false; 
    }
           
    if($("select[name='fGroupKind']").val().trim() === "") {
            alert("카테고리를 선택해주세요.");
            isValid = false;
            return false; 
             
    }
    
    if($("textarea[name='fContent']").val().trim() === "") {
        alert("내용을 입력해주세요.");
        isValid = false;
        return false; 
	}    
    
    
    return isValid;
}

function checkNotice() {
	  var isValid = true;
  
  if($("input[name='nTitle']").val().trim() === "") {
          alert("제목을 입력해주세요.");
          isValid = false;
          return false; 
  }
         
  if($("select[name='nGroupKind']").val().trim() === "") {
          alert("카테고리를 선택해주세요.");
          isValid = false;
          return false; 
           
  }
  
  if($("select[name='nGroupKind']").val()==='티켓오픈'&& $("input[name='nOpenTime']").val().trim() === "") {
      alert("오픈시간을 입력해주세요.");
      isValid = false;
      return false; 
}
  
  if($("textarea[name='nContent']").val().trim() === "") {
      alert("내용을 입력해주세요.");
      isValid = false;
      return false; 
	}    
  
  
  return isValid;
}

$(document).ready(function() {
    function toggleDatetimeContainer() {
        if ($('select[name="nGroupKind"]').val() != '티켓오픈') {
            $('#datetimeContainer').hide();
        } else {
            $('#datetimeContainer').show();
        }
    }
    
    // 페이지 로드 시 초기 상태 설정
    toggleDatetimeContainer();

    // 카테고리 변경 시 상태 변경
    $('select[name="nGroupKind"]').on('change', function() {
        toggleDatetimeContainer();
    });
});