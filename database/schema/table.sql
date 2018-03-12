-------------------------------------
--------- 상품 관련 -----------------
-------------------------------------
-- 상품목록
DROP TABLE IF EXISTS product;
CREATE TABLE product (
  productId    int(12) NOT NULL AUTO_INCREMENT,
  storeId       int(12) NOT NULL COMMENT "셀레버인 사용자의 id를 storeID라고 부르고 있습니다.",
  title         VARCHAR(100) NOT NULL COMMENT "상품명",
  description   TEXT NOT NULL COMMENT "상품 설명",
  saleAmount         int(12) NOT NULL COMMENT "총 팔린 개수",
  likeAmount         int(12) NOT NULL COMMENT "총 찜한 개수",
  cartAmount         int(12) NOT NULL COMMENT "총 장바구니에 담긴 개수",
  hit           int(20) NOT NULL COMMENT "조회수"
  price         int(20) NOT NULL COMMENT "가격 - 가장 첫번째 옵션으로 자동입력",
  discount      int(20) NOT NULL DEFAULT 0 COMMENT "할인된 가격. 할인이 없다면 0",
  status       int(3) NOT NULL COMMENT "현재 상태(1=xxx, 2=xxx, 3=xxx) 아직 미정입니다.",
  isDeleted     int(1) NOT NULL DEFAULT 0,
  updatedAt     TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  createdAt     TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  INDEX(productId),
  INDEX(storeId),
  INDEX(price),
  INDEX(discount),
  INDEX(hit),
  INDEX(sales),
  INDEX(createdAt),
  PRIMARY KEY ('productId'),
  UNIQUE KEY productId_UNIQUE ('productId')
);

-- 상품 옵션
-- [공유사항] 상품옵션의 경우, 조만간 필드들을 추가할 예정입니다.
DROP TABLE IF EXISTS product_option;
CREATE TABLE product_option (
  optionId    int(12) NOT NULL AUTO_INCREMENT,
  productId    int(12) NOT NULL,
  title         VARCHAR(100) NOT NULL COMMENT "옵션명",
  description   TEXT NOT NULL COMMENT "옵션 설명",
  saleAmount     int(12) NOT NULL COMMENT "팔린 개수",
  price         int(20) NOT NULL COMMENT "가격",
  discount      int(20) NOT NULL DEFAULT 0 COMMENT "할인된 가격. 할인이 없다면 0",
  isDeleted     int(1) NOT NULL DEFAULT 0,
  updatedAt     TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  createdAt     TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  INDEX(optionId),
  INDEX(productId),
  INDEX(price),
  INDEX(discount),
  INDEX(sales),
  INDEX(createdAt),
  PRIMARY KEY ('optionId'),
  UNIQUE KEY optionId_UNIQUE ('optionId')
);

-- 장바구니
DROP TABLE IF EXISTS product_cart;
CREATE TABLE product_cart (
  cartId    int(12) NOT NULL AUTO_INCREMENT,
  quantity     int(4) NOT NULL COMMENT "담은 개수",
  productId    int(12) NOT NULL,
  customerId   int(12) NOT NULL COMMENT "장바구니에 담은 사용자의 userId",
  createdAt     TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  INDEX(cartId),
  INDEX(productId),
  INDEX(createdAt),
  PRIMARY KEY ('cartId'),
  UNIQUE KEY cartId_UNIQUE ('cartId')
);

-- 찜하기 / 좋아요
DROP TABLE IF EXISTS product_like;
CREATE TABLE product_like (
  likeId    int(12) NOT NULL AUTO_INCREMENT,
  productId    int(12) NOT NULL,
  customerId   int(12) NOT NULL COMMENT "찜한 사용자의 userId",
  createdAt     TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  INDEX(cartId),
  INDEX(productId),
  INDEX(createdAt),
  PRIMARY KEY ('likeId'),
  UNIQUE KEY likeId_UNIQUE ('likeId')
);

-------------------------------------
--------- 결제 관련 -----------------
-------------------------------------
-- 주문목록
DROP TABLE IF EXISTS order;
CREATE TABLE order (
  orderId   int(12) NOT NULL AUTO_INCREMENT COMMENT "고유번호 (주문Id)",
  invoiceId    int(12) NOT NULL COMMENT "주문번호 - 날짜를 기반으로 랜덤생성",
  customerId   int(12) NOT NULL COMMENT "주문한 사용자의 userId",
  storeId      int(12) NOT NULL COMMENT "셀레버인 사용자의 id를 storeID라고 부르고 있습니다.",
  productId    int(12) NOT NULL COMMENT "구매한 상품의 Id",
  optionId     int(12) NOT NULL COMMENT "구매한 상품의 옵션 Id: 상품마다 사이즈 등등의 옵션들이 있음",
  quantity     int(4) NOT NULL COMMENT "구매한 개수",
  price        int(20) NOT NULL COMMENT "구매 가격 (quantity까지 고려한 총액)",
  status      int(3) NOT NULL DEFAULT 0 COMMENT "주문의 현 상태를 나타낸다. (0: pending(기본값) / 2: invoice발행 완료 / 9: 주문취소 / 10: 결제완료 / 11: 결제취소)",
  currency    VARCHAR(5) NOT NULL COMMENT "국내 서비스는 “krw”를 기본값으로 한다. 기본값설정을 DB에서하지는 않고, server에서 DB로 보낼때 고정값으로 넣어서 보내준다.",
  createdAt   TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  isDeleted     int(1) NOT NULL DEFAULT 0,
  INDEX(orderId),
  INDEX(storeId),
  INDEX(customerId),
  INDEX(productId),
  INDEX(invoiceId),
  INDEX(createdAt),
  PRIMARY KEY ('orderId'),
  UNIQUE KEY orderId_UNIQUE ('orderId'),
  CONSTRAINT 'invoiceId_order' FOREIGN KEY ('invoiceId') REFERENCES invoice ('invoiceId') ON DELETE CASCADE ON UPDATE CASCADE
);

-- 영수증 목록
-- [알림 사항] 서비스에서 주문목록이 invoice입니다. invoice내에 order 정보들 여러개가 있는 개념입니다.
DROP TABLE IF EXISTS invoice;
CREATE TABLE invoice (
  invoiceId   int(12) NOT NULL COMMENT "주문번호 - 날짜를 기반으로 랜덤생성",
  customerId   int(12) NOT NULL COMMENT "주문한 사용자의 userId",
  price        int(20) NOT NULL COMMENT "구매 가격",
  shippingName     VARCHAR(30) NOT NULL COMMENT "배송지받는 사람 이름",
  shippingAddress     VARCHAR(150) NOT NULL COMMENT "배송지 주소",
  shippingNotice     VARCHAR(200) NOT NULL COMMENT "배송시 주의 사항",
  shippingPrice     int(10) NOT NULL COMMENT "배송비",
  status      int(3) NOT NULL DEFAULT 2 COMMENT "주문의 현 상태를 나타낸다. (0: pending(기본값) / 2: invoice발행 완료 / 10: 결제완료 / 11: 결제취소)",
  currency    VARCHAR(5) NOT NULL COMMENT "국내 서비스는 “krw”를 기본값으로 한다. 기본값설정을 DB에서하지는 않고, server에서 DB로 보낼때 고정값으로 넣어서 보내준다.",
  dueAt       TIMESTAMP COMMENT "결제 마감일이다. dueAt이 지나면, 자동으로 state가 “주문취소”가 되어야 하며, invoice도 발행취소 되어야 한다. 서버에서 매 1시간마다 체크해준다.",
  paidAt      TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  createdAt   TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  isDeleted     int(1) NOT NULL DEFAULT 0,
  INDEX(invoiceId),
  INDEX(customerId),
  INDEX(createdAt),
  PRIMARY KEY ('invoiceId'),
  UNIQUE KEY invoiceId_UNIQUE ('invoiceId')
);

-- 결제 목록
-- [알림 사항] log입니다. 사용하는 일은 전혀 없고, iamport로부터 받은 정보를 입력/업데이트만 해 줄 예정입니다.
DROP TABLE IF EXISTS payment;
CREATE TABLE payment (
  paymentId   int(12) NOT NULL AUTO_INCREMENT COMMENT "결제Id",
  invoiceId   int(12) NOT NULL COMMENT "주문번호",
  customerId   int(12) NOT NULL COMMENT "주문한 사용자의 userId",
  price        int(20) NOT NULL COMMENT "결제 총액",
  currency    VARCHAR(5) NOT NULL COMMENT "국내 서비스는 “krw”를 기본값으로 한다. 기본값설정을 DB에서하지는 않고, server에서 DB로 보낼때 고정값으로 넣어서 보내준다.",
  status      int(3) NOT NULL DEFAULT 0 COMMENT "결제의 현 상태를 나타낸다. (0: 미결제, 1: 결제완료, 2: 결제취소, 3: 결제실패)",
  pg          VARCHAR(15) NOT NULL COMMENT "PG사 명",
  type       VARCHAR(15) NOT NULL COMMENT "phone / card / transfer 등등",
  pgAcceptNo  VARCHAR(40) NOT NULL COMMENT "PG사 승인번호",
  orderEmail  VARCHAR(100) NOT NULL COMMENT "구매자의 이메일 (iamport에서 보내주는 값)",
  orderName   VARCHAR(100) NOT NULL COMMENT "구매자의 이름 (iamport에서 보내주는 값)",
  orderPhoneNumber   VARCHAR(100) NOT NULL COMMENT "구매자의 휴대폰번호 (iamport에서 보내주는 값)",
  impId       VARCHAR(40) NOT NULL COMMENT "iamport의 결제 id값",
  createdAt   TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  INDEX(paymentId),
  INDEX(customerId),
  INDEX(impId),
  PRIMARY KEY ('paymentId'),
  UNIQUE KEY paymentId_UNIQUE ('paymentId'),
  UNIQUE KEY impId_UNIQUE ('impId')
);

-------------------------------------
--------- 배송 관련 -----------------
-------------------------------------
-- 배송지
-- [알림 사항] log입니다. 사용하는 일은 전혀 없고, iamport로부터 받은 정보를 입력/업데이트만 해 줄 예정입니다.
DROP TABLE IF EXISTS delivery_address;
CREATE TABLE delivery_address (
  addressId   int(12) NOT NULL AUTO_INCREMENT COMMENT "배송지 Id",
  customerId   int(12) NOT NULL COMMENT "사용자 ID",
  shippingName     VARCHAR(30) NOT NULL COMMENT "배송지받는 사람 이름",
  shippingAddress     VARCHAR(150) NOT NULL COMMENT "배송지 주소",
  shippingNotice     VARCHAR(200) NOT NULL COMMENT "배송시 주의 사항",
  isPrimary   int(1) NOT NULL DEFAULT 0 COMMENT "기본배송지 여부"
  createdAt   TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  INDEX(addressId),
  INDEX(createdAt),
  PRIMARY KEY ('addressId'),
  UNIQUE KEY addressId_UNIQUE ('addressId'),
);

--------------------------------------------
------------------- Logs -------------------
--------------------------------------------