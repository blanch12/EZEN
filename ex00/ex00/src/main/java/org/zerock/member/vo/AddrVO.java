package org.zerock.member.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class AddrVO {
    
    private Integer id;           // 주소 ID: 각 주소를 구별하기 위한 고유 ID
    private String memberId;      // 회원 ID: 해당 주소가 속한 회원의 ID
    private String addrName;      // 배송지명: 주소의 이름 (예: "집", "회사" 등)
    private String recipientName; // 수령인: 주소에서 물건을 받을 사람의 이름
    private String phoneNumber;   // 연락처: 수령인의 연락처
    private String addr;          // 기본 주소: 주소의 기본 정보 (예: "서울시 강남구")
    private String addrDetail;    // 상세 주소: 상세 주소 (예: "동 101호")
    private String postalCode;    // 우편번호: 주소에 해당하는 우편번호
    private String isDefault;     // 기본 배송지 여부: 기본 배송지일 경우 "Y", 아니면 "N"
    private String fullAddr;      // 전체 주소: 기본 주소와 상세 주소를 합친 값 (매핑을 위한 필드 추가)

    // Boolean 값을 기준으로 isDefault 필드에 Y/N 값 설정
    public void setIsDefaultFromBoolean(Boolean isDefault) {
        // isDefault가 true일 경우 "Y", false일 경우 "N"을 설정
        this.isDefault = (isDefault != null && isDefault) ? "Y" : "N";
    }

    // isDefault 값을 Boolean으로 반환
    public Boolean isDefaultAsBoolean() {
        // isDefault가 "Y"일 경우 true, 아니면 false 반환
        return "Y".equals(this.isDefault);
    }

    // 전체 주소 반환 (기본 주소 + 상세 주소)
    public String getFullAddr() {
        // fullAddr이 설정되지 않은 경우, 기본 주소와 상세 주소를 합쳐서 반환
        if (fullAddr == null || fullAddr.isEmpty()) {
            return (addr != null ? addr : "") + " " + (addrDetail != null ? addrDetail : "");
        }
        return fullAddr; // 이미 fullAddr에 값이 있으면 그 값을 반환
    }
}
