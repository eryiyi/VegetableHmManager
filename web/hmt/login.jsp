<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="um" uri="/unimanager-tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html lang="zh_CH">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <link rel="icon" href="../img/icon.png" type="image/png"/>
    <meta name="renderer" content="webkit">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0"/>
    <title>蔬菜通|会员登录</title>
    <meta name="keywords" content="蔬菜通,蔬菜,花木,蔬菜交易,花木求购,蔬菜求购,花木资讯,花木论坛,花木销售,蔬菜销售,蔬菜资讯,绿化蔬菜">
    <meta name="Description"
          content=" 蔬菜通是惠民县本地第一蔬菜供求信息平台、信息通讯平台，突破了蔬菜大市场、绿化工程公司、经纪人、苗农之间的信息壁垒，让市场订单蔬菜不愁买，苗农种植蔬菜不愁卖！为本地蔬菜行业发展助力，让经纪人足不出户，随时随地做生意！让苗农及时了解市场行情，蔬菜卖价更高更容易！">
    <link href="../hmt/css/common/index-type.css" rel="stylesheet" type="text/css"/>
    <link href="../hmt/css/common/common.css" rel="stylesheet" type="text/css"/>
    <link href="../hmt/css/common/base.css" rel="stylesheet" type="text/css"/>
    <link href="../hmt/css/frame.css" rel="stylesheet" type="text/css"/>
    <link href="../hmt/css/category-vegetable/common.css" rel="stylesheet" type="text/css"/>
    <link href="../hmt/css/search/style.css" rel="stylesheet" type="text/css"/>
    <link href="../hmt/css/search/base.css" rel="stylesheet" type="text/css"/>
    <link href="../hmt/css/supply/index.css" rel="stylesheet" type="text/css"/>

    <link href="../hmt/css/frame.css" rel="stylesheet" type="text/css"/>
    <link href="../hmt/css/reg.css" rel="stylesheet" type="text/css"/>
    <link href="../hmt/css/base.min.css" rel="stylesheet" type="text/css"/>
    <link href="../hmt/css/login/common.css" rel="stylesheet" type="text/css"/>
    <link href="../hmt/css/login/login.css" rel="stylesheet" type="text/css"/>

    <script type="text/javascript" src="../js/jquery.min.js"></script>
    <script type="text/javascript" src="../js/md5.js"></script>
    <script type="text/javascript" src="../js/cookie.js"></script>
    <script type="text/javascript" src="../js/ajaxfileupload.js"></script>
    <script type="text/javascript" src="../js/Util.js"></script>
    <script type="text/javascript" src="../js/validation.js"></script>
    <script language="javascript" src="../js/jquery.js"></script>
    <script type="text/javascript" src="../js/jquery_latest.js"></script>

</head>
<body onload="loginAuto()">
<div class="header clearfix">
    <div class="logo-box fl">
        <div class="logo fl">
            <a href="/hmtIndex/toIndex.do?page=1"><img src="../hmt/images/category-vegetable/logo_type.png"
                                                       alt="蔬菜通信息平台" width="205px" height="40px"></a>
        </div>
        <div class="logotext lh22 fl ml10">
            <div class="fs18">用户登录</div>
            <div class="">客服热线：400-024-2103</div>
        </div>
    </div>
    <div class="links fr">
            <span>
                <i class="fl"><img src="../hmt/images/top_ico_01.jpg"></i>
                <div class="lh22 fs14 fl ml10">
                    <p>海量供应</p>

                    <p>实时更新</p>
                </div>
            </span>
            <span>
                <i class="fl"><img src="../hmt/images/top_ico_02.jpg"></i>
                <div class="lh22 fs14 fl ml10">
                    <p>采购信息</p>

                    <p>免费发布</p>
                </div>
            </span>
            <span>
                <i class="fl"><img src="../hmt/images/top_ico_03.jpg"></i>
                <div class="lh22 fs14 fl ml10">
                    <p>知名产地 </p>

                    <p>源头好货</p>
                </div>
            </span>
    </div>
</div>
<!--头部 导航 end-->

<!--内容-->
<div class="main wrap-1000">
    <div class="fl">
        <a href="#"><img src="../hmt/images/login-ad.jpg?v=20151221"></a>
    </div>
    <div class="login-form" style="padding-bottom: 20px">
        <h1>用户登录</h1>

        <input type="hidden" name="isRememberPwd" id="isRememberPwd">

        <div class="usertxt">
            <span class="reg-hint">
                <span class="red" id="userAccountv"></span>
            </span>
        </div>
        <div class="userinput">
            <input type="text" placeholder="手机号" id="mobile" name="mobile"
                   onfocus="this.value=this.value=='手机号'?'':this.value;"
                   onblur="this.value=this.value==''?'手机号':this.value"
                   validate="{required:true,trim:true,messages:{required:'登录名不能为空'}}"
                   autocomplete="off">
        </div>
        <div class="passwordtxt">
            <span class="reg-hint">
                <span class="red" id="passwordv"></span>
            </span>
        </div>
        <div class="passwordinput">
            <input type="password" value="" placeholder="请输入密码" id="pwr" name="pwr"
                   validate="{required:true,trim:true,messages:{required:'密码不能为空'}}"
                   autocomplete="off">
        </div>
        <div id="liValiCode" style="display: none;">
            <div class="codetxt">验证码：</div>
            <div class="codeinput">
                <input name="valCode" id="valCode" type="text">

                <div class="verify"><img src="" width="60" height="30" id="imgValidate"></div>
                <span>看不清，<a href="javascript:void(0);" id="img">换一张</a></span>
            </div>
        <span class="reg-hint">
        	<span class="red" id="valCodev"></span>
        </span>
        </div>
        <%--<div class="forget">--%>
        <%--<em id="forget-check"></em>--%>
        <%--<span>下次自动登录</span>--%>
        <%--</div>--%>
        <a href="javascript:void(0)" class="userloginbut but" onclick="login()" style="margin-top: 15px">登 录</a>
        <a href="javascript:void(0)" class="userloginbut but" onclick="reg()" style="margin-top: 10px">免费注册</a>
        <a href="javascript:void(0)" class="userloginbut but" onclick="kefu()" style="margin-top: 10px">客服中心</a>

        <p class="mt_10" style="margin-top: 20px"></p>
        <%--<a href="javascript:void(0)" class="forget-word" onclick="findpwr()" style="margin-top: 20px;margin-bottom: 20px">忘记登录密码</a>--%>
        <%--<a href="javascript:void(0)" class="regin" id="free_goReg" onclick="reg()">免费注册</a>--%>

        <%--<div class="login-qq">--%>
        <%--<div class="login-g"><b>—————</b>&nbsp;&nbsp;使用合作伙伴账号登录&nbsp;&nbsp;<b>—————</b></div>--%>
        <%--<div class="clear"></div>--%>
        <%--<div class="login-h clearfix">--%>
        <%--<a href="javascript:turn('qq')" target="_self" class="qqico" id="qqlogin"><img src="../hmt/images/kj_dl_01.png" id="login_qq"></a>--%>
        <%--<a href="javascript:turn('wb')" target="_self" class="qqico" id="wblogin"><img src="../hmt/images/kj_dl_04.png" id="login_wb"></a>--%>
        <%--<a href="javascript:turn('wx')" target="_self" class="qqico" id="wxlogin"><img src="../hmt/images/kj_dl_02.png" id="login_wx"></a>--%>
        <%--</div>--%>
        <%--</div>--%>
    </div>
</div>
<!--内容 end-->

<jsp:include page="footer.jsp" flush="true"/>

</body>
<script>

    function toPage(_url, _page) {
        if (_page != '') {
            window.location.href = _url + "?page=" + _page;
        } else {
            window.location.href = _url;
        }
    }

    function reg() {
        //注册页面跳转
        window.location.href = "/netRegController/toReg.do";
    }

    function findpwr() {
        //找回密码页面跳转
        window.location.href = "/webvFindPwrController/toFindPwr.do";
    }

    function kefu() {
        window.location.href = "/netKefuController/toKefu.do";
    }

    function login() {
        //登录
        var username = $("#mobile").val();
        var password = $("#pwr").val();

        if (username.replace(/\s/g, '') == '') {
            alert("手机号不能为空");
            return;
        }
        if (password.replace(/\s/g, '') == '') {
            alert("密码不能为空");
            return;
        }
        $.ajax({
            cache: true,
            type: "POST",
            url: "/netLoginController/login.do",
            data: {"username": username, "password": password},
            async: false,
            success: function (_data) {
                var data = $.parseJSON(_data);
                if (data.success) {
                    addCookie("loginName", username, 36);
                    addCookie("loginPassword", password, 36);
                    window.location.href = "/hmtIndex/toIndex.do?page=1";
                } else {
                    var _case = {
                        1: "该用户不存在",
                        2: "密码不正确",
                        3: "该用户被禁用了，请联系客服",
                        4: "该用户尚未审核，请联系客服",
                        5: "手机号不能为空",
                        6: "密码不能为空",
                        7: "登录失败",
                        8: "请使用注册手机登录，不能更换手机！"
                    };
                    alert(_case[data.code])
                }
            }
        });
    }
    function loginAuto() {
        var username = getCookie("loginName");
        var password = getCookie("loginPassword");
        document.getElementById("mobile").value = username
        document.getElementById("pwr").value = password
    }
</script>

</html>