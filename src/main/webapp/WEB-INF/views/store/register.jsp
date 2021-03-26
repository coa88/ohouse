<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<form id="writePost">
	<input type="hidden" name="iProduct" value="${param.iProduct}">
	<div class="thumbImg-container">
		<div class="thumbImg">
			<img id="preview" src="/resources/img/store/board/${data.iBoard}/${data.boardImg}" onerror="this.src='/resources/img/user/cover.jpg'" alt="썸네일" >
		</div>
		<input type="file" id="file" multiple accept="image/*" value="커버사진선택" onchange="setThumbnail(event)">
	</div>	
	
	<div>
		<input type="text" name="brand" placeholder="브랜드" value="${data.brand}" required>
		<input type="text" name="productNm" placeholder="상품이름" value="${data.productNm}" required>
		<input type="number" name="price" placeholder="가격" value="${data.price}" required>
		<input type="number" name="sales" placeholder="할인율" value="${data.sales}" required>
		<select id="category" name="category">
			<option value="none" disabled selected>카테고리</option>
			<option value="1">가구</option>
			<option value="2">홈데코/조명</option>
			<option value="3">가전</option>
			<option value="4">수납/정리</option>
			<option value="5">주방</option>
		</select>
	</div>
	
	<div class="write-container">
		<div class="input-form-title" >
			<input type="text"  name="productTitle" placeholder="제목을 입력해주세요." value="${data.productTitle}" required>
		</div>
		<textarea class="editor" id="productCtnt" placeholder="내용을 입력해주세요." required>${data.productCtnt}</textarea >
		
		<c:choose>
			<c:when test="${data == null}">
				<input type="button" class="writeBtn" value="글등록" onclick="productRegister ()">			
			</c:when>
			<c:otherwise>
				<input type="button" class="writeBtn" value="글수정" onclick="">			
			</c:otherwise>
		</c:choose>		
	</div>
	 	
</form>



<script src="/resources/js/ckeditor5/build/ckeditor.js?ver=4"></script>
<script defer src="/resources/js/ckeditor5/write_form.js?ver=4"></script>