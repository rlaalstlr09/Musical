<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.net.URLDecoder" %>
<!DOCTYPE html>
<html>
<head>
    <title>Payment</title>
    <script src="https://cdn.iamport.kr/v1/iamport.js"></script>
</head>
<body>
    <h1>Payment Page</h1>
    <input type="hidden" id="total_cost" value="100">
    <input type="hidden" id="customer_id" value="John Doe">
    <button id="payButton">Pay Now</button>

    <script>
        document.getElementById('payButton').onclick = function() {
            var IMP = window.IMP; // 아임포트 내 글로벌 변수
            IMP.init('imp27170120'); // 아임포트 가맹점 식별코드

            var totalCost = document.getElementById("total_cost").value;
            var customer = document.getElementById("customer_id").value; // 고객 ID를 사용

            IMP.request_pay({
                pg: 'html5_inicis', // 이니시스 결제 PG사
                pay_method: 'card',
                merchant_uid: 'merchant_' + new Date().getTime(), // 주문 번호
                name: "Example Payment",
                amount: totalCost, // 결제 금액
                buyer_email: "customer@example.com",
                buyer_name: customer,
            }, function(rsp) {
                console.log(rsp);

                if (rsp.success) {
                    alert('결제가 완료되었습니다.');
                    // 서버로 결제 결과를 전송하거나 추가 처리를 합니다.
                } else {
                    alert('결제에 실패하였습니다. 에러내용: ' + rsp.error_msg);
                }
            });
        };
    </script>
</body>
</html>