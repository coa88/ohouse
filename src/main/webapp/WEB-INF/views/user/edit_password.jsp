<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<meta charset="UTF-8">
<html>
	 <nav class="nav_box">
        <div class="nav_warp">
          <li class ="nav_item"> <a href="/user/mypage">프로필</a></li>
          <li class ="nav_item"> <a href ="/user/edit">설정</a> </li>
          <li class ="nav_item"> <a href ="/user/edit_password">비밀번호 변경</a> </li>
          <li class ="nav_item"> <a href ="/user/withdraw">회원탈퇴</a> </li>
        </div>
    </nav>

    <div class=edit_password_wrap>
        <h3 class="edit_password_title">비밀번호 변겅</h3>
            <form id ="changePw" action="/user/edit_password" method="post">
            <div class="edit_password_section">
                <div class="edit_password_section_title">
                    현재 비밀번호
                </div>
                <div class="form_section">
                    <div class="form_content">
                        <input type="password" name="currentPw" class="form_control">
                    </div>
                </div>

                <div class="edit_password_section_title">
                    새 비밀번호 
                </div>
                <span id="pwc"></span>
                <div class="form_section">
                    <div class="form_content">
                        <input type="password" name ="user_pw" id= "user_pw" class="form_control">
                    </div>
                </div>
                <div class="edit_password_section_title">
                    비밀번호 확인
                </div>
                <span id="chkpwc"></span>
                <div class="form_section">
                    <div class="form_content">
                        <input type="password" name ="chk_user_pw" id="chk_user_pw" class="form_control">
                    </div>
                    
                </div>
            </div>
            <button class="edit_password_submit" type="submit"> 확인 </button>
        </form>


    </div>

	 <script defer src="/resources/js/edit_password.js?ver=4"></script>
</html>