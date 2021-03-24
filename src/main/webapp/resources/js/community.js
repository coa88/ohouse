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

// 댓글 obj
var cmtObj = {
	iBoard: 0,
	createCmtTable: function() {
		var tableElem = document.createElement('table')
		tableElem.innerHTML =
			`<tr>
			<th>내용</th>
			<th>작성자</th>
			<th>작성일</th>
			<th>비고</th>
		</tr>`
		return tableElem
	},

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
		var table = this.createCmtTable()
		for (var i = 0; i < list.length; i++) {
			var recode = this.createRecode(list[i])
			table.append(recode)
		}
		cmtListElem.append(table)
	},
	createRecode: function(item) {
		var etc = ''
		if (item.isMycmt === 1) {
			etc = `<button onclick="delCmt(${item.iCmt})">삭제</button>`
		}
		var div = document.createElement('div')
		div.innerHTML =
			`
			<div>${item.ctnt}</div>
			<div>${item.nm}</div>
			<div>${etc}</div>
			<input type="button" name="recmt_btn" value="등록">	
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

		console.log(param)
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
	//모달창 닫기 버튼
	var modalCloseElem = document.querySelector('.modal_close')
	if (modalCloseElem) {
		modalCloseElem.addEventListener('click', function() {
			openCloseCmtModal('none')
		})
	}


	var iBoard = document.querySelector('#iBoard').dataset.id
	cmtObj.iBoard = iBoard
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

//대댓글 달기
