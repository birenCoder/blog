function check(){
    var check = check_Name()&&check_Pwd();
    return check;
}
function check_Name(){
    var uname = document.getElementById("uname");
    var lableName = document.getElementById("lname");
    var nameValue = uname.value;
    var pattern = /^[a-zA-Z_]\w{5,19}$/g;
    var flag = false;
    if(nameValue =="" || nameValue==null){
        lableName.style.color="red";
        lableName.innerHTML = "用户名不能为空!";
        flag =false;
    }
    else if(pattern.test(nameValue)){
        lableName.style.color="green";
        lableName.innerHTML = "正确!";
        flag =true;
    }
    else{
        lableName.style.color="red";
        lableName.innerHTML = "数字不能开头,长度在6-20位之间！";
        flag =false;
    }
    return flag;
}

function check_Pwd(){
    var pwd = document.getElementById("pwd");
    var lablePwd = document.getElementById("lpwd");
    var pwdValue = pwd.value;
    var pattern = /^\w{6,19}$/g;
    var flag = false;
    if(pwdValue =="" || pwdValue==null){
        lablePwd.style.color="red";
        lablePwd.innerHTML = "密码不能为空!";
        flag =false;
    }
    else if(pattern.test(pwdValue)){
        lablePwd.style.color="green";
        lablePwd.innerHTML = "正确!";
        flag =true;
    }
    else{
        lablePwd.style.color="red";
        lablePwd.innerHTML = "密码长度6-19位！";
        flag =false;
    }
    return flag;
}
