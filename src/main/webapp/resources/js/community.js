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
			<input id="recmtBtn" type="button" name="recmt_btn" value="답글 달기">
			${etc}
			<form id="recmtFrm">
				<input type="text" name="ctnt">				
				<input type="button" name="btn" value="등록">
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


