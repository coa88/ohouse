<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!-- 레이아웃 -->
<div id="layout">
    <!-- main -->
    <main>
    	<input type="hidden" name="iBoard" value="${param.iBoard}">
        <!-- 커버이미지 -->
        <div class="detail_cover_img_wrap">
            <div class="detail_cover_img_size">
            	<img src="../resources/img/community/board/${data.iBoard}/${data.boardImg}"alt="대표이미지">
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
                                <img class="user_img" src="../resources/img/user/${data.iUser}/${data.profileImg}" onerror="this.src='../resources/img/user/basic_profile.webp'" alt="프로필사진">
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
                        <button class="detail_favorite">
                            <svg class="detail_favorite_icon_blue icon" width="24" height="24" fill="currentColor" stroke="currentColor" stroke-width="2" viewBox="0 0 24 24" preserveAspectRatio="xMidYMid meet"><path d="M23.22 7.95c.4 4.94-2.92 9.71-10.92 13.85a.47.47 0 0 1-.42 0C3.88 17.66.56 12.9.96 7.93 1.54 2.48 8.28.3 12.1 4.7c3.8-4.4 10.55-2.22 11.13 3.25z"></path></svg>
                            <svg class="detail_favorite_icon_inactive icon" width="24" height="24" viewBox="0 0 24 24" preserveAspectRatio="xMidYMid meet"><path fill="currentColor" d="M22.971 7.638c-.548-5.17-7.119-7.135-10.57-2.488a.5.5 0 0 1-.802 0C8.148.503 1.577 2.469 1.029 7.625.642 12.451 3.897 17.183 12 21.436c8.104-4.252 11.36-8.984 10.972-13.798zm.996-.093c.428 5.319-3.137 10.446-11.738 14.899a.5.5 0 0 1-.46 0C3.169 17.99-.395 12.864.034 7.532.656 1.67 7.904-.683 12 4.052 16.096-.683 23.344 1.67 23.967 7.545z"></path></svg>
                        </button>
                        <span class=""></span>
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
        	</div>
        	<!-- 스텟끝 -->
        	
        	<!-- 댓글시작 -->
        	<div style="margin-top: 20px;">				
				<div>
					<form id="cmtFrm">
						<input type="hidden" name="iBoard" value="${param.iBoard}">
						댓글: <input type="text" name="ctnt">	
						<input type="button" name="btn" value="등록">	
					</form>
				</div>				
				<div id="cmtList"></div>		
			</div>
        	<!-- 댓글끝 -->
        </div>
    </main>
</div>