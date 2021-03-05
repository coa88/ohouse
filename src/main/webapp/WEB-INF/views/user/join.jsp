<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<div class="join-container">
    
    <div class="join-form">
        <h1 class="join-form-title">회원가입</h1>

        <form action="/user/join" method="post">
            <h2 class="join-form-label">이메일</h2>
            <div class="join-form-email">
                <span><input type="text" class="join-form-email-input" name="emailId" placeholder="이메일"></span>
                <span class="join-form-email-separator">@</span>
                <span class="join-form-email-select">
                    <select id="join-form-email-emailType" onchange="emailClick()">
                        <option selected value disabled>선택해주세요</option>
                        <option value="naver.com">naver.com</option>
                        <option value="hanmail.net">hanmail.net</option>
                        <option value="daum.net">daum.net</option>
                        <option value="gmail.com">gmail.com</option>
                        <option value="nate.com">nate.com</option>
                        <option value="hotmail.com">hotmail.com</option>
                        <option value="outlook.com">outlook.com</option>
                        <option value="icloud.com">icloud.com</option>
                        <option value="direct">직접입력</option>
                        <input type="hidden" class="emailAdr_send_input" name="emailAdr">
                    </select>
                </span>
            </div>

            <h2 class="join-form-label">비밀번호</h2>
            <h3 class="join-form-label-contents">8자 이상 입력해주세요.</h2>
            <div><input type="password" class="join-form-input" name="user_pw" placeholder="비밀번호"></div>
            <h2 class="join-form-label">비밀번호 확인</h2>
            <div><input type="text" class="join-form-input" name="user_pw_chk" placeholder="비밀번호 확인"></div>
            <h2 class="join-form-label">별명</h2>
            <h3 class="join-form-label-contents">다른 유저와 겹치지 않는 별명을 입력해주세요. (2~15자)</h2>
            <div><input type="text" class="join-form-input" name="nm" placeholder="별명 (2~15자)"></div>
            
            <h2 class="join-form-label">약관동의</h2>
            <div class="join-form-agree">
                <label class="form-all-check-label">
                    <input type="checkbox" class="form-check-label-box">
                    <span class="join-form-all-check-contents">전체동의</span>
                </label>
                <label class="form-check-label">
                    <input type="checkbox" class="form-check-label-box">
                    <span class="join-form-check-contents">만 14세 이상입니다.</span>
                    <span class="join-form-check-contents-required">(필수)</span>
                </label>
                <label class="form-check-label">
                    <input type="checkbox" class="form-check-label-box">
                    <span class="join-form-check-contents">
                        <a href="#" class="join-form-check-contents-a">이용약관</a>
                    </span>
                    <span class="join-form-check-contents-required">(필수)</span>
                </label>
                <label class="form-check-label">
                    <input type="checkbox" class="form-check-label-box">
                    <span class="join-form-check-contents">
                        <a href="#" class="join-form-check-contents-a">개인정보수집 및 이용동의</a>
                    </span>
                    <span class="join-form-check-contents-required">(필수)</span>
                </label>
                <label class="form-check-label">
                    <input type="checkbox" class="form-check-label-box">
                    <span class="join-form-check-contents">이벤트,프로모션 알림 메일 및 SMS 수신</span>
                    <span class="join-form-check-contents-select">(선택)</span>
                </label>
            </div>

            <button type="submit" class="input-join-form-btn">회원가입 완료</button>
            <input type="hidden" name="provider" value="ohouse">
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
        </form>

        <p class="user-sign-page">
            이미 아이디가 있으신가요?
            <a href="/login" class="join-form-label">로그인</a>
        </p>
    </div>    
</div>