var result = '${msg}';
	if (result == 'success') {
		alert("처리가 완료되었습니다.");
	}else if(result == 'fail'){
		alert("예매정보가 있습니다. 삭제할 수 없습니다.");
	}
	
	$(document).ready(function() {
	    // 현재 년도 가져오기
	    const currentYear = new Date().getFullYear();
	    
	    // 시작 년도와 끝나는 년도 셀렉트 박스 채우기
	     $('#startYear, #endYear').append(new Option('선택',''));
	    for (let year = currentYear-5; year <= currentYear+3; year++) {
	    	var startnameName = $('#startYear').attr('name');
	    	var endnameName = $('#endYear').attr('name');
	    	let option1 = new Option(year, year);
	    	let option2 = new Option(year, year);
	    	console.log(endnameName);
	    	if(startnameName == year){	    		
	    		$(option1).attr('selected', 'selected');
	    	}
	    	if(endnameName == year){	    		
	    		$(option2).attr('selected', 'selected');
	    	}
	    	$('#startYear').append(option1);
	    	$('#endYear').append(option2);
	    }
	    
	    // 확인 버튼 클릭 시 유효성 검사
	    $('#submit').click(function() {
	        const startYear = parseInt($('#startYear').val());
	        const startMonth = parseInt($('#startMonth').val());
	        const endYear = parseInt($('#endYear').val());
	        const endMonth = parseInt($('#endMonth').val());
	        
	        if ($('#startYear').val()==""|| $('#endYear').val()==""){
	        	alert('연도를 설정해 주세요.');
	        }else if (endYear < startYear || (endYear === startYear && endMonth < startMonth)) {
	            alert('기간이 잘못 설정되었습니다.');
	        } else {
	            window.location.href = "admin_musical"
	            + "?page=1"	            
	            + "&perPageNum=10"
	            + "&fGroupKind=" + $('#startYear').val() + $('#startMonth').val()
	            + "&nGroupKind=" + $('#endYear').val() + $('#endMonth').val()
	            + '&searchType='
				+ $('select[name="search_keyword"]')
						.val()
				+ "&keyword=" + $('#keywordInput').val();
	            
	        }
	    });
	});
	
	
	$(document).ready(function() {
		$('#searchBtn').on("click",function(event) {
									
									window.location.href = "admin_musical?"
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
			window.location.href = "musical_register";
		})
		
		$('.modifyBtn').on("click",function(event) {
			window.location.href = "musical_modify?musical_id="+$(this).val();
		})
		
		$('.characterBtn').on("click",function(event) {
			window.location.href = "character_read?musical_id="+$(this).val();
		})
						// 삭제 버튼 클릭 시 처리
		$('.deleteBtn').on("click",function(event) {
											// 현재 클릭된 버튼을 저장
											var $button = $(this);
											var musicalId = $button.val();

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
								                    	if(confirm("뮤지컬을 삭제하면 관련된 배역,스케쥴,좌석정보도 모두 삭제됩니다. (예매내역이 있는 경우 삭제되지 않습니다.) 정말 삭제하시겠습니까?")){
								                        // 리뷰 삭제 요청 URL로 이동
								                        window.location.href = "musical_remove?musical_id=" + musicalId + "&reason=" + encodeURIComponent(reason);
								                    	}
								                    }
								                });
								            }
								        });
		$('.excelBtn').on("click", function(event) {
			alert("모든 페이지의 내용이 엑셀로 저장됩니다.");
		    const startYear = $('#startYear').val();
		    const startMonth = $('#startMonth').val();
		    const endYear = $('#endYear').val();
		    const endMonth = $('#endMonth').val();
		    const searchType = $('select[name="search_keyword"]').val();
		    const keyword = $('#keywordInput').val();

		    let url = "musical_excel"
		        + "?fGroupKind=" + startYear + startMonth
		        + "&nGroupKind=" + endYear + endMonth
		        + "&searchType=" + searchType
		        + "&keyword=" + keyword;

		    window.location.href = url;
		});
	});