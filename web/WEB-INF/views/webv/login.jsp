<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="um" uri="/unimanager-tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html lang="zh_CH">
<head>
    <meta charset="utf-8">
    <title>花木蔬菜求购信息、供应信息、金牌榜和服务中心，具备一键拨号、一键导航、一键分享功能。整合全国蔬菜行业资源，服务于全国蔬菜行业发展，受到全国蔬菜行业人士好评.以蔬菜行业供求信息为基础，搭建起农村信息及电商为一体的网络平台</title>
    <meta name="Keywords" content="蔬菜通,花木,花草,苗联通,白蜡,菜园,绿化,蔬菜,花草,草坪"/>
    <meta name="Description" content="花木蔬菜求购信息、供应信息、金牌榜和服务中心，具备一键拨号、一键导航、一键分享功能。整合全国蔬菜行业资源，服务于全国蔬菜行业发展，受到全国蔬菜行业人士好评.以蔬菜行业供求信息为基础，搭建起农村信息及电商为一体的网络平台"/>
    <meta name="author" content="蔬菜通"/>
    <meta name="Copyright" content="蔬菜通版权所有"/>
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <link rel="shortcut icon" type="image/png" href="/img/logo.png">
    <link rel="stylesheet" href="/css/reset.css">
    <link rel="stylesheet" href="/css/common.css">
    <link rel="stylesheet" href="/css/common_2.css">
    <link rel="stylesheet" href="/css/login.css">

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
<div class="container">
    <!-- HEADING -->
    <%--<div class="heading clearfix">--%>
        <%--<a href="javascript:history.back()" class="back"><img src="/img/tree_icons_back.png" alt=""></a>--%>

        <%--<h1 class="head-title">登录</h1>--%>
    <%--</div>--%>
    <!-- CONTENT -->
    <form class="content w85">
        <div class="input-group-icon phone">
            <img src="/img/phone.svg" alt="手机">
            <input placeholder="手机号" type="text" id="mobile" name="mobile">
        </div>
        <div class="input-group-icon password">
            <img src="/img/lock.svg" alt="密码">
            <input placeholder="密码" type="password" id="pwr" name="pwr">
        </div>

        <button class="mt4 w10 fill-green" type="button"  onclick="login()">登录</button>
        <button class="mt4 w10 fill-green" type="button" onclick="reg()">新用户注册</button>

        <button class="mt4 w10 fill-green" type="button" onclick="kefu()">客服咨询中心</button>
        <button class="mt4 w10 fill-green" type="button" onclick="findpwr()">忘记密码</button>
    </form>
    <!-- TOOLBAR -->
    <div class="toolbar">
        <a href="javaScript:void(0)" onclick="toPage('/webv/toIndex.do','1')" class="buy"></a>
        <a href="javaScript:void(0)" onclick="toPage('/webvSell/toSell.do','1')" class="sell"></a>
        <a href="javaScript:void(0)" onclick="toPage('/webvShangquanController/toShangquan.do','1')" class="recommend"></a>
        <a href="javaScript:void(0)" onclick="toPage('/webvServiceController/toService.do','1')" class="mine"></a>
    </div>
    <!-- TOOLBAR -->
</div>
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
        window.location.href = "/webvRegController/toReg.do";
    }

    function findpwr() {
        //找回密码页面跳转
        window.location.href = "/webvFindPwrController/toFindPwr.do";
    }

    function kefu() {
        window.location.href = "/webvKefuController/toKefu.do";
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
            url: "/webvLoginController/login.do",
            data: {"username": username, "password": password},
            async: false,
            success: function (_data) {
                var data = $.parseJSON(_data);
                if (data.success) {
                    addCookie("loginName", username, 36);
                    addCookie("loginPassword", password, 36);
                    window.location.href = "/webv/toIndex.do?page=1";
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
        if(username != 0 && username !='0'){
            document.getElementById("mobile").value = username
        }
        if(password != 0 && password !='0'){
            document.getElementById("pwr").value = password
        }
//        document.getElementById("pwr").value = password
    }
</script>
</html>