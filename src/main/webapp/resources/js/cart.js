'use strict'


// 모두선택시 체크되기
var checkBoxes = document.getElementsByClassName('check_square')
document.querySelector(".all_item_select").addEventListener('click', function(event){
    this.style.color='#35c5f0'
    for(var i=0; i<checkBoxes.length ; i++){
        checkBoxes[i].style.color='#35c5f0'
    }
})