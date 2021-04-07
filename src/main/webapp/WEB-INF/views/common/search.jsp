<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:if test="${cmList2 == null && cmList3 == null && cmList4 == null && pdList == null}">
	<div class="empty_post">
		<h2>검색된 게시물이 없습니다.</h2>
	</div>
</c:if>


<!-- ///////////////////////사진////////////////////// -->
<c:if test="${cmList2 != null}">
	<section class="photo container section_mt60">
		<div class="section_title">
		    <h2 class="plr10">사진</h2>
		    <c:if test="${param.searchTyp eq 0}">
		    	<div class="photo_more" onclick="getMoreSearchList('${param.searchText}', 2)">더보기</div>
		    </c:if>
		</div>
		<ul class="photo_box mlr-10">
		 <c:forEach items="${cmList2}" var="item">
		     <li class="photo_box_list plr10">
		         <a class="photo_box_link" href="/community/photo/detail?iBoard=${item.iBoard}">
		             <div class="photo_box_img_wrap">
		                 <img class="photo_box_img" src="/resources/img/community/board/${item.iBoard}/${item.boardImg}" onerror="this.src='/resources/img/errorThumb.png'" alt="썸네일사진">
		             </div>
		             <div class="photo_box_content_wrap">
		                 <div class="photo_box_content_profile">
		                     <img class="photo_box_profile_img" src="/resources/img/user/${item.iUser}/${item.profileImg}" onerror="this.src='/resources/img/user/basic_profile.webp'" alt="프로필사진">
		                     <span class="photo_box_profile_name">${item.nm}</span>
		                 </div>
		             </div>
		         </a>
		     </li>
		 </c:forEach>
		</ul>
	</section>
</c:if>
<!-- ///////////////////////집들이////////////////////// -->
<c:if test="${cmList3 != null}">
	<section class="story container section_mt60">
	    <div class="section_title">
	        <h2 class="plr10">집들이</h2>
	        <c:if test="${param.searchTyp eq 0}">
	       		<div class="photo_more" onclick="getMoreSearchList('${param.searchText}', 3)">더보기</div>
	        </c:if>
	    </div>
	    <ul class="story_box mlr-10">
			<c:forEach items="${cmList3}" var="item">
			    <li class="story_box_list plr10">
			        <a class="story_box_link" href="/community/houseparty/detail?iBoard=${item.iBoard}">
			            <div class="story_box_img_wrap">
			                <img class="story_box_img" src="/resources/img/community/board/${item.iBoard}/${item.boardImg}" onerror="this.src='/resources/img/errorThumb.png'" alt="집들이사진">
			            </div>
			            <div class="story_box_content_wrap">
			                <div class="story_box_content_title">${item.title}</div>
			                <div class="story_box_content_profile">
			                    <img class="story_box_profile_img" src="/resources/img/user/${item.iUser}/${item.profileImg}" onerror="this.src='/resources/img/user/basic_profile.webp'" alt="프로필사진">
			                    <span class="story_box_profile_name">${item.nm}</span>
			                </div>
			            </div>
			        </a>
			    </li>
			</c:forEach>
	    </ul>
	</section>
</c:if>
<!-- ///////////////////////노하우////////////////////// -->
<c:if test="${cmList4 != null}">
	<div class="tip container">
	 	<div class="section_title">
	        <h2 class="plr10">노하우</h2>
	        <c:if test="${param.searchTyp eq 0}">
	        	<div class="photo_more" onclick="getMoreSearchList('${param.searchText}', 4)">더보기</div>
	        </c:if>
	    </div>
		<div class="tip_box mlr-10">
			<c:forEach items="${cmList4}" var="item">
				<div class="tip_box_list plr10">
				    <div class="box_padding">
				        <a class="tip_link" onclick="moveLocation(${item.iBoard})"></a>
				        <div class="tip_img_wrap">
				            <img class="tip_img" src="/resources/img/community/board/${item.iBoard}/${item.boardImg}" onerror="this.src='/resources/img/errorThumb.png'" alt="노하우사진">
				        </div>
				        <div class="tip_con">
				            <h1 class="tip_con_title">${item.title}</h1>
				            <div class="tip_con_author">${item.nm}</div>
				            <div class="tip_con_status">
				                <span class="status_scrap_count">스크랩 ${item.scrapCnt}</span>
				                <span class="status_count">조회 ${item.hits}</span>
				            </div>
				        </div>
				    </div>
				</div>
			</c:forEach>
		</div>
	</div>
</c:if>
<!-- ///////////////////////스토어////////////////////// -->
<c:if test="${pdList != null}">
<div class="store-container">
    <div class="section_title">
        <h2 class="plr10">스토어</h2>
        <c:if test="${param.searchTyp eq 0}">
        	<div class="photo_more" onclick="getMoreSearchList('${param.searchText}', 5)">더보기</div>
        </c:if>
    </div>
    <section class="store-item-container-section">
    	<c:forEach items="${pdList}" var="item">
	        <article class="store-big-item">
	            <a href="/store/category/productInfo?category=${item.category}&iProduct=${item.iProduct}"></a>
	                <div class="store-imgbox">
	                    <div class="store-item-b-img">
	                    	<img src="/resources/img/store/board/${item.iProduct}/${item.pdImg}" onerror="this.src='/resources/img/errorThumb.png'" class="store-item-b-img-pp">
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
    </section>
</div>
</c:if>