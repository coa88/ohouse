<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<!-- 레이아웃 -->
<div id="layout">
    <!-- main -->
    <main>
        <!-- 비주얼 -->
        <div class="visual container">
            <div class="visual_wrap mlr-10">
                <div class="visual_left plr10">
	                 <c:forEach items="${best}" var="item">
	                    <a class="visual_left_link" href="/community/houseparty/detail?iBoard=${item.iBoard }">
	                        <div class="visual_left_img_wrap">
	                            <img class="visual_left_img" src="/resources/img/community/board/${item.iBoard}/${item.boardImg}" alt="메인사진">
	                        </div>
	                        <div class="visual_left_content_wrap">
	                            <span class="visual_left_title">${item.title}</span>
	                            <div class="visual_left_profile">
	                                <span class="visual_left_profile_img_wrap">
	                                    <img class="visual_left_profile_img" src="/resources/img/user/${item.iUser}/${item.profileImg}" onerror="this.src='/resources/img/user/basic_profile.webp'" alt="프로필사진">
	                                </span>
	                                <span class="visual_left_profile_name">${item.nm}</span>
	                            </div>
	                            <div class="visual_left_more">보러가기</div>
	                        </div>
	                    </a>
	                </c:forEach>
                </div>
                <div class="visual_right plr10">
                    <a class="visual_right_link" href="#">
                        <div class="visual_right_img_wrap">
                            <img class="visual_right_img" src="/resources/img/visual_right_img_01.webp" alt="home">
                        </div>
                    </a>
                </div>
            </div>
        </div>
        <!-- 오늘의 스토리 -->
        <section class="story container section_mt60">
            <div class="section_title">
                <h2 class="plr10">오늘의 스토리</h2>
            </div>
            <ul class="story_box mlr-10">
            <c:forEach items="${housepartyBest}" var="item">
                <li class="story_box_list plr10">
                    <a class="story_box_link" href="/community/houseparty/detail?iBoard=${item.iBoard}">
                        <div class="story_box_img_wrap">
                            <img class="story_box_img" src="/resources/img/community/board/${item.iBoard}/${item.boardImg}" alt="집들이사진">
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
                <li class="story_box_list plr10">
                    <div class="story_menu_wrap">
                        <a class="story_menu_link" href="/community/houseparty">
                            <div class="description">예쁜 집 구경하기</div>
                            <div class="title">
                                <span class="text">집들이</span>
                                <div class="arrow"></div>
                            </div>
                        </a>
                        <a class="story_menu_link" href="/community/houseparty">
                            <div class="description">전문가 시공사례</div>
                            <div class="title">
                                <span class="text">전문가 집들이</span>
                                <div class="arrow"></div>
                            </div>
                        </a>
                        <a class="story_menu_link" href="/community/tip">
                            <div class="description">인테리어 꿀팁 총 집합</div>
                            <div class="title">
                                <span class="text">노하우</span>
                                <div class="arrow"></div>
                            </div>
                        </a>
                    </div>
                </li>
            </ul>
        </section>
        
        <!-- 오늘의 인기 사진 -->
        <section class="photo container section_mt60">
            <div class="section_title">
                <h2 class="plr10">오늘의 인기 사진</h2>
                <a class="photo_more" href="/community/photo">더보기</a>
            </div>
            <ul class="photo_box mlr-10">
	            <c:forEach items="${photoBest}" var="item">
	                <li class="photo_box_list plr10">
	                    <a class="photo_box_link" href="/community/photo/detail?iBoard=${item.iBoard}">
	                        <div class="photo_box_img_wrap">
	                            <img class="photo_box_img" src="/resources/img/community/board/${item.iBoard}/${item.boardImg}" alt="썸네일사진">
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
    </main>
</div>