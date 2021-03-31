<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

 <nav class="nav_box">
        <div class="nav_warp">
          <li class ="nav_item"> <a href="/user/mypage">프로필</a></li>
          <li class ="nav_item"> <a href ="/user/edit">설정</a> </li>
          <li class ="nav_item"> <a href ="/user/edit_password">비밀번호 변경</a> </li>
          <li class ="nav_item"> <a href ="/user/withdraw">회원탈퇴</a> </li>
        </div>
    </nav>

<div class ="withdraw_content">
    <h2>회원탈퇴</h2>
        <form id="withdraw" class="withdraw" action="/user/withdraw" method="POST">  
        	
            <div class="withdraw_terms_field">
                <div class="withdraw_terms_box">
                    <div class="terms_title">회원탈퇴 시 처리내용</div>
                    <ul class="withdraw_terms_text">
                        <li>오늘의집 포인트·쿠폰은 소멸되며 환불되지 않습니다.</li>
                        <li>오늘의집 구매 정보가 삭제됩니다.</li>
                        <li>소비자보호에 관한 법률 제6조에 의거,계약 또는 청약철회 등에 관한 기록은 5년, 대금결제 및 재화등의 공급에 관한 기록은 5년, 소비자의 불만 또는 분쟁처리에 관한 기록은 3년 동안 보관됩니다. 동 개인정보는 법률에 의한 보유 목적 외에 다른 목적으로는 이용되지 않습니다.
                        </li>
                    </ul>
                    <div class="terms_title">회원탈퇴 시 게시물 관리</div>
                    <ul class="withdraw_terms_text">
                        회원탈퇴 후 오늘의집 서비스에 입력한 게시물 및 댓글은 삭제되지 않으며, 회원정보 삭제로 인해 작성자 본인을 확인할 수 없으므로 게시물 편집 및 삭제 처리가 원천적으로 불가능 합니다. 게시물 삭제를 원하시는 경우에는 먼저 해당 게시물을 삭제 하신 후, 탈퇴를 신청하시기 바랍니다.
                    </ul>
                    <div class="terms_title">회원탈퇴 후 재가입 규정</div>
                    <ul class="withdraw_terms_text">
                        탈퇴 회원이 재가입하더라도 기존의 오늘의집 포인트는 이미 소멸되었기 때문에 양도되지 않습니다.
                    </ul>



                </div>
                <div class="terms_title" id ="move">회원 탈퇴 신청에 앞서 아래 내용을 반드시 확인해 주세요.</div>
                <div class="confirm_check">
                    <input id="confirm" type="checkbox">
                    <label for="confirm"> 위 내용을 모두 확인했습니다.
                        <span class="confrim_alert">필수</span>
                    </label>
                </div>
            </div>

            <div class="withdraw_terms_field"> 
                <div class="terms_title">오늘의집 회원에서 탈퇴하려는 이유가 무엇인가요? (복수선택 가능)
                    <span class="confrim_alert">필수</span>
                </div>
                <div class="withdraw_terms_box">
                        <div class="grid_checkbox">
                            <div class="checkbox_content">
                                <input type="checkbox" id="reason_0" value="이용빈도 낮음">
                                <label for="reason_0">이용빈도 낮음</label>
                            </div>
                            <div class="checkbox_content">
                                <input type="checkbox" id="reason_1" value="재가입">
                                <label for="reason_1">재가입</label>
                            </div>
                            <div class="checkbox_content">
                                <input type="checkbox" id="reason_2" value="콘텐츠/제품정보/상품 부족">
                                <label for="reason_2">콘텐츠/제품정보/상품 부족</label>
                            </div>
                            <div class="checkbox_content">
                                <input type="checkbox" id="reason_3" value="개인정보보호">
                                <label for="reason_3">개인정보보호</label>
                            </div>
                            <div class="checkbox_content">
                                <input type="checkbox" id="reason_4" value="회원특혜/쇼핑혜택 부족">
                                <label for="reason_4">회원특혜/쇼핑혜택 부족</label>
                            </div>
                            <div class="checkbox_content">
                                <input type="checkbox" id="reason_5" value="기타">
                                <label for="reason_5">기타</label>
                            </div>
                        </div>
                </div>

            </div>
            <div class="withdraw_terms_field">
                <div class="terms_title">오늘의집에 떠나는 이유를 자세히 알려주시겠어요? 
                    <span class="confrim_info">선택</span>
                </div>
                <div class="terms_sub_title">
                    여러분의 소중한 의견을 반영해 더 좋은 서비스로 꼭 찾아뵙겠습니다.
                </div>
               <textarea id = "text-area" placeholder="※ 탈퇴 사유 작성 전 아래 내용을 참고해주세요.
- 오늘의집 이용 빈도가 낮아졌다면 어떤 이유로 자주 사용하지 않게 되었는지 구체적인 사유를 남겨주세요
- 인테리어 콘텐츠/제품정보/상품 등 찾으려고 했던 정보가 부족하거나 없었다면 어떤 정보가 필요하신지 자세하게 남겨주세요
- 기타 사유를 포함하여 오늘의집 이용중 불편하셨던 점이나 앱 기능 등 전반적으로 개선되었으면 하는 부분을 자세하게 남겨주세요
- 다시 돌아오셨을 때 지금 보다 더 발전된 오늘의집이 되어있을 수 있도록 다양하고 충분한 의견 부탁드립니다^^*" class="withdrawal_reason_detail" ></textarea>
                <div class="text_length"><span id='count'>0</span>자/<span id="max-count"> 0</span>자</div>
            </div>
            <div class="withdraw_button_box">
                <input type="submit" class="withdraw_commit" value="탈퇴하기"> 
                <a class="withdraw_cancel" href="/user/edit">취소하기</a>
            </div>
            
        </form> 

</div>

</html>

<script defer src="/resources/js/withdraw.js?ver=4"></script>