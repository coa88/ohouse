'use strict'

// 회원가입 체크
const email = document.querySelector('.join-form-email-input')
const emailVal = document.querySelector('.join-form-email-input').value
const regExp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i

email.addEventListener('blur', () => {
	if (emailVal.match(regExp) == null) {
		document.querySelector('.emailChk').style.display = 'none'
		document.querySelector('.join-form-label').style.color = '#f77'
	} else {
		document.querySelector('.emailChk').style.display = 'block'
		document.querySelector('.join-form-label').style.color = '#424242'
	}

	if (emailVal == null) {
		document.querySelector('.emailRequired').style.display = 'block'
	} else {
		document.querySelector('.emailRequired').style.display = 'none'
	}
})




// 약관동의 체크박스 이벤트
const chkAll = document.querySelector('.check_all')
const chkNormal = document.querySelectorAll('.normal')

const agreements = {
	firstChk: false,
	secondChk: false,
	thirdChk: false,
	fourChk: false,
}

chkNormal.forEach((item) => item.addEventListener('input', toggleCheckbox))

function toggleCheckbox(e) {
	const { checked, id } = e.target
	agreements[id] = checked
	this.parentNode.classList.toggle('active')
	checkAllStatus()
	toggleSubmitButton()
}

function checkAllStatus() {
	const { firstChk, secondChk, thirdChk, fourChk } = agreements
	if (firstChk && secondChk && thirdChk && fourChk) {
		chkAll.checked = true
	} else {
		chkAll.checked = false
	}
}

chkAll.addEventListener('click', (e) => { // 전체동의이벤트
	const { checked } = e.target
	if (checked) {
		chkNormal.forEach((item) => {
			item.checked = true
			agreements[item.id] = true
			item.parentNode.classList.add('active')
		})
	} else {
		chkNormal.forEach((item) => {
			item.checked = false
			agreements[item.id] = false
			item.parentNode.classList.remove('active')
		})
	}
})