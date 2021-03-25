//--------------- ckeditor 시작 -----------------//

let textAreaData;
ClassicEditor.create( document.querySelector( '.editor' ), {
	extraPlugins: [ MyCustomUploadAdapterPlugin ],
	toolbar: {
		viewportTopOffset : -100,
		items: [
			'imageUpload',
			'|',
			'bold',
			'italic',
			'underline',
			'|',
			'fontColor',
			'|',
			'link'
		]
	},
	language: 'ko',
	licenseKey: '',
	} )
	.then( editor => {
		window.editor = editor
		textAreaData = editor
		editor.model.document.on('change:data', onImageRemoveEvent)
	} )
	.catch( error => {
		console.error( error );
	})

//파일을 서버로 안전하게 보내고 서버의 응답 (예 : 저장된 파일의 URL)을 파일 로더로 다시 전달 또는 오류처리
class MyUploadAdapter { 
    constructor(loader) {	//디스크에서 파일을 읽고 업로드 어댑터를 사용하여 서버에 업로드
    	this.loader = loader;
    }
	upload() {
        return this.loader.file.then(ctntImg => {
				return new Promise((resolve, reject) => {
               		const data = new FormData()
            		data.append('ctntImg', ctntImg)

					fetch('/uploadImg', {
						method: 'POST',
						body: data
					})
					.then(res => res.json())
		
					.catch(e => {
						reject('err')
					})										
					.then(myJson => {
						console.log(myJson)
						resolve(myJson)
					})
            	}) 
			} 
		)
    }

 	abort() {}
}


function MyCustomUploadAdapterPlugin( editor ) {
    editor.plugins.get( 'FileRepository' ).createUploadAdapter = ( loader ) => {
        return new MyUploadAdapter( loader );
    }
}

var srcArr = [];
function onImageRemoveEvent(event) { // 이미지삭제 이벤트
	const differ = event.source.differ
    // if no difference
    if (differ.isEmpty) {
        return;
    }

    const changes = differ.getChanges({
        includeChangesInGraveyard: true
    });

    if (changes.length === 0) {
        return;
    }

    let hasNoImageRemoved = true

    // check any image remove or not
    for (let i = 0; i < changes.length; i++){
        const change = changes[i]
        // if image remove exists
        if (change && change.type === 'remove' && change.name === 'image') {
            hasNoImageRemoved = false
            break
        }
    }

    // if not image remove stop execution
    if (hasNoImageRemoved) {
        return;
    }

    // get removed nodes
    const removedNodes = changes.filter(change => (change.type === 'insert' && change.name === 'image'))

    // removed images src
    const removedImagesSrc = [];

    // removed image nodes
    const removedImageNodes = []

    removedNodes.forEach(node => {
        const removedNode = node.position.nodeAfter
        removedImageNodes.push(removedNode)
        removedImagesSrc.push(removedNode.getAttribute('src'))
    })

	//서버 이미지 삭제처리
	removedImagesSrc.forEach(src => {
		console.log(`src : ${src}`)
		srcArr.push(src)	
	})
} 


//--------------- ckeditor 끝 -----------------//

// 썸네일보여주기
var file = document.querySelector("#file");
function setThumbnail() {
    var fileList = file.files 
    // 읽기
    var reader = new FileReader()
    reader.readAsDataURL(fileList [0])
    //로드 한 후
    reader.onload = function  () {
        document.querySelector('#preview').src = reader.result
    }
}


// 커뮤니티 게시물 업로드
function writeUpload () {
	let fileElem = document.querySelector('#file')
	let writePostElem = document.querySelector('#writePost')
	let typVal = writePostElem.typ.value;
	let secTypVal = writePostElem.secTyp.value;
	let titleVal = writePostElem.title.value;
	let ctntVal = textAreaData.getData();

	
	var pathName
	if(typVal === '1' && secTypVal === '2') {
		pathName = 'photo'
	} else if (typVal === '1' && secTypVal === '3') {
		pathName = 'houseparty'
	} else if (typVal === '1' && secTypVal === '4') {
		pathName = 'tip'
	} else {
		pathName = 'none'
	}
	
	
	
	if(fileElem.files.length === 0) {
		alert('이미지를 선택해 주세요')
		return false
	}
	if(titleVal == '') {
		alert('제목을 입력해 주세요.');
		return false;
	} else if(ctntVal == '') {
		alert('내용을 작성해 주세요.');
		return false;
	}

	let formData = new FormData()
	formData.append('file', fileElem.files[0])
	formData.append('typ', typVal)
	formData.append('secTyp', secTypVal)
	formData.append('title', titleVal)
	formData.append('ctnt', ctntVal)
	
	
	fetch('/community/write', {
		method: 'POST',		
		body: formData
	}).then(function (res){
		console.log(res)
		return res.json()		
	}).then(function (data) {
		console.log(data)
		if(data.result === 0 || data.result === undefined) {
			alert('업로드 실패하였습니다.')			
		} else {
			location.href='/community/'+ pathName +'/detail?iBoard='+data.iBoard						
		} 
	}).catch(error => console.error('Error:', error))
}

// 커뮤니티게시물 수정

function updatePost () {
	let fileElem = document.querySelector('#file')
	let writePostElem = document.querySelector('#writePost')
	let iBoardVal = writePostElem.iBoard.value
	let titleVal = writePostElem.title.value
	let ctntVal = textAreaData.getData()
	let previousUrl = document.referrer
	console.log(fileElem)
	if(titleVal == '') {
		alert('제목을 입력해 주세요.');
		return false;
	} else if(ctntVal == '') {
		alert('내용을 작성해 주세요.');
		return false;
	}

	let formData = new FormData()
	if(fileElem.files[0] !== undefined) {
		formData.append('file', fileElem.files[0])		
	}
	formData.append('iBoard', iBoardVal)
	formData.append('title', titleVal)
	formData.append('ctnt', ctntVal)
	formData.append('src', srcArr)
	
	
	fetch('/community/modify', {
		method: 'POST',		
		body: formData
	}).then(function (res){
		console.log(res)
		return res.json()		
	}).then(function (data) {
		console.log(data.result)
		if(data.result === 0 || data.result === undefined) {
			alert('수정을 실패하였습니다.')			
		} else {
			location.href = previousUrl
		} 
	}).catch(error => console.error('Error:', error))
}

// 스토어 상품등록
function productRegister () {
	let fileElem = document.querySelector('#file')
	let writePostElem = document.querySelector('#writePost')
	let productTypVal = writePostElem.productTyp.value;
	let productSectypVal = writePostElem.productSectyp.value;
	let brandVal = writePostElem.brand.value;
	let productNmVal = writePostElem.productNm.value;
	let priceVal = writePostElem.price.value;
	let salesVal = writePostElem.sales.value;
	let productTitleVal = writePostElem.productTitle.value;
	let productCtntVal = textAreaData.getData();

	
	if(fileElem.files.length === 0) {
		alert('이미지를 선택해 주세요')
		return false
	}
	if(productTitleVal == '') {
		alert('제목을 입력해 주세요.');
		return false;
	} else if(productCtntVal == '') {
		alert('내용을 작성해 주세요.');
		return false;
	}

	let formData = new FormData()
	for(var i=0; i<fileElem.files.length; i++) {
		formData.append('file', fileElem.files[i])
	}
	formData.append('productTyp', productTypVal)		
	formData.append('productSectyp', productSectypVal)
	formData.append('brand', brandVal)
	formData.append('productNm', productNmVal)
	formData.append('price', priceVal)
	formData.append('sales', salesVal)
	formData.append('productTitle', productTitleVal)
	formData.append('productCtnt', productCtntVal)
	
	
	fetch('/store/register', {
		method: 'POST',		
		body: formData
	}).then(function (res){
		console.log(res)
		return res.json()		
	}).then(function (data) {
		console.log(data)
		if(data.result === 0 || data.result === undefined) {
			alert('업로드 실패하였습니다.')			
		} else {
			location.href='/store/register?iProduct='+ data.iProduct			
		} 
	}).catch(error => console.error('Error:', error))
}






