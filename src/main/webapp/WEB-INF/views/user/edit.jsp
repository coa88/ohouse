<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<meta charset="UTF-8">

<div>emailId : ${userDetail.emailId}</div>
<div>nm : ${userDetail.nm}</div>
<div>gender : ${userDetail.gender}</div>
<div>ph : ${userDetail.ph}</div>

<form id ="updUser" action="/user/edit" method="post">
	<input type="hidden" name="iUser" value="${userDetail.iUser}">
	<input type="hidden" name="emailId" value="${userDetail.emailId}">
	<div> ---updUser----
		<div>pw <input type="text" name="userPw"></div>
		<div>nm <input type="text" name="nm"></div>
		<div>gender: 
			<label>Woman<input type="radio" name="gender" value="0"></label>
			<label>Man<input type="radio" name="gender" value="1"></label>
		</div>
		<div>ph<input type="text" name="ph"></div>
	</div>	
	
	<button type="submit"> 확인 </button>
</form>
</html>