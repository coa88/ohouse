'use strict'
function moveLocation(iBoard) {		
	var url = `/community/detail?i_board=${iBoard}`
	location.href = url; //주소값 이동
}