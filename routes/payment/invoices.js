'use strict';

const router   = require('express')();
module.exports = router;

/**
 *  [논의사항]
 */

/**
 *  @apiVersion 0.0.1
 *  @api {GET} /payment/invoices
 *  @apiName get-payment-invoices
 *  @apiGroup ERP-payment
 *  @apiDescription 청구서목록 불러오기:
 *  @apiPermission customer, store, master계정 셋 다 접근 가능하나, customer의 경우에는 customerId를 자신의 id로 무조건 고정

 *  @apiParam {integer}   from=0        특정 순서부터 불러온다
 *  @apiParam {integer}   count=20      특정 개수만큼 불러온다
 *  @apiParam {integer}   [invoiceId]   특정 청구 Id
 *  @apiParam {integer}   [paymentId]   특정 결제 Id
 *  @apiParam {integer}   [customerId]  특정 고객 Id
 *  @apiParam {string}    [searchQuery] 검색 쿼리 (customerId, invoiceId 으로 검색)
 *  @apiParam {date}      [dateFrom]    시작 날짜
 *  @apiParam {date}      [dateTo]      종료 날짜

 *  @apiSuccessExample  Success-Response:
 *  HTTP/1.1 200 OK
 *  {
 *      invoices : [{
 *          invoiceId     : "integer",
 *          customerId     : "integer",
 *          customerName     : "string",
 *          orders: [{
 *              orderId     : "integer",
     *          customerId     : "integer",
     *          storeId     : "integer",
     *          storeName     : "string",
     *          productId     : "integer",
     *          productName     : "string",
     *          quantity     : "integer",
     *          price     : "integer",
     *          tax     : "integer",
     *          commission     : "integer", // 스토어가 가져가는 커미션 비
     *          shipping     : "integer", // 배송비
     *          description     : "string",
     *          state     : "integer", // 주문의 현 상태를 나타낸다. (0: pending(기본값) / 2: invoice발행 완료 / 10: 결제완료)
     *          currency     : "string", // 국내서비스는 기본이 KRW 이다.
     *          dueAt   : "Date",
     *          createdAt   : "Date"
 *          }],
 *          price     : "integer", // 상품가격 + tax + commission까지 모두 합친 총 금액
 *          tax     : "integer",
 *          commission     : "integer", // 스토어가 가져가는 커미션 비
 *          shipping     : "integer", // 배송비
 *          address     : "string", // 배송될 주소
 *          description     : "string",
 *          state     : "integer", // 주문의 현 상태를 나타낸다. (0: pending(기본값) / 2: invoice발행 완료 / 10: 결제완료)
 *          currency     : "string", // 국내서비스는 기본이 KRW 이다.
 *          dueAt   : "Date",
 *          createdAt   : "Date"
 *      }, ... ]
 *  }

 *  @apiErrorExample {text} Error-Response:
 *  HTTP/1.1 200 OK
 *  { code : 404, description : "invalid body data." }
 */
router.get('/payment/invoices', function(req, res, next) {
});