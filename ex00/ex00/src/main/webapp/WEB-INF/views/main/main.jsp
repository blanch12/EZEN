<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- main.jsp -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<meta name="viewport"
	content="width=device-width, 
                initial-scale=1.0, 
                minimum-scale=1.0, 
                maximum-scale=1.0, 
                user-scalable=no, 
                viewport-fit=cover" />
<meta name="format-detection" content="telephone=no" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />

<!-- jQuery -->
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<!-- swiper -->
<script
	src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.js"></script>
<link rel="stylesheet" href="/resources/styles/reset.css?after">
<link rel="stylesheet" href="/resources/styles/common.css?after">
<link rel="stylesheet" href="/resources/styles/root.css?after">
<link rel="stylesheet" href="/resources/styles/main.css?after">
<link rel="stylesheet" href="/resources/styles/reponsive.css?after">




<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.css" />

<title>프리미엄 브랜드 셀렉샵</title>

</head>
<body>
<body class="body" id="body">
	<!-- container (S) -->
	<div class="container">
		<main class="main" role="main">
			<div class="main-wrap">
				<!-- 메인 비주얼 배너 -->
				<section
					class="section section-width__wide section-no__margin main-banner main-banner__visual swiper">
					<div class="visual-banner__wrap swiper-wrapper">
						<div class="visual-banner__item swiper-slide">
							<img src="/resources/images/main/banner_visual_maxmara.png"
								alt="" />
							<div class="visual-item__txt display-flex">
								<p class="visual-txt__content">
									우아함과 실용성을 겸비한 현대적인 품격 <strong>막스마라</strong>
								</p>
								<a href="/brands/list.do" class="btn-component01">바로가기 <span></span></a>
							</div>
						</div>
						<div class="visual-banner__item swiper-slide">
							<img src="/resources/images/main/banner_visual_moncler.png"
								alt="" />
							<div class="visual-item__txt display-flex">
								<p class="visual-txt__content">
									프리미엄 아우터웨어의 정수 <strong>몽클레르</strong>
								</p>
								<a href="/brands/list.do" class="btn-component01">바로가기 <span></span></a>
							</div>
						</div>
						<div class="visual-banner__item swiper-slide">
							<img src="/resources/images/main/banner_visual_prada.png" alt="" />
							<div class="visual-item__txt display-flex">
								<p class="visual-txt__content">
									고급스러움 속에서 빛나는 모던함 <strong>프라다</strong>
								</p>
								<a href="/brands/list.do" class="btn-component01">바로가기 <span></span></a>
							</div>
						</div>
						<div class="visual-banner__item swiper-slide">
							<img src="/resources/images/main/banner_visual_westwood.png"
								alt="" />
							<div class="visual-item__txt display-flex">
								<p class="visual-txt__content">
									예술과 자유로 빚어낸 대담한 클래식 <strong>비비안 웨스트우드</strong>
								</p>
								<a href="/brands/list.do" class="btn-component01">바로가기 <span></span></a>
							</div>
						</div>
					</div>
					<div class="swiper-pagination"></div>
					<div class="swiper-button-prev prev-no-bg"></div>
					<div class="swiper-button-next next-no-bg"></div>
				</section>

				<!-- 메인 카테고리 박스 -->
				<section class="section section-width__limit main-category">
					<div class="main-category__wrap display-flex">
						<div class="category-item category-woman" href="#">
							<img src="/resources/images/main/category_woman_hover.png" alt="" />
							<a href="/woman/list.do" class="display-flex">WOMAN</a>
						</div>
						<div class="category-item category-man" href="#">
							<img src="/resources/images/main/category_man_hover.png" alt="" />
							<a href="/goods/list.do" class="display-flex">MAN</a>
						</div>
						<div class="category-item category-bag" href="#">
							<img src="/resources/images/main/category_bag_hover.png" alt="" />
							<a href="#" class="display-flex">BAG</a>
						</div>
						<div class="category-item category-acc" href="#">
							<img src="/resources/images/main/category_acc_hover.png" alt="" />
							<a href="#" class="display-flex">ACC</a>
						</div>
					</div>
				</section>

				<!-- 메인 상품리스트 (트렌드픽) -->
				<section class="section section-width__limit main-trendpick">
					<h2 class="title">Trend Pick</h2>
					<div class="trendpick-wrap">
						<div class="product-list__box">
							<ul class="product-list" id="productList">
								<!-- item -->
							</ul>
						</div>
					</div>
				</section>

				<!-- 메인 익스클루시브 배너 -->
				<section
					class="section section-width__wide main-banner main-banner__exclusive">
					<div class="exclusive-wrap">
						<a href="/brands/list.do"> <img
							src="/resources/images/main/banner_exclusive.png" alt="" /> <span
							class="btn-component02">2025 SS Collection</span>
						</a>
					</div>
					<div class="exclusive-wrap__mobile">
						<a href="/brands/list.do"> <img
							src="/resources/images/main/banner_exclusive_mobile.png" alt="" />
						</a>
						<div class="exclusive-mobile-txtbox">
							<img src="/resources/images/main/logo_balenciaga.png" alt="" />
						</div>
						<span class="btn-component01">2025 SS Collection</span>
					</div>
				</section>

				<!-- 메인 브랜드 배너 -->
				<section
					class="section section-width__wide main-banner main-banner__brands swiper">
					<div class="brands-banner__wrap swiper-wrapper display-flex">
						<div class="brands-banner__item swiper-slide">
							<img src="/resources/images/main/exclusive_item_stoneisland.png"
								alt="" />
							<div class="barnds-banner__txtbox">
								<img src="/resources/images/main/logo_stoneisland.png" alt="" />
								<div class="brandshop-content display-flex img-bg-light">
									<div>
										<span class="brandshop-content__txt">컨템포러리 어쩌고</span> <span
											class="brandshop-content__title"><strong>스톤아일랜드</strong></span>
									</div>
									<a href="#" class="btn-component01">브랜드 스토어</a>
								</div>
							</div>
						</div>
						<div class="brands-banner__item swiper-slide">
							<img src="/resources/images/main/exclusive_item_celine.png"
								alt="" />
							<div class="barnds-banner__txtbox">
								<img src="/resources/images/main/logo_celine.png" alt="" />
								<div class="brandshop-content display-flex">
									<div>
										<span class="brandshop-content__txt">어쩌고저쩌고</span> <span
											class="brandshop-content__title"><strong>셀린느</strong></span>
									</div>
									<a href="#" class="btn-component01">브랜드 스토어</a>
								</div>
							</div>
						</div>
						<div class="brands-banner__item swiper-slide">
							<img src="/resources/images/main/exclusive_item_hermes.png"
								alt="" />
							<div class="barnds-banner__txtbox">
								<img src="/resources/images/main/logo_hermes.png" alt="" />
								<div class="brandshop-content display-flex">
									<div>
										<span class="brandshop-content__txt">프랑스 하이엔드 패션하우스</span> <span
											class="brandshop-content__title"><strong>에르메스</strong></span>
									</div>
									<a href="#" class="btn-component01">브랜드 스토어</a>
								</div>
							</div>
						</div>
						<div class="brands-banner__item swiper-slide">
							<img src="/resources/images/main/exclusive_item_acnestudios.png"
								alt="" />
							<div class="barnds-banner__txtbox">
								<img src="/resources/images/main/logo_acnestudios.png" alt="" />
								<div class="brandshop-content display-flex">
									<div>
										<span class="brandshop-content__txt">로렘입숨</span> <span
											class="brandshop-content__title"><strong>아크네
												스튜디오</strong></span>
									</div>
									<a href="#" class="btn-component01">브랜드 스토어</a>
								</div>
							</div>
						</div>
						<div class="brands-banner__item swiper-slide">
							<img src="/resources/images/main/exclusive_item_louisvuitton.png"
								alt="" />
							<div class="barnds-banner__txtbox">
								<img src="/resources/images/main/logo_louisvuitton.png" alt="" />
								<div class="brandshop-content display-flex">
									<div>
										<span class="brandshop-content__txt">예뻐요</span> <span
											class="brandshop-content__title"><strong>루이비통</strong></span>
									</div>
									<a href="#" class="btn-component01">브랜드 스토어</a>
								</div>
							</div>
						</div>
					</div>
					<div class="swiper-button-prev prev-no-bg"></div>
					<div class="swiper-button-next next-no-bg"></div>
				</section>

				<!-- 메인 이벤트 배너 -->
				<section
					class="section section-width__wide main-banner main-banner__event">
					<div class="event-banner__wrap display-flex">
						<a href="#"> <img
							src="/resources/images/main/banner_review.png" alt="" />
							<div class="main-event__innertxt txt-white">
								<strong>BEST REVIEW EVENT</strong>
								<p>베스트 리뷰로 선정되면 최대 100,000원 적립금 지급!</p>
							</div>
						</a> <a href="#"> <img
							src="/resources/images/main/banner_welcome.png" alt="" />
							<div class="main-event__innertxt welcome-event">
								<p>
									신규 회원가입 시 <br /> <strong>50,000원 웰컴쿠폰</strong> 즉시 발급!
								</p>
							</div>
						</a>
					</div>
				</section>

				<!-- 메인 베스트리뷰 스와이퍼 -->
				<section class="section section-width__limit main-bestreview">
					<h2 class="title">Best Review</h2>
					<div class="main-bestreview__wrap swiper">
						<ul class="bestreview-list swiper-wrapper">
							<li class="bestreview-item swiper-slide">
								<div class="user-review__img">
									<img src="/resources/images/main/review_user_img01.png" alt="" />
								</div>
								<ul class="star display-flex">
									<li><img src="/resources/images/icons/star.svg" alt="" /></li>
									<li><img src="/resources/images/icons/star.svg" alt="" /></li>
									<li><img src="/resources/images/icons/star.svg" alt="" /></li>
									<li><img src="/resources/images/icons/star.svg" alt="" /></li>
									<li><img src="/resources/images/icons/star.svg" alt="" /></li>
								</ul> <a class="review-product__info display-flex" href="#">
									<div class="product-thumbnali__sm">
										<img src="/resources/images/main/review_thum_sm01.png" alt="" />
									</div>
									<div class="review-product__link display-flex">
										<div class="product-info review-product__txt">
											<span class="item-brand">MAXMARA</span> <span
												class="item-title">더블 브레스트 코트 카멜</span>
										</div>
										<span class="go-link"><img
											src="/resources/images/icons/arrow-next.svg" alt="" /></span>
									</div>
							</a>
							</li>
							<li class="bestreview-item swiper-slide">
								<div class="user-review__img">
									<img src="/resources/images/main/review_user_img02.png" alt="" />
								</div>
								<ul class="star display-flex">
									<li><img src="/resources/images/icons/star.svg" alt="" /></li>
									<li><img src="/resources/images/icons/star.svg" alt="" /></li>
									<li><img src="/resources/images/icons/star.svg" alt="" /></li>
									<li><img src="/resources/images/icons/star.svg" alt="" /></li>
									<li><img src="/resources/images/icons/star.svg" alt="" /></li>
								</ul> <a class="review-product__info display-flex" href="#">
									<div class="product-thumbnali__sm">
										<img src="/resources/images/main/review_thum_sm02.png" alt="" />
									</div>
									<div class="review-product__link display-flex">
										<div class="product-info review-product__txt">
											<span class="item-brand">BALENCIAGA</span> <span
												class="item-title">모나코 미니 퀼티드 백 블랙</span>
										</div>
										<span class="go-link"><img
											src="/resources/images/icons/arrow-next.svg" alt="" /></span>
									</div>
							</a>
							</li>
							<li class="bestreview-item swiper-slide">
								<div class="user-review__img">
									<img src="/resources/images/main/review_user_img03.png" alt="" />
								</div>
								<ul class="star display-flex">
									<li><img src="/resources/images/icons/star.svg" alt="" /></li>
									<li><img src="/resources/images/icons/star.svg" alt="" /></li>
									<li><img src="/resources/images/icons/star.svg" alt="" /></li>
									<li><img src="/resources/images/icons/star.svg" alt="" /></li>
									<li><img src="/resources/images/icons/star.svg" alt="" /></li>
								</ul> <a class="review-product__info display-flex" href="#">
									<div class="product-thumbnali__sm">
										<img src="/resources/images/main/review_thum_sm03.png" alt="" />
									</div>
									<div class="review-product__link display-flex">
										<div class="product-info review-product__txt">
											<span class="item-brand">GUCCI</span> <span
												class="item-title">사이드 자카드 로고 트랙팬츠</span>
										</div>
										<span class="go-link"><img
											src="/resources/images/icons/arrow-next.svg" alt="" /></span>
									</div>
							</a>
							</li>
							<li class="bestreview-item swiper-slide">
								<div class="user-review__img">
									<img src="/resources/images/main/review_user_img04.png" alt="" />
								</div>
								<ul class="star display-flex">
									<li><img src="/resources/images/icons/star.svg" alt="" /></li>
									<li><img src="/resources/images/icons/star.svg" alt="" /></li>
									<li><img src="/resources/images/icons/star.svg" alt="" /></li>
									<li><img src="/resources/images/icons/star.svg" alt="" /></li>
									<li><img src="/resources/images/icons/star.svg" alt="" /></li>
								</ul> <a class="review-product__info display-flex" href="#">
									<div class="product-thumbnali__sm">
										<img src="/resources/images/main/review_thum_sm04.png" alt="" />
									</div>
									<div class="review-product__link display-flex">
										<div class="product-info review-product__txt">
											<span class="item-brand">THOM BROWNE</span> <span
												class="item-title">사선완장 클래식 메리노 울 가디건</span>
										</div>
										<span class="go-link"><img
											src="/resources/images/icons/arrow-next.svg" alt="" /></span>
									</div>
							</a>
							</li>
						</ul>
					</div>
				</section>
			</div>
		</main>


	</div>
<script type="text/javascript" src="/resources/js/product.js?after"></script>
<script type="text/javascript" src="/resources/js/mainslider.js?after"></script>

	<script>
	AOS.init();
    </script>
	<!-- container (E) -->
</body>
</html>
