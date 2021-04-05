'use strict'

//게시물 삭제
function DeletePost(iBoard) {
	if (confirm('삭제 하시겠습니까?')) {
		fetch(`/community/delCmBoard/${iBoard}`, {
			method: 'DELETE'
		}).then(function(res) {
			return res.json()
		}).then(function(json) {
			console.log('result : ' + json.result)
			if (json.result === 1) {
				location.href = '/community'
			} else {
				alert("삭제 실패하였습니다.")
			}
		})
	}
}


// 커뮤니티 댓글
const cmtFrmElem = document.querySelector('#cmtFrm')
const ctntElem = cmtFrmElem.ctnt
const btnElem = cmtFrmElem.btn
const iBoardElem = cmtFrmElem.cmtiBoard
const cmtListElem = document.querySelector('#cmtList')

// 댓글달기
if (cmtFrmElem) {

	cmtFrmElem.onsubmit = function(e) {
		e.preventDefault()
	}

	btnElem.addEventListener('click', ajax)

	function ajax() {

		if (ctntElem.value === '') {
			return
		}

		let param = {
			iBoard: iBoardElem.value,
			ctnt: ctntElem.value
		}

		fetch('/community/insCmt', {
			method: 'POST',
			headers: {
				'Content-Type': 'application/json'
			},
			body: JSON.stringify(param)
		}).then(function(res) {
			return res.json()
		}).then(function(data) {
			proc(data)
		})
	}

	function proc(data) {
		switch (data.result) {
			case 0:
				alert('댓글 작성 실패하였습니다.')
				return
			case 1:
				ctntElem.value = ''
				getCmtList()
				return
		}
	}

}

// 댓글리스트
if (cmtListElem) {
	getCmtList()
}

function getCmtList() {
	if (iBoardElem.value === 0) {
		return
	}

	fetch(`/community/cmtList?iBoard=${iBoardElem.value}`)
		.then(function(res) {
			return res.json()
		})
		.then((list) => {
			cmtListElem.innerHTML = ''

			if (list.length == 0) {
				return
			}

			for (let i = 0; i < list.length; i++) {
				let recode = createRecode(list[i])
				cmtListElem.append(recode)
			}

			function createRecode(data) {
				let delButton = ''
				if (data.isMycmt === 1) {
					delButton = `<button onclick="delCmt(${data.iCmt})">삭제</button>`
				}
				const div = document.createElement('div')

				let url = new URLSearchParams(location.search)
				let urlParams = url.get('iBoard')
				div.innerHTML =
					`
					<span>${data.nm}</span>
					<span>${data.ctnt}</span>
					<button class="reCmtBtn" type="button" data-iCmt="${data.iCmt}" onclick="reCmtBtnClk(${data.iCmt},${data.cmtGroup},${urlParams})">답글달기</button>
					${delButton}
					<div class="reCmtDiv"></div>
					`
				return div
			}
			

		})

}

// 대댓글 창열기
function reCmtBtnClk(icmt, cmtGroup, urliBoard) {
	let reCmtBtn = document.getElementsByClassName('reCmtBtn')
	for (let i = 0; i < reCmtBtn.length; i++) {
		let dataiCmt = reCmtBtn[i].getAttribute('data-iCmt')
		if (dataiCmt == icmt) {
			let reCmtDiv = document.querySelectorAll('.reCmtDiv')
			reCmtDiv[i].innerHTML =
				`
				<form id="recmtFrm">
					<input type="hidden" name="cmtiBoard" value="${urliBoard}">
					<input type="hidden" name="cmtGroup" value="${cmtGroup}">
					<input type="text" name="ctnt">				
					<input type="button" name="btn" value="등록">
				</form>
				`
		}
	}
	recmtInsert()

}

// 대댓글 달기
const reCmtFrmElem = document.querySelectorAll('#recmtFrm')
const rectntElem = reCmtFrmElem.ctnt
const rebtnElem = reCmtFrmElem.btn
const reiBoardElem = reCmtFrmElem.cmtiBoard
const recmtGroupElem = reCmtFrmElem.cmtGroup

function recmtInsert() {
	for (let i = 0; i < reCmtFrmElem.length; i++) {
		reCmtFrmElem[i].addEventListener('click', function() {
			recmtEvent(reCmtFrmElem, i)
		}, false)
	}
}

function recmtEvent(reCmtFrmElem, i) {
	if (reCmtFrmElem) {
		reCmtFrmElem.onsubmit = function(e) {
			e.preventDefault()
		}

		let rectntElem = reCmtFrmElem[i]
		let rebtnElem = reCmtFrmElem[i]
		let iBoard = reiBoardElem[i]
		let cmtGroup = recmtGroupElem[i]

		rectntElem.onkeyup = function(e) {
			if (e.keyCode === 13) {
				ajax()
			}
		}

		rebtnElem.addEventListener('click', ajax)

		function ajax() {
			if (rectntElem.value === '') {
				return
			}

			let param = {
				cmtGroup: cmtGroup.value,
				iBoard: iBoard.value,
				ctnt: rectntElem.value
			}

			console.log(param)
			fetch('/community/insReCmt', {
				method: 'POST',
				headers: {
					'Content-Type': 'application/json'
				},
				body: JSON.stringify(param)
			}).then(function(res) {
				return res.json()
			}).then(function(data) {
				proc(data)
			})
		}

		function proc(data) {
			switch (data.result) {
				case 0:
					alert('댓글 작성 실패하였습니다.')
					return
				case 1:
					rectntElem.value = ''
					alert('댓글 성공')
					return
			}
		}
	}
}

// 댓글 삭제
function delCmt(iCmt) {
	if (!confirm('댓글을 삭제하시겠습니까? 삭제한 댓글은 되돌릴 수 없습니다.')) {
		return
	}

	fetch(`/community/delCmt?iCmt=${iCmt}`, {
		method: 'delete'
	}).then(function(res) {
		return res.json()
	}).then(function(myJson) {
		switch (myJson.result) {
			case 1:
				getCmtList()
				return
			case 0:
				alert('댓글 삭제 실패')
				return
		}
	})
}

/*
// 댓글 obj
var cmtObj = {
	iBoard: 0,
	cmtGroup: 0,
	getCmtList: function() {
		if (this.iBoard === 0) {
			return
		}
		fetch(`/community/cmtList?iBoard=${this.iBoard}`)
			.then(function(res) {
				return res.json()
			})
			.then((list) => {
				cmtListElem.innerHTML = ''
				this.proc(list)
			})
	},
	proc: function(list) {
		if (list.length == 0) {
			return
		}
		for (var i = 0; i < list.length; i++) {
			var recode = this.createRecode(list[i])
			cmtListElem.append(recode)
		}
		recmtInsert()
	},
	createRecode: function(item) {
		var etc = ''
		if (item.isMycmt === 1) {
			etc = `<button onclick="delCmt(${item.iCmt})">삭제</button>`
		}
		var div = document.createElement('div')
		div.innerHTML =
			`
			<span>${item.nm}</span>
			<span>${item.ctnt}</span>
			<button id="recmtBtn" onclick="recmtToggleFrm(${item.cmtGroup})">답글 달기</button>
			${etc}
			<span id="cmtGroup" data-id="${item.cmtGroup}"></span>
			<form class="recmtFrm cmtHide">
				<input class="ph_color" type="text" name="re_ctnt" value="">
				<input type="button" name="re_btn" value="등록">
			</form>
			`
		return div
	},
}
//댓글 달기
var cmtFrmElem = document.querySelector('#cmtFrm')
if (cmtFrmElem) {
	cmtFrmElem.onsubmit = function(e) {
		e.preventDefault()
	}
	var ctntElem = cmtFrmElem.ctnt
	var btnElem = cmtFrmElem.btn
	var iBoard = document.querySelector('#iBoard').dataset.id
	cmtObj.iBoard = iBoard
	ctntElem.onkeyup = function(e) {
		if (e.keyCode === 13) {
			ajax()
		}
	}
	btnElem.addEventListener('click', ajax)
	function ajax() {
		if (ctntElem.value === '') {
			return
		}
		var param = {
			iBoard: iBoard,
			ctnt: ctntElem.value
		}
		fetch('/community/insCmt', {
			method: 'POST',
			headers: {
				'Content-Type': 'application/json'
			},
			body: JSON.stringify(param)
		}).then(function(res) {
			return res.json()
		}).then(function(data) {
			proc(data)
		})
	}
	function proc(data) {
		switch (data.result) {
			case 0:
				alert('댓글 작성 실패하였습니다.')
				return
			case 1:
				ctntElem.value = ''
				cmtObj.getCmtList()
				return
		}
	}
}
//댓글 리스트
var cmtListElem = document.querySelector('#cmtList')
if (cmtListElem) {
	cmtObj.getCmtList()
}
//댓글 삭제
function delCmt(iCmt) {
	if (!confirm('댓글을 삭제하시겠습니까? 삭제한 댓글은 되돌릴 수 없습니다.')) {
		return
	}
	fetch(`/community/delCmt?iCmt=${iCmt}`, {
		method: 'delete'
	}).then(function(res) {
		return res.json()
	}).then(function(myJson) {
		switch (myJson.result) {
			case 1:
				cmtObj.getCmtList()
				return
			case 0:
				alert('댓글 삭제 실패')
				return
		}
	})
}
//대댓글 입력창
function recmtToggleFrm(cmtGroup) {
	let i = cmtGroup - 1
	let recmtFrmAll = document.querySelectorAll('.recmtFrm')
	recmtFrmAll[i].classList.toggle('cmtHide')
}
//대댓글 달기
function recmtInsert() {
	let recmtFrmElem = document.querySelectorAll('.recmtFrm')
	for (let i = 0; i < recmtFrmElem.length; i++) {
		recmtFrmElem[i].addEventListener('click', function() {
			recmtEvent(recmtFrmElem, i)
		}, false)
	}
}
function recmtEvent(recmtFrmElem, i) {
	if (recmtFrmElem) {
		recmtFrmElem.onsubmit = function(e) {
			e.preventDefault()
		}
		let rectntElem = recmtFrmElem[i].re_ctnt
		let rebtnElem = recmtFrmElem[i].re_btn
		let iBoard = document.querySelector('#iBoard').dataset.id
		let cmtGroup = document.querySelector('#cmtGroup').dataset.id
		cmtObj.iBoard = iBoard
		cmtObj.cmtGroup = cmtGroup
		rectntElem.onkeyup = function(e) {
			if (e.keyCode === 13) {
				ajax()
			}
		}
		rebtnElem.addEventListener('click', ajax)
		function ajax() {
			if (rectntElem.value === '') {
				return
			}
			let param = {
				cmtGroup: cmtGroup,
				iBoard: iBoard,
				ctnt: rectntElem.value
			}
			console.log(param)
			fetch('/community/insReCmt', {
				method: 'POST',
				headers: {
					'Content-Type': 'application/json'
				},
				body: JSON.stringify(param)
			}).then(function(res) {
				return res.json()
			}).then(function(data) {
				proc(data)
			})
		}
		function proc(data) {
			switch (data.result) {
				case 0:
					alert('댓글 작성 실패하였습니다.')
					return
				case 1:
					rectntElem.value = ''
					cmtObj.getCmtList()
					return
			}
		}
	}
}
*/