$(document).ready(function() {
		$('#searchBtn').on("click",function(event) {
									window.location.href = "admin_users?"
											+ "&page=1"
							            	+ "&perPageNum=10"
											+ '&searchType='
											+ $("select[name='search_keyword']")
													.val() + "&keyword="
											+ $('#keywordInput').val();
		})
		
		const $modal = $('#modal');
		let cssLoaded = false;						
		// CSS 파일을 동적으로 추가하는 함수
		function loadModalCSS() {
        if (!cssLoaded) {
            $('head').append('<link rel="stylesheet" type="text/css" href="'+contextPath+'/resources/css/signup.css" id="modal-css">');
            cssLoaded = true;
        	}
		}
		// CSS 파일을 동적으로 제거하는 함수
		function removeModalCSS() {
        $('#modal-css').remove();
        cssLoaded = false;
    	}						
		
		$('.modifyBtn').on("click",function(event) {
			loadModalCSS();
			let cId=$(this).val();
			$('#cid').val(cId);
			let statusText = $('#' + cId).text().trim();
			if(statusText=='활동'){
				$('#enabled').val('1');
			}else if(statusText=='휴면'){
				$('#enabled').val('0');
			}
			let authorityText = $('.' + cId).text().trim();
			
			console.log(cId+' : '+authorityText)
			if(authorityText=='회원'){
				$('#authority').val('ROLE_MEMBER');
			}else if(authorityText=='관리자'){
				$('#authority').val('ROLE_ADMIN');
			}
			
			$modal.show();	
			
			$('.signup').on("click",function(event) {
				let enabled= $('#enabled').val();
				let authority= $('#authority').val();
				if(confirm("정말 수정하시겠습니까?")){
					$.ajax({
	                    type: "POST",
	                    url: "users_modify",
	                    data: {
	                    	customer_id: cId,
	                    	enabled: enabled,
	                    	authority: authority
	                    },
	                    success: function(response) {
	                    	if (response === "success") {
	                            alert("회원정보가 성공적으로 수정되었습니다.");
	                            $modal.hide();			
	            				removeModalCSS();
	                            location.reload();
	                        }
	                    },
	                    error: function(xhr, status, error) {
	                        alert("수정 중 오류가 발생했습니다. 다시 시도해주세요.");
	                        console.error("Error: " + error);
	                    }
	                });		
				}
			});
			
		});
		
		
		
		$('.close').on("click",function(event) {
			$modal.hide();
			removeModalCSS();
		});
		
		
						// 삭제 버튼 클릭 시 처리
		$('.Btn').on("click",function(event) {
											// 현재 클릭된 버튼을 저장
											var $button = $(this);
											var usersId = $button.val();

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

												//  버튼 아래에 폼 삽입
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
									                            url: "users_remove",
									                            data: {
									                            	users_id: usersId,
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