//글쓰기에디터 생성	
let textAreaData;
ClassicEditor.create( document.querySelector( '.editor' ), {
	toolbar: {
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
	let boardImgElem = document.querySelector('#boardImg')
	
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


let modalContainerElem = document.querySelector('.modalContainer')
function boardImgModal() {
	
}

function openModal () {	
	modalContainerElem.classList.remove('hide')
}

function closeModal () {
	modalContainerElem.classList.add('hide')
}

