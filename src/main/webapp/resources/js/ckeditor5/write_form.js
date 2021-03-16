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
        return this.loader.file
            .then( file => new Promise( ( resolve, reject ) => {
                this._initRequest();
                this._initListeners( resolve, reject, file );
                this._sendRequest( file );
            } ) );
    }

	abort() {
        if ( this.xhr ) {
            this.xhr.abort();
        }
    }

    _initRequest() {
        const xhr = this.xhr = new XMLHttpRequest();
        xhr.open( 'POST', '/imageUpload.do', true );
        xhr.responseType = 'json'
    } 

    _initListeners( resolve, reject, file ) {
        const xhr = this.xhr;
        const loader = this.loader;
        const genericErrorText = `Couldn't upload file: ${ file.name }.`

        xhr.addEventListener( 'error', () => reject( genericErrorText ))
        xhr.addEventListener( 'abort', () => reject() );
        xhr.addEventListener( 'load', () => {
            const response = xhr.response
            if (!response || response.error) {
                return reject( response && response.error ? response.error.message : genericErrorText)
            } else {
				let ctntElem = textAreaData.getData();
				var img = "<img src=\"" + response.fileUrl + "\">";
				textAreaData.setData(ctntElem + img);
			}

            resolve({				
                default: response.url
            })
        })

		if ( xhr.upload ) {
            xhr.upload.addEventListener( 'progress', evt => {
                if ( evt.lengthComputable ) {
                    loader.uploadTotal = evt.total;
                    loader.uploaded = evt.loaded;
                }
            })
   		}
	}
	_sendRequest( file ) {
	    const data = new FormData();
	    data.append( 'upload', file );
	    this.xhr.send( data );
		console.log(data)
    }
}


function MyCustomUploadAdapterPlugin( editor ) {
    editor.plugins.get( 'FileRepository' ).createUploadAdapter = ( loader ) => {
        return new MyUploadAdapter( loader );
    }
}

//--------------- ckeditor 끝 -----------------//

// 게시물 업로드
let fileElem = document.querySelector('#file')
function WriteUpload () {
	if(fileElem.files.length === 0) {
		alert('이미지를 선택해 주세요')
		return false
	}
	
	//ajax()
	writePost ()
	
	function ajax () {
		var formData = new FormData()
			formData.append('boardImg', fileElem.files[0])		
			
		fetch('/community/mainImgUpload',{
			method: 'post',
			body: formData
		})
	}
}

//글정보 서버로 전송
function writePost () {
	let writePostElem = document.querySelector('#writePost')
	let typElem = writePostElem.typ.value;
	let secTypElem = writePostElem.secTyp.value;
	let titleElem = writePostElem.title.value;
	let ctntElem = textAreaData.getData();
	
	if(titleElem == '') {
		alert('제목을 입력해 주세요.');
		return false;
	} else if(ctntElem == '') {
		alert('내용을 작성해 주세요.');
		return false;
	}
	/*
	let data = {
		typ: typElem,
		secTyp: secTypElem,
		title: titleElem,
		ctnt: ctntElem,
		
	}
	*/
	
	var formData = new FormData()
	formData.append('file', fileElem.files[0])
	formData.append('typ', typElem)
	formData.append('secTyp', secTypElem)
	formData.append('title', titleElem)
	formData.append('ctnt', ctntElem)
	
	
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
		})
		
	.catch(error => console.error('Error:', error))

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
