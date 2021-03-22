'use strict'

//댓글 삭제
function DeletePost(iBoard) {
	if(confirm('댓글을 삭제하시겠습니까? 삭제한 댓글은 되돌릴 수 없습니다.')) {
		fetch(`/community/delCmt/${iBoard}`, {
			method: 'DELETE'
		}).then(function (res) {
			return res.json()
		}).then(function (json) {
			console.log('result : '+json.result)
			if(json.result === 1) {
				location.href = '/community'
			} else {
				alert("삭제 실패하였습니다.")
			}
		})
	}
}