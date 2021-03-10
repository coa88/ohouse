<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<div class="login-container">
    
    <div class="login-form">
        <div class="login-form-header">
            <img src="../resources/img/ohouser_logo.jpg">
        </div>
        <form action="/user/login" method="post">
            <div>
                <input type="text" class="input-login-form input-login-form-email" name="emailId" placeholder="이메일">
            </div>
            <div>
                <input type="password" class="input-login-form input-login-form-password" name="userPw" placeholder="비밀번호">
            </div>
            <button type="submit" class="input-login-form input-login-form-btn">로그인</button>
   
        </form>

        <div class="sign-in-form">
            <a href="#" class="sign-in-form sign-in-form-resetpw">비밀번호 재설정</a>
            <a href="/join" class="sign-in-form sign-in-form-join">회원가입</a>
        </div>

        <div class="sign-in-form">
            <button href="#" class="sign-in-form guest-order-btn">비회원 주문 조회하기</button>
        </div>
    </div>
</div>