'use strict'


document.getElementById('user_pw').onkeyup = function() {
    var msg = '',
        val = this.value;
    if( val.length >= 8 ){
        msg = GetAjaxPW(val);
    }else{
        msg = '8자 이상 입력해 주세요'
    };
    document.getElementById('pwc').textContent = msg;
};

var GetAjaxPW = function(val){ // 비밀번호 8자 이상 체크
    const data = document.getElementById('user_pw').value

    fetch('/edit_password', {
		method: 'post',
		headers: {
			'Content-Type': 'application/json'
		},
		body: JSON.stringify(data)
	})
		.then(res => res.json())
		.then(myJson => {
		})
    return ' 사용가능'
}



document.getElementById('chk_user_pw').onkeyup = function() {

    var msg = '',
        val = this.value;
    if( val ===  document.getElementById('user_pw').value ){
        msg = GetAjaxPWchk(val);
    }else{
        msg = '비밀번호를 확인해 주세요'
    };
    document.getElementById('chkpwc').textContent = msg;
};

var GetAjaxPWchk = function(val){ // 비밀번호 동일체크
    const data = document.getElementById('chk_user_pw').value

    fetch('/edit_password', {
		method: 'post',
		headers: {
			'Content-Type': 'application/json'
		},
		body: JSON.stringify(data)
	})
		.then(res => res.json())
		.then(myJson => {
			
		})
    return '비밀번호 일치'
}