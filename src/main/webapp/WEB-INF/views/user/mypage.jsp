<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<meta charset="UTF-8">


<div>emailId : ${userDetail.emailId}</div>
<div>nm : ${userDetail.nm}</div>
<div>gender : ${userDetail.gender}</div>
<div>ph : ${userDetail.ph}</div>

<form id ="updUser" action="/user/mypage" method="post">
	<input type="hidden" name="userPk" value="">
	<div> ---updUser----
		<div>nm <input type="text" name=""></div>
		<div>gender<input type="text" name=""></div>
		<div>ph</div> <input type="text" name=""></div>
	</div>	
</form>
</html>