-------------------------------------
--------- 비디오 관련 ---------------
-------------------------------------
-- 비디오목록
DROP TABLE IF EXISTS video;
CREATE TABLE video (
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