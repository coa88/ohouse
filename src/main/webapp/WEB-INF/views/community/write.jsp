<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<form id="writePost">
	<input type="hidden" name="typ" value="${param.typ}">
	<input type="hidden" name="secTyp" value="${param.secTyp}">

	<div class="thumbImg-container">
		<div class="thumbImg">
			<img id="preview" src="" onerror="this.src='../resources/img/user/cover.jpg'" alt="썸네일" >
		</div>
		<input type="file" id="file" accept="image/*" value="커버사진선택" onchange="setThumbnail(event)">
	</div>	
	
	<div class="write-container">
		<div class="input-form-title" >
			<input type="text"  name="title" placeholder="제목을 입력해주세요." required>
		</div>
		<textarea class="editor" id="ctnt" placeholder="내용을 입력해주세요." required></textarea >
		<input type="button" class="writeBtn" value="글등록" onclick="WriteUpload ()">
	</div>
	 	
</form>



<script src="/resources/js/ckeditor5/build/ckeditor.js?ver=4"></script>
<script defer src="/resources/js/ckeditor5/write_form.js?ver=4"></script>

