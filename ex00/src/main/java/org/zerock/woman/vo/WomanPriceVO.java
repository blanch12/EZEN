package org.zerock.woman.vo;

import java.util.Date;

import lombok.Data;

@Data
public class WomanPriceVO {

	private Long woman_price_no;
	private Integer price;
	private Integer discount;
	private Integer discount_rate;
	private Integer sale_price;
	private Integer saved_rate;
	private Integer delivery_charge;
	private Date sale_start_date;
	private Date sale_end_date;
	private Long woman_no;
	
	public Integer sale_price() {

		if (discount != 0) {
			return price - discount;
		}

		return (price - (price * discount_rate / 100)) / 100 * 100;
	}
}




