package org.zerock.brands.vo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class BrandsVO {

	private Long brands_no;
	private String brands_name;
	private Integer brands_cate_code1;
	private Integer brands_cate_code2;
	private String brands_cate_name;
	
	
	private String brands_image_name;
	private String content;
	private String company;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date product_date;
	
	private Long brands_price_no;
	private Integer price;
	private Integer discount;
	private Integer discount_rate;
	private Integer sale_price;
	private Integer saved_rate;
	private Integer delivery_charge;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date sale_start_date;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date sale_end_date;
	
	public Integer sale_price() {

		if (discount != 0) {
			return price - discount;
		}

		return (price - (price * discount_rate / 100)) / 100 * 100;
	}
	
    // Getter, Setter
    public String getBrands_cate_name() {
        return brands_cate_name;
    }

    public void setBrands_cate_name(String brands_cate_name) {
        this.brands_cate_name = brands_cate_name;
    }
}




