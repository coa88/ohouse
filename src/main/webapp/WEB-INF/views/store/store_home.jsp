<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

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
    	<c:forEach items="${pdSales}" var="item">
	        <article class="store-big-item">
	            <a href="/store/category/productInfo?category=${item.category}&iProduct=${item.iProduct}"></a>
	                <div class="store-imgbox">
	                    <div class="store-item-b-img">
	                    	<img src="/resources/img/store/board/${item.iProduct}/${item.pdImg}" onerror="this.src='/resources/img/errorThumb.png'" class="store-item-b-img-pp">
	                    </div>
	                    <button class="scrap-btn" onclick="pdScrapList(${item.iProduct}, ${item.scrapChk})">
	                    <div class="scrap_div" data-iProduct = "${item.iProduct}">
                            <c:choose>
                        		<c:when test="${item.scrapChk > 0}">
	                        	    <span class="fas fa-bookmark fa-lg blue"></span>
	                        	</c:when>
	                        	<c:otherwise>
	                        	    <span class="fas fa-bookmark fa-lg"></span>
	                        	</c:otherwise>
                            </c:choose>
                        </div>
	                    </button>
	                </div>
	                <div class="store-item-info">
	                    <h1 class="store-item-header">
	                        <div class="store-item-brand">${item.brand}</div>
	                        <div class="store-item-name">${item.productTitle}</div>
	                    </h1>
	                    <div class="store-item-pricebox">
	                        <span class="store-item-pricebox-sale">${item.sales}%</span>
	                        <span class="store-item-pricebox-price"><fmt:formatNumber value="${item.finalPrice}" pattern="#,###"/></span>
	                    </div>
	                    <div>
	                        <span class="store-item-avg"><i class="fas fa-star"></i>${item.starRt}</span>
	                        <span class="store-item-rev"><strong>리뷰 <fmt:formatNumber value="${item.reviewCnt}" pattern="#,###"/></strong></span>
	                    </div>
	                </div>
	        </article>
        </c:forEach>
    </section>
</div>