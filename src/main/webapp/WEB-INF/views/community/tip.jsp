<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<!-- 레이아웃 -->
<div id="layout">
    <!-- main -->
    <main>
        <div class="tip container">
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
            <!-- 노하우 리스트들 -->
            <div class="tip_box mlr-10">
           	<c:choose>
	            <c:when test="${fn:length(data.cmList) == 0}">
					<div class="nonePost">글이 없습니다.</div>
				</c:when>
				<c:otherwise>
					<c:forEach items="${data.cmList}" var="item">
		                <div class="tip_box_list plr10">
		                    <div class="box_padding">
		                        <a class="tip_link" onclick="moveLocation(${item.iBoard})"></a>
		                        <div class="tip_img_wrap">
		                            <img class="tip_img" src="/resources/img/community/board/${item.iBoard}/${item.boardImg}" alt="노하우사진">
		                         
		                            <button class="tip_scrap">
		                                <c:choose>
		                            		<c:when test="${item.scrapChk > 0}">
				                                <svg class="scrap_icon" xmlns="http://www.w3.org/2000/svg" width="24" height="24"
				                                    viewBox="0 0 24 24" class="icon">
				                                    <defs>
				                                        <path id="scrap-icon-619-b"
				                                            d="M12.472 6.93l7.056-3.811A1 1 0 0 1 21 4.002v15.496c0 .83-.672 1.502-1.5 1.502h-15c-.828 0-1.5-.673-1.5-1.502V4.002a1 1 0 0 1 1.472-.883l7.056 3.811a.999.999 0 0 0 .944 0z">
				                                        </path>
				                                        <filter id="scrap-icon-619-a" width="150%" height="150%" x="-25%" y="-25%"
				                                            filterUnits="objectBoundingBox">
				                                            <feOffset in="SourceAlpha" result="shadowOffsetOuter1"></feOffset>
				                                            <feGaussianBlur in="shadowOffsetOuter1" result="shadowBlurOuter1"
				                                                stdDeviation="1.5"></feGaussianBlur>
				                                            <feComposite in="shadowBlurOuter1" in2="SourceAlpha" operator="out"
				                                                result="shadowBlurOuter1"></feComposite>
				                                            <feColorMatrix in="shadowBlurOuter1"
				                                                values="0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0.26 0"></feColorMatrix>
				                                        </filter>
				                                        <filter id="scrap-icon-619-c" width="150%" height="150%" x="-25%" y="-25%"
				                                            filterUnits="objectBoundingBox">
				                                            <feGaussianBlur in="SourceAlpha" result="shadowBlurInner1"
				                                                stdDeviation="1.5"></feGaussianBlur>
				                                            <feOffset in="shadowBlurInner1" result="shadowOffsetInner1"></feOffset>
				                                            <feComposite in="shadowOffsetInner1" in2="SourceAlpha" k2="-1" k3="1"
				                                                operator="arithmetic" result="shadowInnerInner1"></feComposite>
				                                            <feColorMatrix in="shadowInnerInner1"
				                                                values="0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0.2 0"></feColorMatrix>
				                                        </filter>
				                                    </defs>
				                                    <g fill="none" fill-rule="nonzero" transform="matrix(1 0 0 -1 0 24)">
				                                        <use fill="#000" filter="url(#scrap-icon-619-a)" href="#scrap-icon-619-b">
				                                        </use>
				                                        <use fill="#35c5f0" fill-opacity=".4" href="#scrap-icon-619-b"></use>
				                                        <use fill="#000" filter="url(#scrap-icon-619-c)" href="#scrap-icon-619-b">
				                                        </use>
				                                        <path stroke="#FFF"
				                                            d="M12.71 7.37h-.002a1.5 1.5 0 0 1-1.417 0L4.236 3.56a.499.499 0 0 0-.736.442v15.496c0 .553.448 1.002 1 1.002h15c.552 0 1-.449 1-1.002V4.002a.499.499 0 0 0-.734-.443l-7.057 3.81zm-.475-.88h-.001z">
				                                        </path>
				                                    </g>
				                                </svg>
		                                	</c:when>
		                                	<c:otherwise>
		                                		<svg class="scrap_icon" xmlns="http://www.w3.org/2000/svg" width="24" height="24"
				                                    viewBox="0 0 24 24" class="icon">
				                                    <defs>
				                                        <path id="scrap-icon-619-b"
				                                            d="M12.472 6.93l7.056-3.811A1 1 0 0 1 21 4.002v15.496c0 .83-.672 1.502-1.5 1.502h-15c-.828 0-1.5-.673-1.5-1.502V4.002a1 1 0 0 1 1.472-.883l7.056 3.811a.999.999 0 0 0 .944 0z">
				                                        </path>
				                                        <filter id="scrap-icon-619-a" width="150%" height="150%" x="-25%" y="-25%"
				                                            filterUnits="objectBoundingBox">
				                                            <feOffset in="SourceAlpha" result="shadowOffsetOuter1"></feOffset>
				                                            <feGaussianBlur in="shadowOffsetOuter1" result="shadowBlurOuter1"
				                                                stdDeviation="1.5"></feGaussianBlur>
				                                            <feComposite in="shadowBlurOuter1" in2="SourceAlpha" operator="out"
				                                                result="shadowBlurOuter1"></feComposite>
				                                            <feColorMatrix in="shadowBlurOuter1"
				                                                values="0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0.26 0"></feColorMatrix>
				                                        </filter>
				                                        <filter id="scrap-icon-619-c" width="150%" height="150%" x="-25%" y="-25%"
				                                            filterUnits="objectBoundingBox">
				                                            <feGaussianBlur in="SourceAlpha" result="shadowBlurInner1"
				                                                stdDeviation="1.5"></feGaussianBlur>
				                                            <feOffset in="shadowBlurInner1" result="shadowOffsetInner1"></feOffset>
				                                            <feComposite in="shadowOffsetInner1" in2="SourceAlpha" k2="-1" k3="1"
				                                                operator="arithmetic" result="shadowInnerInner1"></feComposite>
				                                            <feColorMatrix in="shadowInnerInner1"
				                                                values="0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0.2 0"></feColorMatrix>
				                                        </filter>
				                                    </defs>
				                                    <g fill="none" fill-rule="nonzero" transform="matrix(1 0 0 -1 0 24)">
				                                        <use fill="#000" filter="url(#scrap-icon-619-a)" href="#scrap-icon-619-b">
				                                        </use>
				                                        <use fill="#FFF" fill-opacity=".4" href="#scrap-icon-619-b"></use>
				                                        <use fill="#000" filter="url(#scrap-icon-619-c)" href="#scrap-icon-619-b">
				                                        </use>
				                                        <path stroke="#FFF"
				                                            d="M12.71 7.37h-.002a1.5 1.5 0 0 1-1.417 0L4.236 3.56a.499.499 0 0 0-.736.442v15.496c0 .553.448 1.002 1 1.002h15c.552 0 1-.449 1-1.002V4.002a.499.499 0 0 0-.734-.443l-7.057 3.81zm-.475-.88h-.001z">
				                                        </path>
				                                    </g>
				                                </svg>
		                                	</c:otherwise>
		                                </c:choose>
		                            </button>
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
                </c:otherwise>
			</c:choose>
            </div>
            <!-- 페이징 -->
		    <div class="pageContainer">
		    	<c:if test="${data.startPage > 1}">
					<span class="page" onclick="getBoardList(1)">[처음]</span>
				</c:if>	
		    
				<c:forEach begin="${data.startPage}" end="${data.endPage}" var="i">			
					<span class="page ${data.page == i ? 'selected' : ''}" onclick="getBoardList(${i})">${i}</span>
				</c:forEach>
				
				<c:if test="${data.endPage < data.maxPageNum}">
					<span class="page" onclick="getBoardList(${data.maxPageNum})">[끝]</span>
				</c:if>
			</div>
			<!-- 페이징끝 -->
        </div>
    </main>
</div>