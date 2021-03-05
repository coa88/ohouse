'use strict'

// 이메일아이디 서버로 보내기
const emailAdr = document.querySelector("#join-form-email-emailType")

function emailClick() {
	emailSend()
}

function emailSend() {
	const emailAdrVal = emailAdr.options[emailAdr.selectedIndex].value
	document.querySelector('.emailAdr_send_input').value = '@' + emailAdrVal
}