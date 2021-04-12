'use strict'

const form = document.querySelector('#joinForm')
const emailErrorElem = document.querySelector('.emailError')
const pwErrorElem = document.querySelector('.pwError')
const pw2ErrorElem = document.querySelector('.pw2Error')
const nmErrorElem = document.querySelector('.nmError')

// 회원가입 체크
function joinChk() {
	if (emailErrorElem.getAttribute('data-email') == 1) {
		return false
	} else if (nmErrorElem.getAttribute('data-nm') == 1) {
		return false
	} else if (pwErrorElem.getAttribute('data-pw') == 1) {
		return false
	} else if (!pw2Chk()) {
		return false
	}
	pw2ErrorElem.innerHTML = ''
	return true
}

// 이메일 중복 체크
form.emailId.addEventListener('change', function() {
	emailIdAjax()
})

function emailIdAjax() {
	const joinEmailIdVal = form.emailId.value

	const param = {
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

	function emailIdProc(val) {
		const emailJ = /^[_a-zA-Z0-9]+([-+.][_a-zA-Z0-9]+)*@([0-9a-zA-Z_-]+)(\.[0-9a-zA-Z_-]+){1,2}$/i

		if (!emailJ.test(form.emailId.value)) {
			emailErrorElem.innerHTML = '이메일 형식이 올바르지 않습니다.'
			form.emailId.focus()
			emailErrorElem.setAttribute('data-email', '1')
			return
		} else if (val === 1) {
			emailErrorElem.innerHTML = '이미 사용하고있는 이메일입니다.'
			form.emailId.focus()
			emailErrorElem.setAttribute('data-email', '1')
			return
		} else {
			emailErrorElem.innerHTML = ''
			emailErrorElem.setAttribute('data-email', '0')
			return
		}

	}
}

// 비밀번호 조건 체크
form.userPw.addEventListener('keydown', function(e) {
	pwChk(e)
})

function pwChk(e) {
	if (e.target.value.length < 8) {
		pwErrorElem.innerHTML = '8자 이상 입력해주세요.'
		form.userPw.focus()
		pwErrorElem.setAttribute('data-pw', '1')
		return
	} else {
		pwErrorElem.innerHTML = ''
		pwErrorElem.setAttribute('data-pw', '0')
		return
	}

}

function pw2Chk() {
	const pwVal = form.userPw.value
	const pw2Val = form.userPwChk.value
	
	if (pwVal !== pw2Val) {
		pw2ErrorElem.innerHTML = '비밀번호가 일치하지 않습니다.'
		form.userPwChk.focus()
		return false
	} else {
		pw2ErrorElem.innerHTML = ''
		return true
	}
	
}

// 별명 중복 체크
form.nm.addEventListener('change', function() {
	nmAjax()
})

function nmAjax() {
	const joinNmVal = form.nm.value

	const param = {
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

	function nmProc(val) {
		const nmVal = form.nm.value

		if (nmVal.length < 2 || nmVal.length > 10) {
			nmErrorElem.innerHTML = '2자 이상 10자 이하로 입력해주세요.'
			form.nm.focus()
			nmErrorElem.setAttribute('data-email', '1')
			return
		} else if (val === 1) {
			nmErrorElem.innerHTML = '사용 중인 별명입니다.'
			form.nm.focus()
			nmErrorElem.setAttribute('data-email', '1')
			return
		} else {
			nmErrorElem.innerHTML = ''
			nmErrorElem.setAttribute('data-email', '0')
			return
		}

	}
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