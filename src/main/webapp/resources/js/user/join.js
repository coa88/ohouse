'use strict'

// 회원가입 - 이메일
const joinSelect = document.querySelector('#join-form-email-emailType')
const joinInputBox = document.querySelector('.emailAdr_send_input')
const buttonExpandIcon = document.querySelector('.email_input_expand')

function selectEmail() {
	if (joinSelect.options[joinSelect.selectedIndex].value == 'direct') {
		joinInputBox.type = 'text'
		joinInputBox.value = ''
		joinInputBox.focus()
		joinSelect.style.display = 'none'
		buttonExpandIcon.style.display = 'block'
	} else {
		joinInputBox.value = '@' + joinSelect.options[joinSelect.selectedIndex].value
		joinSelect.style.display = 'inline-block'
	}
}

buttonExpandIcon.addEventListener('click', () => { // 이메일주소 x아이콘 클릭시
	buttonExpandIcon.style.display = 'none'
	joinInputBox.type = 'hidden'
	joinSelect.style.display = 'inline-block'
	joinSelect.options[0].selected = 'selected'
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