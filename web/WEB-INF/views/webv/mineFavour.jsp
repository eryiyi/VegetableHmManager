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
    <link rel="stylesheet" href="/css/index.css">

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

            <%--<h1 class="head-title">我的收藏</h1>--%>
        <%--</div>--%>
    <%--</div>--%>
    <!-- CONTENT -->
    <div class="content">
        <input type="hidden" id="is_login" name="is_login" value="${is_login}">
        <input type="hidden" id="accessToken" name="accessToken" value="${emp.access_token}">
        <input type="hidden" id="mm_emp_id" name="mm_emp_id" value="${emp.mm_emp_id}">
        <c:forEach items="${list}" var="e" varStatus="st">
            <div class="item">
                <div class="item-heading clearfix">
                    <a href="javaScript:void(0)" onclick="showDetail('${e.mm_msg_id}')" class="left clearfix">
                        <img src="${e.mm_emp_cover}" alt="" class="head-pic">

                        <div class="detail">
                            <h1 class="company">${e.mm_emp_company}&nbsp;${e.mm_emp_nickname}</h1>

                            <h3 class="time">${e.dateline} &nbsp;&nbsp; ${e.area}</h3>
                        </div>
                    </a>

                    <div class="right">
                        <div class="top clearfix">
                            <c:if test="${e.is_miaomu=='1'}"><img src="/img/tree_icons_trust.png" alt=""></c:if>
                            <c:if test="${e.is_chengxin=='1'}"><img src="/img/tree_icons_group.png" alt=""></c:if>
                        </div>
                        <div class="botton clearfix">
                            <c:if test="${e.mm_level_num=='0'}"><img src="/img/tree_icons_star_1.png" alt=""></c:if>
                            <c:if test="${e.mm_level_num=='1'}"><img src="/img/tree_icons_star_2.png" alt=""></c:if>
                            <c:if test="${e.mm_level_num=='2'}"><img src="/img/tree_icons_star_3.png" alt=""></c:if>
                            <c:if test="${e.mm_level_num=='3'}"><img src="/img/tree_icons_star_4.png" alt=""></c:if>
                            <c:if test="${e.mm_level_num=='4'}"><img src="/img/tree_icons_star_5.png" alt=""></c:if>
                        </div>
                    </div>
                </div>
                <a class="item-content" href="javaScript:void(0)" onclick="showDetail('${e.mm_msg_id}')">
                        ${e.mm_msg_title}
                        ${e.mm_msg_content}
                </a>

                <div class="item-footer clearfix">
                    <a type="button" href="tel:${e.mm_emp_mobile}" class="button-phone"></a>
                    <c:if test="${e.mm_msg_picurl !=''}"><a type="button" onclick="showDetail('${e.mm_msg_id}')"
                                                            class="button-pic"></a></c:if>
                </div>
            </div>
        </c:forEach>

    </div>
    <!-- TOOLBAR -->
    <div class="toolbar">
        <a href="javaScript:void(0)" onclick="toPage('/webv/toIndex.do','1')" class="buy"></a>
        <a href="javaScript:void(0)" onclick="toPage('/webvSell/toSell.do','1')" class="sell"></a>
        <a href="javaScript:void(0)" onclick="toPage('/webvShangquanController/toShangquan.do','1')" class="recommend"></a>
        <a href="javaScript:void(0)" onclick="toPage('/webvServiceController/toService.do','1')"
           class="mine mine-active"></a>
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
    function favourClick(_mm_msg_id) {
        //先判断是否登录
        var is_login = $("#is_login").val();
        if (is_login == 1) {
            //登陆了
            var mm_emp_id = $("#mm_emp_id").val();
            var accessToken = $("#accessToken").val();
            $.ajax({
                cache: true,
                type: "POST",
                url: "/saveFavour.do",
                data: {"mm_msg_id": _mm_msg_id, "accessToken": accessToken, "mm_emp_id": mm_emp_id},
                async: false,
                success: function (_data) {
                    var data = $.parseJSON(_data);
                    if (data.success) {
                        alert("收藏成功");
                    } else {
                        var _case = {1: "收藏失败", 2: "已经收藏，不能重复收藏！", 9: "账号过期，请重新登录！"};
                        alert(_case[data.code])
                    }
                }
            });
        } else {
            //没登陆
            window.location.href = "/webvLoginController/toLogin.do";
        }
    }

    function showDetail(_mm_msg_id) {
        window.location.href = "/webvRecordController/toDetail.do?mm_msg_id=" + _mm_msg_id;
    }

    function login() {
        //登录页面跳转
        window.location.href = "/webvLoginController/toLogin.do";
    }
</script>

<script type="text/javascript" charset="UTF-8">

    <%--function searchIndex(e) {--%>
        <%--if (e.keyCode != 13) return;--%>
        <%--var _index = $("#index").val();--%>
        <%--var page = parseInt(_page);--%>
        <%--var size = $("#size").val();--%>
        <%--var keyword = $("#keyword").val();--%>
        <%--if (_index <= ${page.pageCount} && _index >= 1) {--%>
            <%--window.location.href = "/webv/toIndex.do?page=" + page + "&size=" + size + "&keyword=" + keyword+ "&_t=" + new Date().getTime();--%>
        <%--} else {--%>
            <%--alert("请输入1-${page.pageCount}的页码数");--%>
        <%--}--%>
    <%--}--%>

    <%--function nextPage(_page) {--%>
        <%--var page = parseInt(_page);--%>
        <%--var size = $("#size").val();--%>
        <%--var keyword = $("#keyword").val();--%>
        <%--addCookie("contract_size", size, 36);--%>
        <%--if ((page <= ${page.pageCount} && page >= 1)) {--%>
            <%--window.location.href = "/webv/toIndex.do?page=" + page + "&size=" + size + "&keyword=" + keyword+ "&_t=" + new Date().getTime();--%>
        <%--} else {--%>
            <%--alert("请输入1-${page.pageCount}的页码数");--%>
        <%--}--%>
    <%--}--%>

</script>
<script type="text/javascript">
    (function (window, undefined) {
        var currentHash;

        function decodeChineseWords(params) {
            if (params["cn"] == undefined || params["cn"] == "") {
                return;
            }
            var cns = params["cn"].split(","), i;
            for (i = 0; i < cns.length; i++) {
                params[cns[i]] = decodeURIComponent(params[cns[i]]);
            }
        }

        function checkHash() {
            var newHash = window.location.hash;
            if (newHash == "") {
//                window.location.hash = "#module=main";
                return;
            }
            if (newHash == currentHash) return;
            currentHash = newHash;
            var paramsString = currentHash.substring(1);
            var paramsArray = paramsString.split("&");
            var params = {};
            for (var i = 0; i < paramsArray.length; i++) {
                var tempArray = paramsArray[i].split("=");
                params[tempArray[0]] = tempArray[1];
            }
            var _url = params["module"].replace(/\./g, "/") + ".do?_t=" + new Date().getTime();
            delete params["module"];
            decodeChineseWords(params);
            $.ajax({
                url: _url, type: "post", data: params, success: function (data) {
                    var editor;
                    while ((editor = Util.editors.shift()) != undefined) {
                        editor.destroy();
                    }
                    $("#content").html(data);
                }
            });
        }

        window.setInterval(checkHash, 100);
    })(window);


</script>

</html>