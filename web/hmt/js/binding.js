var userType = init.userType;
function phone(value) {
    var regPartton = /^((13|14|15|17|18)\d{9})$/;
    if (!regPartton.test(value)) {
        return false;
    }
    return true;
}

function emial(value) {
    var regPartton = /^([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+@([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+\.[a-zA-Z]{2,3}$/;
    if (!regPartton.test(value)) {
        return false;
    }
    return true;
}

function zhLinkMan(value) {
    var reg = /^[\u4E00-\u9FA5]+$/;
    if (!reg.test(value)) {
        return false;
    }
    return true;
}

var waitEmail = 60;
function timeEmail(dom) {
    if (waitEmail > 0) {
        $(dom).addClass("aaa");
        $(dom).attr("disabled", true);
        $(dom).siblings("input[id='email']").attr("disabled", true);
        $(dom).text("重新发送(" + waitEmail + ")");
        waitEmail--;
        setTimeout(function () {
            timeEmail(dom)
        }, 1000)
    } else {
        $(dom).text("重新发送");
        $(dom).removeClass("aaa");
        $(dom).attr("disabled", false);
        waitEmail = 60;
    }
}

var wait = 60;
function time(dom) {
    if (wait > 0) {
        $(dom).addClass("aaa");
        $(dom).attr("disabled", true);
        $(dom).siblings("input[id='mobile']").attr("disabled", true);
        $(dom).text("重新发送(" + wait + ")");
        wait--;
        setTimeout(function () {
            time(dom)
        }, 1000)
    } else {
        $(dom).text("重新发送");
        $(dom).removeClass("aaa");
        $(dom).attr("disabled", false);
        wait = 60;
    }
}
//绑定邮箱
$('.email').click(function () {
    var email = init.email;
    windows_custom_open('发送验证邮件', '<div class="sada"><input placeholder="请您输入邮箱地址" type="text" name="email" id="email" value="' + email + '"><button type="button" name="sendEmail" id="sendEmail">发送验证邮件</button></div><div class="sada"><input type="text" placeholder="请您输入验证码" name="emailCode" id="emailCode"><button type="button" name="vailEmail" id="vailEmail">验证邮件</button></div>', '400', '200');
    $("#sendEmail", window.parent.document).click(function () {
        var _bodys = $(window.parent.document).find('body');
        var _email = _bodys.find("input[name='email']").val();
        if (_email.length > 0) {
            if (!emial(_email)) {
                alert("请输入正确的邮箱");
                return;
            }
            $.ajax({
                type: "POST",
                url: init.userWebUrl + "myhn/sendEmailValidateCode",
                data: {email: _email},
                dataType: "json",
                success: function (result) {
                    if (result.msg == 3) {
                        alert("输入的邮箱和之前的一样");
                        return;
                    } else if (result.msg == 2) {
                        alert("输入的邮箱已存在");
                        return;
                    } else if (result.msg == 1) {
                        timeEmail($(window.parent.document).find('body').find("button[name='sendEmail']"));
                        return;
                    } else {
                        alert("邮箱验证码发送失败");
                        return;
                    }
                }
            });
        } else {
            alert("请填写邮箱");
            return
        }
    });


    $("#vailEmail", window.parent.document).click(function () {
        var _bodys = $(window.parent.document).find('body');
        var _email = _bodys.find("input[name='email']").val();
        var _code = _bodys.find("input[name='emailCode']").val();
        if (_code.length > 0 && _email.length > 0) {
            if (!emial(_email)) {
                alert("请输入正确的邮箱");
                return;
            }
            $.ajax({
                type: "POST",
                url: init.userWebUrl + "myhn/validateEmailCode",
                data: {email: _email, emailCode: _code},
                dataType: "json",
                success: function (result) {
                    if (result.msg == 1) {
                        alert("邮箱绑定成功");
                        windows_close();
                        window.location.href = "home";
                    } else {
                        alert("输入验证码错误");
                        return;
                    }
                }
            });
        } else {
            alert("请填写验证码或者邮箱");
            return;
        }
    });
});

//绑定手机
$('.phone').click(function () {
    var mobile = init.mobile;
    windows_custom_open('发送手机验证码', '<div class="sada"><input type="text" placeholder="请您输入手机号码" name="mobile" id="mobile" maxlength="11" value="' + mobile + '"><button type="button" name="sendMobile" id="sendMobile" >发送手机验证码</button></div><div class="sada"><input type="text" placeholder="请您输入验证码" name="phoneCode" id="phoneCode" maxlength="6"><button type="button" name="vailMobile" id="vailMobile">验证手机</button></div>', '400', '200');
    $("#sendMobile", window.parent.document).click(function () {
        sendSms();
    });
    function sendSms() {
        var _bodys = $(window.parent.document).find('body');
        var _mobile = _bodys.find("input[name='mobile']").val();
        if (_mobile.length > 0) {
            if (!phone(_mobile)) {
                alert("请输入（13|14|15|17|18）开头的手机号码");
                return;
            }
            $.ajax({
                type: "POST",
                url: init.userWebUrl + "myhn/sendMobileCode",
                data: {mobile: _mobile},
                dataType: "json",
                success: function (result) {
                    if (result.msg == 3) {
                        alert("输入的手机和之前的一样");
                        return;
                    } else if (result.msg == 2) {
                        alert("输入的手机已存在");
                        return;
                    } else if (result.msg == 1) {
                        time($(window.parent.document).find('body').find("button[name='sendMobile']"));
                        //alert("手机验证码发送，请查收");
                        return;
                    } else {
                        alert("手机验证码发送失败");
                        return;
                    }
                }
            });
        } else {
            alert("请填写手机号码");
            return;
        }
    }

    $("#vailMobile", window.parent.document).click(function () {
        var _bodys = $(window.parent.document).find('body');
        var _mobile = _bodys.find("input[name='mobile']").val();
        var _code = _bodys.find("input[name='phoneCode']").val();
        if (_code.length > 0 && _mobile.length > 0) {
            if (!phone(_mobile)) {
                alert("请输入（13|14|15|17|18）开头的手机号码");
                return;
            }
            $.ajax({
                type: "POST",
                url: init.userWebUrl + "myhn/validateMobileCode",
                data: {phoneNo: _mobile, phoneCode: _code},
                dataType: "json",
                success: function (result) {
                    if (result.msg == 1) {
                        alert("手机绑定成功");
                        windows_close();
                        window.location.href = "home";
                    } else {
                        alert("输入验证码错误");
                        return;
                    }
                }
            });
        } else {
            alert("请填写验证码或者手机号");
            return;
        }
    });
});