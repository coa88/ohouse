<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<!DOCTYPE html>
<html>
<meta charset="UTF-8">
    <nav class="nav_box">
        <div class="nav_warp">
          <li class ="nav_item"> <a href="/user/mypage">프로필</a></li>
          <li class ="nav_item"> <a href ="/user/edit">설정</a> </li>
          <li class ="nav_item"> <a href ="/user/edit_password">비밀번호 변경</a> </li>
          <li class ="nav_item"> <a href ="/user/withdraw">회원탈퇴</a> </li>
        </div>
    </nav>

    <div class="edit_password_wrap">
        <div class="edit_user_info_header">
            <h3> 회원정보 수정</h3>
        </div>
        <form id ="updUser">
            <table>
                <tr class="edit_user_info_item">
                    <td>이메일</td>
                    <td> 
                        <div class="edit_user_info_item_field" onclick="test()">
                              <input class="form_control" name="email_id" value="${userDetail.emailId}">
                        </div>
                    </td>
                </tr>
                <tr class="edit_user_info_item">
                    <td>별명</td>
                    <td>
                        <input class="form_control" name="nm" value="${userDetail.nm}">
                    </td>
                </tr>
                <tr class="edit_user_info_item">
                    <td>성별</td>
                    <td>
                        <ul class="radio_user_sex">
                            <label><input type="radio" name="gender" value="0" checked>여성</label>
                            <label><input type="radio" name="gender" value="1">남성</label>
                        </ul>
                    </td>
                </tr>
                <tr class="edit_user_info_item">
                    <td>연락처 </td>
                    <td>
                        <ul class="radio_user_sex">
                           <input class="form_control" name="ph" value="${userDetail.ph}">
                        </ul>
                    </td>
                </tr>
                <tr class="edit_user_info_item">
                    <td>프로필 이미지</td>
                    <td>

					<div class="edit_user_profile_box" >
						<c:if test="${userDetail.profileImg == null}">
							<div class="circular--landscape circular--size200">
								<img id="profileImg" src="/resources/img/user/basic_profile.webp">
							</div>
						</c:if>
						<c:if test="${userDetail.profileImg != null}">
							<div class="circular--landscape circular--size200">
								<img id="profileImg" src=#>
							</div>
						</c:if>
					 <input type="file" id="file" accept="image/*" value="사진선택">
						
					</div>
					
				</td>
                </tr>
            </table>

            <button class="edit_user_info_submit" onclick="updUserDetail()">회원정보 수정</button>
        </form>
        
        
	
	
</div> 


</html>

<script defer src="/resources/js/edit.js?ver=4"></script>
