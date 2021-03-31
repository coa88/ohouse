let navWriteElem = document.querySelector('.nav-write-box')
let navWriteList = document.querySelector('.nav-write-list')
navWriteElem.addEventListener('click',() => { //글쓰기 클릭시 메뉴 on/off
    navWriteList.classList.toggle('active')
})

const url = window.location.pathname

function moveLocation(iBoard) {		
	let link = url + `/detail?iBoard=${iBoard}`
	location.href = link; //주소값 이동
}

function getCmBoardList(page) { // 커뮤니티 페이지선택
	location.href= url + `?page=${page}`				
}

function getPdBoardList(page) { // 스토어 페이지선택
	let params = new URLSearchParams(location.search);
	let category = params.get('category')
	if(category === null) {
		params.set('category', '1')
	}
	location.href= url + '?category=' + params.get('category') + `&page=${page}`				
}

function favorite(iBoard) {
	let fc = document.querySelector('#favoriteContainer');
	let favState = fc.getAttribute('is_favorite'); //1: 좋아요, 0: 안좋아요	
	favState = 1 - favState;
	console.log('favState : ')
	fetch('/community/favorite', {
		body: {
			'iBoard': iBoard,
			'state': favState
		}
	}).then(function (res) {
		return res.json
	}).then(function (data) {
		
	}).catch(error => console.error('Error:', error))
}
