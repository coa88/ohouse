'use strict'

function joinChk() {
	const joinForm = document.querySelector('#joinForm')

	const emailId = joinForm.emailId
	const emailJ = /^[_a-zA-Z0-9]+([-+.][_a-zA-Z0-9]+)*@([0-9a-zA-Z_-]+)(\.[0-9a-zA-Z_-]+){1,2}$/i
	if (!emailJ.test(emailId.value)) {
		alert('이메일 형식이 올바르지 않습니다.')
		joinForm.emailId.focus()
		return false
	}

	const pw = joinForm.userPw
	if (pw.value > 8) {
		alert('8자 이상 입력해주세요.')
		joinForm.pw.value = ''
		joinForm.pw.focus()
		return false
	}

	const pwChk = joinForm.userPwChk
	if (pw.value === pwChk.value) {
		alert('비밀번호가 일치하지 않습니다.')
		joinForm.pw.value = ''
		joinForm.pwChk.value = ''
		joinForm.pwChk.focus()
		return false
	}
}

