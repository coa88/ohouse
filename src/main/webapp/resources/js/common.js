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
	let fc = document.querySelector('#favoriteContainer')
	let favState = fc.getAttribute('favState') //1: 좋아요, 0:안 좋아요	
	favState = 1 - favState
	
	fetch(`/community/favorite?iBoard=${iBoard}&favState=${favState}`, {
		method: 'GET',
	}).then(function (res) {
		return res.json()
	}).then(function (data) {
		let resData = data.result
		if( resData === 2) {
			location.href = '/user/login'
		}
		if(data.result == 1) {
			let iconType = favState == 1 ? 'blue' : 'white'
			fc.innerHTML = `<svg class="detail_util_icon_${iconType}" width="24" height="24" viewBox="0 0 24 24" preserveAspectRatio="xMidYMid meet"><path d="M23.22 7.95c.4 4.94-2.92 9.71-10.92 13.85a.47.47 0 0 1-.42 0C3.88 17.66.56 12.9.96 7.93 1.54 2.48 8.28.3 12.1 4.7c3.8-4.4 10.55-2.22 11.13 3.25z"></path></svg>`
			fc.setAttribute('favState', favState)
		}
	}).catch(error => console.error('Error:', error))
}

function scrap(iBoard) {
	let sc = document.querySelector('#scrapContainer')
	let scrapState = sc.getAttribute('scrapState') //1: 스크랩, 0:안 스크랩	
	scrapState = 1 - scrapState
	
	fetch(`/community/scrap?iBoard=${iBoard}&scrapState=${scrapState}`, {
		method: 'GET',
	}).then(function (res) {
		return res.json()
	}).then(function (data) {
		let resData = data.result
		if( resData === 2) {
			location.href = '/user/login'
		}
		if(data.result == 1) {
			let iconType = scrapState == 1 ? 'blue' : 'white'
			sc.innerHTML = `<svg class="detail_util_icon_${iconType}" width="24" height="24" stroke-width="1" viewBox="0 0 24 24" preserveAspectRatio="xMidYMid meet"><path d="M11.53 18.54l-8.06 4.31A1 1 0 0 1 2 21.97V3.5A1.5 1.5 0 0 1 3.5 2h17A1.5 1.5 0 0 1 22 3.5v18.47a1 1 0 0 1-1.47.88l-8.06-4.31a1 1 0 0 0-.94 0z"></path></svg>`
			sc.setAttribute('scrapState', scrapState)
		}
	}).catch(error => console.error('Error:', error))
}

function scrapList(iBoard) {
	let scrapDiv = document.querySelector('#scrap_div')
	let scrapState = scrapDiv.getAttribute('scrapState') //1: 스크랩, 0:안 스크랩	
	scrapState = 1 - scrapState
	
	fetch(`/community/scrap?iBoard=${iBoard}&scrapState=${scrapState}`, {
		method: 'GET',
	}).then(function (res) {
		return res.json()
	}).then(function (data) {
		let resData = data.result
		if( resData === 2) {
			location.href = '/user/login'
		}
		if(data.result == 1) {
			let iconType = scrapState == 1 ? 'blue' : 'white'
			scrapDiv.innerHTML = `<svg class="detail_util_icon_${iconType}" width="24" height="24" stroke-width="1" viewBox="0 0 24 24" preserveAspectRatio="xMidYMid meet"><path d="M11.53 18.54l-8.06 4.31A1 1 0 0 1 2 21.97V3.5A1.5 1.5 0 0 1 3.5 2h17A1.5 1.5 0 0 1 22 3.5v18.47a1 1 0 0 1-1.47.88l-8.06-4.31a1 1 0 0 0-.94 0z"></path></svg>`
			scrapDiv.setAttribute('scrapState', scrapState)
		}
	}).catch(error => console.error('Error:', error))
}

	

