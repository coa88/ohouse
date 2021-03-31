<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

<div class = "user_mypage">
    <div class ="main_wrap">  
            <div class="user_profile">
                    <div class="user_profile_img_box" >
                        <div class="circular--landscape circular--size500">
                            <img id="profileImg" src="/resources/img/user/${data.iUser}/${data.profileImg}" onerror="unnamed.png">		                                        
                        </div>
                        <div id="user_nm">'${data.userNm}'</div> 

                        <div id="user_profile_link">
                            <div id="link_item">
                                <span class="link_item_icon"> 
                                    <i class="far fa-bookmark fa-2x"></i>
                                </span>
                                <div>스크랩</div>
                                <div>0</div>
                            </div>
                            <div id="link_item">
                                <span class="link_item_icon"> 
                                    <i class="far fa-heart fa-2x"></i>
                                </span>
                                <div>스크랩</div>
                                <div>0</div>
                            </div>
                            <div id="link_item">
                                <span class = "link_item_icon">
                                    <i class="fas fa-ticket-alt fa-2x"></i>
                                </span>
                                <div>스크랩</div>
                                <div>0</div>
                            </div>
                        </div>
                        
                    </div>

 
                스크랩, 팔로워, 팔로잉 좋아요 수 확인

            </div>
        </div>  
        <div class = "contents">
            
            <section class="post_list">
                <h3 class="post_title">커뮤니티</h3>
                <div class="post_item_box">
                    -커뮤니티에서 글 쓴 것들 리스트         
                </div>

                <h3 class="post_title">리뷰</h3>
                    <div class="post_item_box">
                        -리뷰들       
                    </div>
                <h3 class="post_title">댓글</h3>
                    <div class="post_item_box">
                        -댓글들      
                    </div>
            </section>
        </div>          
    </div>
      
</div>


</html>