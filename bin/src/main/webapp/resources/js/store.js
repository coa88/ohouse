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