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
} )
.catch( error => {
	console.error( 'Oops, something went wrong!' );
	console.error( 'Please, report the following error on https://github.com/ckeditor/ckeditor5/issues with the build id and the error stack trace:' );
	console.warn( 'Build id: g4qhzp7szln0-71jm4jd3x1pp' );
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

					fetch('/community/uploadImg', {
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

//--------------- ckeditor 끝 -----------------//


// 게시물 업로드
function WriteUpload () {
	let fileElem = document.querySelector('#file')
	let writePostElem = document.querySelector('#writePost')
	let typVal = writePostElem.typ.value;
	let secTypVal = writePostElem.secTyp.value;
	let titleVal = writePostElem.title.value;
	let ctntVal = textAreaData.getData();
	
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

	var formData = new FormData()
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
			return false;
		} else {
			location.href='/'
			return data;			
		} 
	}).catch(error => console.error('Error:', error))
}

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
