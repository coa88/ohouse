<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!-- 레이아웃 -->
<div id="layout">
    <!-- main -->
    <main>
        <!-- 커버이미지 -->
        <div class="detail_cover_img_wrap">
            <div class="detail_cover_img_size">
            	<img src="/resources/img/community/board/${data.iBoard}/${data.boardImg}"alt="대표이미지">
            </div>
        </div>
        <!-- 디테일 내용 -->
        <div class="detail_content">
            <div class="con_main">
                <div class="con_header">
                    <h1>${data.title}</h1>
                    <div class="con_header_user">
                        <a class="con_header_user_link" href="#">
                            <div class="user_img_wrap">
                                <img class="user_img" src="/resources/img/user/${data.iUser}/${data.profileImg}" onerror="this.src='/resources/img/user/basic_profile.webp'" alt="프로필사진">
                            </div>																							
                            <div class="user_name">${data.nm}</div>
                            <div class="user_date">${data.rDt}</div>
                        </a>
                    </div>
                </div>
                <div class="con_bpd">
                   	${data.ctnt}
                </div>
            </div>
            
            
            <!-- 사이드 아이콘 -->
            <div class="con_side">
                <div class="con_side_sticky">
                    <div class="side_icon_wrap">
                    <div id="favoriteContainer" favState="${favState}" onclick="favorite(${param.iBoard})">	
                         <c:choose>
                        	<c:when test="${favState eq 1}">
	                            <svg class="detail_util_icon_blue" width="24" height="24" stroke-width="1" viewBox="0 0 24 24" preserveAspectRatio="xMidYMid meet"><path d="M23.22 7.95c.4 4.94-2.92 9.71-10.92 13.85a.47.47 0 0 1-.42 0C3.88 17.66.56 12.9.96 7.93 1.54 2.48 8.28.3 12.1 4.7c3.8-4.4 10.55-2.22 11.13 3.25z"></path></svg>
	                        </c:when>
	                        <c:otherwise>
	                            <svg class="detail_util_icon_white" width="24" height="24" viewBox="0 0 24 24" preserveAspectRatio="xMidYMid meet"><path d="M23.22 7.95c.4 4.94-2.92 9.71-10.92 13.85a.47.47 0 0 1-.42 0C3.88 17.66.56 12.9.96 7.93 1.54 2.48 8.28.3 12.1 4.7c3.8-4.4 10.55-2.22 11.13 3.25z"></path></svg>
	                        </c:otherwise>
                        </c:choose> 
                    </div>     
                    <div id="scrapContainer" scrapState="${scrapState}" onclick="scrap(${param.iBoard})">	
                         <c:choose>
                        	<c:when test="${scrapState eq 1}">
	                            <svg class="detail_util_icon_blue" width="24" height="24" stroke-width="1" viewBox="0 0 24 24" preserveAspectRatio="xMidYMid meet"><path d="M11.53 18.54l-8.06 4.31A1 1 0 0 1 2 21.97V3.5A1.5 1.5 0 0 1 3.5 2h17A1.5 1.5 0 0 1 22 3.5v18.47a1 1 0 0 1-1.47.88l-8.06-4.31a1 1 0 0 0-.94 0z"></path></svg>
	                        </c:when>
	                        <c:otherwise>
	                            <svg class="detail_util_icon_white" width="24" height="24" viewBox="0 0 24 24" preserveAspectRatio="xMidYMid meet"><path d="M11.53 18.54l-8.06 4.31A1 1 0 0 1 2 21.97V3.5A1.5 1.5 0 0 1 3.5 2h17A1.5 1.5 0 0 1 22 3.5v18.47a1 1 0 0 1-1.47.88l-8.06-4.31a1 1 0 0 0-.94 0z"></path></svg>
	                        </c:otherwise>
                        </c:choose> 
                    </div>                        
                </div>
            </div>
        </div>
        <!-- 디테일 댓글,좋아요,조회수... -->
        <div class="detail_footer">
        	<!-- 스텟시작 -->
        	<div class="content-detail-stats">
        		<div class="content-detail-stats__item">
        			<dt>좋아요</dt>
        			<dd>${data.favoriteCnt}</dd>
        		</div>
        		<div class="content-detail-stats__item">
        			<dt>스크랩</dt>
        			<dd>${data.scrapCnt}</dd>
        		</div>
        		<div class="content-detail-stats__item">
        			<dt>댓글</dt>
        			<dd>${data.cmtCnt}</dd>
        		</div>
        		<div class="content-detail-stats__item">
        			<dt>조회수</dt>
        			<dd>${data.hits}</dd>
        		</div>
        		<c:if test="${loginUser.iUser eq data.iUser}">
        			<div class="content-detail-item-btn">
        				<a href="/community/modify?iBoard=${param.iBoard}">수정</a>
        				<span onclick="DeletePost(${param.iBoard})">삭제</span>
        			</div>
        		</c:if>
        	</div>
        	<!-- 스텟끝 -->
        	
        	<!-- 댓글시작 -->
        	<h1>댓글&nbsp;<span>${data.cmtCnt}</span></h1>
        	
	        <div style="margin-top: 20px;">	        
				<span id="iBoard" data-id="${data.iBoard}"></span>
				<c:if test="${loginUser != null}">				
					<form id="cmtFrm">
						<input type="text" name="ctnt" placeholder="칭찬과 격려의 댓글은 작성자에게 큰 힘이 됩니다 :)">				
						<input type="button" name="btn" value="등록">
					</form>
				</c:if>
					
				<div id="cmtList"></div>
			</div>			
        	<!-- 댓글끝 -->
        </div>
    </main>
</div>