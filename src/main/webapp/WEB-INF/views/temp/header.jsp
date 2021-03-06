<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>      
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %> 
<tiles:importAttribute name="menuList"/>

<div id="header-container">
    <header>
        <div class="menu-layout">
            <div class="main-menubar">
                <div class="logo">
                    <a href="/"><img src="../resources/img/ohouser_logo.jpg"></a>
                </div>
                <nav class="nav-menu">
                    <a href="/community/home">커뮤니티</a>
                    <div class="sub-menu-layout">
                        <div class="sub-menubar">
                            <ul class="sub-menu-item">
	                            <c:forEach items="${pageScope.menuList}" var="item">
	                                <li class="sub-menu-item_li"><a href="/community/${item.menuAddress}">${item.menuNm}</a></li>
	                            </c:forEach>
                            </ul>
                        </div>
                    </div>
                   
                </nav>
                <div class="nav-right">
                    <div class="has-search">
                        <span class="fa fa-search fa-lg form-control-feedback"></span>
                        <input type="text" class="form-control" placeholder="스토어 검색">
                    </div>
                    <div class="cart-menu">
                        <a href="/" class="fas fa-shopping-cart fa-lg cart-icon"></a>
                    </div>
                    <div>
                        <a href="/user/login" class="nav-login-item">로그인</a>
                        <a href="/user/join" class="nav-login-item">회원가입</a>
                    </div>
                    <div>
                        <button class="nav-write-btn">글쓰기<span class="fas fa-chevron-down nav-write-btn-arrow"></span></button>
                    </div>
                </div>
            </div>
            
        </div>
    </header>
</div>