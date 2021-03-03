<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

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
                <div class="photo_box_list plr10">
                    <div class="box_padding">
                        <div class="box_writer">
                            <div class="writer_content">
                                <div class="writer_header">
                                    <a class="writer_link" href="#">
                                        <img class="writer_img" src="../resources/img/community/photo/writer_img_01.jpeg" alt="photo">
                                        <span class="writer_name">그래니놀라</span>
                                    </a>
                                </div>
                                <p class="writer_introduction">인스타 @dreaming_roomroom</p>
                            </div>
                        </div>
                        <div class="box_content">
                            <div class="util">
                                <button class="util_icon">
                                    <svg class="icon" aria-label="좋아요" width="24" height="24" fill="currentColor"
                                        stroke="currentColor" stroke-width="2" viewBox="0 0 24 24"
                                        preserveAspectRatio="xMidYMid meet">
                                        <path
                                            d="M23.22 7.95c.4 4.94-2.92 9.71-10.92 13.85a.47.47 0 0 1-.42 0C3.88 17.66.56 12.9.96 7.93 1.54 2.48 8.28.3 12.1 4.7c3.8-4.4 10.55-2.22 11.13 3.25z">
                                        </path>
                                    </svg>
                                    <span class="count">33</span>
                                </button>
                                <button class="util_icon">
                                    <svg class="icon" aria-label="스크랩" width="24" height="24" fill="currentColor"
                                        stroke="currentColor" stroke-width="0.5" viewBox="0 0 24 24"
                                        preserveAspectRatio="xMidYMid meet">
                                        <path
                                            d="M11.53 18.54l-8.06 4.31A1 1 0 0 1 2 21.97V3.5A1.5 1.5 0 0 1 3.5 2h17A1.5 1.5 0 0 1 22 3.5v18.47a1 1 0 0 1-1.47.88l-8.06-4.31a1 1 0 0 0-.94 0z">
                                        </path>
                                    </svg>
                                    <span class="count">3</span>
                                </button>
                                <button class="util_icon">
                                    <svg class="icon_va7" aria-label="댓글 달기" width="24" height="24"
                                        viewBox="0 0 24 24" preserveAspectRatio="xMidYMid meet">
                                        <path fill="currentColor" fill-rule="nonzero"
                                            d="M13.665 18.434l.53-.066C19.69 17.679 23 14.348 23 10c0-4.942-4.235-8.5-11-8.5S1 5.058 1 10c0 4.348 3.31 7.68 8.804 8.368l.531.066L12 21.764l1.665-3.33zm-3.985.926C3.493 18.585 0 14.69 0 10 0 4.753 4.373.5 12 .5S24 4.753 24 10c0 4.69-3.493 8.585-9.68 9.36l-1.647 3.293c-.374.75-.974.744-1.346 0L9.68 19.36z">
                                        </path>
                                    </svg>
                                    <span class="count">33</span>
                                </button>
                            </div>
                            <a class="box_link" href="#">
                                <div class="photo_feed_img_wrap">
                                    <img class="photo_feed_img" src="../resources/img/community/photo/photo_feed_img_01.webp" alt="home">
                                    <span class="img_view_count">조회수 1,948</span>
                                </div>
                                <div class="user_text_wrap">
                                    <span class="user_text">미니멀 라이프가 하고 싶었는데, 점점 뭐가 생겨나는 중</span>
                                </div>
                            </a>
                            <div class="photo_feed_comment_wrap">
                                <div class="photo_feed_comment">
                                    <a class="comment_profile" href="#">
                                        <img class="comment_img" src="../resources/img/community/photo/photo_feed_comment_img_01.webp"
                                            alt="photo">
                                        <span class="comment_name">청담동옥탑방</span>
                                    </a>
                                    <a class="comment_link" href="#">
                                        <p class="comment_text">이 분 인스타 들어가봤는데 원래 감성적인 분이네요... 넘므 믓찌당😍</p>
                                    </a>
                                </div>
                            </div>
                        </div>
                        <div class="box_comment"></div>
                    </div>
                </div>
                <div class="photo_box_list plr10">
                    <div class="box_padding">
                        <div class="box_writer">
                            <div class="writer_content">
                                <div class="writer_header">
                                    <a class="writer_link" href="#">
                                        <img class="writer_img" src="../resources/img/community/photo/writer_img_01.jpeg" alt="photo">
                                        <span class="writer_name">그래니놀라</span>
                                    </a>
                                </div>
                                <p class="writer_introduction">인스타 @dreaming_roomroom</p>
                            </div>
                        </div>
                        <div class="box_content">
                            <div class="util">
                                <button class="util_icon">
                                    <svg class="icon" aria-label="좋아요" width="24" height="24" fill="currentColor"
                                        stroke="currentColor" stroke-width="2" viewBox="0 0 24 24"
                                        preserveAspectRatio="xMidYMid meet">
                                        <path
                                            d="M23.22 7.95c.4 4.94-2.92 9.71-10.92 13.85a.47.47 0 0 1-.42 0C3.88 17.66.56 12.9.96 7.93 1.54 2.48 8.28.3 12.1 4.7c3.8-4.4 10.55-2.22 11.13 3.25z">
                                        </path>
                                    </svg>
                                    <span class="count">33</span>
                                </button>
                                <button class="util_icon">
                                    <svg class="icon" aria-label="스크랩" width="24" height="24" fill="currentColor"
                                        stroke="currentColor" stroke-width="0.5" viewBox="0 0 24 24"
                                        preserveAspectRatio="xMidYMid meet">
                                        <path
                                            d="M11.53 18.54l-8.06 4.31A1 1 0 0 1 2 21.97V3.5A1.5 1.5 0 0 1 3.5 2h17A1.5 1.5 0 0 1 22 3.5v18.47a1 1 0 0 1-1.47.88l-8.06-4.31a1 1 0 0 0-.94 0z">
                                        </path>
                                    </svg>
                                    <span class="count">3</span>
                                </button>
                                <button class="util_icon">
                                    <svg class="icon_va7" aria-label="댓글 달기" width="24" height="24"
                                        viewBox="0 0 24 24" preserveAspectRatio="xMidYMid meet">
                                        <path fill="currentColor" fill-rule="nonzero"
                                            d="M13.665 18.434l.53-.066C19.69 17.679 23 14.348 23 10c0-4.942-4.235-8.5-11-8.5S1 5.058 1 10c0 4.348 3.31 7.68 8.804 8.368l.531.066L12 21.764l1.665-3.33zm-3.985.926C3.493 18.585 0 14.69 0 10 0 4.753 4.373.5 12 .5S24 4.753 24 10c0 4.69-3.493 8.585-9.68 9.36l-1.647 3.293c-.374.75-.974.744-1.346 0L9.68 19.36z">
                                        </path>
                                    </svg>
                                    <span class="count">33</span>
                                </button>
                            </div>
                            <a class="box_link" href="#">
                                <div class="photo_feed_img_wrap">
                                    <img class="photo_feed_img" src="../resources/img/community/photo/photo_feed_img_01.webp" alt="home">
                                    <span class="img_view_count">조회수 1,948</span>
                                </div>
                                <div class="user_text_wrap">
                                    <span class="user_text">미니멀 라이프가 하고 싶었는데, 점점 뭐가 생겨나는 중</span>
                                </div>
                            </a>
                            <div class="photo_feed_comment_wrap">
                                <div class="photo_feed_comment">
                                    <a class="comment_profile" href="#">
                                        <img class="comment_img" src="../resources/img/community/photo/photo_feed_comment_img_01.webp"
                                            alt="photo">
                                        <span class="comment_name">청담동옥탑방</span>
                                    </a>
                                    <a class="comment_link" href="#">
                                        <p class="comment_text">이 분 인스타 들어가봤는데 원래 감성적인 분이네요... 넘므 믓찌당😍</p>
                                    </a>
                                </div>
                            </div>
                        </div>
                        <div class="box_comment"></div>
                    </div>
                </div>
                <div class="photo_box_list plr10">
                    <div class="box_padding">
                        <div class="box_writer">
                            <div class="writer_content">
                                <div class="writer_header">
                                    <a class="writer_link" href="#">
                                        <img class="writer_img" src="../resources/img/community/photo/writer_img_01.jpeg" alt="photo">
                                        <span class="writer_name">그래니놀라</span>
                                    </a>
                                </div>
                                <p class="writer_introduction">인스타 @dreaming_roomroom</p>
                            </div>
                        </div>
                        <div class="box_content">
                            <div class="util">
                                <button class="util_icon">
                                    <svg class="icon" aria-label="좋아요" width="24" height="24" fill="currentColor"
                                        stroke="currentColor" stroke-width="2" viewBox="0 0 24 24"
                                        preserveAspectRatio="xMidYMid meet">
                                        <path
                                            d="M23.22 7.95c.4 4.94-2.92 9.71-10.92 13.85a.47.47 0 0 1-.42 0C3.88 17.66.56 12.9.96 7.93 1.54 2.48 8.28.3 12.1 4.7c3.8-4.4 10.55-2.22 11.13 3.25z">
                                        </path>
                                    </svg>
                                    <span class="count">33</span>
                                </button>
                                <button class="util_icon">
                                    <svg class="icon" aria-label="스크랩" width="24" height="24" fill="currentColor"
                                        stroke="currentColor" stroke-width="0.5" viewBox="0 0 24 24"
                                        preserveAspectRatio="xMidYMid meet">
                                        <path
                                            d="M11.53 18.54l-8.06 4.31A1 1 0 0 1 2 21.97V3.5A1.5 1.5 0 0 1 3.5 2h17A1.5 1.5 0 0 1 22 3.5v18.47a1 1 0 0 1-1.47.88l-8.06-4.31a1 1 0 0 0-.94 0z">
                                        </path>
                                    </svg>
                                    <span class="count">3</span>
                                </button>
                                <button class="util_icon">
                                    <svg class="icon_va7" aria-label="댓글 달기" width="24" height="24"
                                        viewBox="0 0 24 24" preserveAspectRatio="xMidYMid meet">
                                        <path fill="currentColor" fill-rule="nonzero"
                                            d="M13.665 18.434l.53-.066C19.69 17.679 23 14.348 23 10c0-4.942-4.235-8.5-11-8.5S1 5.058 1 10c0 4.348 3.31 7.68 8.804 8.368l.531.066L12 21.764l1.665-3.33zm-3.985.926C3.493 18.585 0 14.69 0 10 0 4.753 4.373.5 12 .5S24 4.753 24 10c0 4.69-3.493 8.585-9.68 9.36l-1.647 3.293c-.374.75-.974.744-1.346 0L9.68 19.36z">
                                        </path>
                                    </svg>
                                    <span class="count">33</span>
                                </button>
                            </div>
                            <a class="box_link" href="#">
                                <div class="photo_feed_img_wrap">
                                    <img class="photo_feed_img" src="../resources/img/community/photo/photo_feed_img_01.webp" alt="home">
                                    <span class="img_view_count">조회수 1,948</span>
                                </div>
                                <div class="user_text_wrap">
                                    <span class="user_text">미니멀 라이프가 하고 싶었는데, 점점 뭐가 생겨나는 중</span>
                                </div>
                            </a>
                            <div class="photo_feed_comment_wrap">
                                <div class="photo_feed_comment">
                                    <a class="comment_profile" href="#">
                                        <img class="comment_img" src="../resources/img/community/photo/photo_feed_comment_img_01.webp"
                                            alt="photo">
                                        <span class="comment_name">청담동옥탑방</span>
                                    </a>
                                    <a class="comment_link" href="#">
                                        <p class="comment_text">이 분 인스타 들어가봤는데 원래 감성적인 분이네요... 넘므 믓찌당😍</p>
                                    </a>
                                </div>
                            </div>
                        </div>
                        <div class="box_comment"></div>
                    </div>
                </div>
                <div class="photo_box_list plr10">
                    <div class="box_padding">
                        <div class="box_writer">
                            <div class="writer_content">
                                <div class="writer_header">
                                    <a class="writer_link" href="#">
                                        <img class="writer_img" src="../resources/img/community/photo/writer_img_01.jpeg" alt="photo">
                                        <span class="writer_name">그래니놀라</span>
                                    </a>
                                </div>
                                <p class="writer_introduction">인스타 @dreaming_roomroom</p>
                            </div>
                        </div>
                        <div class="box_content">
                            <div class="util">
                                <button class="util_icon">
                                    <svg class="icon" aria-label="좋아요" width="24" height="24" fill="currentColor"
                                        stroke="currentColor" stroke-width="2" viewBox="0 0 24 24"
                                        preserveAspectRatio="xMidYMid meet">
                                        <path
                                            d="M23.22 7.95c.4 4.94-2.92 9.71-10.92 13.85a.47.47 0 0 1-.42 0C3.88 17.66.56 12.9.96 7.93 1.54 2.48 8.28.3 12.1 4.7c3.8-4.4 10.55-2.22 11.13 3.25z">
                                        </path>
                                    </svg>
                                    <span class="count">33</span>
                                </button>
                                <button class="util_icon">
                                    <svg class="icon" aria-label="스크랩" width="24" height="24" fill="currentColor"
                                        stroke="currentColor" stroke-width="0.5" viewBox="0 0 24 24"
                                        preserveAspectRatio="xMidYMid meet">
                                        <path
                                            d="M11.53 18.54l-8.06 4.31A1 1 0 0 1 2 21.97V3.5A1.5 1.5 0 0 1 3.5 2h17A1.5 1.5 0 0 1 22 3.5v18.47a1 1 0 0 1-1.47.88l-8.06-4.31a1 1 0 0 0-.94 0z">
                                        </path>
                                    </svg>
                                    <span class="count">3</span>
                                </button>
                                <button class="util_icon">
                                    <svg class="icon_va7" aria-label="댓글 달기" width="24" height="24"
                                        viewBox="0 0 24 24" preserveAspectRatio="xMidYMid meet">
                                        <path fill="currentColor" fill-rule="nonzero"
                                            d="M13.665 18.434l.53-.066C19.69 17.679 23 14.348 23 10c0-4.942-4.235-8.5-11-8.5S1 5.058 1 10c0 4.348 3.31 7.68 8.804 8.368l.531.066L12 21.764l1.665-3.33zm-3.985.926C3.493 18.585 0 14.69 0 10 0 4.753 4.373.5 12 .5S24 4.753 24 10c0 4.69-3.493 8.585-9.68 9.36l-1.647 3.293c-.374.75-.974.744-1.346 0L9.68 19.36z">
                                        </path>
                                    </svg>
                                    <span class="count">33</span>
                                </button>
                            </div>
                            <a class="box_link" href="#">
                                <div class="photo_feed_img_wrap">
                                    <img class="photo_feed_img" src="../resources/img/community/photo/photo_feed_img_01.webp" alt="home">
                                    <span class="img_view_count">조회수 1,948</span>
                                </div>
                                <div class="user_text_wrap">
                                    <span class="user_text">미니멀 라이프가 하고 싶었는데, 점점 뭐가 생겨나는 중</span>
                                </div>
                            </a>
                            <div class="photo_feed_comment_wrap">
                                <div class="photo_feed_comment">
                                    <a class="comment_profile" href="#">
                                        <img class="comment_img" src="../resources/img/community/photo/photo_feed_comment_img_01.webp"
                                            alt="photo">
                                        <span class="comment_name">청담동옥탑방</span>
                                    </a>
                                    <a class="comment_link" href="#">
                                        <p class="comment_text">이 분 인스타 들어가봤는데 원래 감성적인 분이네요... 넘므 믓찌당😍</p>
                                    </a>
                                </div>
                            </div>
                        </div>
                        <div class="box_comment"></div>
                    </div>
                </div>
                <div class="photo_box_list plr10">
                    <div class="box_padding">
                        <div class="box_writer">
                            <div class="writer_content">
                                <div class="writer_header">
                                    <a class="writer_link" href="#">
                                        <img class="writer_img" src="../resources/img/community/photo/writer_img_01.jpeg" alt="photo">
                                        <span class="writer_name">그래니놀라</span>
                                    </a>
                                </div>
                                <p class="writer_introduction">인스타 @dreaming_roomroom</p>
                            </div>
                        </div>
                        <div class="box_content">
                            <div class="util">
                                <button class="util_icon">
                                    <svg class="icon" aria-label="좋아요" width="24" height="24" fill="currentColor"
                                        stroke="currentColor" stroke-width="2" viewBox="0 0 24 24"
                                        preserveAspectRatio="xMidYMid meet">
                                        <path
                                            d="M23.22 7.95c.4 4.94-2.92 9.71-10.92 13.85a.47.47 0 0 1-.42 0C3.88 17.66.56 12.9.96 7.93 1.54 2.48 8.28.3 12.1 4.7c3.8-4.4 10.55-2.22 11.13 3.25z">
                                        </path>
                                    </svg>
                                    <span class="count">33</span>
                                </button>
                                <button class="util_icon">
                                    <svg class="icon" aria-label="스크랩" width="24" height="24" fill="currentColor"
                                        stroke="currentColor" stroke-width="0.5" viewBox="0 0 24 24"
                                        preserveAspectRatio="xMidYMid meet">
                                        <path
                                            d="M11.53 18.54l-8.06 4.31A1 1 0 0 1 2 21.97V3.5A1.5 1.5 0 0 1 3.5 2h17A1.5 1.5 0 0 1 22 3.5v18.47a1 1 0 0 1-1.47.88l-8.06-4.31a1 1 0 0 0-.94 0z">
                                        </path>
                                    </svg>
                                    <span class="count">3</span>
                                </button>
                                <button class="util_icon">
                                    <svg class="icon_va7" aria-label="댓글 달기" width="24" height="24"
                                        viewBox="0 0 24 24" preserveAspectRatio="xMidYMid meet">
                                        <path fill="currentColor" fill-rule="nonzero"
                                            d="M13.665 18.434l.53-.066C19.69 17.679 23 14.348 23 10c0-4.942-4.235-8.5-11-8.5S1 5.058 1 10c0 4.348 3.31 7.68 8.804 8.368l.531.066L12 21.764l1.665-3.33zm-3.985.926C3.493 18.585 0 14.69 0 10 0 4.753 4.373.5 12 .5S24 4.753 24 10c0 4.69-3.493 8.585-9.68 9.36l-1.647 3.293c-.374.75-.974.744-1.346 0L9.68 19.36z">
                                        </path>
                                    </svg>
                                    <span class="count">33</span>
                                </button>
                            </div>
                            <a class="box_link" href="#">
                                <div class="photo_feed_img_wrap">
                                    <img class="photo_feed_img" src="../resources/img/community/photo/photo_feed_img_01.webp" alt="home">
                                    <span class="img_view_count">조회수 1,948</span>
                                </div>
                                <div class="user_text_wrap">
                                    <span class="user_text">미니멀 라이프가 하고 싶었는데, 점점 뭐가 생겨나는 중</span>
                                </div>
                            </a>
                            <div class="photo_feed_comment_wrap">
                                <div class="photo_feed_comment">
                                    <a class="comment_profile" href="#">
                                        <img class="comment_img" src="../resources/img/community/photo/photo_feed_comment_img_01.webp"
                                            alt="photo">
                                        <span class="comment_name">청담동옥탑방</span>
                                    </a>
                                    <a class="comment_link" href="#">
                                        <p class="comment_text">이 분 인스타 들어가봤는데 원래 감성적인 분이네요... 넘므 믓찌당😍</p>
                                    </a>
                                </div>
                            </div>
                        </div>
                        <div class="box_comment"></div>
                    </div>
                </div>
            </div>
        </div>
    </main>
</div>