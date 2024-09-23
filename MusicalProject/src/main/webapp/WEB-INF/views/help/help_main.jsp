<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>고객센터</title>
</head>
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/help_main.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="<%=request.getContextPath()%>/resources/script/faq.js"></script>
<script>
$(function() {
	var article = (".tb_board .show");
	$(".tb_board .item").click(
			function() {
				var myArticle = $(this).next("dd");
				if ($(myArticle).hasClass('hide')) {
					$(article).removeClass('show')
							.addClass('hide');
					$(myArticle)
							.removeClass('hide')
							.addClass('show');
				} else {
					$(myArticle).addClass('hide')
							.removeClass('show');
				}
			});
});

</script>
<body>
<jsp:include page="../layout/header.jsp"/>
<br>
<div id='wrap'>
	<div id='content'>
		<div id='search'>
			<div id='search_help'>
			<label>질문 검색</label>
			<input type="text" name="keyword" id="keywordInput" placeholder="궁금하신 점을 검색해보세요!">
			<button class="searchBtn" id="searchBtn">검색</button>
			</div>
		</div>
		<ul class="help_link">
			<li>
				<a href='inform' class='help_box' id='inform'>
					<strong class="link_title">
						<span class="color_point">이용 안내</span> 
						받기 &gt;
					</strong>
					<span class="link_text">예매 안내를 통해서<br>편리한 예매방법을<br>알아보세요.</span>					
				</a>
			</li>
			<li>
				<a href='${pageContext.request.contextPath }/member/write' class='help_box' id='write'>
				<strong class="link_title">
						<span class="color_point">1:1 상담 </span> 
						받기 &gt;
					</strong>
					<span class="link_text">빠르고 간편한<br>온라인 1:1문의를<br>이용해 보세요.</span>					
				</a>
			</li>				
			<li>
				<a href='${pageContext.request.contextPath }/member/qa_list' class='help_box' id='qa_list'>
				<strong class="link_title">
						<span class="color_point">1:1 상담 </span> 
						리스트 &gt;
					</strong>
					<span class="link_text">온라인 1:1 <br>문의 내역을<br>확인해보세요.</span>					
				</a>
			</li>
			<li>
				<a href='faq' class='help_box' id='faq'>
				<strong class="link_title">
						<span class="color_point">FAQ </span> 
						보기 &gt;
					</strong>
					<span class="link_text">궁금한 질문들을 <br>쉽게 편하게<br>한번에 알아 보세요.</span>	
				</a>
			</li>
			<li>
				<a href='notice' class='help_box' id='notice'>
				<strong class="link_title">
						<span class="color_point">공지사항 </span> 
						알아 보기 &gt;
					</strong>
					<span class="link_text">티켓보라의 <br>새로운 소식들을<br>빠르게 접해보세요.</span>	
				</a>
			</li>
			<li>
				<div class='help_box' id='inquiry'>
					<strong class="desc_title">문의하기</strong>
					<span class="desc_text">
						<span class="desc_phone">1234-5678</span>
						<span class="desc_time">09:00~18:00 (월~일)</span>
                    </span>
					
				</div>
			</li>
		</ul>
		<div class='faqBox'>
			<div class='faqTop'>
				<strong>자주 묻는 질문 TOP 10</strong>
				<div class='faqAll'><a href='faq'>전체보기</a></div>				
			</div>
			<dl class="tb_board">
				<dt class="item">
				결제 완료 메시지를 받았는데 예매 내역이 없어요.
				</dt>
				<dd class="hide">	
				<div class="show_cont">			
				<p>동시 접속 수가 많을 경우 좌석 선택 중복건이 다수 발생할 수 있습니다.</p>
				<p>이런 경우에는 결제를 먼저 완료하신 고객님의 예매가 완료됩니다.</p>
				<p>또한, 결제 완료 메시지를 받으셨더라도 예매번호가 생성 되지 않은 경우 정상 예매건이 아니므로</p>
				<p>[예매확인/취소]에서 예매내역을 꼭 확인해 주시기 바랍니다.</p>
				<p>만약, 예매 내역 없이 결제만 완료가 되었다면 자동으로 취소가 진행되나,</p>
				<p>빠른 취소를 원하신다면 예매자 본인께서 고객센터 1544-6399 또는 1:1문의하기로</p>
				<p>연락해 주시기 바랍니다.</p>
				</div>
				</dd>
			</dl>
			<dl class="tb_board">
				<dt class="item">
				회원가입은 어디서 하나요?
				</dt>
				<dd class="hide">	
				<div class="show_cont">			
				<p>티켓보라에 처음 방문하셨나요?</p>
				<p>화면 좌측 상단의 회원가입에서 간편하게 가입하시면  </p>
				<p>다양한 공연 티켓을 예매하실 수 있습니다 .</p>				
				</div>
				</dd>
			</dl>
			<dl class="tb_board">
				<dt class="item">
				비밀번호를 변경하고 싶어요.
				</dt>
				<dd class="hide">	
				<div class="show_cont">			
				<p>회원정보 수정 페이지에서 [변경] 버튼을 클릭하시고, 사용중인 비밀번호와 신규 비밀번호를 입력하시면 변경이 완료됩니다.</p>
				<p>영문자, 숫자, 특수문자 조합으로 8~15자리 입력해주세요.</p>
				</div>
				</dd>
			</dl>
			<dl class="tb_board">
				<dt class="item">
				본인인증된 ID 로만 예매할 수 있나요? 
				</dt>
				<dd class="hide">	
				<div class="show_cont">			
				<p>공연 예매는 본인 인증된 ID로만 예매 가능합니다. </p>
				<p>비회원 또는 간편 가입 회원 예매는 불가하오니, 예매 전 email 로 본인 인증을 하신 후 재로그인 해주시기 바랍니다. </p>
				</div>
				</dd>
			</dl>
			<dl class="tb_board">
				<dt class="item">
				비회원도 공연 예매를 할 수 있나요?
				</dt>
				<dd class="hide">	
				<div class="show_cont">			
				<p>비회원 및 간편 가입 회원은 예매를 하실 수가 없습니다.</p>
				<p>영문자, 숫자, 특수문자 조합으로 8~15자리 입력해주세요.</p>
				<p>예매 서비스 이용을 위해서는 email 인증을 해주시기 바랍니다. </p>
				</div>
				</dd>
			</dl>
			<dl class="tb_board">
				<dt class="item">
				공연 예매시 사용할 수 있는 결제수단은 무엇인가요?
				</dt>
				<dd class="hide">	
				<div class="show_cont">			
				<p>아래 6가지 결제수단을 이용하여 예매 가능합니다.  </p>
				<br>
				<p> 1. 신용카드</p>
				<p> 2. 무통장입금(가상계좌)</p>
				<br>
				<p>단, 신용카드와 무통장입금 결제는 동시에 할 수 없습니다. </p>
				</div>
				</dd>
			</dl>
			<dl class="tb_board">
				<dt class="item">
				예매 취소 시 환불은 어떻게 받나요?
				</dt>
				<dd class="hide">	
				<div class="show_cont">			
				<p>결제 수단에 따라 아래의 방법과 같이 환불 됩니다.</p>
				<br>
				<p>신용카드</p>
				<p>- 일반적으로 취소완료 4~5일(토, 공휴일 제외) 후 카드 승인 취소가 확인됩니다.</p>
				<p>- 취소 시점에 따라 취소 수수료/배송료를 제외한 금액만큼 환불 처리 됩니다. </p>
				<p>* 단, 해당 카드사의 취소 정책에 따라 환급일 및 승인 취소는 차이가 있을 수 있습니다. 자세한 사항은 해당 카드사로 문의 바랍니다.</p>
				<br>
				<p>무통장입금</p>
				<p>- 예매 취소 시 반드시 환불 받으실 은행명과 계좌번호를 입력해주세요.</p>
				<p>- 예매수수료, 취소수수료, 배송비 등 부과되는 수수료 금액을 제외한 후 환불 처리됩니다.</p>
				<p>- 취소 후 고객님의 계좌로 입금까지 영업일 기준 2~3일 정도 소요됩니다.</p>
				</div>
				</dd>
			</dl>
			<dl class="tb_board">
				<dt class="item">
				비밀번호를 변경하고 싶어요.
				</dt>
				<dd class="hide">	
				<div class="show_cont">			
				<p>회원정보 수정 페이지에서 [변경] 버튼을 클릭하시고, 사용중인 비밀번호와 신규 비밀번호를 입력하시면 변경이 완료됩니다.</p>
				<p>영문자, 숫자, 특수문자 조합으로 8~15자리 입력해주세요.</p>
				<p>또한, 결제 완료 메시지를 받으셨더라도 예매번호가 생성 되지 않은 경우 정상 예매건이 아니므로</p>
				<p>[예매확인/취소]에서 예매내역을 꼭 확인해 주시기 바랍니다.</p>
				<p>만약, 예매 내역 없이 결제만 완료가 되었다면 자동으로 취소가 진행되나,</p>
				<p>빠른 취소를 원하신다면 예매자 본인께서 고객센터 1544-6399 또는 1:1문의하기로</p>
				<p>연락해 주시기 바랍니다.</p>
				</div>
				</dd>
			</dl>
			<dl class="tb_board">
				<dt class="item">
				모바일 티켓 입장 방법이 궁금해요.
				</dt>
				<dd class="hide">	
				<div class="show_cont">			
				<p>티켓 입장 바코드를 입구에서 제시하시면, 별도 발권 절차 없이 바로 입장하실 수 있습니다.</p>
				<p>상품에 따라, 스마트티켓을 제공하지 않을 수 있습니다.</p>
				</div>
				</dd>
			</dl>
			<dl class="tb_board">
				<dt class="item">
				공연 예매 시 할인 받을 수 있는 신용카드는 무엇이 있나요?
				</dt>
				<dd class="hide">	
				<div class="show_cont">			
				<p>공연/전시 할인카드는 우리 We'll Rich 주거래Ⅱ, WiBee 할인카드, WiBee 포인트카드, 티켓보라 우리V카드입니다.</p>
				</div>
				</dd>
			</dl>
		</div>
		<div class='noticeBox'>
			<div class='noticeTop'>
				<strong><a href='notice'>최근 공지사항</a></strong>							
			</div>
			<ul>
			<c:forEach items="${list }" var='boardDtos' varStatus='status'>
				<li>
				<a href='notice_read?nId=${boardDtos.nId}'>${boardDtos.nTitle }
				<em class="txt_date">${boardDtos.formattedNWriteTime}</em></a>
				</li>
			</c:forEach>
			</ul>
		</div>		
</div>
</div>
<jsp:include page="../layout/footer.jsp"></jsp:include>
</body>
</html>