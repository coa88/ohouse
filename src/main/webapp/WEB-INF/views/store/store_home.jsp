<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<div class="store-header">
    <div class="store-banners">
        <div id="banner-img" class="splide">
            <div class="splide__track">
                <ul class="splide__list">
                    <img src="../resources/img/banner1.jpg" class="splide__slide"></img>
                    <img src="../resources/img/banner2.jpg" class="splide__slide"></img>
                    <img src="../resources/img/banner3.jpg" class="splide__slide"></img>
                    <img src="../resources/img/banner1.jpg" class="splide__slide"></img>
                    <img src="../resources/img/banner2.jpg" class="splide__slide"></img>
                    <img src="../resources/img/banner3.jpg" class="splide__slide"></img>
                </ul>
            </div>
        </div>
    </div>

    <div id="banner-thumbnail" class="splide">
        
        <div class="splide__track">
            <ul class="splide__list">
                <li class="splide__slide">
                    1번
                </li>
                <li class="splide__slide">
                    2번
                </li>
                <li class="splide__slide">
                    3번
                </li>
                <li class="splide__slide">
                    4번
                </li>
                <li class="splide__slide">
                    5번
                </li>
                <li class="splide__slide">
                    6번
                </li>
            </ul>
        </div>
    </div>
</div>

<div class="store-container">
    <h1 class="store-index-title">오늘의딜</h1>
    <section class="store-item-container-section">
        <article class="store-big-item">
            <a href="/store/detail">
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
    </section>
</div>