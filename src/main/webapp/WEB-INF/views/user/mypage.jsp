<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
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
                        <div class="circular--landscape circular--size200">
                            <img class="profileImg" src="/resources/img/user/${data.iUser}/${data.profileImg}" onerror="/resources/img/user/basic_profile.webp">		                                        
                        </div>
                        <div class="user_nm">${data.nm}</div> 

                        <div class="user_profile_link">
                            <div class="link_item">
                                <span class="link_item_icon"> 
                                    <i class="far fa-bookmark fa-2x"></i>
                                </span>
                                <div class="link_item_title">스크랩</div>
                                <div>${userStateChk.cmScrapChk}</div>
                            </div>
                            <div class="link_item">
                                <span class="link_item_icon"> 
                                    <i class="far fa-heart fa-2x"></i>
                                </span>
                                <div class="link_item_title">좋아요</div>
                                <div>${userStateChk.favoriteChk}</div>
                            </div>
                            <div class="link_item">
                                <span class = "link_item_icon">
                                    <i class="fas fa-ticket-alt fa-2x"></i>
                                </span>
                                <div class="link_item_title">찜한상품</div>
                                <div class="link_item_content">${userStateChk.pdScrapChk}</div>
                            </div>
                        </div>
                        
                    </div>

            </div>
        </div>  
        <div class = "contents">
            
            <section class="post_list">
                <h3 class="post_title">커뮤니티</h3>
                <div class="post_item_box">
                
					<table>
						<thead class="post_table_head">
							<tr class="post_table_tr">
								<th>제목</th>
								<th>수정일</th>
								<th>조회수</th>
								<th>좋아요</th>
							</tr>
						</thead>
						<c:forEach items="${boardData}" var="item">
						
							<tbody class="post_table_body">
								<tr class="post_table_tr" onclick="mypageLocation(${item.iBoard})">
									<td>${item.title}</td>
									<td>${item.rDt}</td>
									<td>${item.hits}</td>
									<td>${item.favoriteCnt}</td>
								</tr>
							</tbody>
						
						</c:forEach>
					</table>
                </div>

                <h3 class="post_title">댓글</h3>
                    <div class="post_item_box">
                    
                    <table>
						<thead class="post_table_head">
							<tr class="post_table_tr">
								<th >댓글내용</th>
								<th>수정일</th>
							</tr>
						</thead>
                     <c:forEach items="${CmtData}" var="item">
                     	<tbody class="post_table_body">
							<tr class="post_table_tr" onclick="mypageLocation(${item.iBoard})">
								<td>${item.ctnt}</td>
								<td>${item.cmtDt}</td>
							</tr>
						</tbody>
               		</c:forEach>
                	</table> 
                       
                    </div>
			<h3 class="post_title">스크랩</h3>
			<div class="post_item_box">
			
			<div class="scrap_table_CM">
				<div class ="scrap_table_title">커뮤니티 스크랩 </div>
				<table>
					<thead class="post_table_head">
						<tr class="post_table_tr">
							<th>제목</th>
						</tr>
					</thead>
					<c:forEach items="${userScrapCMData}" var="item">
						<tbody class="post_table_body">
							<tr class="post_table_tr" onclick="mypageLocation(${item.iBoard})">
								<td>${item.title}</td>
							</tr>
						</tbody>
					</c:forEach>
				</table>
			</div>
			
			<div class="scrap_table_ST">
				<div class ="scrap_table_title">스토어 스크랩 </div>
				<table>
					<thead class="post_table_head">
						<tr class="post_table_tr">
							<th>제목</th>
						</tr>
					</thead>
					<c:forEach items="${userScrapSTData}" var="item">
						<tbody class="post_table_body" >
							<tr class="post_table_tr" onclick="moveLocation(${item.iBoard})">
								<td>${item.title}</td>
							</tr>
						</tbody>
					</c:forEach>
				</table>
			</div>
			
			</div>
			<h3 class="post_title">좋아요</h3>
			<div class="post_item_box">
				<table>
					<thead class="post_table_head">
						<tr class="post_table_tr">
							<th>제목</th>
						</tr>
					</thead>
					<c:forEach items="${scrapData}" var="item">
						<tbody class="post_table_body">
							<tr class="post_table_tr">
								<td>${item.title}</td>
							</tr>
						</tbody>
					</c:forEach>
				</table>

			</div>
		</section>
        </div>          
    </div>
      
</div>


</html>