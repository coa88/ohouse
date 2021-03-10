<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<div class="store-detail-container">
    <!-- 상품이미지 시작 -->
	<div class="store-detail-photo">
		<div class="product_img">
			<div class="pro_min_img_box">
				<img class="pro_min_img" src="../resources/img/store/detail1.jpg" alt="작은 이미지.">
                <img class="pro_min_img" src="../resources/img/store/detail2.jpg" alt="작은 이미지.">
                <img class="pro_min_img" src="../resources/img/store/detail3.jpg" alt="작은 이미지.">
                <img class="pro_min_img" src="../resources/img/store/detail4.jpg" alt="작은 이미지.">
			</div>

			<div class="pro_big_img_box">
				<img class='pro_big_img' src="../resources/img/store/detail1.jpg" alt="커다란 이미지.">
			</div>
		</div>
    </div>
    <!-- 상품이미지 끝 -->

    <!-- 가격관련 시작 -->
    <div class="store-detail-info">
        <div class="brand">퀵슬립</div>
        <span class=product_nm>Q4 유로탑 롤팩 매트리스 2size</span>

        <span class="review_content"><a href="#">999개의 리뷰</a></span>
        <div class="action_button_box">
            <span class=share_button>
                <i class="far fa-bookmark fa-2x"></i>
            </span>
            <span class=scrap_button>
                <i class="fas fa-share-alt fa-2x"></i>
            </span>
        </div>

        <span class="price_box">
            <span class="sale_count">52</span>
            <span class="sale_persent">%</span>
            <h2 class="sale_price">100,000원</h2>
        </span>

        <div class="delivery_content">
            <div class="delivery_content_header">
                <span class="delivery_info">업체직접배송</span>
                <span class="delivery_info">15일 이내 배송</span>
            </div>
            <ul>
                <li>무료 배송</li>
                <li>화물 택배상품</li>
                <li>조건에 따라 추가비용 발생 가능 (상품 상세 정보 참고)</li>
                <li>도서산간 지역 배송 불가</li>
            </ul>
        </div>

        <div class="select_product">상품이름</div>
        <div class="order_box">
            <div class="order_price_box">
                <span class="order_price">주문금액</span>
                <span class="order_product_price">100,000원</span>
            </div>
            <div class="order_or_basket">
                <a href="#" class="basket_box">장바구니</a>
                <a href="#" class="order_direct">바로주문</a>
            </div>
        </div>
    </div>
    <!-- 가격관련 끝 -->

    <div class="store-detail-content">
        <div class="tab_nav">
            <a href="#page_1" class="tab_nav_item">상품정보</a>
            <a href="#page_2" class="tab_nav_item">리뷰</a>
            <a href="#page_3" class="tab_nav_item">배송</a>
            <a href="#page_4" class="tab_nav_item">추천</a>
        </div>

        <div class="item_info">
            <a name="page_1"></a>
            <img src="../resources/img/store/show.gif" alt="상품정보를 불러올 수 없습니다.">
        </div>

        <div class="nav_item_text">리뷰</div>
        <a name="page_2"></a>

        <section class="selling_section">
            <div class="nav_item_text">배송</div>
            <a name="page_3"></a>
            <table class="selling_table">
                <tbody>
                    <tr>
                        <th>배송</th>
                        <td>일반택배</td>
                    </tr>
                    <tr>
                        <th>배송비</th>
                        <td>무료배송</td>
                    </tr>
                    <tr>
                        <th>도서산간 추가 배송비</th>
                        <td>4,000원</td>
                    </tr>
                    <tr>
                        <th>배송불가지역</th>
                        <td>배송불가지역이 없습니다.</td>
                    </tr>
                </tbody>
            </table>
        </section>

        <h2 class="refund_title">반품/교환 사유에 따른 요청 가능 기간</h2>
        <p class="refund_note">반품 시 먼저 판매자와 연락하셔서 반품사유, 택배사,
                배송비, 반품지 주소 등을 협의하신 후 반품상품을 발송해 주시기 바랍니다.</p>
        <ol class="refund_text">
            <li>1. 구매자 단순 변심은 상품 수령 후 7일 이내 (구매자 반품배송비 부담)</li>
            <li>2. 표시/광고와 상이, 상품하자의 경우 상품 수령 후 3개월 이내 혹은 표시/광고와 다른 사실을 안
                날로부터 30일 이내.<br/>둘 중 하나 경과 시 반품/교환 불가 (판매자 반품배송비 부담)</li>
        </ol>

        <h2 class="refund_title">반품/교환 불가능 사유</h2>
        <p class="refund_note">아래와 같은 경우 반품/교환이 불가능합니다.</p>
        <ol class="refund_text">
            <li>1. 반품요청기간이 지난 경우</li>
            <li>2. 구매자의 책임 있는 사유로 상품 등이 멸실 또는 훼손된 경우 (단, 상품의 내용을 확인하기 위하여 포장 등을 훼손한 경우는 제외)</li>
            <li>3. 포장을 개봉하였으나 포장이 훼손되어 상품가치가 현저히 상실된 경우 (예: 식품, 화장품)</li>
            <li>4. 구매자의 사용 또는 일부 소비에 의하여 상품의 가치가 현저히 감소한 경우 (라벨이 떨어진 의류 또는 태그가 떨어진 명품관 상품인 경우)</li>
            <li>5. 시간의 경과에 의하여 재판매가 곤란할 정도로 상품 등의 가치가 현저히 감소한 경우 (예: 식품, 화장품)</li>
            <li>6. 고객주문 확인 후 상품제작에 들어가는 주문제작상품</li>
            <li>7. 복제가 가능한 상품 등의 포장을 훼손한 경우 (CD/DVD/GAME/도서의 경우 포장 개봉 시)</li>
        </ol>
    </div>
    
    
    <div>리뷰쓰기 테스트 로그인 되어있으면 리뷰쓰기 버튼이 보이고 안되어있으면 로그인으로 </div>
    <c:choose>
    	<c:when test="${sessionScope.loginUser = null}">
    		 <form action="/user/login" method="post"></form>
    	</c:when>
    	<c:otherwise>
    		<div>리뷰쓰기 </div>
    	</c:otherwise>
    </c:choose>
    
    
    
    <button type='button' id="modal_btn">모달창아 나와랏</button>
        <div class="black_bg"></div>
        <div class="modal_wrap">
         	<div class="modal_close"><a href="#">close</a></div>
        <div>
             
<div class ="review_modal">
    <div class="review_modal_title"> 리뷰 쓰기
        <button type="button" class="review_modal_close">close</button>
    </div>
    <div class= "review_point"> 포토리뷰 500p, 일반리뷰 100p</div>

    <form class="review_modal_form">    
        <div class="review_modal_form_product">
            <img class="review_modal_form_product_img" src ="img/detail1.jpg">
            <div class ="review_modal_form_product_content"> 
                <div class="review_modal_form_product_content_brand">브랜드 이름</div>
                <div class="review_modal_form_product_content_name"> 제품 이름</div>
            </div>

        </div>
        <div class="review_modal_star_section">
            <div class="review_modal_star_title">별점평가</div>
            <div class="review_modal_star_wrap">
                <div class = "review_modal_star">
                    <div class ="review_modal_star_label" >내구성</div>
                    <div class="review_modal_star_value">  
                        <div class = star-rating_wrap>
                            <p class="star_rating">
                                <a href="#" class="on">★</a>
                                <a href="#" class="on">★</a>
                                <a href="#" class="on">★</a>
                                <a href="#">★</a>
                                <a href="#">★</a>
                            </p>
                        </div>
                    </div>
                </div>
                <div class = "review_modal_star">
                    <div class ="review_modal_star_label" >가격</div>
                    <div class="review_modal_star_value">  
                        <div class = star-rating_wrap>
                            <p class="star_rating">
                                <a href="#" class="on">★</a>
                                <a href="#" class="on">★</a>
                                <a href="#" class="on">★</a>
                                <a href="#">★</a>
                                <a href="#">★</a>
                            </p>
                    </div></div>
                </div>
                <div class = "review_modal_star">
                    <div class ="review_modal_star_label" >디자인</div>
                    <div class="review_modal_star_value">  
                        <div class = star-rating_wrap>
                            <p class="star_rating">
                                <a href="#" class="on">★</a>
                                <a href="#" class="on">★</a>
                                <a href="#" class="on">★</a>
                                <a href="#">★</a>
                                <a href="#">★</a>
                            </p>
                        </div>
                    </div>
                </div>
                <div class = "review_modal_star">
                    <div class ="review_modal_star_label" >배송</div>
                    <div class="review_modal_star_value">  
                        <div class = star-rating_wrap>
                            <p class="star_rating">
                                <a href="#" class="on">★</a>
                                <a href="#" class="on">★</a>
                                <a href="#" class="on">★</a>
                                <a href="#">★</a>
                                <a href="#">★</a>
                            </p>
                        </div>    
                    </div>
                </div>
            </div>

           
           
            <!-- 테스트 코드 끝 -->

        <div class="review_modal_section">
            <div class="review_modal_section_title">사진 첨부 (선택)</div>
            <button class="upload_button" type="button">  사진 첨부하기 </buttons>
        </div>
        <div class="review_modal_section">
            <div class="review_modal_star_title">리뷰 작성</div>
            <textarea class ="review_modal_text"placeholder="자세하고 솔직한 리뷰는 다른 고객들에게 큰 도움이 됩니다. (최소 20자 이상)"></textarea>

        </div>
        <button class="review_modal_form_submit" type="submit">완료</button>
        
    </form>
</div>