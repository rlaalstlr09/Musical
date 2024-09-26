	var result = '${msg}';
	if (result == 'success') {
		alert("처리가 완료되었습니다.");
	}
	
	// 유효성 검사 함수
    function checkActor() {
        var isValid = true;
        
        // 모든 배역명 필드 검사
        $("input[name='character_name[]']").each(function() {
            if ($(this).val().trim() === "") {
                alert("모든 배역명을 입력해주세요.");
                isValid = false;
                return false; // each 반복문 중지
            }
        });
        
        return isValid;
    }
	    
	$(document).ready(function() {
		
		var musical_id=$('.newBtn').val();
		
		$(".viewBtn").click(function () {				
    	    const fileName = $(this).data("file");
    	    if(fileName=="" ||fileName==null){
    	    	alert("등록된 파일이 없습니다.");
    	    	return;
    	    }
    	    const url = "admin_filesView?" + 'searchType=document' + "&fileNames=" + encodeURIComponent(fileName);
    	    const windowName = '_blank'; // 창의 이름
    	    const windowFeatures = 'width=800,height=700,scrollbars=yes,resizable=yes'; // 팝업창의 속성 설정

    	    window.open(url, windowName, windowFeatures);
    	});
		
		var formObj = $("form[role='form']");
		$(".btn-warning").on("click", function() {
			 window.history.back();
		});
		$(".btn-primary").on("click", function() {
			$('.addFormRow').remove();
		});
	
								
		$('.newBtn').on("click",function(event) {
			var $button = $(this);
			var musicalId = $button.val();
			
			// 이미 폼이 표시되어 있는지 확인하고, 있으면 제거
			if ($('.addFormRow').length) {
				$('.addFormRow').remove();
			} else {
				
				$.post("actor_list", function (data) {
					var formHtml = 
						"<form action='character_register' onsubmit='return checkActor()' method='post' class='addFormRow'>"+
						"<table cellspacing='0' border='0' class='tb_board tb_qna' >"+
						"<colgroup>"+
						"<col width='40%'>"+					
						"<col width='40%'>"+						
						"<col width='20%'>"+						
						"</colgroup>"+				
						"<thead>"+					
						"<tr>"+					
						"<th scope='col'>추가 배역</th>"+						
						"<th scope='col'>배우 선택</th>"+							
						"<th scope='col'>추가/삭제</th>"+						
						"</tr>"+					
						"</thead>"+				
						"<tbody>"+				
						"<tr>" +
						"<input type='hidden' name='musical_id[]' value='"+musicalId+"'>" +
						"<td style='text-align: center;'>" +
						"<input type='text' name='character_name[]' placeholder='배역명'>" +
						"</td>" +
						"<td style='text-align: center;'>" +
						"<select name='actor_id[]' class='actor_list'>";
					data.forEach(function(Dto) {
						formHtml +="<option value='"+Dto.actor_id+"'>"+Dto.actor_name+"</option>";
	        				       			
	        		});
					formHtml +=
						"</select>" +
						"</td>" +
						"<td style='text-align: center;'>" +
						"<button class='add_addBtn' type='button' value='"+musicalId+"'>추가</button>" +
						"</td>" +
						"</tr>"+
						"</tbody>"+	
						"</table>"+
						"<button type='submit' class='registerBtn'>저장</button>"+
						"</form>";
					$button.closest('div').after(formHtml);
					$('.actor_list').select2();
				});	
				
				
      		 };
		})
		    
		
				$(document).on("click", ".add_addBtn", function() {
					var $addButton = $(this);
					var musicalId = $addButton.val();
					$.post("actor_list", function (data) {
					var formHtml1 = 
						"<tr>" +
						"<input type='hidden' name='musical_id[]' value='"+musicalId+"'>" +
						"<td style='text-align: center;'>" +
						"<input type='text' name='character_name[]' placeholder='배역명'>" +
						"</td>" +
						"<td style='text-align: center;'>" +
						"<select class='actor_list' name='actor_id[]'>";
						data.forEach(function(Dto) {
							formHtml1 +="<option value='"+Dto.actor_id+"'>"+Dto.actor_name+"</option>";
		        				       			
		        		});
						formHtml1 +=
						"</select>" +
						"</td>" +
						"<td style='text-align: center;'>" +
						"<button type='button' class='add_addBtn'>추가</button>" +
						"<button type='button' class='add_removeBtn'>삭제</button>" +
						"</td>" +
						"</tr>";	
						console.log($addButton.closest('tr'));
						$addButton.closest('tr').after(formHtml1);
						$('.actor_list').select2();
					});
				});
				
				$(document).on("click", ".add_removeBtn", function() {
	                $(this).closest('tr').remove();
	            });
		

		
		$('.modifyBtn').on("click",function(event) {
			var $button = $(this);
			var characterId = $button.val();
			$('.deleteFormRow').remove();
			
			if ($button.closest('tr').next()
					.hasClass('modifyFormRow')) {
				$button.closest('tr').next()
						.remove();
			} else {
				$('.modifyFormRow').remove();
				// 폼을 동적으로 추가
				 $.post("actor_list", function (data) {
				 var formHtml2 = 
					"<tr class='modifyFormRow'>" +
					"<td style='text-align: center;'>" +
					"<input type='text' id='character_name' name='character_name' placeholder='배역명'>" +
					"</td>" +
					"<td style='text-align: center;'>" +
					"<select id='actor_list'>" +
					"<option value='new'>새로 등록</option>";;
					data.forEach(function(Dto) {
						formHtml2 +="<option value='"+Dto.actor_id+"'>"+Dto.actor_name+"</option>";   			
	        		});
					formHtml2 +=
					"</select>" +
					"</td>" +
					"<td style='text-align: center;'>" +
					"<button class='submitmodifyBtn'>수정완료</button>" +
					"</td>" +
					"</tr>";

				 $button.closest('tr').after(formHtml2);
				 $('#actor_list').select2();
				 
				
				
				// 제출 버튼 클릭 시 처리
                $('.submitmodifyBtn').on("click", function () {
                    var character_name = $('#character_name').val();
                    var actor_id = $('#actor_list').val();
                   
                    	if(actor_id==="new"){
                    		if(confirm("배우등록 페이지로 이동합니다.")){
                    			window.location.href = "actor_register";
                    		}                    		
                    	}else{
                    		 if (actor_name.trim() === "") {
                                 alert("배역명을 입력해주세요.");
                             } else{
                            	 $.ajax({
			                            type: "POST",
			                            url: "character_modify",
			                            data: {
			                                character_id: characterId,
			                                character_name: character_name,
			                                actor_id: actor_id,
			                                musical_id: musical_id
			                            },
			                            success: function(response) {
			                                alert("배역이 성공적으로 수정되었습니다.");
			                                location.reload();
			                            },
			                            error: function(xhr, status, error) {
			                                alert("배역 수정 중 오류가 발생했습니다. 다시 시도해주세요.");
			                                console.error("Error: " + error);
			                            }
			                        });
                            	 //window.location.href = "character_?character_id=" + characterId + "&actor_name=" + 
                 				//encodeURIComponent(actor_name)+"&actor_id=" +actor_id;
                             }
                    		
                    	}
                        // 리뷰 삭제 요청 URL로 이동
                                             
                   });
				
				 });
      		 };
		 });    
		
		$('#actor_list').select2({
            placeholder: "이름을 검색하세요",
            allowClear: true
        });
		
						// 삭제 버튼 클릭 시 처리
		$('.deleteBtn').on("click",function(event) {
											// 현재 클릭된 버튼을 저장
											var $button = $(this);
											var characterId = $button.val();
											$('.modifyFormRow').remove();

											// 이미 폼이 표시되어 있는지 확인하고, 있으면 제거
											if ($button.closest('tr').next()
													.hasClass('deleteFormRow')) {
												$button.closest('tr').next()
														.remove();
											} else {
												$('.deleteFormRow').remove();
												// 폼을 동적으로 추가
												var formHtml = 
    "<tr class='deleteFormRow'>" +
        "<td colspan='6' style='text-align: center;'>" +
            "<label>삭제 사유: </label>" +
            "<input type='text' id='deleteReason' placeholder='삭제 사유를 입력하세요' style='width: 800px;'>" +
            "<button class='submitDeleteBtn'>제출</button>" +
        "</td>" +
    "</tr>";

												// 삭제 버튼 아래에 폼 삽입
												$button.closest('tr').after(formHtml);

												// 제출 버튼 클릭 시 처리
								                $('.submitDeleteBtn').on("click", function () {
								                    var reason = $('#deleteReason').val();
								                    if (reason.trim() === "") {
								                        alert("삭제 사유를 입력해주세요.");
								                    } else {
								                    	$.ajax({
								                            type: "POST",
								                            url: "character_remove",
								                            data: {
								                                character_id: characterId,
								                                reason: reason
								                            },
								                            success: function(response) {
								                                alert("배역이 성공적으로 삭제되었습니다.");
								                                location.reload();
								                            },
								                            error: function(xhr, status, error) {
								                                alert("배역 삭제 중 오류가 발생했습니다. 다시 시도해주세요.");
								                                console.error("Error: " + error);
								                            }
								                        });
								                    }
								                });
								            }
								        });
	});