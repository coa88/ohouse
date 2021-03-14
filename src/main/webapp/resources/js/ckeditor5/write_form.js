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
			alert(response);
            if (!response || response.error) {
				console.log(xhr)
				console.log(loader)
				console.log(genericErrorText)
                return reject( response && response.error ? response.error.message : genericErrorText)
            } else {
				let writePostElem = document.querySelector('#writePost');
				let ctntElem = textAreaData.getData();
				alert(ctntElem);
				var img = "<img src=\"" + response.fileUrl + "\">";
				alert(img);
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

//글쓰기
function writePost () {
	
	let writePostElem = document.querySelector('#writePost')
	let typElem = writePostElem.typ.value;
	let secTypElem = writePostElem.secTyp.value;
	let titleElem = writePostElem.title.value;
	let ctntElem = textAreaData.getData();

	let data = {
		typ: typElem,
		secTyp: secTypElem,
		title: titleElem,
		ctnt: ctntElem,
		
	}
	
	fetch('/community/write', {
		method: 'POST',
		headers: {
            'Content-Type': 'application/json',
        },
		body: JSON.stringify(data),
	}).then(function (res){
			return res.json()
		}).then(function (data) {
			console.log(data.result)
		}) 
	.catch(error => console.error('Error:', error));

}

let boardImgElem = document.querySelector('#boardImgInput')
function boardImgUpload () {
	if(boardImgElem.files.length === 0) {
		alert('이미지를 선택해 주세요')
		return
	}
	
	ajax()
	closeModal () 
	
	function ajax () {
		var formData = new FormData()
			formData.append('boardImg', boardImgElem.files[0])		
			
		fetch('/community/imgUpload',{
			method: 'post',
			body: formData
		})
	}
}

let modalContainerElem = document.querySelector('.modalContainer')

function openModal () {	
	modalContainerElem.classList.remove('hide')
}

function closeModal () {
	modalContainerElem.classList.add('hide')
}



