<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!-- 레이아웃 -->
<div id="layout">
	
    <!-- main -->
    <main>
        <div class="photo_feed container">
            <!-- 필터 -->
            <div class="filter_wrap">
                <div class="filter">
                    <ul class="menu">
                        <li class="menu_list">
                            <button class="btn">최신순
                                <svg class="btn_icon" width="12" height="12" viewBox="0 0 12 12" fill="currentColor"
                                    preserveAspectRatio="xMidYMid meet">
                                    <path
                                        d="M6.069 6.72l4.123-3.783 1.216 1.326-5.32 4.881L.603 4.273l1.196-1.346z">
                                    </path>
                                </svg>
                            </button>
                            <div class="submenu">
                                <div class="drop_down">
                                    <div class="panel_wrap">
                                        <ul class="panel">
                                            <li class="panel_list">
                                                <button class="panel_btn selected">최신순</button>
                                            </li>
                                            <li class="panel_list">
                                                <button class="panel_btn">최근 인기순</button>
                                            </li>
                                            <li class="panel_list">
                                                <button class="panel_btn">역대 인기순</button>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </li>
                    </ul>
                </div>
            </div>
            
            <!-- photo_리스트들 -->
            <div class="photo_box mlr-10">
           	<c:choose>
	            <c:when test="${fn:length(data.cmList) == 0}">
					<div class="nonePost">글이 없습니다.</div>
				</c:when>
				<c:otherwise>
	         		<c:forEach items="${data.cmList}" var="item">
		                <div class="photo_box_list plr10">
		                    <div class="box_padding">
		                    	<input type="hidden" name="iBoard" value="${item.iBoard}">
		            
		                        <div class="box_writer">
		                            <div class="writer_content">
		                                <div class="writer_header">
		                                    <a class="writer_link" href="#">
		                                        <img class="writer_img" src="/resources/img/user/${item.iUser}/${item.profileImg}" onerror="this.src='/resources/img/user/basic_profile.webp'" alt="프로필사진">
		                                        <span class="writer_name">${item.nm}</span>
		                                    </a>
		                                </div>
		                            </div>
		                        </div>
		                        <div class="box_content">
		                            
		                            <div class="box_link" onclick="moveLocation(${item.iBoard})">
		                                <div class="photo_feed_img_wrap">
		                                    <img class="photo_feed_img" src="/resources/img/community/board/${item.iBoard}/${item.boardImg}" onerror="this.src='/resources/img/errorThumb.png'" alt="썸네일사진">
		                                    <span class="img_view_count">조회수 ${item.hits}</span>
		                                </div>
		                                <div class="user_text_wrap">
		                                    <span class="user_text">${item.title}</span>
		                                </div>
		                            </div>
		                            <div class="util">
		                                <button class="util_icon" onclick="utilIconChk(${item.iBoard},${item.favoriteChk},2)">
		                                	<span class="utilFIcon_span" data-iBoard="${item.iBoard}" data-iconAttribute="favorite">
			                                <c:choose>
		                                		<c:when test="${item.favoriteChk > 0}">
				                                    <svg class="fIcon blue" aria-label="좋아요" width="24" height="24" stroke-width="2" viewBox="0 0 24 24" preserveAspectRatio="xMidYMid meet">
				                                        <path
				                                            d="M23.22 7.95c.4 4.94-2.92 9.71-10.92 13.85a.47.47 0 0 1-.42 0C3.88 17.66.56 12.9.96 7.93 1.54 2.48 8.28.3 12.1 4.7c3.8-4.4 10.55-2.22 11.13 3.25z">
				                                        </path>
				                                    </svg>
				                                    <span class="count">${item.favoriteCnt }</span>
			                                    </c:when>
			                                    <c:otherwise>
			                                    	<svg class="fIcon" aria-label="좋아요" width="24" height="24" stroke-width="2" viewBox="0 0 24 24" preserveAspectRatio="xMidYMid meet">
				                                        <path
				                                            d="M23.22 7.95c.4 4.94-2.92 9.71-10.92 13.85a.47.47 0 0 1-.42 0C3.88 17.66.56 12.9.96 7.93 1.54 2.48 8.28.3 12.1 4.7c3.8-4.4 10.55-2.22 11.13 3.25z">
				                                        </path>
				                                    </svg>
				                                    <span class="count">${item.favoriteCnt}</span>
			                                    </c:otherwise>
		                                    </c:choose>
		                              		</span>
		                                </button>
		                                <button class="util_icon" onclick="utilIconChk(${item.iBoard},2,${item.scrapChk})">
		                                	<span class="utilSIcon_span" data-iBoard="${item.iBoard}" data-iconAttribute="scrap">
		                                	<c:choose>
		                                		<c:when test="${item.scrapChk > 0}">
				                                    <svg class="sIcon blue" aria-label="스크랩" width="24" height="24" stroke-width="0.5" viewBox="0 0 24 24" preserveAspectRatio="xMidYMid meet">
				                                        <path
				                                            d="M11.53 18.54l-8.06 4.31A1 1 0 0 1 2 21.97V3.5A1.5 1.5 0 0 1 3.5 2h17A1.5 1.5 0 0 1 22 3.5v18.47a1 1 0 0 1-1.47.88l-8.06-4.31a1 1 0 0 0-.94 0z">
				                                        </path>
				                                    </svg>
		                                		</c:when>
		                               			<c:otherwise>
				                                    <svg class="sIcon" aria-label="스크랩" width="24" height="24" stroke-width="0.5" viewBox="0 0 24 24"
				                                        preserveAspectRatio="xMidYMid meet">
				                                        <path
				                                            d="M11.53 18.54l-8.06 4.31A1 1 0 0 1 2 21.97V3.5A1.5 1.5 0 0 1 3.5 2h17A1.5 1.5 0 0 1 22 3.5v18.47a1 1 0 0 1-1.47.88l-8.06-4.31a1 1 0 0 0-.94 0z">
				                                        </path>
				                                    </svg>
		                               			</c:otherwise>
		                                	</c:choose>
		                                	</span>
		                                    <span class="count">${item.scrapCnt}</span>
		                                </button>
		                                <button class="util_icon">
		                                    <svg class="icon_va7" aria-label="댓글 달기" width="24" height="24"
		                                        viewBox="0 0 24 24" preserveAspectRatio="xMidYMid meet">
		                                        <path fill="currentColor" fill-rule="nonzero"
		                                            d="M13.665 18.434l.53-.066C19.69 17.679 23 14.348 23 10c0-4.942-4.235-8.5-11-8.5S1 5.058 1 10c0 4.348 3.31 7.68 8.804 8.368l.531.066L12 21.764l1.665-3.33zm-3.985.926C3.493 18.585 0 14.69 0 10 0 4.753 4.373.5 12 .5S24 4.753 24 10c0 4.69-3.493 8.585-9.68 9.36l-1.647 3.293c-.374.75-.974.744-1.346 0L9.68 19.36z">
		                                        </path>
		                                    </svg>
		                                    <span class="count">${item.cmtCnt}</span>
		                                </button>
		                            </div>
		                            
		                            <div class="photo_feed_comment_wrap">
		                                <div class="photo_feed_comment">
		                                    <a class="comment_profile" href="#">
		                                        <img class="comment_img" src="/" onerror="this.src='/resources/img/user/basic_profile.webp'" alt="댓글프로필사진">
		                                        <span class="comment_name">댓글닉네임</span>
		                                    </a>
		                                    <a class="comment_link" href="#">
		                                        <p class="comment_text">댓글내용</p>
		                                    </a>
		                                </div>
		                            </div>
		                        </div>
		                    </div>
		                </div>
		           	</c:forEach>
	           	</c:otherwise>
           	</c:choose>
            </div>
             <!-- 페이징 -->
		    <div class="pageContainer">
		    	<c:if test="${data.startPage > 1}">
					<span class="page" onclick="getCmBoardList(1)">[처음]</span>
				</c:if>	
		    
				<c:forEach begin="${data.startPage}" end="${data.endPage}" var="i">			
					<span class="page ${data.page == i ? 'selected' : ''}" onclick="getCmBoardList(${i})">${i}</span>
				</c:forEach>
				
				<c:if test="${data.endPage < data.maxPageNum}">
					<span class="page" onclick="getCmBoardList(${data.maxPageNum})">[끝]</span>
				</c:if>
			</div>
			<!-- 페이징끝 -->
        </div>
    </main>
</div>