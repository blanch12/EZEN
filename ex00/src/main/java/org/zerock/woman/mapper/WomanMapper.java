package org.zerock.woman.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;
import org.zerock.util.page.PageObject;
import org.zerock.woman.vo.WomanColorVO;
import org.zerock.woman.vo.WomanImageVO;
import org.zerock.woman.vo.WomanSearchVO;
import org.zerock.woman.vo.WomanSizeVO;
import org.zerock.woman.vo.WomanVO;
import org.zerock.womancategory.vo.WomanCategoryVO;

@Repository
public interface WomanMapper {

	public List<WomanVO> list(
			@Param("pageObject") PageObject pageObject,
			@Param("womanSearchVO") WomanSearchVO womanSearchVO);
	// 상품 리스트 개수
	public Long getTotalRow(
			@Param("pageObject") PageObject pageObject,
			@Param("womanSearchVO") WomanSearchVO womanSearchVO);
	

	public List<WomanCategoryVO> getWomanCategory(@Param("woman_cate_code1") Integer woman_cate_code1);
	

	public WomanVO view(@Param("woman_no") Long woman_no);

	public List<WomanSizeVO> sizeList(@Param("woman_no") Long woman_no);

	public List<WomanColorVO> colorList(@Param("woman_no") Long woman_no);

	public List<WomanImageVO> imageList(@Param("woman_no") Long woman_no);
	

	public Integer write(WomanVO vo);

	public Integer writePrice(WomanVO vo);

	public Integer writeImage(WomanImageVO vo);

	public Integer writeSize(WomanSizeVO vo);

	public Integer writeColor(List<WomanColorVO> list);
	
	
	// 상품정보수정
	public Integer update(WomanVO vo);
	// 상품가격수정
	public Integer updatePrice(WomanVO vo);
	// 상품사이즈삭제
	public Integer deleteSize(Long woman_no);
	// 상품컬러삭제
	public Integer deleteColor(Long woman_no);
	// 상품이미지삭제
	public Integer deleteImage(String woman_image_name);
	
    // 상품 삭제
    Integer delete(Long woman_no);
}



