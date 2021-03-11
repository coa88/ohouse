//글쓰기에디터 생성	
let textAreaData;
ClassicEditor.create( document.querySelector( '.editor' ), {
	extraPlugins: [MyCustomUploadAdapterPlugin],
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
		window.editor = editor;
		textAreaData = editor
} )
.catch( error => {
	console.error( 'Oops, something went wrong!' );
	console.error( 'Please, report the following error on https://github.com/ckeditor/ckeditor5/issues with the build id and the error stack trace:' );
	console.warn( 'Build id: g4qhzp7szln0-71jm4jd3x1pp' );
	console.error( error );
})



//글쓰기
function writePost () {
	
	let writePostElem = document.querySelector('#writePost')
	let typElem = writePostElem.typ.value
	let secTypElem = writePostElem.secTyp.value
	let titleElem = writePostElem.title.value
	let ctntElem = textAreaData.getData()

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


class UploadAdapter {
    constructor(loader) {
        this.loader = loader;
    }
	upload() {
        return this.loader.file.then( file => new Promise(((resolve, reject) => {
            this._initRequest();
            this._initListeners( resolve, reject, file );
            this._sendRequest( file );
        })))
    }

    _initRequest() {
        const xhr = this.xhr = new XMLHttpRequest();
        xhr.open('POST', '/community/writeImgUpload', true);
        xhr.responseType = 'json';
    }

    _initListeners(resolve, reject, file) {
        const xhr = this.xhr;
        const loader = this.loader;
        const genericErrorText = '파일을 업로드 할 수 없습니다.'

        xhr.addEventListener('error', () => {reject(genericErrorText)})
        xhr.addEventListener('abort', () => reject())
        xhr.addEventListener('load', () => {
            const response = xhr.response
            if(!response || response.error) {
                return reject( response && response.error ? response.error.message : genericErrorText );
            }

            resolve({
                default: response.url //업로드된 파일 주소
            })
        })
    }

    _sendRequest(file) {
        const data = new FormData()
        data.append('upload',file)
		//this.xhr.send(data)
    }
}

function MyCustomUploadAdapterPlugin(editor) { // 이미지업로드 어댑터
    editor.plugins.get('FileRepository').createUploadAdapter = (loader) => {
        return new UploadAdapter(loader)
    }
}
