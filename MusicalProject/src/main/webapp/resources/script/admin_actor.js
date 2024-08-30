
	
	    
	
	
	$(document).ready(function() {
		$('#searchBtn').on("click",function(event) {
									window.location.href = "admin_actor?"
											+ "&page=1"
							            	+ "&perPageNum=10"							            	
											+ "&fGroupKind=" + $('#startYear').val() + $('#startMonth').val()
											+ "&nGroupKind=" + $('#endYear').val()+$('#endMonth').val()
											+ '&searchType='
											+ $("select[name='search_keyword']")
													.val() + "&keyword="
											+ $('#keywordInput').val();
								})
								
		$('.newBtn').on("click",function(event) {
			window.location.href = "actor_register";
		})
		
		$('.modifyBtn').on("click",function(event) {
			window.location.href = "actor_modify?actor_id="+$(this).val();
		})
		
		$('.readBtn').on("click",function(event) {
			window.location.href = "actor_read?actor_id="+$(this).val();
		})
						// 삭제 버튼 클릭 시 처리
		$('.deleteBtn').on("click",function(event) {
											// 현재 클릭된 버튼을 저장
											var $button = $(this);
											var actorId = $button.val();

											// 이미 폼이 표시되어 있는지 확인하고, 있으면 제거
											if ($button.closest('tr').next()
													.hasClass('deleteFormRow')) {
												$button.closest('tr').next()
														.remove();
											} else {
												// 폼을 동적으로 추가
												var formHtml = 
    "<tr class='deleteFormRow'>" +
        "<td colspan='7' style='text-align: center;'>" +
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
if(confirm("배우정보를 삭제하면 관련된 배역정보도 모두 삭제됩니다. 정말 삭제하시겠습니까?")){
								                    		
								                    		$.ajax({
									                            type: "POST",
									                            url: "actor_remove",
									                            data: {
									                            	actor_id: actorId,
									                                reason: reason
									                            },
									                            success: function(response) {
									                            	if (response === "success") {
									                                    alert("배우정보가 성공적으로 삭제되었습니다.");
									                                    location.reload();
									                                }
									                            },
									                            error: function(xhr, status, error) {
									                                alert("배우정보 삭제 중 오류가 발생했습니다. 다시 시도해주세요.");
									                                console.error("Error: " + error);
									                            }
									                        });
									                        
									                    }
								                    }
								                });
								            }
								        });
								    });