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

function mypageLocation(iBoard) {		
	let link = '/community/photo/detail?iBoard=' + iBoard
	location.href = link //주소값 이동
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
	location.href = url + '?category=' + params.get('category') + `&page=${page}`				
}

function favorite(iBoard) { // 디테일페이지에서 좋아요버튼 눌렀을때
	let fc = document.querySelector('#favoriteContainer')
	let favoriteChk = fc.getAttribute('data-favoriteChk') //1: 좋아요, 0:안 좋아요	
	favoriteChk = 1 - favoriteChk
	
	fetch(`/community/favorite?iBoard=${iBoard}&favoriteChk=${favoriteChk}`, {
		method: 'GET',
	}).then(function (res) {
		return res.json()
	}).then(function (data) {
		let resData = data.result
		if( resData === 2) {
			location.href = '/user/login'
		}
		if(resData === 1) {
			let iconType = favoriteChk == 1 ? 'blue' : 'white'
			fc.innerHTML = `<svg class="detail_util_icon_${iconType}" width="24" height="24" viewBox="0 0 24 24" preserveAspectRatio="xMidYMid meet"><path d="M23.22 7.95c.4 4.94-2.92 9.71-10.92 13.85a.47.47 0 0 1-.42 0C3.88 17.66.56 12.9.96 7.93 1.54 2.48 8.28.3 12.1 4.7c3.8-4.4 10.55-2.22 11.13 3.25z"></path></svg>`
			fc.setAttribute('data-favoriteChk', favoriteChk)
		}
	}).catch(error => console.error('Error:', error))
}

function scrap(iBoard) { // 디테일페이지에서 스크랩버튼 눌렀을때
	let sc = document.querySelector('#scrapContainer')
	let scrapChk = sc.getAttribute('data-scrapChk') //1: 스크랩, 0:안 스크랩	
	scrapChk = 1 - scrapChk
	fetch(`/community/scrap?iBoard=${iBoard}&scrapChk=${scrapChk}`, {
		method: 'GET',
	}).then(function (res) {
		return res.json()
	}).then(function (data) {
		let resData = data.result
		if(resData === 2) {
			location.href = '/user/login'
		}
		if(resData === 1) {
			let iconType = scrapChk == 1 ? 'blue' : 'white'
			sc.innerHTML = `<svg class="detail_util_icon_${iconType}" width="24" height="24" stroke-width="1" viewBox="0 0 24 24" preserveAspectRatio="xMidYMid meet"><path d="M11.53 18.54l-8.06 4.31A1 1 0 0 1 2 21.97V3.5A1.5 1.5 0 0 1 3.5 2h17A1.5 1.5 0 0 1 22 3.5v18.47a1 1 0 0 1-1.47.88l-8.06-4.31a1 1 0 0 0-.94 0z"></path></svg>`
			sc.setAttribute('data-scrapChk', scrapChk)
		}
	}).catch(error => console.error('Error:', error))
}

function scrapList(iBoard, scrapChk) { // 리스트페이지에서 스크랩버튼 눌렀을때
	let scrapDiv = document.getElementsByClassName('scrap_div')
	let scrapIcon = document.getElementsByClassName("scrap_icon");
	
	fetch(`/community/scrap?iBoard=${iBoard}&scrapChk=${scrapChk}`, {
		method: 'GET',
	}).then(function (res) {
		return res.json()
	}).then(function (data) {
		let resData = data.result
		if(resData === 2) {
			location.href = '/user/login'
		}
		if(resData === 1) {
			for(let i=0; i<scrapDiv.length; i++) {
				let dataIBoard = scrapDiv[i].getAttribute('data-iBoard')
				if(dataIBoard == iBoard) {
					scrapIcon[i].classList.toggle('active_blue')					
				}
			}
		}
	}).catch(error => console.error('Error:', error))
}

function pdScrapList(iProduct, scrapChk) { // 리스트페이지에서 스크랩버튼 눌렀을때
	let scrapDiv = document.getElementsByClassName('scrap_div')
	let scrapIcon = document.getElementsByClassName('fas fa-bookmark fa-lg');
	console.log('dddd : ' + scrapChk)
	fetch(`/store/scrap?iProduct=${iProduct}&scrapChk=${scrapChk}`, {
		method: 'GET',
	}).then(function (res) {
		return res.json()
	}).then(function (data) {
		let resData = data.result
		if(resData === 2) {
			location.href = '/user/login'
		}
		if(resData === 1) {
			for(let i=0; i<scrapDiv.length; i++) {
				let dataIProduct = scrapDiv[i].getAttribute('data-iProduct')
				if(dataIProduct == iProduct) {
					console.log('ddd')
					scrapIcon[i].classList.toggle('blue')					
				}
			}
		}
	}).catch(error => console.error('Error:', error))
}

function utilIconChk(iBoard, favoriteChk, scrapChk) {
	let utilSpanType // span이 좋아요인지 스크랩인지 custom-Attribute를 가져오기위한 변수
	let utilIconSpan // span이 좋아요인지 스크랩인지 배열인덱스를 위한 변수

	if(scrapChk == 2) { //좋아요버튼 눌렀을때
		utilSpanType = document.querySelector('.utilFIcon_span')
		utilIconSpan = document.getElementsByClassName('utilFIcon_span')
	}
	if(favoriteChk == 2) { //스크랩버튼 눌렀을때
		utilSpanType = document.querySelector('.utilSIcon_span')
		utilIconSpan = document.getElementsByClassName('utilSIcon_span')
	}
	
	let iconAttribute = utilSpanType.getAttribute('data-iconAttribute')
	let iconType
	let paramType
	let chkType
	
	if(iconAttribute === "favorite") {
		iconType = document.getElementsByClassName("fIcon")
		paramType = "favoriteChk"
		chkType = favoriteChk
	}
	
	if(iconAttribute === "scrap") {
		iconType = document.getElementsByClassName("sIcon")
		paramType = "scrapChk"
		chkType = scrapChk
	}
	
	fetch(`/community/${iconAttribute}?iBoard=${iBoard}&${paramType}=${chkType}`, {
		method: 'GET',
	}).then(function (res) {
		return res.json()
	}).then(function (data) {
		let resData = data.result
		if(resData === 2) {
			location.href = '/user/login'
		}
		if(resData === 1) {
			for(let i=0; i<utilIconSpan.length; i++) {
				let dataIBoard = utilIconSpan[i].getAttribute('data-iBoard')
				if(dataIBoard == iBoard) {
					//TODO: 클릭했을때 숫자도 변경되게 하기
					iconType[i].classList.toggle('blue')					
				}
			}
		}
	}).catch(error => console.error('Error:', error))
}

