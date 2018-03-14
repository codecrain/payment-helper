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
