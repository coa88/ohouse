



//업로드

function updUserDetail() {

	let userDetailElem = document.querySelector('#updUser')

	
	let emailIdVal = userDetailElem.email_id.value
	let nmVal = userDetailElem.nm.value
	let genderVal= userDetailElem.gender.value
	let phVal = userDetailElem.ph.value	
	let profileImgVal = userDetailElem.profileImg.value
	let fileElem = document.querySelector('#file')
	
	if(emailIdVal == '') {
		alert('이메일을 입력해 주세요')
		return false
	}
	if(nmVal == '') {
		alert('닉네임을 입력해 주세요');
		return false;
	}  
	
	let formData = new FormData()
	
	formData.append('emaiId', emailIdVal)
	formData.append('nm', nmVal)
	formData.append('gender', genderVal)
	formData.append('ph', phVal)
	formData.append('profileImg', profileImgVal)
	formData.append('file', fileElem.files[0])
	
	
	fetch('/user/edit', {
		method: 'POST',		
		body: formData
	}).then(function (res){
		console.log(res)
		return res.json()		
	}).then(function (data) {
		console.log(data)
		alert(data.result)
		if(data.result === 0 || data.result === undefined) {
			alert('업로드 실패하였습니다.')			
		} else {
			alert('수정되었습니다.')					
		} 
	}).catch(error => console.error('Error:', error))
	
}
