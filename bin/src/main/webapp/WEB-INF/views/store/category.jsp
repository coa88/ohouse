<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<div class="category-container">
    <!-- 카테고리 사이드바 시작 -->
    <div class="category-side-bar">
        <section class="category-side-bar-item">
            <h2 class="category-side-bar-title">가구</h2>
            <ul class="category-side-bar-other">
                <li><a href="#">가구</a></li>
                <li><a href="#">패브릭</a></li>
                <li><a href="#">홈데코/조명</a></li>
                <li><a href="#">가전</a></li>
                <li><a href="#">수납/정리</a></li>
            </ul>
        </section>
    </div>
    <!-- 카테고리 사이드바 끝 -->

    <div class="category-content">
        <!-- 카테고리 배너 -->
        <div class="category-header">
            <nav class="store-header-title">가구</nav>
            <div class="category-banners">
                <div class="splide">
                    <div class="splide__track">
                        <ul class="splide__list">
                            <img src="../resources/img/category_banner1.jpg" class="splide__slide"></img>
                            <img src="../resources/img/category_banner2.jpg" class="splide__slide"></img>
                            <img src="../resources/img/category_banner3.jpg" class="splide__slide"></img>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        <!-- 카테고리 배너 끝 -->
        
        <!-- 지금은 할인중 시작-->
        <div class="category-mdpick">
            <h1 class="category-mdpick-title">#지금은 할인중</h1>
            <div class="category-mdpick-box">
                <article class="store-small-item">
                    <a href="/store/store_detail">
                        <div class="store-imgbox">
                            <div class="store-item-s-img"><img src="../resources/img/1.jpg" class="store-item-s-img-pp"></div>
                            <button class="scrap-btn">
                                <span class="fas fa-bookmark fa-lg"></span>
                            </button>
                        </div>
                        <div class="store-item-info">
                            <h1 class="store-item-header">
                                <div class="store-item-brand">판매업체</div>
                                <div class="store-item-name">상품이름</div>
                            </h1>
                            <div class="store-item-pricebox">
                                <span class="store-item-pricebox-sale">40%</span>
                                <span class="store-item-pricebox-price">170,000 외</span>
                            </div>
                            <div>
                                <span class="store-item-avg"><i class="fas fa-star"></i>4.7</span>
                                <span class="store-item-rev"><strong>리뷰 3451</strong></span>
                            </div>
                        </div>
                    </a>
                </article>
                
            </div>
            <!-- 지금은 할인중 끝-->


            <!-- 전체상품-->
            <nav class="store-header-title">전체 5123개</nav>
            <!-- TODO 최신순, 인기순 -->
            <div class="store-item-list">

                <article class="store-big-item">
                    <a href="/store/store_detail">
                        <div class="store-imgbox">
                            <div class="store-item-b-img"><img src="../resources/img/1.jpg" class="store-item-b-img-pp"></div>
                            <button class="scrap-btn">
                                <span class="fas fa-bookmark fa-lg"></span>
                            </button>
                        </div>
                        <div class="store-item-info">
                            <h1 class="store-item-header">
                                <div class="store-item-brand">판매업체</div>
                                <div class="store-item-name">상품이름</div>
                            </h1>
                            <div class="store-item-pricebox">
                                <span class="store-item-pricebox-sale">40%</span>
                                <span class="store-item-pricebox-price">170,000 외</span>
                            </div>
                            <div>
                                <span class="store-item-avg"><i class="fas fa-star"></i>4.7</span>
                                <span class="store-item-rev"><strong>리뷰 3451</strong></span>
                            </div>
                        </div>
                    </a>
                </article>
                
            </div>
            <!-- 전체상품 끝-->
        </div>
    </div>
</div>