<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!-- 레이아웃 -->
<div id="layout">
    <!-- main -->
    <main>
        <div class="houseparty container">
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
            <!-- 전체 게시물 카운트 -->
            <div class="all_feed_count">전체 ${data.cmList[0].boardCnt}</div>
			
            <!-- 집들이,전문가집들이 리스트들 -->
            <div class="houseparty_box mlr-10">
			<c:choose>
	            <c:when test="${fn:length(data.cmList) == 0}">
					<div class="nonePost">글이 없습니다.</div>
				</c:when>
				<c:otherwise>
	            	<c:forEach items="${data.cmList}" var="item">
		                <div class="houseparty_box_list plr10">
		                    <div class="box_padding">
		                        <a class="houseparty_link" onclick="moveLocation(${item.iBoard})"></a>
		                        <div class="houseparty_img_wrap">
		                            <img class="houseparty_img" src="/resources/img/community/board/${item.iBoard}/${item.boardImg}" onerror="this.src='/resources/img/errorThumb.png'" alt="집들이사진">
		                            <button class="houseparty_scrap" onclick="scrapList(${item.iBoard}, ${item.scrapChk})">
		                            	<div class="scrap_div" data-iBoard = "${item.iBoard}">
			                            	<c:choose>
			                            		<c:when test="${item.scrapChk > 0}">
					                                <svg class="scrap_icon active_blue" xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24"><g fill-rule="nonzero" transform="matrix(1 0 0 -1 0 24)"><path stroke="#FFF" d="M12.71 7.37h-.002a1.5 1.5 0 0 1-1.417 0L4.236 3.56a.499.499 0 0 0-.736.442v15.496c0 .553.448 1.002 1 1.002h15c.552 0 1-.449 1-1.002V4.002a.499.499 0 0 0-.734-.443l-7.057 3.81zm-.475-.88h-.001z"></path></svg>
			                            		</c:when>
			                            		<c:otherwise>
					                                <svg class="scrap_icon" xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24"><g fill-rule="nonzero" transform="matrix(1 0 0 -1 0 24)"><path stroke="#FFF" d="M12.71 7.37h-.002a1.5 1.5 0 0 1-1.417 0L4.236 3.56a.499.499 0 0 0-.736.442v15.496c0 .553.448 1.002 1 1.002h15c.552 0 1-.449 1-1.002V4.002a.499.499 0 0 0-.734-.443l-7.057 3.81zm-.475-.88h-.001z"></path></svg>
			                            		</c:otherwise>
			                            	</c:choose>
		                            	</div>
		                            </button>
		                        </div>
		                        <h1 class="houseparty_box_title">${item.title}</h1>
		                        <div class="houseparty_writer_wrap">
		                            <a class="houseparty_writer" href="#">
		                                <img class="houseparty_writer_img" src="/resources/img/user/${item.iUser}/${item.profileImg}" onerror="this.src='/resources/img/user/basic_profile.webp'" alt="프로필사진">
		                                <span class="houseparty_writer_name">${item.nm}</span>
		                            </a>
		                        </div>
		                        <div class="houseparty_box_status">
		                            <span class="status_scrap_count">스크랩 ${item.scrapCnt}</span>
		                            <span class="status_count">조회 ${item.hits}</span>
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
