'use strict'

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

// 이메일주소 서버로 보내기 (ex @naver.com)
const emailAdr = document.querySelector("#join-form-email-emailType")

function emailClick() {
	emailSend()
}

function emailSend() {
	const emailAdrVal = emailAdr.options[emailAdr.selectedIndex].value
	document.querySelector('.emailAdr_send_input').value = '@' + emailAdrVal
}

