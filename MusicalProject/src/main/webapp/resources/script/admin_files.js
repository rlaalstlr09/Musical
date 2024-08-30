
var result = '${msg}';
if (result == 'success') {
	alert("처리가 완료되었습니다.");
}


    $(document).ready(function () {
    	$(".viewBtn").click(function () {
    	    const fileName = $(this).data("file");
    	    const url = "admin_fileView?" + 'searchType=' + $('select[name="select"]').val() + "&fileName=" + fileName;
    	    const windowName = '_blank'; // 창의 이름
    	    const windowFeatures = 'width=800,height=700,scrollbars=yes,resizable=yes'; // 팝업창의 속성 설정

    	    window.open(url, windowName, windowFeatures);
    	});

        $(".deleteBtn").click(function () {
            if (confirm("정말 삭제하시겠습니까? (경고 : 실제 파일이 삭제됩니다.)")) {
                const fileName = $(this).data("file");
                const searchType = $('select[name="select"]').val();
                $.post("admin_fileRemove", { fileName: fileName, searchType: searchType }, function (data) {
                    window.location.reload();
                    alert("처리가 완료되었습니다.");
                });
            }
        });
        
        $(".addBtn").click(function () {
        	var $button = $(this);
        	// 현재 클릭된 버튼을 저장
			var file= $(this).data("file");
        	

			// 이미 폼이 표시되어 있는지 확인하고, 있으면 제거
			if ($button.closest('tr').next()
					.hasClass('addFormRow')) {
				$button.closest('tr').next()
						.remove();	
			} else {
				$('.addFormRow').remove();
				// 폼을 동적으로 추가
				var formHtml = 
"<tr class='addFormRow'>" +
"<td colspan='4' style='text-align: center;'>" +
"<label>등록 유형 </label>" +
"<select id='add' data-file='"+file+"'>" +
"<option value='null'>------------</option>" +
"<option value='musical'>뮤지컬정보</option>" +
"<option value='venue'>극장정보</option>" +
"<option value='hall'>홀정보</option>" +
"<option value='actor'>배우정보</option>" +
"<option value='character'>배역정보</option>" +       
"</select>";

				// 삭제 버튼 아래에 폼 삽입
				$button.closest('tr').after(formHtml);				
            }
        });
        
        
        $(document).on('change', '#add', function() {
        	var input_id=$(this).val(); 
        	var file= $(this).data("file");
			$('#name_add').remove();
			$('.submitAddBtn').remove();
			$('#labelAdd').remove();
			if(input_id!='null'){
        	$.post("admin_fileIdSelect", { input_id: input_id}, function (data) {          		
        		var formHtml2=
        			"<label id='labelAdd'>	등록 이름 </label>" +
        			"<select id='name_add' style='width:50%; '>";
        			if(input_id==="musical"||input_id==="venue"||input_id==="actor"||input_id==="hall"){
        				formHtml2+=
                			"<option value='new'>새로 등록</option>";
        			}
        			
        		data.forEach(function(Dto) {
        			formHtml2 +=
        			"<option value='"+Dto.table_id+"'>"+Dto.table_name+"</option>"        			
        		});
        		formHtml2 +=  
        			"</select>" +
        			"<button class='submitAddBtn' data-file='"+file+"'>등록</button>" +
        			"</td>" +
        			"</tr>";
        		$('#add').after(formHtml2);
        		
        		// 여기서 select2를 적용합니다
                $('#name_add').select2();
            });
			}        	
        });
        
        $('#name_add').select2({
            placeholder: "이름을 검색하세요",
            allowClear: true
        });
     // 제출 버튼 클릭 시 처리
     $(document).on('click', '.submitAddBtn', function() {
    	    var fileName = $(this).data("file");
            var table_id = $('#name_add').val();
            var table_title = $('#name_add option:selected').text();
            var dto_name = $('#add').val();
            var searchType=$('select[name="select"]').val();
            if (table_id === "new") {
            	 window.location.href = dto_name+"_register_file?fileName="+ encodeURIComponent(fileName)
            	 + '&searchType=' + searchType;
            } else {
            	if (confirm("\'"+table_title+"\'에 문서를 등록하시겠습니까?")) {                    
                    $.post("admin_fileAdd", { fileName: fileName, table_name: dto_name, table_id: table_id, searchType: searchType }, function (data) {
                        window.location.reload();
                        alert("등록이 완료되었습니다.");
                    });
                }
                
            }
        });
        
        
        $('select[name="select"]').on('change', function() {
			window.location.href = "admin_files?"
            + "&page=1"
            + "&perPageNum=10"
            + '&searchType='
			+ $(this).val()
    	});
    });
    
    