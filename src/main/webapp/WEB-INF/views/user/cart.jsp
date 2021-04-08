<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

    <script defer src="/resources/js/cart.js?ver=4"></script>
<div class="commerce-cart-wrap">
    <div class= "main_container">
        <div class = "cart_main_wrap">
            <div class="cart_header">
                <span class="all_item_select">
                    <i class="fas fa-check-square"></i>
                    
                </span>
                <div>모두선택</div>
                
            </div>
        
        
         <c:forEach items="${product_detail}" var="item">

				<ul class="cart_content_group_list">
					<li class="cart_content_group_item">
						<article class="cart_group">
							<div class="cart_item_header">${item.brand}</div>
							<ul class="cart_content_group_item-list">

								<article class="cart_content_group_item-detail">
									<span class="check_square"> <i
										class="fas fa-check-square"></i>
									</span> <a class="product_item_link" href="#">


										<div class="product_small-img">
											<img class="cart_small-img" src="/resources/img/store/board/${item.iProduct}/${item.pdImg}" onerror="this.src='/resources/img/errorThumb.png'" alt="작은 이미지.">
										</div>
										<h3 class="product_small_title">${item.productNm}</h3>
									</a>
									<button class="carted_product_delete" type="button">삭제</button>

								</article>

							</ul>
							<ul class="cart_content_group_item-list">
								<select class="item_quantity">
									<option value="0">1</option>
									<option value="1">2</option>
									<option value="2">3</option>
									<option value="3">4</option>
									<option value="4">5</option>
									<option value="5">6</option>
									<option value="6">7</option>
									<option value="7">8</option>
									<option value="8">9</option>
									<option value="9">10+</option>
								</select>
								 <div class="item_price_box">
                            		<div class="item_price_number">${item.price} </div>
                            		 <div class="item_price_number won">원</div>
                        		</div>
							</ul>
						</article>
						<div class="cart_item_bottom">무료배송</div>

					</li>
				</ul>

			</c:forEach>

       
        </div>
        <div class= "cart_sidebar_wrap">
            <div class="cart_summary_table">
                <div class="cart_summary_row">
                    <div class="cart_summary_column">
                        총 상품금액
                    </div>
                    <div class="cart_summary_price">
                        원
                    </div>
                </div>
                <div class="cart_summary_row">
                    <div class="cart_summary_column" >
                        배송비
                    </div>
                    <div class="cart_summary_price">
                        원
                    </div>
                </div>
                <div class="cart_summary_row">
                    <div class="cart_summary_column">
                        총 할인금액
                    </div>
                    <div class="cart_summary_price">
                        원
                    </div>

                </div>
                <div class="cart_summary_row">
                    <div class="row_total">
                        결재금액
                    </div>
                    <div class="row_total_price"> 
                        원
                    </div>
                </div>

               

            </div>
            <button class="cart_submit">
                주문하기
            </button>

        </div>


        
    </div>
    

</div>
