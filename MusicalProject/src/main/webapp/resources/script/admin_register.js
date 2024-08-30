		$(document).ready(function() {
			$(".viewBtn").click(function () {
	    	    const fileName = $(this).data("file");
	    	    if(fileName==""){
	    	    	alert("등록된 파일이 없습니다.");
	    	    	return;
	    	    }
	    	    const searchType = $(this).val();
	    	    const url = "admin_fileView?" + 'searchType=' + searchType + "&fileName=" + fileName;
	    	    const windowName = '_blank'; // 창의 이름
	    	    const windowFeatures = 'width=800,height=700,scrollbars=yes,resizable=yes'; // 팝업창의 속성 설정

	    	    window.open(url, windowName, windowFeatures);
	    	});
			
			var formObj = $("form[role='form']");
			$(".btn-warning").on("click", function() {
				window.history.back();
			});
						
			
		});