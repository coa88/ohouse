<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

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
            <div class="all_feed_count">전체 4,457</div>
            <!-- 집들이,전문가집들이 리스트들 -->
            <div class="houseparty_box mlr-10">
                <div class="houseparty_box_list plr10">
                    <div class="box_padding">
                        <a class="houseparty_link" href="#"></a>
                        <div class="houseparty_img_wrap">
                            <img class="houseparty_img" src="../resources/img/community/houseparty/houseparty_img_01.webp" alt="houseparty">
                            <span class="houseparty_new">
                                <svg class="icon" width="36" height="20" viewBox="0 0 36 20" preserveAspectRatio="xMidYMid meet"><g fill="none" fill-rule="evenodd"><rect width="36" height="20" fill="#FDBD39" rx="4"></rect><path fill="#FFF" fill-rule="nonzero" d="M6 14V6h1.668l3.446 5.644h.036V6h1.318v8h-1.475L7.354 7.97h-.036V14H6zm8.414 0V6h5.174v1.131h-3.687v2.193h2.865v1.12h-2.865v2.425h3.76V14h-5.247zm8.317 0l-2.067-8h1.511l1.414 5.924h.037L25.318 6h1.21l1.667 5.924h.037L29.658 6H31l-2.03 8h-1.476l-1.62-5.808h-.036L24.194 14H22.73z"></path></g></svg>
                            </span>
                            <button class="houseparty_scrap">
                                <svg class="scrap_icon" xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" class="icon"><defs><path id="scrap-icon-619-b" d="M12.472 6.93l7.056-3.811A1 1 0 0 1 21 4.002v15.496c0 .83-.672 1.502-1.5 1.502h-15c-.828 0-1.5-.673-1.5-1.502V4.002a1 1 0 0 1 1.472-.883l7.056 3.811a.999.999 0 0 0 .944 0z"></path><filter id="scrap-icon-619-a" width="150%" height="150%" x="-25%" y="-25%" filterUnits="objectBoundingBox"><feOffset in="SourceAlpha" result="shadowOffsetOuter1"></feOffset><feGaussianBlur in="shadowOffsetOuter1" result="shadowBlurOuter1" stdDeviation="1.5"></feGaussianBlur><feComposite in="shadowBlurOuter1" in2="SourceAlpha" operator="out" result="shadowBlurOuter1"></feComposite><feColorMatrix in="shadowBlurOuter1" values="0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0.26 0"></feColorMatrix></filter><filter id="scrap-icon-619-c" width="150%" height="150%" x="-25%" y="-25%" filterUnits="objectBoundingBox"><feGaussianBlur in="SourceAlpha" result="shadowBlurInner1" stdDeviation="1.5"></feGaussianBlur><feOffset in="shadowBlurInner1" result="shadowOffsetInner1"></feOffset><feComposite in="shadowOffsetInner1" in2="SourceAlpha" k2="-1" k3="1" operator="arithmetic" result="shadowInnerInner1"></feComposite><feColorMatrix in="shadowInnerInner1" values="0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0.2 0"></feColorMatrix></filter></defs><g fill="none" fill-rule="nonzero" transform="matrix(1 0 0 -1 0 24)"><use fill="#000" filter="url(#scrap-icon-619-a)" href="#scrap-icon-619-b"></use><use fill="#FFF" fill-opacity=".4" href="#scrap-icon-619-b"></use><use fill="#000" filter="url(#scrap-icon-619-c)" href="#scrap-icon-619-b"></use><path stroke="#FFF" d="M12.71 7.37h-.002a1.5 1.5 0 0 1-1.417 0L4.236 3.56a.499.499 0 0 0-.736.442v15.496c0 .553.448 1.002 1 1.002h15c.552 0 1-.449 1-1.002V4.002a.499.499 0 0 0-.734-.443l-7.057 3.81zm-.475-.88h-.001z"></path></g></svg>
                            </button>
                        </div>
                        <h1 class="houseparty_box_title">낡은 집에서 가능성을 발견한, 그림 같은 집</h1>
                        <div class="houseparty_writer_wrap">
                            <a class="houseparty_writer" href="#">
                                <img class="houseparty_writer_img" src="../resources/img/community/houseparty/houseparty_writer_img_01.webp" alt="houseparty">
                                <span class="houseparty_writer_name">_iam_hana</span>
                            </a>
                        </div>
                        <div class="houseparty_box_status">
                            <span class="status_scrap_count">스크랩 72</span>
                            <span class="status_count">조회 2,434</span>
                        </div>
                    </div>
                </div>
                <div class="houseparty_box_list plr10">
                    <div class="box_padding">
                        <a class="houseparty_link" href="#"></a>
                        <div class="houseparty_img_wrap">
                            <img class="houseparty_img" src="../resources/img/community/houseparty/houseparty_img_01.webp" alt="houseparty">
                            <span class="houseparty_new">
                                <svg class="icon" width="36" height="20" viewBox="0 0 36 20" preserveAspectRatio="xMidYMid meet"><g fill="none" fill-rule="evenodd"><rect width="36" height="20" fill="#FDBD39" rx="4"></rect><path fill="#FFF" fill-rule="nonzero" d="M6 14V6h1.668l3.446 5.644h.036V6h1.318v8h-1.475L7.354 7.97h-.036V14H6zm8.414 0V6h5.174v1.131h-3.687v2.193h2.865v1.12h-2.865v2.425h3.76V14h-5.247zm8.317 0l-2.067-8h1.511l1.414 5.924h.037L25.318 6h1.21l1.667 5.924h.037L29.658 6H31l-2.03 8h-1.476l-1.62-5.808h-.036L24.194 14H22.73z"></path></g></svg>
                            </span>
                            <button class="houseparty_scrap">
                                <svg class="scrap_icon" xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" class="icon"><defs><path id="scrap-icon-619-b" d="M12.472 6.93l7.056-3.811A1 1 0 0 1 21 4.002v15.496c0 .83-.672 1.502-1.5 1.502h-15c-.828 0-1.5-.673-1.5-1.502V4.002a1 1 0 0 1 1.472-.883l7.056 3.811a.999.999 0 0 0 .944 0z"></path><filter id="scrap-icon-619-a" width="150%" height="150%" x="-25%" y="-25%" filterUnits="objectBoundingBox"><feOffset in="SourceAlpha" result="shadowOffsetOuter1"></feOffset><feGaussianBlur in="shadowOffsetOuter1" result="shadowBlurOuter1" stdDeviation="1.5"></feGaussianBlur><feComposite in="shadowBlurOuter1" in2="SourceAlpha" operator="out" result="shadowBlurOuter1"></feComposite><feColorMatrix in="shadowBlurOuter1" values="0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0.26 0"></feColorMatrix></filter><filter id="scrap-icon-619-c" width="150%" height="150%" x="-25%" y="-25%" filterUnits="objectBoundingBox"><feGaussianBlur in="SourceAlpha" result="shadowBlurInner1" stdDeviation="1.5"></feGaussianBlur><feOffset in="shadowBlurInner1" result="shadowOffsetInner1"></feOffset><feComposite in="shadowOffsetInner1" in2="SourceAlpha" k2="-1" k3="1" operator="arithmetic" result="shadowInnerInner1"></feComposite><feColorMatrix in="shadowInnerInner1" values="0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0.2 0"></feColorMatrix></filter></defs><g fill="none" fill-rule="nonzero" transform="matrix(1 0 0 -1 0 24)"><use fill="#000" filter="url(#scrap-icon-619-a)" href="#scrap-icon-619-b"></use><use fill="#FFF" fill-opacity=".4" href="#scrap-icon-619-b"></use><use fill="#000" filter="url(#scrap-icon-619-c)" href="#scrap-icon-619-b"></use><path stroke="#FFF" d="M12.71 7.37h-.002a1.5 1.5 0 0 1-1.417 0L4.236 3.56a.499.499 0 0 0-.736.442v15.496c0 .553.448 1.002 1 1.002h15c.552 0 1-.449 1-1.002V4.002a.499.499 0 0 0-.734-.443l-7.057 3.81zm-.475-.88h-.001z"></path></g></svg>
                            </button>
                        </div>
                        <h1 class="houseparty_box_title">낡은 집에서 가능성을 발견한, 그림 같은 집</h1>
                        <div class="houseparty_writer_wrap">
                            <a class="houseparty_writer" href="#">
                                <img class="houseparty_writer_img" src="../resources/img/community/houseparty/houseparty_writer_img_01.webp" alt="houseparty">
                                <span class="houseparty_writer_name">_iam_hana</span>
                            </a>
                        </div>
                        <div class="houseparty_box_status">
                            <span class="status_scrap_count">스크랩 72</span>
                            <span class="status_count">조회 2,434</span>
                        </div>
                    </div>
                </div>
                <div class="houseparty_box_list plr10">
                    <div class="box_padding">
                        <a class="houseparty_link" href="#"></a>
                        <div class="houseparty_img_wrap">
                            <img class="houseparty_img" src="../resources/img/community/houseparty/houseparty_img_01.webp" alt="houseparty">
                            <span class="houseparty_new">
                                <svg class="icon" width="36" height="20" viewBox="0 0 36 20" preserveAspectRatio="xMidYMid meet"><g fill="none" fill-rule="evenodd"><rect width="36" height="20" fill="#FDBD39" rx="4"></rect><path fill="#FFF" fill-rule="nonzero" d="M6 14V6h1.668l3.446 5.644h.036V6h1.318v8h-1.475L7.354 7.97h-.036V14H6zm8.414 0V6h5.174v1.131h-3.687v2.193h2.865v1.12h-2.865v2.425h3.76V14h-5.247zm8.317 0l-2.067-8h1.511l1.414 5.924h.037L25.318 6h1.21l1.667 5.924h.037L29.658 6H31l-2.03 8h-1.476l-1.62-5.808h-.036L24.194 14H22.73z"></path></g></svg>
                            </span>
                            <button class="houseparty_scrap">
                                <svg class="scrap_icon" xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" class="icon"><defs><path id="scrap-icon-619-b" d="M12.472 6.93l7.056-3.811A1 1 0 0 1 21 4.002v15.496c0 .83-.672 1.502-1.5 1.502h-15c-.828 0-1.5-.673-1.5-1.502V4.002a1 1 0 0 1 1.472-.883l7.056 3.811a.999.999 0 0 0 .944 0z"></path><filter id="scrap-icon-619-a" width="150%" height="150%" x="-25%" y="-25%" filterUnits="objectBoundingBox"><feOffset in="SourceAlpha" result="shadowOffsetOuter1"></feOffset><feGaussianBlur in="shadowOffsetOuter1" result="shadowBlurOuter1" stdDeviation="1.5"></feGaussianBlur><feComposite in="shadowBlurOuter1" in2="SourceAlpha" operator="out" result="shadowBlurOuter1"></feComposite><feColorMatrix in="shadowBlurOuter1" values="0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0.26 0"></feColorMatrix></filter><filter id="scrap-icon-619-c" width="150%" height="150%" x="-25%" y="-25%" filterUnits="objectBoundingBox"><feGaussianBlur in="SourceAlpha" result="shadowBlurInner1" stdDeviation="1.5"></feGaussianBlur><feOffset in="shadowBlurInner1" result="shadowOffsetInner1"></feOffset><feComposite in="shadowOffsetInner1" in2="SourceAlpha" k2="-1" k3="1" operator="arithmetic" result="shadowInnerInner1"></feComposite><feColorMatrix in="shadowInnerInner1" values="0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0.2 0"></feColorMatrix></filter></defs><g fill="none" fill-rule="nonzero" transform="matrix(1 0 0 -1 0 24)"><use fill="#000" filter="url(#scrap-icon-619-a)" href="#scrap-icon-619-b"></use><use fill="#FFF" fill-opacity=".4" href="#scrap-icon-619-b"></use><use fill="#000" filter="url(#scrap-icon-619-c)" href="#scrap-icon-619-b"></use><path stroke="#FFF" d="M12.71 7.37h-.002a1.5 1.5 0 0 1-1.417 0L4.236 3.56a.499.499 0 0 0-.736.442v15.496c0 .553.448 1.002 1 1.002h15c.552 0 1-.449 1-1.002V4.002a.499.499 0 0 0-.734-.443l-7.057 3.81zm-.475-.88h-.001z"></path></g></svg>
                            </button>
                        </div>
                        <h1 class="houseparty_box_title">낡은 집에서 가능성을 발견한, 그림 같은 집</h1>
                        <div class="houseparty_writer_wrap">
                            <a class="houseparty_writer" href="#">
                                <img class="houseparty_writer_img" src="../resources/img/community/houseparty/houseparty_writer_img_01.webp" alt="houseparty">
                                <span class="houseparty_writer_name">_iam_hana</span>
                            </a>
                        </div>
                        <div class="houseparty_box_status">
                            <span class="status_scrap_count">스크랩 72</span>
                            <span class="status_count">조회 2,434</span>
                        </div>
                    </div>
                </div>
                <div class="houseparty_box_list plr10">
                    <div class="box_padding">
                        <a class="houseparty_link" href="#"></a>
                        <div class="houseparty_img_wrap">
                            <img class="houseparty_img" src="../resources/img/community/houseparty/houseparty_img_01.webp" alt="houseparty">
                            <span class="houseparty_new">
                                <svg class="icon" width="36" height="20" viewBox="0 0 36 20" preserveAspectRatio="xMidYMid meet"><g fill="none" fill-rule="evenodd"><rect width="36" height="20" fill="#FDBD39" rx="4"></rect><path fill="#FFF" fill-rule="nonzero" d="M6 14V6h1.668l3.446 5.644h.036V6h1.318v8h-1.475L7.354 7.97h-.036V14H6zm8.414 0V6h5.174v1.131h-3.687v2.193h2.865v1.12h-2.865v2.425h3.76V14h-5.247zm8.317 0l-2.067-8h1.511l1.414 5.924h.037L25.318 6h1.21l1.667 5.924h.037L29.658 6H31l-2.03 8h-1.476l-1.62-5.808h-.036L24.194 14H22.73z"></path></g></svg>
                            </span>
                            <button class="houseparty_scrap">
                                <svg class="scrap_icon" xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" class="icon"><defs><path id="scrap-icon-619-b" d="M12.472 6.93l7.056-3.811A1 1 0 0 1 21 4.002v15.496c0 .83-.672 1.502-1.5 1.502h-15c-.828 0-1.5-.673-1.5-1.502V4.002a1 1 0 0 1 1.472-.883l7.056 3.811a.999.999 0 0 0 .944 0z"></path><filter id="scrap-icon-619-a" width="150%" height="150%" x="-25%" y="-25%" filterUnits="objectBoundingBox"><feOffset in="SourceAlpha" result="shadowOffsetOuter1"></feOffset><feGaussianBlur in="shadowOffsetOuter1" result="shadowBlurOuter1" stdDeviation="1.5"></feGaussianBlur><feComposite in="shadowBlurOuter1" in2="SourceAlpha" operator="out" result="shadowBlurOuter1"></feComposite><feColorMatrix in="shadowBlurOuter1" values="0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0.26 0"></feColorMatrix></filter><filter id="scrap-icon-619-c" width="150%" height="150%" x="-25%" y="-25%" filterUnits="objectBoundingBox"><feGaussianBlur in="SourceAlpha" result="shadowBlurInner1" stdDeviation="1.5"></feGaussianBlur><feOffset in="shadowBlurInner1" result="shadowOffsetInner1"></feOffset><feComposite in="shadowOffsetInner1" in2="SourceAlpha" k2="-1" k3="1" operator="arithmetic" result="shadowInnerInner1"></feComposite><feColorMatrix in="shadowInnerInner1" values="0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0.2 0"></feColorMatrix></filter></defs><g fill="none" fill-rule="nonzero" transform="matrix(1 0 0 -1 0 24)"><use fill="#000" filter="url(#scrap-icon-619-a)" href="#scrap-icon-619-b"></use><use fill="#FFF" fill-opacity=".4" href="#scrap-icon-619-b"></use><use fill="#000" filter="url(#scrap-icon-619-c)" href="#scrap-icon-619-b"></use><path stroke="#FFF" d="M12.71 7.37h-.002a1.5 1.5 0 0 1-1.417 0L4.236 3.56a.499.499 0 0 0-.736.442v15.496c0 .553.448 1.002 1 1.002h15c.552 0 1-.449 1-1.002V4.002a.499.499 0 0 0-.734-.443l-7.057 3.81zm-.475-.88h-.001z"></path></g></svg>
                            </button>
                        </div>
                        <h1 class="houseparty_box_title">낡은 집에서 가능성을 발견한, 그림 같은 집</h1>
                        <div class="houseparty_writer_wrap">
                            <a class="houseparty_writer" href="#">
                                <img class="houseparty_writer_img" src="../resources/img/community/houseparty/houseparty_writer_img_01.webp" alt="houseparty">
                                <span class="houseparty_writer_name">_iam_hana</span>
                            </a>
                        </div>
                        <div class="houseparty_box_status">
                            <span class="status_scrap_count">스크랩 72</span>
                            <span class="status_count">조회 2,434</span>
                        </div>
                    </div>
                </div>
                <div class="houseparty_box_list plr10">
                    <div class="box_padding">
                        <a class="houseparty_link" href="#"></a>
                        <div class="houseparty_img_wrap">
                            <img class="houseparty_img" src="../resources/img/community/houseparty/houseparty_img_01.webp" alt="houseparty">
                            <span class="houseparty_new">
                                <svg class="icon" width="36" height="20" viewBox="0 0 36 20" preserveAspectRatio="xMidYMid meet"><g fill="none" fill-rule="evenodd"><rect width="36" height="20" fill="#FDBD39" rx="4"></rect><path fill="#FFF" fill-rule="nonzero" d="M6 14V6h1.668l3.446 5.644h.036V6h1.318v8h-1.475L7.354 7.97h-.036V14H6zm8.414 0V6h5.174v1.131h-3.687v2.193h2.865v1.12h-2.865v2.425h3.76V14h-5.247zm8.317 0l-2.067-8h1.511l1.414 5.924h.037L25.318 6h1.21l1.667 5.924h.037L29.658 6H31l-2.03 8h-1.476l-1.62-5.808h-.036L24.194 14H22.73z"></path></g></svg>
                            </span>
                            <button class="houseparty_scrap">
                                <svg class="scrap_icon" xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" class="icon"><defs><path id="scrap-icon-619-b" d="M12.472 6.93l7.056-3.811A1 1 0 0 1 21 4.002v15.496c0 .83-.672 1.502-1.5 1.502h-15c-.828 0-1.5-.673-1.5-1.502V4.002a1 1 0 0 1 1.472-.883l7.056 3.811a.999.999 0 0 0 .944 0z"></path><filter id="scrap-icon-619-a" width="150%" height="150%" x="-25%" y="-25%" filterUnits="objectBoundingBox"><feOffset in="SourceAlpha" result="shadowOffsetOuter1"></feOffset><feGaussianBlur in="shadowOffsetOuter1" result="shadowBlurOuter1" stdDeviation="1.5"></feGaussianBlur><feComposite in="shadowBlurOuter1" in2="SourceAlpha" operator="out" result="shadowBlurOuter1"></feComposite><feColorMatrix in="shadowBlurOuter1" values="0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0.26 0"></feColorMatrix></filter><filter id="scrap-icon-619-c" width="150%" height="150%" x="-25%" y="-25%" filterUnits="objectBoundingBox"><feGaussianBlur in="SourceAlpha" result="shadowBlurInner1" stdDeviation="1.5"></feGaussianBlur><feOffset in="shadowBlurInner1" result="shadowOffsetInner1"></feOffset><feComposite in="shadowOffsetInner1" in2="SourceAlpha" k2="-1" k3="1" operator="arithmetic" result="shadowInnerInner1"></feComposite><feColorMatrix in="shadowInnerInner1" values="0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0.2 0"></feColorMatrix></filter></defs><g fill="none" fill-rule="nonzero" transform="matrix(1 0 0 -1 0 24)"><use fill="#000" filter="url(#scrap-icon-619-a)" href="#scrap-icon-619-b"></use><use fill="#FFF" fill-opacity=".4" href="#scrap-icon-619-b"></use><use fill="#000" filter="url(#scrap-icon-619-c)" href="#scrap-icon-619-b"></use><path stroke="#FFF" d="M12.71 7.37h-.002a1.5 1.5 0 0 1-1.417 0L4.236 3.56a.499.499 0 0 0-.736.442v15.496c0 .553.448 1.002 1 1.002h15c.552 0 1-.449 1-1.002V4.002a.499.499 0 0 0-.734-.443l-7.057 3.81zm-.475-.88h-.001z"></path></g></svg>
                            </button>
                        </div>
                        <h1 class="houseparty_box_title">낡은 집에서 가능성을 발견한, 그림 같은 집</h1>
                        <div class="houseparty_writer_wrap">
                            <a class="houseparty_writer" href="#">
                                <img class="houseparty_writer_img" src="../resources/img/community/houseparty/houseparty_writer_img_01.webp" alt="houseparty">
                                <span class="houseparty_writer_name">_iam_hana</span>
                            </a>
                        </div>
                        <div class="houseparty_box_status">
                            <span class="status_scrap_count">스크랩 72</span>
                            <span class="status_count">조회 2,434</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </main>
</div>
