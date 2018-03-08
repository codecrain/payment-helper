-- 주문목록
DROP TABLE IF EXISTS orders;
CREATE TABLE orders (
  orderId   INTEGER UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  customerId   VARCHAR(50) CHARACTER SET utf8mb4 NOT NULL,
  storeId,
  productId, --해당 상품의 id를 나타낸다
  invoiceId,
  quantity,
  price,
  tax,
  commission, --해당 스토어의 커미션 비용을 나타낸다.
  shipping,
  description
  state, --주문의 현 상태를 나타낸다. (0: pending(기본값) / 2: invoice발행 완료 / 10: 결제완료)
  currency, -- 국내 서비스는 “krw”를 기본값으로 한다. 기본값설정을 DB에서하지는 않고, server에서 DB로 보낼때 고정값으로 넣어서 보내준다.
  dueAt, -- 결제 마감일이다. dueAt이 지나면, 자동으로 state가 “주문취소”가 되어야 하며, invoice도 발행취소 되어야 한다.
  paidAt,
  createdAt,
INDEX(orderId),
INDEX(storeId),
INDEX(customerId),
INDEX(productId),
INDEX(invoiceId)
);
