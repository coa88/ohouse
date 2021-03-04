'use strict'

let emailID = document.getElementById("join-form-email-emailType")
let sendEmail = emailID.options[emailID.selectedIndex].value
document.querySelector('.dd').value = '@'+sendEmail