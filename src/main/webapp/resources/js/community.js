'use strict'
function moveLocation(iBoard) {		
	let url = `/community/detail?iBoard=${iBoard}`
	location.href = url; //주소값 이동
}