'use strict'

const form = document.querySelector('#joinForm')

// 회원가입 체크
function joinChk() {
	if (!chKEmail()) {
		return false
	} else if (!chkPw()) {
		return false
	} else if (!chkPwChk()) {
		return false
	} else if (!chkNm()) {
		return false
	}
	return true
}

// 공백체크후에 조건 체크
function chKEmail() {
	if (!emailNullChk())
		return false

	const emailJ = /^[_a-zA-Z0-9]+([-+.][_a-zA-Z0-9]+)*@([0-9a-zA-Z_-]+)(\.[0-9a-zA-Z_-]+){1,2}$/i

	if (!emailJ.test(form.emailId.value)) {
		document.querySelector('.email_label').classList.add('focus')
		document.querySelector('.emailChk').style.display = 'block'
		form.emailId.focus()
		return false
	}
	document.querySelector('.email_label').classList.remove('focus')
	document.querySelector('.emailChk').style.display = 'none'
	return true
}

function chkPw() {
	if (!pwNullChk())
		return false

	if (form.userPw.value.length < 8) {
		document.querySelector('.pw_label').classList.add('focus')
		document.querySelector('.pwChk').style.display = 'block'
		form.userPw.focus()
		return false
	}
	document.querySelector('.pw_label').classList.remove('focus')
	document.querySelector('.pwChk').style.display = 'none'
	return true
}

function chkPwChk() {
	if (!pwChkNullChk())
		return false

	if (form.userPw.value !== form.userPwChk.value) {
		document.querySelector('.pwChk_label').classList.add('focus')
		document.querySelector('.pwChkChk').style.display = 'block'
		form.userPwChk.focus()
		return false
	}
	document.querySelector('.pwChk_label').classList.remove('focus')
	document.querySelector('.pwChkChk').style.display = 'none'
}

function chkNm() {
	if (!nmNullChk())
		return false

	if (form.nm.value.length < 2 || form.nm.value.length > 15) {
		document.querySelector('.nm_label').classList.add('focus')
		document.querySelector('.nmLength').style.display = 'block'
		return false
	}
	document.querySelector('.nm_label').classList.remove('focus')
	document.querySelector('.nmLength').style.display = 'none'
	return true
}

// 입력란 공백 체크
function emailNullChk() {
	if (form.emailId.value == '') {
		document.querySelector('.email_label').classList.add('focus')
		document.querySelector('.emailRequired').style.display = 'block'
		form.emailId.focus()
		return false
	}
	document.querySelector('.email_label').classList.remove('focus')
	document.querySelector('.emailRequired').style.display = 'none'
	return true
}

function pwNullChk() {
	if (form.userPw.value == '') {
		document.querySelector('.pw_label').classList.add('focus')
		document.querySelector('.pwRequired').style.display = 'block'
		form.userPw.focus()
		return false
	}
	document.querySelector('.pw_label').classList.remove('focus')
	document.querySelector('.pwRequired').style.display = 'none'
	return true
}

function pwChkNullChk() {
	if (form.userPwChk.value == '') {
		document.querySelector('.pwChk_label').classList.add('focus')
		document.querySelector('.pwChkRequired').style.display = 'block'
		form.userPwChk.focus()
		return false
	}
	document.querySelector('.pwChk_label').classList.remove('focus')
	document.querySelector('.pwChkRequired').style.display = 'none'
	return true
}

function nmNullChk() {
	if (form.nm.value == '') {
		document.querySelector('.nm_label').classList.add('focus')
		document.querySelector('.nmRequired').style.display = 'block'
		form.nm.focus()
		return false
	}
	document.querySelector('.nm_label').classList.remove('focus')
	document.querySelector('.nmRequired').style.display = 'none'
	return true
}