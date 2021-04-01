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
	let favState = fc.getAttribute('favState'); //1: 좋아요, 0:안 좋아요	
	favState = 1 - favState;
	
	console.log('iBoard : ' + iBoard)
	console.log('favState : ' + favState)
	fetch(`/community/favorite?iBoard=${iBoard}&favState=${favState}`, {
		method: 'GET',
	}).then(function (res) {
		return res.json()
	}).then(function (data) {
		let resData = data.result
		if( resData === 2) {
			alert('로그인 페이지로 이동합니다.')
			location.href = '/user/login'
		}
		
	}).catch(error => console.error('Error:', error))
}
