function check(){
    var check = checkUser()&&checkName()&&checkPwd1()&&checkPwd2()&&checkCode();
    return check;
}
function checkUser(){
    var user = document.getElementById("user").value;
    var luser = document.getElementById("luser");
    var pattern = /^[A-Za-z][A-Za-z1-9]{5,12}$/g;
    var flag = false;
    if(user =="" || user==null){
        luser.style.color="red";
        luser.innerHTML = "账号不能为空!";
        flag =false;
    }
    else if(pattern.test(user)){
        luser.style.color="green";
        luser.innerHTML = "正确!";
        flag =true;
    }
    else{
        luser.style.color="red";
        luser.innerHTML = "以字母开头,长度在6~13位！";
        flag =false;
    }
    return flag;
}
function checkName(){
    var name = document.getElementById("name").value;
    var lname = document.getElementById("lname");
    var pattern = /^[\u4e00-\u9fa5_a-zA-Z0-9]{2,6}$/g;
    var flag = false;
    if(name =="" || name==null){
        lname.style.color="red";
        lname.innerHTML = "用户名不能为空!";
        flag =false;
    }
    else if(pattern.test(name)){
        lname.style.color="green";
        lname.innerHTML = "正确!";
        flag =true;
    }
    else{
        lname.style.color="red";
        lname.innerHTML = "用户名长度为2~6位";
        flag =false;
    }
    return flag;
}
function checkPwd1(){
    var pwd1 = document.getElementById("pwd1").value;
    var lpwd1 = document.getElementById("lpwd1");
    var pattern = /^\w{5,19}$/g;
    var flag = false;
    if(pwd1 =="" || pwd1==null){
        lpwd1.style.color="red";
        lpwd1.innerHTML = "密码不能为空!";
        flag =false;
    }
    else if(pattern.test(pwd1)){
        lpwd1.style.color="green";
        lpwd1.innerHTML = "正确!";
        flag =true;
    }
    else{
        lpwd1.style.color="red";
        lpwd1.innerHTML = "密码长度在6~20位！";
        flag =false;
    }
    return flag;
}
function checkPwd2(){
    var pwd1 = document.getElementById("pwd1").value;
    var pwd2 = document.getElementById("pwd2").value;
    var lpwd2 = document.getElementById("lpwd2");
    var flag = false;
    if(pwd2 =="" || pwd2==null){
        lpwd2.style.color="red";
        lpwd2.innerHTML = "密码不能为空!";
        flag =false;
    }
    else if(pwd1 == pwd2){
        lpwd2.style.color="green";
        lpwd2.innerHTML = "正确!";
        flag =true;
    }
    else{
        lpwd2.style.color="red";
        lpwd2.innerHTML = "两次密码不匹配";
        flag =false;
    }
    return flag;
}
function checkMail(){
    var mail = document.getElementById("mail").value;
    var lmail = document.getElementById("lmail");
    var pattern =/^(\w)+(\.\w+)*@(\w)+((\.\w{2,3}){1,3})$/;
    var flag = false;
    if(mail =="" || mail==null){
        lmail.style.color="red";
        lmail.innerHTML = "邮箱不能为空!";
        flag =false;
    }
    else if(pattern.test(mail)){
        lmail.style.color="green";
        lmail.innerHTML = "正确!";
        flag =true;
    }
    else{
        lmail.style.color="red";
        lmail.innerHTML = "邮箱格式错误，请重新输入";
        flag =false;
    }
    return flag;
}
function checkCode(){
    var code = document.getElementById("code").value;
    var lcode = document.getElementById("lcode");
    var pattern = /^[A-Za-z1-9]{4}$/g;
    var flag = false;
    if(code =="" || code==null){
        lcode.style.color="red";
        lcode.innerHTML = "验证码不能为空!";
        flag =false;
    } else if(pattern.test(code)){
        lcode.innerHTML = "";
        flag =true;
    }else{
        lcode.style.color="red";
        lcode.innerHTML = "验证码格式错误!";
        flag =false;
    }
    return flag;
}
function flashCode(){
    var imgCode = document.getElementById("imgCode");
    imgCode.src = "/code?time = "+new Date().getTime();
}