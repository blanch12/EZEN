package org.zerock.woman.vo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class WomanVO {

	private Long woman_no;
	private String woman_name;
	private Integer woman_cate_code1;
	private Integer woman_cate_code2;
	private String woman_cate_name;
	private String woman_image_name;
	private String content;
	private String company;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date product_date;
	
	private Long woman_price_no;
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
	


}




