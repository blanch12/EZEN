package org.zerock.brands.vo;

import java.util.Date;

import lombok.Data;

/**
 * BrandsPriceVO 클래스
 * <p>
 * 이 클래스는 브랜드 상품의 가격 정보를 담기 위한 VO(Value Object) 클래스입니다.
 * 상품의 원가격, 할인 금액, 할인율, 세일 가격, 배송비, 세일 시작 및 종료 날짜 등 가격 관련 정보를 포함합니다.
 * </p>
 */
@Data
public class BrandsPriceVO {

    /**
     * 가격 고유 번호
     * <p>
     * 각 가격 정보에 대해 고유하게 부여된 번호입니다.
     * </p>
     */
    private Long brands_price_no;

    /**
     * 원가격
     * <p>
     * 브랜드 상품의 원래 가격입니다. 할인이나 세일 적용 전의 가격입니다.
     * </p>
     */
    private Integer price;

    /**
     * 할인 금액
     * <p>
     * 브랜드 상품에 대해 직접 적용된 할인 금액입니다. 할인율이 아닌, 금액으로 할인 적용 시 사용됩니다.
     * </p>
     */
    private Integer discount;

    /**
     * 할인율
     * <p>
     * 브랜드 상품에 적용되는 할인율입니다. 0에서 100까지의 퍼센트 값으로 입력됩니다.
     * </p>
     */
    private Integer discount_rate;

    /**
     * 세일 가격
     * <p>
     * 할인 후 적용되는 실제 가격입니다. `discount` 또는 `discount_rate`에 의해 계산됩니다.
     * </p>
     */
    private Integer sale_price;

    /**
     * 적립률
     * <p>
     * 상품 구매 시 적립되는 포인트 비율입니다. 예를 들어, 10이면 10%를 의미합니다.
     * </p>
     */
    private Integer saved_rate;

    /**
     * 배송비
     * <p>
     * 브랜드 상품에 대해 적용되는 배송비입니다.
     * </p>
     */
    private Integer delivery_charge;

    /**
     * 세일 시작 날짜
     * <p>
     * 해당 상품의 세일이 시작되는 날짜입니다. 세일 시작일을 기준으로 할인을 적용할 수 있습니다.
     * </p>
     */
    private Date sale_start_date;

    /**
     * 세일 종료 날짜
     * <p>
     * 해당 상품의 세일이 종료되는 날짜입니다. 세일 종료일 이후에는 할인이 적용되지 않습니다.
     * </p>
     */
    private Date sale_end_date;

    /**
     * 브랜드 번호
     * <p>
     * 해당 가격 정보가 속한 브랜드의 고유 번호입니다. 브랜드와 가격 정보를 연결하는 외래 키 역할을 합니다.
     * </p>
     */
    private Long brands_no;
    
    /**
     * 세일 가격 계산
     * <p>
     * 세일 가격을 계산하는 메서드입니다. 할인 금액(`discount`)이 있을 경우, 
     * 원가격에서 할인 금액을 뺀 값을 세일 가격으로 계산하며, 
     * 그렇지 않으면 할인율(`discount_rate`)을 적용하여 세일 가격을 계산합니다.
     * </p>
     * 
     * @return 세일 가격
     */
    public Integer sale_price() {

        // 할인 금액이 있을 경우
        if (discount != 0) {
            return price - discount;
        }

        // 할인율이 있을 경우
        return (price - (price * discount_rate / 100)) / 100 * 100;
    }
}
