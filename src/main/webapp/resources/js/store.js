
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