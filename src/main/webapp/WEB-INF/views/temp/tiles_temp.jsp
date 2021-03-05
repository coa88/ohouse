<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${title}</title>
<link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous"/>
<link rel="stylesheet" href="/resources/css/common.css?ver=2">
<link rel="stylesheet" href="/resources/css/home.css?ver=2">
<link rel="stylesheet" href="/resources/css/photo.css?ver=2">
<link rel="stylesheet" href="/resources/css/houseparty.css?ver=2">
<link rel="stylesheet" href="/resources/css/tip.css?ver=2">
<link rel="stylesheet" href="/resources/css/store.css?ver=2">
<link rel="stylesheet" href="/resources/css/board.css?ver=2">
<link rel="stylesheet" href="/resources/css/regmod.css?ver=2">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@splidejs/splide@latest/dist/css/splide.min.css?ver=2"> <!-- splide css -->
<script defer src="https://cdn.jsdelivr.net/npm/@splidejs/splide@latest/dist/js/splide.min.js"></script> <!-- splide js-->
<script defer src="/resources/js/store.js?ver=2"></script>
<script defer src="/resources/js/<tiles:getAsString name="categoryJS"/>.js?ver=3"></script>
</head>
<body>
	<div id="container">
		<tiles:insertAttribute name="header" />
		<tiles:insertAttribute name="content" />		
		<tiles:insertAttribute name="footer"/>
	</div>
</body>
</html>



