<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<div class="join-container">
    
    <div class="join-form">
        <h1 class="join-form-title">회원가입</h1>
        <form id="joinForm" action="/user/join" method="post" onsubmit="return joinChk()">
            
            <h2 class="join-form-label email_label">이메일</h2>
            <div class="join-form-email">
                <span><input type="text" class="email_input" name="emailId" placeholder="이메일을 입력해주세요."></span>
            	<div class="emailRequired">필수 입력 항목입니다.</div>
 				<div class="emailChk">이메일 형식이 올바르지 않습니다.</div>
 				<div class="emailIdOverlap">이미 사용하고있는 이메일입니다.</div>
            </div> 			
 			
            <h2 class="join-form-label pw_label">비밀번호</h2>
            <h3 class="join-form-label-contents">8자 이상 입력해주세요.</h2>
            <div>
            	<input type="password" class="join-form-input pw_margin" name="userPw" placeholder="비밀번호" >
            	<div class="pwRequired">필수 입력 항목입니다.</div>
            	<div class="pwChk">8자 이상 입력해주세요.</div>
            </div>            
            
            <h2 class="join-form-label pwChk_label">비밀번호 확인</h2>
            <div><input type="password" class="join-form-input pwChk_margin" name="userPwChk" placeholder="비밀번호 확인"></div>
            <div class="pwChkRequired">확인을 위해 비밀번호를 한 번 더 입력해주세요.</div>
            <div class="pwChkChk">비밀번호가 일치하지 않습니다.</div>
            
            <h2 class="join-form-label nm_label">별명</h2>
            <h3 class="join-form-label-contents">다른 유저와 겹치지 않는 별명을 입력해주세요. (2~10자)</h2>
            <div><input type="text" class="join-form-input nm_margin" name="nm" placeholder="별명 (2~10자)"></div>
            <div class="nmRequired">필수 입력 항목입니다.</div>
            <div class="nmLength">2자 이상 10자 이하로 입력해주세요.</div>
            <div class="nmOverlap">사용 중인 별명입니다.</div>
            
            <h2 class="join-form-label terms_label">약관동의</h2>
            <div class="checkbox_group join-form-agree">
                <label class="form-all-check-label">
                    <input type="checkbox" class="check_all form-check-label-box">
                    <span class="join-form-all-check-contents">전체동의</span>
                </label>
                <label class="form-check-label">
                    <input type="checkbox" class="normal form-check-label-box">
                    <span class="join-form-check-contents">만 14세 이상입니다.</span>
                    <span class="join-form-check-contents-required">(필수)</span>
                </label>
                <label class="form-check-label">
                    <input type="checkbox" class="normal form-check-label-box">
                    <span class="join-form-check-contents">
                        <a href="#" class="join-form-check-contents-a">이용약관</a>
                    </span>
                    <span class="join-form-check-contents-required">(필수)</span>
                </label>
                <label class="form-check-label">
                    <input type="checkbox" class="normal form-check-label-box">
                    <span class="join-form-check-contents">
                        <a href="#" class="join-form-check-contents-a">개인정보수집 및 이용동의</a>
                    </span>
                    <span class="join-form-check-contents-required">(필수)</span>
                </label>
                <label class="form-check-label">
                    <input type="checkbox" class="normal form-check-label-box">
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
            <a href="/user/login" class="join-form-label">로그인</a>
        </p>
    </div>    
</div>