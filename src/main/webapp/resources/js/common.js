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


function getBoardList(page) { // 페이징 페이지선택
	let params = new URLSearchParams(location.search);
	let category = params.get('category')
	
	if(category === null) {
		params.set('category', '1')
		let url = params.toString();
	}
	
	let formData = new FormData()
	formData.append('page', page)
	
	fetch('/store/category', {
		method: 'POST',		
		body: formData
	}).then(function (res){
		console.log(res)
		return res.json()		
	}).then(function (data) {
		location.href='/store/category?category='+params.get('category')+`&page=${page}`				
	}).catch(error => console.error('Error:', error))
}