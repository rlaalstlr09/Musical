$(document).ready(function() {

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

function checkActor() {
	  var isValid = true;
        
        // 배우명 필드 검사
        if($("input[name='actor_name']").val().trim() === "") {
                alert("배우명을 입력해주세요.");
                isValid = false;
                return false; 
        }
               
        if($("input[name='birthday']").val().trim() === "") {
                alert("생년월일을 입력해주세요.");
                isValid = false;
                return false; 
                 
        }
        
        if($("input[name='height']").val().trim() === "") {
            alert("키를 입력해주세요.");
            isValid = false;
            return false; 
    	}
        
        if(!/\d/.test($("input[name='height']").val())){
        	alert("키는 숫자를 입력해주세요.");
            isValid = false;
            return false;
        }
        
        if($("input[name='weight']").val().trim() === "") {
            alert("몸무게를 입력해주세요.");
            isValid = false;
            return false; 
    	}
        
        if(!/\d/.test($("input[name='weight']").val())){
        	alert("몸무게는 숫자를 입력해주세요.");
            isValid = false;
            return false;
        }
        
        
        return isValid;
    }

function checkMusical() {
	var isValid = true;
    const startDate = new Date($("input[name='musical_period_start']").val());    
    const endDate = new Date($("input[name='musical_period_end']").val());
    
    if (endDate < startDate) {
        alert('기간이 잘못 설정되었습니다.');
        isValid = false;
        return false; 
    } 
    
    if($("input[name='musical_title']").val().trim() === "") {
            alert("타이틀을 입력해주세요.");
            isValid = false;
            return false; 
    }
           
    if($("input[name='musical_period_start']").val().trim() === "") {
            alert("시작날짜를 입력해주세요.");
            isValid = false;
            return false; 
             
    }
    
    if($("input[name='musical_period_end']").val().trim() === "") {
        alert("끝나는 날짜를 입력해주세요.");
        isValid = false;
        return false; 
	}
    
    if($("input[name='musical_runningtime']").val().trim() === "") {
        alert("관람시간을 입력해주세요.");
        isValid = false;
        return false; 
	}
    
    if(!/\d/.test($("input[name='musical_runningtime']").val())){
    	alert("관람시간은 숫자를 입력해주세요.");
        isValid = false;
        return false;
    }
    
    
    if($("input[name='musical_agelimit']").val().trim() === "") {
        alert("관람등급을 입력해주세요.");
        isValid = false;
        return false; 
	}
    
    if(!/\d/.test($("input[name='musical_agelimit']").val())){
    	alert("관람등급은 숫자를 입력해주세요.");
        isValid = false;
        return false;
    }
    
    if($("input[name='file']").val().trim() === "") {
        alert("포스터를 업로드해주세요.");
        isValid = false;
        return false; 
	}     
    
    return isValid;
}


function checkVenue() {
	  var isValid = true;
    
    if($("input[name='venue_name']").val().trim() === "") {
            alert("극장이름을 입력해주세요.");
            isValid = false;
            return false; 
    }
           
    if($("input[name='venue_address']").val().trim() === "") {
            alert("극장주소를 입력해주세요.");
            isValid = false;
            return false; 
             
    }
    
    return isValid;
}

function checkHall() {
	  var isValid = true;

if($("input[name='hall_name']").val().trim() === "") {
        alert("홀 이름을 입력해주세요.");
        isValid = false;
        return false; 
}

if(!/\d/.test($("input[name='hall_total_seat']").val())){
	alert("총 좌석수는 숫자를 입력해주세요.");
    isValid = false;
    return false;
}

if($("input[name='hall_total_seat']").val().trim() === "") {
        alert("총 좌석수를 입력해주세요.");
        isValid = false;
        return false;            
}

return isValid;
}

