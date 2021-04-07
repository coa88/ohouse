
// ------------------------------ splide 배너 설정 ------------------------------
document.addEventListener( 'DOMContentLoaded', function () {
    new Splide( '.category-banners .splide',{
        type   : 'loop',
        arrows     : true,
        cover      : true,
    }).mount()
    
} )



document.addEventListener( 'DOMContentLoaded', function () {
	var secondarySlider = new Splide( '#banner-thumbnail', {
		fixedWidth  : 176,
		height      : 41,
		isNavigation: true,
        pagination : false,
        classes: {
            arrows: 'splide__arrows',
            arrow : 'splide__arrow',
            prev  : 'splide__arrow--prev',
            next  : 'splide__arrow--next',
        },
		breakpoints : {
			'600': {
				fixedWidth: 66,
				height    : 40,
			}
		},
	} ).mount();
	
    var storeBanner = document.getElementsByClassName('store-banners')
	var primarySlider = new Splide( '#banner-img', {
		type       : 'loop',
		heightRatio: storeBanner,
		pagination : true,
		arrows     : false,
		cover      : true,
	}) // do not call mount() here.
	
	primarySlider.sync( secondarySlider ).mount()
} )

// ------------------------------ splide 배너 설정 끝 ------------------------------


//마우스 오버시 상품이미지 변경
let bigImg = document.querySelector('.pro_big_img')
let minImg = document.querySelectorAll('.pro_min_img')
for(let i=0; i<minImg.length; i++) {
	minImg[i].addEventListener("click", changepic)
}

function changepic() { // 상품이미지 바꾸기
	let minImgAttribute = this.getAttribute("src")
	bigImg.setAttribute("src", minImgAttribute)
}



//게시물 삭제
function DeleteProduct(iProduct) {
	if (confirm('삭제 하시겠습니까?')) {
		fetch(`/store/delPdBoard/${iProduct}`, {
			method: 'DELETE'
		}).then(function(res) {
			return res.json()
		}).then(function(json) {
			console.log('result : ' + json.result)
			if (json.result === 1) {
				location.href = '/store/category'
			} else {
				alert("삭제 실패하였습니다.")
			}
		})
	}
}

//장바구니 담기
function addCart(iProduct) {
	console.log('dddd : ' + iProduct)
	
	let formData = new FormData()
	formData.append('iProduct', iProduct)
	
	fetch('/store/cart/', {
		method: 'POST',
		body: formData
	}).then(function (res) {
		return res.json()
	}).then(function (data) {
		console.log(data)
		if(data.result === 0) {
			alert('에러가 발생하였습니다.')
		}
		
		if(data.result === 1) {
			if(confirm('장바구니에 상품을 담았습니다. 장바구니페이지로 이동하시겠습니까?')) {
				location.href = '/'
			}
		}
	})
}
