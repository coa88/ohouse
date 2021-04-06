<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div class="category-container">
    <!-- 카테고리 사이드바 시작 -->
    <div class="category-side-bar">
        <section class="category-side-bar-item">
            <h2 class="category-side-bar-title">${category.categoryNm}</h2>
            <ul class="category-side-bar-other">
           		<c:forEach items="${categoryList}" var="data">
                	<li><a href="/store/category?category=${data.iCategory}">${data.categoryNm}</a></li>
                </c:forEach>
            </ul>
        </section>
    </div>
    <!-- 카테고리 사이드바 끝 -->

    <div class="category-content">
        <!-- 카테고리 배너 -->
        <div class="category-header">
            <nav class="store-header-title">${category.categoryNm}</nav>
            <div class="category-banners">
                <div class="splide">
                    <div class="splide__track">
                        <ul class="splide__list">
                            <img src="/resources/img/category_banner1.jpg" class="splide__slide"></img>
                            <img src="/resources/img/category_banner2.jpg" class="splide__slide"></img>
                            <img src="/resources/img/category_banner3.jpg" class="splide__slide"></img>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        <!-- 카테고리 배너 끝 -->

        <!-- 지금은 할인중 시작-->
        <c:if test="${param.page <= 1 || param.page == null}">
        <div class="category-mdpick">
            <h1 class="category-mdpick-title">#지금은 할인중</h1>
            <div class="category-mdpick-box">
	            <c:forEach items="${pdSales}" var="item">
	            	 <article class="store-small-item">
	                    <a href="/store/category/productInfo?category=${item.category}&iProduct=${item.iProduct}"></a>
	                        <div class="store-imgbox">
	                            <div class="store-item-s-img">
	                            	<img src="/resources/img/store/board/${item.iProduct}/${item.pdImg}" onerror="this.src='/resources/img/errorThumb.png'" class="store-item-s-img-pp">
	                            </div>
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
            </div>
            </c:if>
            <!-- 지금은 할인중 끝-->


            <!-- 전체상품-->
            <nav class="store-header-title">전체 ${data.pdList[0].productCnt}</nav>
            <!-- TODO 최신순, 인기순 -->
            <div class="store-item-list">
				<c:choose>
		            <c:when test="${fn:length(data.pdList) == 0}">
		            	<div class="nonePost">글이 없습니다.</div>
					</c:when>
					<c:otherwise>
						<c:forEach items="${data.pdList}" var="item">
			                <article class="store-big-item">
			                    <a href="/store/category/productInfo?category=${param.category eq null? 1 : param.category}&iProduct=${item.iProduct}"></a>
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
	                </c:otherwise>
                </c:choose>
            </div>
		    <!-- 페이징 -->
		    <div class="pageContainer">
		    	<c:if test="${data.startPage > 1}">
					<span class="page" onclick="getPdBoardList(1)">[처음]</span>
				</c:if>	
		    
				<c:forEach begin="${data.startPage}" end="${data.endPage}" var="i">			
					<span class="page ${data.page == i ? 'selected' : ''}" onclick="getPdBoardList(${i})">${i}</span>
				</c:forEach>
				
				<c:if test="${data.endPage < data.maxPageNum}">
					<span class="page" onclick="getPdBoardList(${data.maxPageNum})">[끝]</span>
				</c:if>
			</div>
			<!-- 페이징끝 -->
            <!-- 전체상품 끝-->
        </div>
    </div>
</div>
