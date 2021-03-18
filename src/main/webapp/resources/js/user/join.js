'use strict'

const form = document.querySelector('#joinForm')

// 회원가입 체크
function joinChk() {
	if (!emailNullChk()) {
		return false
	} else if (!chkEmail()) {
		return false
	} else if (!pwNullChk()) {
		return false
	} else if (!chkPw()) {
		return false
	} else if (!pwChkNullChk()) {
		return false
	} else if (!chkPwChk()) {
		return false
	} else if (!nmNullChk()) {
		return false
	} else if (!chkNm()) {
		return false
	}
	
	return true
}

// 이메일 중복 체크
form.emailId.addEventListener('change', function() {
	emailIdAjax()
})

function emailIdAjax() {
	const joinEmailIdVal = form.emailId.value

	var param = {
		emailId: joinEmailIdVal
	}

	fetch('/user/emailIdChk', {
		method: 'post',
		headers: {
			'Content-Type': 'application/json'
		},
		body: JSON.stringify(param)
	})
		.then(res => res.json())
		.then(myJson => {
			emailIdProc(myJson.emailId)
		})
}

function emailIdProc(val) {
	if (val === 1) {
		document.querySelector('.email_label').classList.add('focus')
		document.querySelector('.emailIdOverlap').style.display = 'block'
		return false
	}
	document.querySelector('.email_label').classList.remove('focus')
	document.querySelector('.emailIdOverlap').style.display = 'none'
	return true
}

// 별명 중복 체크
form.nm.addEventListener('change', function() {
	nmAjax()
})

function nmAjax() {
	const joinNmVal = form.nm.value

	var param = {
		nm: joinNmVal
	}

	fetch('/user/nmChk', {
		method: 'post',
		headers: {
			'Content-Type': 'application/json'
		},
		body: JSON.stringify(param)
	})
		.then(res => res.json())
		.then(myJson => {
			nmProc(myJson.nm)
		})
}

function nmProc(val) {
	if (val === 1) {
		document.querySelector('.nm_label').classList.add('focus')
		document.querySelector('.nmOverlap').style.display = 'block'
		return false
	}
	document.querySelector('.nm_label').classList.remove('focus')
	document.querySelector('.nmOverlap').style.display = 'none'
	return true
}








// 회원가입 조건 체크
function chkEmail() {

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

	if (form.userPw.value !== form.userPwChk.value) {
		document.querySelector('.pwChk_label').classList.add('focus')
		document.querySelector('.pwChkChk').style.display = 'block'
		form.userPwChk.focus()
		return false
	}
	document.querySelector('.pwChk_label').classList.remove('focus')
	document.querySelector('.pwChkChk').style.display = 'none'
	return true
}

function chkNm() {

	if (form.nm.value.length < 2 || form.nm.value.length > 10) {
		document.querySelector('.nm_label').classList.add('focus')
		document.querySelector('.nmLength').style.display = 'block'
		form.nm.focus()
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

// 약관동의
const chkAll = document.querySelector('.check_all')
const chkNormal = document.querySelectorAll('.normal')

chkAll.addEventListener('click', function() { // 전체 선택 클릭시 이벤트
	for (let i = 0; i < chkNormal.length; i++) {
		chkNormal[i].checked = chkAll.checked
	}
}, false)

for (let i = 0; i < chkNormal.length; i++) { // 하위 체크박스 클릭시 이벤트
	chkNormal[i].addEventListener('click', function() {
		for (let j = 0; j < chkNormal.length; j++) {
			if (chkNormal[j].checked === false) {
				chkAll.checked = false
				return
			}
		}
		chkAll.checked = true
	}, false)
} 