<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>


<form action="/community/write" method="post" id="frm">
	<input type="hidden" name="typ" value="${param.typ}">
	<input type="hidden" name="secTyp" value="${param.secTyp}">
	<div class="write-container">
		<div class="input-form-title" >
			<input type="text"  name="title" placeholder="제목을 입력해주세요." required>
		</div>
		<textarea  class="editor" name="ctnt" placeholder="내용을 입력해주세요." required>

		</textarea >
	</div>
	<div>
		<input type="submit" value="글등록">
	</div>
</form>

<script src="/resources/js/ckeditor5/build/ckeditor.js?ver=2"></script>
<script>ClassicEditor
		.create( document.querySelector( '.editor' ), {
			
			toolbar: {
				items: [
					'imageUpload',
					'|',
					'bold',
					'italic',
					'underline',
					'|',
					'fontColor',
					'|',
					'link'
				]
			},
			language: 'ko',
			licenseKey: '',
			
		} )
		.then( editor => {
			window.editor = editor;
		} )
		.catch( error => {
			console.error( 'Oops, something went wrong!' );
			console.error( 'Please, report the following error on https://github.com/ckeditor/ckeditor5/issues with the build id and the error stack trace:' );
			console.warn( 'Build id: g4qhzp7szln0-71jm4jd3x1pp' );
			console.error( error );
		} );
</script>
