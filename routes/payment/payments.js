'use strict';

const router   = require('express')();
module.exports = router;

/**
 *  [논의사항]
 *  180221: 결제 관련 PG사 연동 코드도 추가 필요함
 */

/**
 *  @apiVersion 0.0.1
 *  @api {GET} /payment/payments
 *  @apiName get-payment-payments
 *  @apiGroup ERP-payment
 *  @apiDescription 결제내역 불러오기:
 *  @apiPermission customer, store, master계정 셋 다 접근 가능하나, customer의 경우에는 customerId를 자신의 id로 무조건 고정

 *  @apiParam {integer}   from=0        특정 순서부터 불러온다
 *  @apiParam {integer}   count=20      특정 개수만큼 불러온다
 *  @apiParam {integer}   [paymentId]   특정 청구 Id
 *  @apiParam {integer}   [customerId]  특정 고객 Id
 *  @apiParam {integer}   [invoiceId]   특정 청구 Id
 *  @apiParam {string}    [searchQuery] 검색 쿼리 (customerId, invoiceId, paymentId 으로 검색)
 *  @apiParam {date}      [dateFrom]    시작 날짜
 *  @apiParam {date}      [dateTo]      종료 날짜

 *  @apiSuccessExample  Success-Response:
 *  HTTP/1.1 200 OK
 *  {
 *      payments : [{
 *          paymentId     : "integer",
 *          invoiceId     : "integer",
 *          customerId     : "integer",
 *          customerName     : "string",
 *          paid     : "integer",
 *          currency     : "string", // 국내서비스는 기본이 KRW 이다.
 *          paymentType     : "integer",
 *          description     : "string",
 *          paidAt   : "Date",
 *      }, ... ]
 *  }

 *  @apiErrorExample {text} Error-Response:
 *  HTTP/1.1 200 OK
 *  { code : 404, description : "invalid body data." }
 */
router.get('/payment/payments', function(req, res, next) {
});