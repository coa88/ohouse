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

	btnElem.addEventListener('click', function(e) {
		if (ctntElem.value === '') {
			e.preventDefault()
		} else {
			ajax()
		}
	})

	function ajax() {

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
			case 2:
				return location.href = '/user/login'
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
				let cmtAnsNm = ''
				let profileImg = ''

				if (data.isMycmt === 1) {
					delButton = `<button class="delBtn" onclick="delCmt(${data.iCmt})">삭제</button>`
				}

				if (data.cmtAnsNm !== null) {
					cmtAnsNm = `<span class="cmtAnsNm">@${data.cmtAnsNm}</span>`
				}

				if (data.profileImg !== null) {
					profileImg = `<img class="cmt_profile_img" src="/resources/img/user/${data.iUser}/${data.profileImg}" onerror="this.src='/resources/img/user/basic_profile.webp'" alt="프로필사진">`
				} else {
					profileImg = `<img class="cmt_profile_img" src="/resources/img/user/basic_profile.webp" alt="프로필사진">`
				}

				const div = document.createElement('div')
				let url = new URLSearchParams(location.search)
				let urlParams = url.get('iBoard')
				if (data.cmtAnsNm !== null) {
					div.innerHTML =
						`
					<div class="cmtAns_wrap">
						${profileImg}
						<span class="cmtNm">${data.nm}</span>
						${cmtAnsNm}
						<span class="cmtText">${data.ctnt}</span>
						<div class="btn_wrap">
							<button class="reCmtBtn" type="button" data-iCmt="${data.iCmt}" data-nm=${data.nm} onclick="reCmtBtnClk(${data.iCmt},${data.cmtGroup},${urlParams})">답글달기</button>
							${delButton}
						</div>
					</div>
					<div class="reCmtDiv"></div>
					
					`
					return div
				}else{
					div.innerHTML =
						`
						${profileImg}
						<span class="cmtNm">${data.nm}</span>
						${cmtAnsNm}
						<span class="cmtText">${data.ctnt}</span>
						<div class="btn_wrap">
							<button class="reCmtBtn" type="button" data-iCmt="${data.iCmt}" data-nm=${data.nm} onclick="reCmtBtnClk(${data.iCmt},${data.cmtGroup},${urlParams})">답글달기</button>
							${delButton}
						</div>
						<div class="reCmtDiv"></div>
					`
					return div
				}

			}


		})

}

// 대댓글 창열기
function reCmtBtnClk(icmt, cmtGroup, urliBoard) {

	let reCmtBtn = document.getElementsByClassName('reCmtBtn')

	fetch(`/community/userInfo`, {
		method: 'POST',
		headers: {
			'Content-Type': 'application/json'
		},
	}).then(function(res) {
		return res.json()
	}).then(function(login) {
		for (let i = 0; i < reCmtBtn.length; i++) {
			let dataiCmt = reCmtBtn[i].getAttribute('data-iCmt')
			let dataNm = reCmtBtn[i].getAttribute('data-nm')
			if (dataiCmt == icmt) {
				let profileChk = ''

				if (login.result.length === 0) {
					return location.href = '/user/login'
				}

				let iUser = login.result[0].iUser
				let profileImg = login.result[0].profileImg
				if (profileImg !== null) {
					profileChk = `<img class="cmt_profile_img" src="/resources/img/user/${iUser}/${profileImg}" onerror="this.src='/resources/img/user/basic_profile.webp'" alt="프로필사진">`
				} else {
					profileChk = `<img class="cmt_profile_img" src="/resources/img/user/basic_profile.webp" alt="프로필사진">`
				}

				let reCmtDiv = document.querySelectorAll('.reCmtDiv')
				reCmtDiv[i].innerHTML =
					`
				<form id="recmtFrm">
					<input type="hidden" name="cmtiBoard" value="${urliBoard}">
					<input type="hidden" name="cmtGroup" value="${cmtGroup}">
					<input type="hidden" name="cmtAnsNm" value="${dataNm}">
					${profileChk}
					<span class="dataNm">@${dataNm}</span>
					<input class="reCmtInsText" type="text" name="ctnt" placeholder="칭찬과 격려의 댓글은 작성자에게 큰 힘이 됩니다 :)">
					<input class="reCmtInsBtn" type="button" name="btn" value="등록">
				</form>
				`
			}
		}
		recmtInsert()
	})


}

// 대댓글 달기
function recmtInsert() {
	const reCmtFrmElem = document.querySelectorAll('#recmtFrm')
	for (let i = 0; i < reCmtFrmElem.length; i++) {
		reCmtFrmElem[i].addEventListener('click', function() {
			recmtEvent(reCmtFrmElem[i])
		}, { once: true })
	}
}

function recmtEvent(reCmtFrmElem) {
	if (reCmtFrmElem) {
		reCmtFrmElem.onsubmit = function(e) {
			e.preventDefault()
		}

		const rectntElem = reCmtFrmElem.ctnt
		const rebtnElem = reCmtFrmElem.btn
		const iBoard = reCmtFrmElem.cmtiBoard
		const cmtGroup = reCmtFrmElem.cmtGroup
		const cmtAnsNm = reCmtFrmElem.cmtAnsNm

		rebtnElem.addEventListener('click', function(e) {
			if (rectntElem.value === '') {
				e.preventDefault()
			} else {
				ajax()
			}
		})

		function ajax() {

			let param = {
				cmtGroup: cmtGroup.value,
				iBoard: iBoard.value,
				ctnt: rectntElem.value,
				cmtAnsNm: cmtAnsNm.value
			}

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
					getCmtList()
					return
				case 2:
					return location.href = '/user/login'
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