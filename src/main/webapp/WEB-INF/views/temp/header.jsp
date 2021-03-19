<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>      
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %> 
<tiles:importAttribute name="menuList"/>
<tiles:importAttribute name="submenuList"/>

<div id="header-container">
    <header>
        <div class="menu-layout">
            <div class="main-menubar">
                <div class="logo">
                    <a href="/"><img src="/resources/img/ohouser_logo.jpg"></a>
                </div>
                <nav class="nav-menu">
	                <c:forEach items="${menuList}" var="item">
                    <a href="/${item.menuAddress}">${item.menuNm}</a>
	                    <div class="sub-menu-layout">
	                        <div class="sub-menubar">
	                            <ul class="sub-menu-item">
				                    <c:forEach items="${submenuList}" var="data">
				                 		<c:if test="${item.menuTyp eq data.menuTyp}">
				                 			<c:choose> 
				                 				<c:when test="${item.menuAddress eq data.submenuAddress}">
				                 					<li class="sub-menu-item_li"><a href="/${item.menuAddress}">${data.submenuNm}</a></li>
				                 				</c:when>
				                 				<c:otherwise>
				                 					<li class="sub-menu-item_li"><a href="/${item.menuAddress}/${data.submenuAddress}">${data.submenuNm}</a></li>
				                 				</c:otherwise>
				                 			</c:choose>
					       				</c:if>
							        </c:forEach>
	                            </ul>
	                        </div>
	                    </div>
             	   </c:forEach>
                    
                   
                </nav>
                <div class="nav-right">
                    <div class="has-search">
                        <span class="fa fa-search fa-lg form-control-feedback"></span>
                        <input type="text" class="form-control" placeholder="스토어 검색">
                    </div>
                    <div class="cart-menu">
                        <a href="/" class="fas fa-shopping-cart fa-lg cart-icon"></a>
                    </div>
          
                    <c:choose>
                    	<c:when test="${sessionScope.loginUser eq null}">
                    	 <div>
                      		  <a href="/user/login" class="nav-login-item">로그인</a>
                       		  <a href="/user/join" class="nav-login-item">회원가입</a>
                   		 </div>
                    	</c:when>
                    	<c:otherwise>
                    		<div>
	                    		<a href="/user/mypage" class="nav-login-item">마이페이지</a>
	                    		<a href="/user/logout" class="nav-login-item">로그아웃</a>
							</div>                    		
                    	</c:otherwise>
                    </c:choose>
                   
                    <div class="nav-write-box">
                        <div class="nav-write-btn">글쓰기<span class="fas fa-chevron-down nav-write-btn-arrow"></span></div>
                        <div class="nav-write-list">
                            <a href="/community/write?typ=1&secTyp=2" class="nav-write-item">
                                <div class="nav-write-item-icon"><img src="../resources/img/icon/photo_icon.png" alt="사진올리기"></div>
                                <div class="nav-write-item-text">
                                    <div class="nav-write-item-title">사진 올리기</div>
                                    <div class="nav-write-item-subtitle">우리집 사진을 공유해보세요.</div>
                                </div>
                            </a>
                            <a href="/community/write?typ=1&secTyp=3" class="nav-write-item">
                                <div class="nav-write-item-icon"><img src="../resources/img/icon/houseparty_icon.png" alt="집들이 글쓰기"></div>
                                <div class="nav-write-item-text">
                                    <div class="nav-write-item-title">집들이 글쓰기</div>
                                    <div class="nav-write-item-subtitle">집에 관한 이야기를 글로 작성해보세요.</div>
                                </div>
                            </a>
                            <a href="/community/write?typ=1&secTyp=4" class="nav-write-item">
                                <div class="nav-write-item-icon"><img src="../resources/img/icon/tip_icon.png" alt="노하우 글쓰기"></div>
                                <div class="nav-write-item-text">
                                    <div class="nav-write-item-title">노하우 글쓰기</div>
                                    <div class="nav-write-item-subtitle">다양한 인테리어 노하우를 공유해주세요.</div>
                                </div>
                            </a>
                            <a href="#" class="nav-write-item">
                                <div class="nav-write-item-icon"><img src="../resources/img/icon/review_icon.png" alt="상품 리뷰 쓰기"></div>
                                <div class="nav-write-item-text">
                                    <div class="nav-write-item-title">상품 리뷰 쓰기</div>
                                    <div class="nav-write-item-subtitle">상품 리뷰를 작성해 보세요.</div>
                                </div>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
            
        </div>
    </header>
</div>