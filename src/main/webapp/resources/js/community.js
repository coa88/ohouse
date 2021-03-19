'use strict'

function moveLocation(iBoard) {		
	let url = window.location.href
	let link = url + `/detail?iBoard=${iBoard}`
	location.href = link; //주소값 이동
}


// 커뮤니티 댓글
var cmtObj = {
	i_board: 0,
	createCmtTable: function() {
		var tableElem = document.createElement('table')
		tableElem.innerHTML =
			`
			<tr>
			<th>내용</th>
			<th>작성자</th>
			<th>작성일</th>
			<th>비고</th>
			</tr>
			`
		return tableElem
	},

	getCmtList: function() {
		if (this.i_board === 0) {
			return
		}
		fetch(`/board/cmtList?i_board=${this.i_board}`)
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
		let etc = ''
		if (item.is_mycmt === 1) {
			etc = `<button onclick="modCmt(${item.i_cmt}, '${item.ctnt}')">수정</button>
			<button onclick="delCmt(${item.i_cmt})">삭제</button>`
		}
		let tr = document.createElement('tr')
		tr.innerHTML = `
			<td>${item.ctnt}</td>
			<td>${item.user_nm}</td>
			<td>${item.r_dt}</td>
			<td>${etc}</td>`
		return tr
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
	var i_board = cmtFrmElem.iBoard.value
	cmtObj.i_board = i_board

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
			i_board: i_board,
			ctnt: ctntElem.value
		}

		console.log(param)
		fetch(`/community/insCmt`, {
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
				alert('댓글 작성 실패하였습니다')
				return
			case 1:
				ctntElem.value = ''
				cmtObj.getCmtList()
				return
		}
	}
}