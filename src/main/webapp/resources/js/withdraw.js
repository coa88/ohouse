'use strict'


function confirmAgree() { 
    var confirmbox = document.getElementById('confirm') 
    if(!confirmbox.checked){
        alertAgree()
        return false
    }

    var reason = document.getElementsByClassName('reason')
    var reasonChk = 0
    for (var i= 0; i<reason.length; i++){
        if(reason[i].checked){
            reasonChk++;
        }
    }

    if(reasonChk < 1){
        alertAgree()
        return false
    }
}


function alertAgree(){ // 조건에 부합하지 않았을때 그 위치로 스크롤 이동 
    var location = document.querySelector("#move").offsetTop;
     scrollTo({top:location, behavior:'smooth'})
     alert('필수 약관에 체크해 주세요 ')
    }


///글자수 제한, 글자수 표시
document.getElementById('text-area').addEventListener('keyup' , checkByte);
var countSpan = document.getElementById('count')
var message='';
var max_message_byte= 2000;
document.getElementById('max-count').innerHTML = max_message_byte.toString();

function count(message){
    var totalByte = 0;
    for (var index=0, length = message.length; index < length ; index++){ 
        var currentByte= message.charCodeAt(index);
        (currentByte >128)? totalByte += 2:totalByte++;
    }
    return totalByte;
}

function checkByte(event){
    const totalByte = count(event.target.value);

    if(totalByte <=max_message_byte){
        countSpan.innerText = totalByte.toString();
        message = event.target.value;

    }else {
        alert('2000자까지 입력 가능합니다.')
    }
    countSpan.innerText = count(message).toString();
    event.target.value = message;
}

