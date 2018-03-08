'use strict';

const router   = require('express')();
module.exports = router;

/**
 *  [논의사항]
 */

/**
 *  @apiVersion 0.0.1
 *  @api {GET} /product/carts
 *  @apiName get-product-carts
 *  @apiGroup ERP-product
 *  @apiDescription 장바구니 불러오기
 *  @apiPermission customer

 *  @apiParam {integer}   from=0        특정 순서부터 불러온다
 *  @apiParam {integer}   count=20      특정 개수만큼 불러온다
 *  @apiParam {date}      [dateFrom]    시작 날짜
 *  @apiParam {date}      [dateTo]      종료 날짜

 *  @apiSuccessExample  Success-Response:
 *  HTTP/1.1 200 OK
 *  {
 *      carts : [{
 *          cartId     : "integer",
 *          customerId     : "integer",
 *          customerName     : "string",
 *          productId     : "integer",
 *          productName     : "string",
 *          storeId     : "integer",
 *          storeName   : "string",
 *          price     : "integer",
 *          quantity     : "integer",
 *          currency     : "string", // 국내서비스는 기본이 KRW 이다.
 *          description     : "string",
 *          createdAt   : "Date",
 *      }, ... ]
 *  }

 *  @apiErrorExample {text} Error-Response:
 *  HTTP/1.1 200 OK
 *  { code : 404, description : "invalid body data." }
 */
router.get('/product/carts', function(req, res, next) {
    // 현재 로그인한 고객의 customerId로 cart 불러온다.
});

/**
 *  @apiVersion 0.0.1
 *  @api {POST} /product/cart
 *  @apiName post-product-cart
 *  @apiGroup ERP-product
 *  @apiDescription 장바구니 저장하기
 *  @apiPermission customer

 *  @apiParam {integer}   productId     특정 상품 Id
 *  @apiParam {integer}   storeId       특정 스토어 Id
 *  @apiParam {integer}   quantity      개수

 *  @apiSuccessExample  Success-Response:
 *  HTTP/1.1 200 OK
 *  {
 *      ??? 성공 시 반환값 어떻게 할지 미정. 값 없어도 무방함
 *  }

 *  @apiErrorExample {text} Error-Response:
 *  HTTP/1.1 200 OK
 *  { code : 404, description : "invalid body data." }
 */
router.post('/product/cart', function(req, res, next) {
    // 재고수량이 남아있는지 검증 필요함
});