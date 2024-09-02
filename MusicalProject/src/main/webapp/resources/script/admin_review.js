	var result = '${msg}';
	if (result == 'success') {
		alert("처리가 완료되었습니다.");
	}
	$(document).ready(function() {
		$('#searchBtn').on("click",function(event) {
									
									window.location.href = "admin_review?nGroupKind=" 
											+ $('select[name="searchM_id"]').val()
											+ "&page=1"
							            	+ "&perPageNum=10"
											+ '&searchType='
											+ $("select[name='searchC_id']")
													.val() + "&keyword="
											+ $('#keywordInput').val();
								})
		$('select[name="searchM_id"]').on('change', function() {
			window.location.href = "admin_review?nGroupKind=" + $(this).val()
            + "&page=1"
            + "&perPageNum=10"
            + '&searchType='
			+ $('select[name="searchC_id"]')
					.val();
    });
		$('select[name="searchC_id"]').on('change', function() {
			window.location.href = "admin_review?nGroupKind=" 
				+ $('select[name="searchM_id"]').val()
				+ "&page=1"
            	+ "&perPageNum=10"
				+ '&searchType='
				+ $('select[name="searchC_id"]')
						.val();
    });

						// 삭제 버튼 클릭 시 처리
		$('.deleteBtn').on("click",function(event) {
											// 현재 클릭된 버튼을 저장
											var $button = $(this);
											var reviewId = $button.val();

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
								                        // 리뷰 삭제 요청 URL로 이동
								                        window.location.href = "review_remove?review_id=" + reviewId + "&reason=" + encodeURIComponent(reason);
								                    }
								                });
								            }
								        });
								    });