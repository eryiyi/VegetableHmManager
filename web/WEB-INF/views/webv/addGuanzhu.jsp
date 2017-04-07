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
    <link rel="stylesheet" href="/css/about.css">
    <link rel="stylesheet" href="/css/location_focus.css"/>

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
        <%--<!-- HEADING -->--%>
        <%--<div class="heading clearfix">--%>
            <%--<a href="javascript:history.back()" class="back"><img src="/img/tree_icons_back.png" alt=""></a>--%>

            <%--<h1 class="head-title">添加关注区域</h1>--%>
        <%--</div>--%>
    <%--</div>--%>
    <!-- CONTENT -->
    <!-- CONTENT -->
    <div class="content w9">
        <div class="info">
            *选择省市县然后点击‘添加’按钮，可选择多个地区！
        </div>

        <select class="select-lg w10" name="mm_emp_provinceId" id="mm_emp_provinceId" onchange="selectCitys()">
            <option value="">--选择省份--</option>
            <c:forEach items="${listProvinces}" var="e" varStatus="st">
                <option value="${e.provinceID}">${e.province}</option>
            </c:forEach>
        </select>

        <select class="select-lg w10" id="mm_emp_cityId" onchange="selectCountrys()">
            <option value="">--选择城市--</option>
            <c:forEach items="${listCitys}" var="e" varStatus="st">
                <option value="${e.cityID}">${e.city}</option>
            </c:forEach>
        </select>

        <select class="select-lg w10" id="mm_emp_countryId">
            <option value="">--选择县区--</option>
            <c:forEach items="${listsCountry}" var="e" varStatus="st">
                <option value="${e.areaID}">${e.area}</option>
            </c:forEach>
        </select>

        <button class="button fill-green w10 mb4" onclick="add()">添加</button>
        <input type="hidden" id="areaid1">
        <input class="select-lg w10" readonly="true" type="text" id="mm_msg_title" name="mm_msg_title">
        <button class="button fill-green w10 mb2" onclick="subAll()">提交审核</button>
        <div class="info">
            *1.关注区域只能设置一次，请谨慎！<br>
            2.提交申请后，由后台管理员进行审核，您可以联系客服查询进度！
        </div>

    </div>
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
    function add() {
        var areaid1 = $("#areaid1").val();
        var mm_emp_countryId = $("#mm_emp_countryId").val();
        var mm_emp_countryName = $("#mm_emp_countryId").find("option:selected").text();

        if ($("#areaid1").val().split(',').length > 5) {
            alert("最多选择5个县区！");
        } else {
            if ($("#areaid1").val().indexOf(mm_emp_countryId) > -1) {
                //说明存在这个值了
                alert("不能重复选择同一个县区！");
            } else {
                $("#mm_msg_title").val($("#mm_msg_title").val() + mm_emp_countryName + ",");
                $("#areaid1").val($("#areaid1").val() + mm_emp_countryId + ",");
            }
        }
    }
    function subAll() {
        //提交审核]
        var areaid1 = $("#areaid1").val();
        var mm_msg_title = $("#mm_msg_title").val();
        if (areaid1 == '' || mm_msg_title == '') {
            alert("请先选择地区！");
        } else {
            $.ajax({
                cache: true,
                type: "POST",
                url: "/webvGuanzhuController/saveGuanzhuArea.do",
                data: {
                    "area_name": mm_msg_title,
                    "areaid": areaid1
                },
                async: false,
                success: function (_data) {
                    var data = $.parseJSON(_data);
                    if (data.success) {
                        alert("提交申请成功，请等待管理员审核！");
                        window.history.go(-1);
                    } else {
                        var _case = {1: "提交申请失败", 2: "已经提交申请，不能重复发布！", 9: "您的账号在其它设备上登录，请重新登录"};
                        alert(_case[data.code])
                    }
                }
            });
        }
    }
    function toPage(_url, _page) {
        if (_page != '') {
            window.location.href = _url + "?page=" + _page;
        } else {
            window.location.href = _url;
        }
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