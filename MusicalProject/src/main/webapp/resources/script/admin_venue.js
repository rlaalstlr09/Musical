	var result = '${msg}';
	if (result == 'success') {
		alert("처리가 완료되었습니다.");
	}	
	
	$(document).ready(function() {
		window.makeSearch = function(venue_id, page, $button) {	
	        hallAjax(venue_id, page, 5, $button);
	        return false;			
	    }
		 
	    function hallAjax(venue_id, page, perPageNum, $button) {
	        $.ajax({
	            type: 'POST',
	            url: 'admin_hall',
	            contentType: 'application/json',
	            data: JSON.stringify({ venue_id: venue_id, page: page, perPageNum: perPageNum }),
	            success: function(response) {
	                if (response && response.list && response.list.length > 0) {
	                    var list = response.list;
	                    var boardVo = response.boardVo;
	                    var tableHtml = 
	                        "<tr class='addFormRow' id='"+venue_id+"'>" +
	                        "<td colspan='5' style='text-align: center;'>" +
	                        '<div>' +
	                            '<button class="hall_newBtn" value="'+venue_id+'">홀 추가</button>' +
	                            '<table cellspacing="0" border="0" class="tb_board tb_on">' +
	                            '<colgroup>' +
	                                '<col width="50%">' +
	                                '<col width="30%">' +
	                                '<col width="10%">' +
	                                '<col width="10%">' +
	                            '</colgroup>' +
	                            '<thead>' +
	                                '<tr>' +
	                                    '<th scope="col">홀</th>' +
	                                    '<th scope="col">총 좌석수</th>' +
	                                    '<th scope="col">수정</th>' +
	                                    '<th scope="col">삭제</th>' +
	                                    
	                                '</tr>' +
	                            '</thead>' +
	                            '<tbody>';

	                    list.forEach(function(hallDto) {
	                        tableHtml += 
	                            '<tr class="item">' +
	                                '<td>' + hallDto.hall_name + '</td>' +
	                                '<td>' + hallDto.hall_total_seat + '</td>' +
	                                '<td>' +
	                                    '<button class="hall_modifyBtn" value="' + hallDto.hall_id + '">수정</button>' +
	                                    '</td>' +
	                                    '<td>' +
	                                    '<button class="hall_deleteBtn" value="' + hallDto.hall_id + '">삭제</button>' +
	                                '</td>' +
	                            '</tr>';
	                    });

	                    var paginationHtml = '';

	                    if (boardVo.page != 1) {
	                        paginationHtml += '<a href="#" onclick="makeSearch('+venue_id+',1,this)">&lt;&lt;&lt;</a>';
	                    }

	                    if (boardVo.prev) {
	                        paginationHtml += '<a href="#" onclick="makeSearch('+venue_id+','+(boardVo.startPage - 1)+',this)">&lt;&lt;</a>';
	                    }

	                    if (boardVo.page != 1) {
	                        paginationHtml += '<a href="#" onclick="makeSearch('+venue_id+','+(boardVo.page - 1)+',this)">&lt;</a>';
	                    }

	                    for (var idx = boardVo.startPage; idx <= boardVo.endPage; idx++) {
	                        paginationHtml += '<a href="#" onclick="makeSearch('+venue_id+','+idx+',this)"' +
	                            (idx == boardVo.page ? ' class="active"' : '') + '>' + idx + '</a>';
	                    }

	                    if (boardVo.page != boardVo.totalEndPage) {
	                        paginationHtml += '<a href="#" onclick="makeSearch('+venue_id+','+(boardVo.page + 1)+',this)">&gt;</a>';
	                    }

	                    if (boardVo.next) {
	                        paginationHtml += '<a href="#" onclick="makeSearch('+venue_id+','+(boardVo.endPage + 1)+',this)">&gt;&gt;</a>';
	                    }

	                    if (boardVo.page != boardVo.totalEndPage) {
	                        paginationHtml += '<a href="#" onclick="makeSearch('+venue_id+','+(boardVo.totalEndPage)+',this)">&gt;&gt;&gt;</a>';
	                    }

	                    tableHtml += 
	                                '</tbody>' +
	                            '</table>' +
	                            '<div class="pagination">' +
	                                paginationHtml +
	                            '</div>' +
	                        '</div>'+
                            '</td>' +
                            '</tr>';
                            var nextRow = $($button).closest('tr').nextUntil().filter('.addFormRow').first();
                            if ($('.addFormRow').length > 0) {
                            	$($button).closest('tr').replaceWith(tableHtml);
                            } else {
                                $($button).closest('tr').after(tableHtml);
                            }                                 
	                    
	                } else {
	                	if (confirm("등록된 홀이 없습니다. 추가하시겠습니까?")) {                    
	                		window.location.href = "hall_register?venue_id="+venue_id
	                    }
	                }
	            },
	            error: function(err) {
	                console.error("Error fetching data: ", err);
	            }
	        });
	    }

	    $(document).on("click", ".readBtn", function(event) {
	        var venue_id = $(this).val();
	        // 모든 .addFormRow 요소 제거
	        var addFormRowId = $('.addFormRow').attr('id');
	        if ($('.addFormRow').length == 0) {
	        	hallAjax(venue_id, 1, 5, this);
	        }else if(venue_id==addFormRowId){
	        	$('.addFormRow').remove();	        	
	        }else{
	        	$('.addFormRow').remove();
	        	hallAjax(venue_id, 1, 5, this);
	        }
	    });
		
		
		
		$('#searchBtn').on("click",function(event) {
									window.location.href = "admin_venue?nGroupKind=" + $('#region').val()
											+ "&page=1"
											+ "&perPageNum=10"
											"&keyword="
											+ $('#keywordInput').val();
								})
		$('#region').on('change', function() {
			window.location.href = "admin_venue?nGroupKind=" + $(this).val()
            + "&page=1"
            + "&perPageNum=10"
			+ "&keyword="
			+ $('#keywordInput').val();
    });
		
		$('.modifyBtn').on("click",function(event) {
			window.location.href = "venue_modify?venue_id="+$(this).val();
		});
		
		$('.newBtn').on("click",function(event) {
			window.location.href = "venue_register";
		});

						// 삭제 버튼 클릭 시 처리
		$('.deleteBtn').on("click",function(event) {
											// 현재 클릭된 버튼을 저장
											var $button = $(this);
											var venueId = $button.val();
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
        "<td colspan='5' style='text-align: center;'>" +
            "<label>극장 삭제 사유 </label>" +
            "<input type='text' id='deleteReason' placeholder='삭제 사유를 입력하세요' style='width: 600px;'>" +
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
								                    	if(confirm("극장을 삭제하면 관련된 홀정보도 모두 삭제됩니다. 정말 삭제하시겠습니까? (예매내역이 있는 경우 삭제되지 않습니다.)")){
								                    		
								                    		$.ajax({
									                            type: "POST",
									                            url: "venue_remove",
									                            data: {
									                            	venue_id: venueId,
									                                reason: reason
									                            },
									                            success: function(response) {
									                            	if (response === "success") {
									                                    alert("극장이 성공적으로 삭제되었습니다.");
									                                    location.reload();
									                                } else if (response === "fail") {
									                                    alert("예매내역이 있어 극장을 삭제할 수 없습니다.");
									                                }
									                            },
									                            error: function(xhr, status, error) {
									                                alert("극장 삭제 중 오류가 발생했습니다. 다시 시도해주세요.");
									                                console.error("Error: " + error);
									                            }
									                        });
									                        
									                    	}
								                        
								                    }
								                });
								            }
								        });
		//이하 홀 버튼 클릭시 처리
		$(document).on("click", ".hall_modifyBtn", function(event) {
			window.location.href = "hall_modify?hall_id="+$(this).val();
		});
		$(document).on("click", ".hall_newBtn", function(event) {
			window.location.href = "hall_register?venue_id="+$(this).val();
		});

						// 삭제 버튼 클릭 시 처리
		$(document).on("click", ".hall_deleteBtn", function(event) {
											// 현재 클릭된 버튼을 저장
											var $button = $(this);
											var hall_id = $button.val();

											// 이미 폼이 표시되어 있는지 확인하고, 있으면 제거
											if ($button.closest('tr').next()
													.hasClass('hall_deleteFormRow')) {
												$button.closest('tr').next()
														.remove();
											} else {
												$('.hall_deleteFormRow').remove();
												// 폼을 동적으로 추가
												var formHtml = 
    "<tr class='hall_deleteFormRow'>" +
        "<td colspan='4' style='text-align: center;'>" +
            "<label>홀 삭제 사유 </label>" +
            "<input type='text' id='hall_deleteReason' placeholder='삭제 사유를 입력하세요' style='width: 600px;'>" +
            "<button class='hall_submitDeleteBtn'>제출</button>" +
        "</td>" +
    "</tr>";

												// 삭제 버튼 아래에 폼 삽입
												$button.closest('tr').after(formHtml);

												// 제출 버튼 클릭 시 처리
								                $('.hall_submitDeleteBtn').on("click", function () {
								                    var reason = $('#hall_deleteReason').val();
								                    if (reason.trim() === "") {
								                        alert("삭제 사유를 입력해주세요.");
								                    } else {
								                    	if(confirm("정말 삭제하시겠습니까? (예매내역이 있는 경우 삭제되지 않습니다.)")){
								                    		$.ajax({
									                            type: "POST",
									                            url: "hall_remove",
									                            data: {
									                            	hall_id: hall_id,
									                                reason: reason
									                            },
									                            success: function(response) {
									                            	if (response === "success") {
									                                    alert("홀이 성공적으로 삭제되었습니다.");
									                                    location.reload();
									                                    var venue_id = $button.closest('tr').data('venue-id');
									                                    hallAjax(venue_id, 1, 5, $button.closest('tr').prev().find('.readBtn')[0]);
									                                } else if (response === "fail") {
									                                    alert("예매내역이 있어 홀을 삭제할 수 없습니다.");
									                                }
									                            },
									                            error: function(xhr, status, error) {
									                                alert("삭제 중 오류가 발생했습니다. 다시 시도해주세요.");
									                                console.error("Error: " + error);
									                            }
									                        });
									                        
									                    }
								                        
								                    }
								                });
								            }
								        });
						
	});