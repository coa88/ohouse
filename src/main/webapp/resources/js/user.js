'use strict'

// 이메일아이디 서버로 보내기
let frontID = document.querySelector(".join-form-email-input")
let backID = document.querySelector("#join-form-email-emailType")

function emailClick() {
	emailSend()
}

function emailSend() {
	let resultID = backID.options[backID.selectedIndex].value
	document.querySelector('.backEmail_send_input').value = '@' + resultID
}