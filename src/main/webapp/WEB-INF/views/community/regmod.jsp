<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>


<div class="editor"></div>
		
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
