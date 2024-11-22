package org.zerock.member.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class AddrVO {
    private Integer id;           // 주소 ID
    private String memberId;      // 회원 ID
    private String addrName;      // 배송지명
    private String recipientName; // 수령인
    private String phoneNumber;   // 연락처
    private String addr;          // 기본 주소
    private String addrDetail;    // 상세 주소
    private String postalCode;    // 우편번호
    private String isDefault;     // 기본 배송지 여부 (Y/N)
    private String fullAddr;      // 기본 주소 + 상세 주소 (매핑을 위한 필드 추가)

    // Boolean 값을 기준으로 isDefault 필드에 Y/N 값 설정
    public void setIsDefaultFromBoolean(Boolean isDefault) {
        this.isDefault = (isDefault != null && isDefault) ? "Y" : "N";
    }

    // isDefault 값을 Boolean으로 반환
    public Boolean isDefaultAsBoolean() {
        return "Y".equals(this.isDefault);
    }

    // 전체 주소 반환 (기본 주소 + 상세 주소)
    public String getFullAddr() {
        if (fullAddr == null || fullAddr.isEmpty()) {
            return (addr != null ? addr : "") + " " + (addrDetail != null ? addrDetail : "");
        }
        return fullAddr;
    }
}
