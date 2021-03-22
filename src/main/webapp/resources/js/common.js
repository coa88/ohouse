let navWriteElem = document.querySelector('.nav-write-box')
let navWriteList = document.querySelector('.nav-write-list')
navWriteElem.addEventListener('click',() => { //글쓰기 클릭시 메뉴 on/off
    navWriteList.classList.toggle('active')
})

function moveLocation(iBoard) {		
	let url = window.location.href
	let link = url + `/detail?iBoard=${iBoard}`
	location.href = link; //주소값 이동
}