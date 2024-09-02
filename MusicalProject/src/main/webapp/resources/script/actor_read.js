var result = '${msg}';
	if (result == 'success') {
		alert("처리가 완료되었습니다.");
	}
	    
	
	
	$(document).ready(function() {
		var actor_id=$('#actor_id').val();
				
		$('.modifyBtn').on("click",function(event) {
			alert("해당 작품 배역 정보 페이지로 이동합니다.");
			window.location.href = "character_read?musical_id="+$(this).val();
		})
		
		
						// 삭제 버튼 클릭 시 처리
		$('.deleteBtn').on("click",function(event) {
											// 현재 클릭된 버튼을 저장
											var $button = $(this);
											var characterId = $button.val();

											// 이미 폼이 표시되어 있는지 확인하고, 있으면 제거
											if ($button.closest('tr').next()
													.hasClass('deleteFormRow')) {
												$button.closest('tr').next()
														.remove();
											} else {
												// 폼을 동적으로 추가
												var formHtml = 
    "<tr class='deleteFormRow'>" +
        "<td colspan='6' style='text-align: center;'>" +
            "<label>필모그래피 삭제 사유: </label>" +
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