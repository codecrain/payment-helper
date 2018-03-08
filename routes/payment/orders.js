'use strict';

const router   = require('express')();
module.exports = router;

/**
 *  [논의사항]
 *  180221(신해용) : 각 스토어마다 배송비가 다를 수 있다. 또한, 상품들이 묶여서 배송되면 배송비 무료라던가, 배송비 절감 등 여러 시나리오가 꼬일 수 있음.
 *     => (이재문) ㅇㄹㅇㄹ
 *  #180221(신해용) : 각 스토어마다 커미션 비가 다를 수 있으며, 같은 스토어라도 커미션 비가 다른 경우가 있을 수 있다.
 *  #180221(신해용) : 국가마다 세금체계가 다를 수 있다. 이번 개발에서는 한국을 기준으로 하더라도, 향 후 확장할 때 구조상 문제가 발생할 수 있으므로 고려는 해두어야 함.
 *  180222:
 */

/**
 *  @apiVersion 0.0.1
 *  @api {GET} /payment/orders
 *  @apiName get-payment-orders
 *  @apiGroup ERP-payment
 *  @apiDescription 주문내역 불러오기:
 *  @apiPermission customer, store, master계정 셋 다 접근 가능하나, customer의 경우에는 customerId를 자신의 id로 무조건 고정

 *  @apiParam {integer}   from=0        특정 순서부터 불러온다
 *  @apiParam {integer}   count=20      특정 개수만큼 불러온다
 *  @apiParam {integer}   [orderId]     특정 주문 Id
 *  @apiParam {integer}   [storeId]     특정 스토어 Id
 *  @apiParam {integer}   [customerId]  특정 고객 Id
 *  @apiParam {integer}   [productId]   특정 상품 Id
 *  @apiParam {integer}   [invoiceId]   특정 청구 Id
 *  @apiParam {string}    [searchQuery] 검색 쿼리 (storeId, customerId, productId, invoiceId, productName 으로 검색)
 *  @apiParam {date}      [dateFrom]    시작 날짜
 *  @apiParam {date}      [dateTo]      종료 날짜

 *  @apiSuccessExample  Success-Response:
 *  HTTP/1.1 200 OK
 *  {
 *      orders : [{
 *          orderId     : "integer",
 *          customerId     : "integer",
 *          customerName     : "string", // 이걸 넣어야 할 까?
 *          storeId     : "integer",
 *          storeName     : "string", // 이걸 넣어야 할 까?
 *          productId     : "integer",
 *          productName     : "string", // 이건 payment 모듈에 포함이기 때문에 괜찮을 것으로 보임
 *          invoiceId     : "integer",
 *          quantity     : "integer",
 *          price     : "integer",
 *          tax     : "integer", // 어떻게할까...일단은 알아서 정산하세요로!
 *          commission     : "integer", // 스토어가 가져가는 커미션 비 // 저작권협회같이 여러 커미션이 있는 경우는?
 *          shipping     : "integer", // 배송비 (이 부분이 제일 고민)
 *          address     : "string", // 배송될 주소
 *          description     : "string",
 *          state     : "integer", // 주문의 현 상태를 나타낸다. (0: pending(기본값) / 2: invoice발행 완료 / 10: 결제완료) => 비트플래그
 *          currency     : "string", // 국내서비스는 기본이 KRW 이다.
 *          dueAt   : "Date", // 무통장 입금때문에 넣어는 두었는데, 일단 셀레브에서는 빼도 될 듯 함 (고려만 해두면 될 듯 함)
 *          createdAt   : "Date"
 *      }, ... ]
 *  }

 *  @apiErrorExample {text} Error-Response:
 *  HTTP/1.1 200 OK
 *  { code : 404, description : "invalid body data." }
 */
router.get('/payment/orders', function(req, res, next) {

});