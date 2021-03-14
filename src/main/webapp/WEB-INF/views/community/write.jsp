<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<form id="writePost">
	<div class="boardImgSel" onclick="openModal()">파일선택</div>
	<input type="hidden" name="typ" value="${param.typ}">
	<input type="hidden" name="secTyp" value="${param.secTyp}">
	<div class="write-container">
		<div class="input-form-title" >
			<input type="text"  name="title" placeholder="제목을 입력해주세요." required>
		</div>
		<textarea class="editor" id="ctnt" placeholder="내용을 입력해주세요." required></textarea >
	</div>
	<div>
		<input type="button" value="글등록" onclick="writePost(); boardImgUpload()">
	</div>
<div class="modalContainer hide">
	<div class="modalContent">
		<input type="file" id="boardImgInput" accept="*">
		<!-- <input type="button" value="업로드" onclick="boardImgUpload()">-->
		<span class="pointer" onclick="closeModal()">취소</span>
		
	</div>
</div>
</form>



<script src="/resources/js/ckeditor5/build/ckeditor.js?ver=4"></script>
<script defer src="/resources/js/ckeditor5/write_form.js?ver=4"></script>

