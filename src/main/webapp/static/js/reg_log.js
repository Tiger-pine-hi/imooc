
/*--------------------------- 共用 -- 获取验证码 ------------------------------*/
function genTimestamp() {
    var time = new Date();
    return time.getTime();
}

function changeImage_teacher() {
    $("#t_verifyCodeImage").attr('src','/getVerifyCode?timestamp=' + genTimestamp());
}

function changeImage_student() {
    $("#s_verifyCodeImage").attr('src','/getVerifyCode?timestamp=' + genTimestamp());
}

/*----------------------------  共用 -- 重置表单信息  -----------------------------*/
function teach_form() {
    document.getElementById("teachForm").reset();
    changeImage_teacher();
}

function student_form() {
    document.getElementById("studentForm").reset();
    changeImage_student();
}

/*--------------------------  共用 -- 显示校验结果的提示信息  --------------------*/
function show_validate_msg(ele,status,msg) {
    $(ele).parent().removeClass("has-success has-error");
    $(ele).next("span").text("");
    if("success" == status){
        $(ele).parent().addClass("has-success");
        $(ele).next("span").text(msg);
    }else if("error" == status){
        $(ele).parent().addClass("has-error");
        $(ele).next("span").text(msg);
    }
}

/*-------------------------  共用 -- 跳转主页面 ---------------------------*/
function go(){
    window.location.replace("/Main");
}



/*---------------------------    注册 -- 校验教师表单数据    ------------------------*/
function t_reg_form(){
    var flag1 = false;
    var flag2 = false;
    var flag3 = false;
    var flag4 = false;
    var flag5 = false;
    var tname = $("#tname").val();
    var tphone = $("#tphone").val();
    var tpassword = $("#tpassword").val();
    var tvc = $("#t_verifycode").val();
    var phone_format = /^[1][3,5,7,8][0-9]{9}$/;
    var pwd_format = /^(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]{6,16}$/;
    var name_format= /^[\u4e00-\u9fa5]|[a-zA-Z0-9_]{6,10}$/;

    /*用户名*/
    if(!name_format.test(tname)){
        show_validate_msg("#tname","error","请输入6-10位中文、英文、数字随机组合的用户名");
        flag1 = false;
    }else {
        show_validate_msg("#tname","success","");
        flag1 = true;
    }

    /*手机*/
    if(!phone_format.test(tphone)){
        show_validate_msg("#tphone","error","请输入正确的手机账号");
        flag2 = false;
    }else {
        flag2 = true;
        $.ajax({
            url: "/checkRoleByPhone",
            data: "phone=" + tphone,
            type: "POST",
            async: false,
            success: function (result) {
                if (result.code == 200) {
                    show_validate_msg("#tphone", "error", result.extendInfo.phone_va_msg);
                    flag3 = false;
                } else {
                    show_validate_msg("#tphone", "success", "");
                    flag3 = true;
                }
            }
        });
    }

    /*密码*/
    if(!pwd_format.test(tpassword)){
        show_validate_msg("#tpassword","error","请输入6-20位数字英文密码组合，区分大小写");
        flag4 = false;
    }else {
        show_validate_msg("#tpassword","success","");
        flag4 = true;
    }

    /*验证码*/
    $.ajax({
        url: "/checkVerifyCode",
        data: "verifycode=" + tvc,
        type: "POST",
        async: false,
        success: function (result) {
            if(result.code == 200){
                show_validate_msg("#t_verifycode", "error", "验证码错误");
                flag5 = false;
            }else {
                show_validate_msg("#t_verifycode", "success", "");
                flag5 = true;
            }
        }
    });

    return (flag1&&flag2&&flag3&&flag4&&flag5);
}

/*---------------------------    注册 -- 校验学生表单数据    ------------------------*/
function s_reg_form(){
    var flag1 = false;
    var flag2 = false;
    var flag3 = false;
    var flag4 = false;
    var flag5 = false;
    var sname = $("#sname").val();
    var sphone = $("#sphone").val();
    var spassword = $("#spassword").val();
    var svc = $("#s_verifycode").val();
    var phone_format = /^[1][3,5,7,8][0-9]{9}$/;
    var pwd_format = /^(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]{6,16}$/;
    var name_format= /^[\u4e00-\u9fa5]|[a-zA-Z0-9_]{6,10}$/;

    /*用户名*/
    if(!name_format.test(sname)){
        show_validate_msg("#sname","error","用户名格式不正确，请输入10位以下、不含特殊字符的用户名");
        flag1 = false;
    }else {
        show_validate_msg("#sname", "success", "");
        flag1 = true;
    }

    /*手机*/
    if(!phone_format.test(sphone)){
        show_validate_msg("#sphone","error","请输入正确的手机账号");
        flag2 = false;
    }else {
        flag2 = true;
        $.ajax({
            url: "/checkRoleByPhone",
            data: "phone=" + sphone,
            type: "POST",
            async: false,
            success: function (result) {
                if (result.code == 200) {
                    show_validate_msg("#sphone", "error", result.extendInfo.phone_va_msg);
                    flag3 = false;
                } else {
                    show_validate_msg("#sphone", "success", "");
                    flag3 = true;
                }
            }
        });
    }

    /*密码*/
    if(!pwd_format.test(spassword)){
        show_validate_msg("#spassword","error","请输入6-20位数字英文密码组合，区分大小写");
        flag4 = false;
    }else {
        show_validate_msg("#spassword","success","");
        flag4 = true;
    }

    /*验证码*/
    $.ajax({
        url: "/checkVerifyCode",
        data: "verifycode=" + svc,
        type: "POST",
        async: false,
        success: function (result) {
            if(result.code == 200){
                show_validate_msg("#s_verifycode", "error", "验证码错误");
                flag5 = false;
            }else {
                show_validate_msg("#s_verifycode", "success", "");
                flag5 = true;
            }
        }
    });

    return (flag1&&flag2&&flag3&&flag4&&flag5);
}

/*---------------------------    注册 -- 点击提交教师表单数据  ----------------------*/
function t_reg_submit() {
    //对要提交的数据进行校验
    if(!t_reg_form()){
        changeImage_teacher();
        return false;
    }
    //发送ajax保存账号
    $.ajax({
        url: "/doReg",
        type: "POST",
        data: $("#teachForm").serialize(),
        async: false,
        success: function (result) {
            if (result.code == 100) {
                setTimeout(go, 1000);
            }
        }
    });
    $('#myModal').modal("show");
}

/*---------------------------    注册 -- 点击提交学生表单数据 -----------------------*/
function s_reg_submit() {
    //对要提交的数据进行校验
    if(!t_reg_form()){
        changeImage_student();
        return false;
    }
    //发送ajax保存账号
    $.ajax({
        url: "/doReg",
        type: "POST",
        data: $("#studentForm").serialize(),
        success: function (result) {
            if (result.code == 100) {
                setTimeout(go, 1000);
            }
        }
    });
    $('#myModal').modal("show");
}



/*---------------------------    登录 -- 校验教师表单数据    ------------------------*/
function t_log_form(){
    var flag1 = false;
    var flag2 = false;
    var flag3 = false;
    var flag4 = false;
    var tphone = $("#tphone").val();
    var tpassword = $("#tpassword").val();
    var tvc = $("#t_verifycode").val();
    var phone_format = /^[1][3,5,7,8][0-9]{9}$/;
    var pwd_format = /^(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]{6,16}$/;

    /*手机*/
    if(!phone_format.test(tphone)){
        show_validate_msg("#tphone","error","请输入正确的手机账号");
        flag1 = false;
    }else {
        flag1 = true;
        $.ajax({
            url: "/checkRoleByPhone",
            data: "phone=" + tphone,
            type: "POST",
            async: false,
            success: function (result) {
                if (result.code == 100) {
                    show_validate_msg("#tphone", "error", result.extendInfo.phone_va_msg);
                    flag2 = false;
                } else {
                    show_validate_msg("#tphone", "success", "");
                    flag2 = true;
                }
            }
        });
    }

    /*密码*/
    if(!pwd_format.test(tpassword)){
        show_validate_msg("#tpassword","error","请输入6-20位数字英文密码组合，区分大小写");
        flag3 = false;
    }else {
        show_validate_msg("#tpassword","success","");
        flag3 = true;
    }

    /*验证码*/
    $.ajax({
        url: "/checkVerifyCode",
        data: "verifycode=" + tvc,
        type: "POST",
        async: false,
        success: function (result) {
            if(result.code == 200){
                show_validate_msg("#t_verifycode", "error", "验证码错误");
                flag4 = false;
            }else {
                show_validate_msg("#t_verifycode", "success", "");
                flag4 = true;
            }
        }
    });

    return (flag1&&flag2&&flag3&&flag4);
}

/*---------------------------    登录 -- 校验学生表单数据    ------------------------*/
function s_log_form(){
    var flag1 = false;
    var flag2 = false;
    var flag3 = false;
    var flag4 = false;
    var sphone = $("#sphone").val();
    var spassword = $("#spassword").val();
    var svc = $("#s_verifycode").val();
    var phone_format = /^[1][3,5,7,8][0-9]{9}$/;
    var pwd_format = /^(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]{6,16}$/;

    /*手机*/
    if(!phone_format.test(sphone)){
        show_validate_msg("#sphone","error","请输入正确的手机账号");
        flag1 = false;
    }else {
        flag1 = true;
        $.ajax({
            url: "/checkRoleByPhone",
            data: "phone=" + sphone,
            type: "POST",
            async: false,
            success: function (result) {
                if (result.code == 100) {
                    show_validate_msg("#sphone", "error", result.extendInfo.phone_va_msg);
                    flag2 = false;
                } else {
                    show_validate_msg("#sphone", "success", "");
                    flag2 = true;
                }
            }
        });
    }

    /*密码*/
    if(!pwd_format.test(spassword)){
        show_validate_msg("#spassword","error","请输入6-20位数字英文密码组合，区分大小写");
        flag3 = false;
    }else {
        show_validate_msg("#spassword","success","");
        flag3 = true;
    }

    /*验证码*/
    $.ajax({
        url: "/checkVerifyCode",
        data: "verifycode=" + svc,
        type: "POST",
        async: false,
        success: function (result) {
            if(result.code == 200){
                show_validate_msg("#s_verifycode", "error", "验证码错误");
                flag4 = false;
            }else {
                show_validate_msg("#s_verifycode", "success", "");
                flag4 = true;
            }
        }
    });

    return (flag1&&flag2&&flag3&&flag4);
}

/*---------------------------    登录 -- 点击提交教师表单数据  ----------------------*/
function t_log_submit() {
    //对要提交的数据进行校验
    if(!t_log_form()){
        changeImage_teacher();
        return false;
    }
    //发送ajax保存账号
    $.ajax({
        url: "/doLog",
        type: "POST",
        data: $("#teachForm").serialize(),
        async: false,
        success: function (result) {
            if (result.code == 100) {
                setTimeout(go, 1000);
            }
        }
    });
    $('#myModal').modal("show");
}

/*---------------------------    登录 -- 点击提交学生表单数据 -----------------------*/
function s_log_submit() {
    //对要提交的数据进行校验
    if(!t_log_form()){
        changeImage_student();
        return false;
    }
    //发送ajax保存账号
    $.ajax({
        url: "/doLog",
        type: "POST",
        data: $("#studentForm").serialize(),
        success: function (result) {
            if (result.code == 100) {
                setTimeout(go, 1000);
            }
        }
    });
    $('#myModal').modal("show");
}
