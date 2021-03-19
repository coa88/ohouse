'use strict'
function moveLocation(iBoard) {		
	let url = window.location.href
	let link = url + `/detail?iBoard=${iBoard}`
	location.href = link; //주소값 이동
}