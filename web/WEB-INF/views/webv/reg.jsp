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
    <link rel="shortcut icon" type="image/png" href="/img/logo.png">
    <link rel="stylesheet" href="/css/reset.css">
    <link rel="stylesheet" href="/css/common.css">
    <link rel="stylesheet" href="/css/common_2.css">


    <script type="text/javascript" src="/js/jquery.min.js"></script>
    <script type="text/javascript" src="/js/md5.js"></script>
    <script type="text/javascript" src="/js/cookie.js"></script>
    <script type="text/javascript" src="/js/ajaxfileupload.js"></script>
    <script type="text/javascript" src="/js/Util.js"></script>
    <script type="text/javascript" src="/js/validation.js"></script>


</head>
<body>
<div class="container">
    <!-- HEADING -->
    <%--<div class="heading clearfix">--%>
        <%--<a href="javascript:history.back()" class="back"><img src="/img/tree_icons_back.png" alt=""></a>--%>

        <%--<h1 class="head-title">注册</h1>--%>
    <%--</div>--%>
    <!-- CONTENT -->
    <div class="content regist w85">
        <div class="input-group-regist"><span>手机号</span>
            <input type="number" placeholder="手机号" id="mm_emp_mobile"></div>
        <div class="input-group-regist"><span>密码</span><input placeholder="密码" type="password" id="mm_emp_password"
                                                              name="mm_emp_password"></div>
        <div class="input-group-regist"><span>确认密码</span><input type="password" placeholder="确认密码" id="mm_emp_surepwr"
                                                                name="mm_emp_surepwr"></div>
        <div class="input-group-regist"><span>姓名</span><input placeholder="请输入真实姓名" type="text" id="mm_emp_nickname"
                                                              name="mm_emp_nickname"></div>
        <div class="input-group-regist"><span>身份证号</span><input placeholder="请输入身份证号" id="mm_emp_card"
                                                                name="mm_emp_card"></div>
        <div class="select-group mt2 mb2"><span>-（省）</span>
            <select class="bg-f2" name="mm_emp_provinceId" id="mm_emp_provinceId" onchange="selectCitys()">
                <option value="">--选择省份--</option>
                <c:forEach items="${listProvinces}" var="e" varStatus="st">
                    <option value="${e.provinceID}">${e.province}</option>
                </c:forEach>
            </select>
        </div>
        <div class="select-group mt2 mb2"><span>--（市）</span>
            <select class="bg-f2" id="mm_emp_cityId" onchange="selectCountrys()">
                <option value="">--选择城市--</option>
                <c:forEach items="${listCitys}" var="e" varStatus="st">
                    <option value="${e.cityID}">${e.city}</option>
                </c:forEach>
            </select>
        </div>
        <div class="select-group mt2 mb2"><span>---（县）</span>
            <select class="bg-f2" id="mm_emp_countryId">
                <option value="">--选择县区--</option>
                <c:forEach items="${listsCountry}" var="e" varStatus="st">
                    <option value="${e.areaID}">${e.area}</option>
                </c:forEach>
            </select>
        </div>
        <button class="mt4 w10 fill-green" type="submit" onclick="reg()">注册</button>
        <button class="mt4 w10 fill-green" type="button" onclick="kefu()">客服咨询中心</button>
    </div>
    <!-- TOOLBAR -->
    <div class="toolbar">
        <a href="javaScript:void(0)" onclick="toPage('/webv/toIndex.do','1')" class="buy"></a>
        <a href="javaScript:void(0)" onclick="toPage('/webvSell/toSell.do','1')" class="sell"></a>
        <a href="javaScript:void(0)" onclick="toPage('/webvTopController/toTop.do','1')" class="recommend"></a>
        <a href="javaScript:void(0)" onclick="toPage('/webvServiceController/toService.do','1')" class="mine"></a>
    </div>
    <!-- TOOLBAR -->
</div>
</body>
<script>
    function kefu() {
        window.location.href = "/webvKefuController/toKefu.do";
    }

    function toPage(_url, _page) {
        if (_page != '') {
            window.location.href = _url + "?page=" + _page;
        } else {
            window.location.href = _url;
        }
    }

    function reg() {
        var mm_emp_mobile = $("#mm_emp_mobile").val();
        var mm_emp_card = $("#mm_emp_card").val();
        var mm_emp_nickname = $("#mm_emp_nickname").val();
        var mm_emp_password = $("#mm_emp_password").val();
        var mm_emp_surepwr = $("#mm_emp_surepwr").val();
        var mm_emp_provinceId = $("#mm_emp_provinceId").val();
        var mm_emp_cityId = $("#mm_emp_cityId").val();
        var mm_emp_countryId = $("#mm_emp_countryId").val();

        if (mm_emp_mobile.replace(/\s/g, '') == '') {
            alert("手机号不能为空");
            return;
        }
        if (mm_emp_mobile.length != 11) {
            alert("手机号格式不正确");
            return;
        }
        if (mm_emp_password.replace(/\s/g, '') == '') {
            alert("密码不能为空");
            return;
        }
        if (mm_emp_password.length > 18 || mm_emp_password.length < 6) {
            alert("密码长度在6到18为之间");
            return;
        }
        if (mm_emp_surepwr.replace(/\s/g, '') == '') {
            alert("确认密码不能为空");
            return;
        }
        if (mm_emp_password != mm_emp_surepwr) {
            alert("两次输入密码不一致，请重新输入");
            return;
        }
        if (mm_emp_nickname.replace(/\s/g, '') == '') {
            alert("姓名不能为空");
            return;
        }
        if (mm_emp_nickname.length > 20 || mm_emp_nickname.length < 2) {
            alert("姓名超出字段限制");
            return;
        }
        if (mm_emp_card.replace(/\s/g, '') == '') {
            alert("身份证号不能为空");
            return;
        }
        if (mm_emp_card.length != 18) {
            alert("身份证号格式不正确");
            return;
        }
        if (mm_emp_provinceId.replace(/\s/g, '') == '') {
            alert("请选择省份");
            return;
        }
        if (mm_emp_cityId.replace(/\s/g, '') == '') {
            alert("请选择城市");
            return;
        }
        if (mm_emp_countryId.replace(/\s/g, '') == '') {
            alert("请选择县区");
            return;
        }
        $.ajax({
            cache: true,
            type: "POST",
            url: "/webvRegController/empReg.do",
            data: {
                "mm_emp_mobile": mm_emp_mobile,
                "mm_emp_nickname": mm_emp_nickname,
                "mm_emp_card": mm_emp_card,
                "mm_emp_type": "1",
                "mm_emp_password": mm_emp_password,
                "mm_emp_company": "",
                "mm_emp_company_type": "0",
                "mm_emp_company_address": "",
                "mm_emp_company_detail": "",
                "mm_emp_company_url": "",
                "mm_emp_provinceId": mm_emp_provinceId,
                "mm_emp_cityId": mm_emp_cityId,
                "mm_emp_countryId": mm_emp_countryId,
                "mm_emp_endtime": "",
                "mm_level_id": "",
                "mm_emp_beizhu": "",
                "mm_emp_msg_num": "0",
                "is_login": "0",
                "is_fabugongying": "0",
                "is_fabuqiugou": "0",
                "is_fabugongying_see": "0",
                "is_fabuqiugou_see": "0",
                "is_see_all": "0",
                "is_pic": "0",
                "is_chengxin": "0",
                "is_miaomu": "0",
                "is_use": "0",
                "ischeck": "0"
            },
            async: false,
            success: function (_data) {
                var data = $.parseJSON(_data);
                if (data.success) {
                    alert("注册成功");
                    //登录页面跳转
                    addCookie("loginName", mm_emp_nickname, 36);
                    addCookie("loginPassword", mm_emp_password, 36);
                    window.location.href = "/webvLoginController/toLogin.do";
                } else {
                    var _case = {1: "注册失败", 2: "该手机号已经注册", 3: "该身份证号已经注册"};
                    alert(_case[data.code])
                }
            }
        });
    }

    function selectCitys() {
        var province = $("#mm_emp_provinceId").val();
        $.ajax({
            cache: true,
            type: "POST",
            url: "/getAllCitys.do",
            data: {
                "father": province
            },
            async: false,
            contentType: "application/x-www-form-urlencoded; charset=utf-8",
            success: function (_data) {
                var data = $.parseJSON(_data);
                if (data.success) {
                    <%--var citys = ${listCitysAll};--%>
                    var citys = data.data;
                    var ret = "<option value=''>" + '请选择城市' + "</option>";
                    for (var i = citys.length - 1; i >= 0; i--) {
                        if (citys[i].father == province) {
                            ret += "<option value='" + citys[i].cityID + "'>" + citys[i].city + "</option>";
                        }
                    }
                    $("#mm_emp_cityId").html(ret);
                } else {
                    var _case = {1: "获取数据失败"};
                    alert(_case[data.code])
                }
            }
        });
    }
    ;

    function selectCountrys() {
        var city = $("#mm_emp_cityId").val();
        $.ajax({
            cache: true,
            type: "POST",
            url: "/getAllCountrys.do",
            data: {
                "father": city
            },
            async: false,
            success: function (_data) {
                var data = $.parseJSON(_data);
                if (data.success) {
                    var countrys = data.data;
                    var ret = "<option value=''>" + '请选择县区' + "</option>";
                    for (var i = countrys.length - 1; i >= 0; i--) {
                        if (countrys[i].father == city) {
                            ret += "<option value='" + countrys[i].areaID + "'>" + countrys[i].area + "</option>";
                        }
                    }
                    $("#mm_emp_countryId").html(ret);
                } else {
                    var _case = {1: "获取数据失败"};
                    alert(_case[data.code])
                }
            }
        });
    }
    ;


</script>
</html>