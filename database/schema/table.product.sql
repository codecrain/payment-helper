-- 크라우드펀딩 추가

-------------------------------------
------------- 상품 관련 -------------
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
  hitAmount       int(20) NOT NULL COMMENT "조회수"
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
  INDEX(hitAmount),
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
