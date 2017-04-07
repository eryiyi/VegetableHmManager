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
    <link rel="stylesheet" href="/css/contact.css">
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
    <input type="hidden" id="mm_fuwu_type" name="mm_fuwu_type" value="${mm_fuwu_type}">
    <!-- HEADING -->
    <%--<div class="heading clearfix">--%>
        <%--<a href="javascript:history.back()()" class="back"><img src="/img/tree_icons_back.png" alt=""></a>--%>

        <%--<h1 class="head-title">${name}</h1>--%>
    <%--</div>--%>
    <!-- CONTENT -->
    <div class="content">
        <ul class="contact-list">

            <c:forEach items="${list}" var="e" varStatus="st">
                <%--new--%>
                <%--2016-06-24--%>
                <li class="phone-list">
                    <div class="pic-holder">
                        <img src="${e.mm_fuwu_cover}" alt=""/>
                    </div>
                    <div class="info">
                        <h2 class="name">${e.mm_fuwu_nickname}</h2>
                        <h3 class="address">${e.mm_fuwu_content}</h3>
                    </div>
                    <div class="phone"><a href="tel:${e.mm_fuwu_tel}"><img src="../../../img/btn_phone_green.png"/></a></div>
                </li>
            </c:forEach>

        </ul>

        <!--分页信息，页面跳转-->
        <div class="page clearfix">
            <div class="left hide-phone">
                <a><span>共${page.count}条/${page.pageCount}页</span></a>
                <a>每页显示
                    <select name="size" id="size" onchange="nextPage('1')">
                        <option value="10" ${query.size==10?'selected':''}>10</option>
                        <option value="20" ${query.size==20?'selected':''}>20</option>
                        <option value="30" ${query.size==30?'selected':''}>30</option>
                        <option value="100" ${query.size==100?'selected':''}>100</option>
                    </select>条
                </a>
            </div>
            <div class="right">
                <c:choose>
                    <c:when test="${page.page == 1}">
                        <a class="hide-phone" href="javascript:void(0)">首页</a>
                        <a href="javascript:void(0)">上一页</a>
                    </c:when>
                    <c:otherwise>
                        <a class="hide-phone" href="javascript:void(0);" onclick="nextPage('1')">首页</a>
                        <a href="javascript:void(0);" onclick="nextPage('${page.page-1}')">上一页</a>
                    </c:otherwise>
                </c:choose>
                <a class="hide-phone">第<input type="text" id="index" name="index" onkeyup="searchIndex(event)"
                                              value="${page.page}">页</a>
                <c:choose>
                    <c:when test="${page.page == page.pageCount}">
                        <a href="javascript:void(0)">下一页</a>
                        <a class="hide-phone" href="javascript:void(0)">末页</a>
                    </c:when>
                    <c:otherwise>
                        <a href="javascript:void(0);" onclick="nextPage('${page.page+1}')">下一页</a>
                        <a class="hide-phone" href="javascript:void(0);"
                           onclick="nextPage('${page.pageCount}')">末页</a>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>

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


<script type="text/javascript" charset="UTF-8">
    function searchIndex(e) {
        if (e.keyCode != 13) return;
        var _index = $("#index").val();
        var mm_fuwu_type = $("#mm_fuwu_type").val();
        var page = parseInt(_page);
        var size = $("#size").val();
        if (_index <= ${page.pageCount} && _index >= 1) {
            window.location.href = "/webvFuwuCenterController/toCenter.do?page=" + page + "&size=" + size+ "&_t=" + new Date().getTime()+ "&mm_fuwu_type=" + mm_fuwu_type;
        } else {
            alert("请输入1-${page.pageCount}的页码数");
        }
    }

    function nextPage(_page) {
        var page = parseInt(_page);
        var size = $("#size").val();
        var mm_fuwu_type = $("#mm_fuwu_type").val();
        addCookie("contract_size", size, 36);
        if ((page <= ${page.pageCount} && page >= 1)) {
            window.location.href = "/webvFuwuCenterController/toCenter.do?page=" + page + "&size=" + size+ "&_t=" + new Date().getTime()+ "&mm_fuwu_type=" + mm_fuwu_type;
        } else {
            alert("请输入1-${page.pageCount}的页码数");
        }
    }
</script>

<script>
    function toPage(_url, _page) {
        if (_page != '') {
            window.location.href = _url + "?page=" + _page;
        } else {
            window.location.href = _url;
        }
    }

    function findPwr() {
        var mm_emp_mobile = $("#mm_emp_mobile").val();
        var mm_emp_password = $("#mm_emp_password").val();
        var mm_emp_surepwr = $("#mm_emp_surepwr").val();
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
        $.ajax({
            cache: true,
            type: "POST",
            url: "/webvFindPwrController/findPwr.do",
            data: {
                "mm_emp_mobile": mm_emp_mobile,
                "mm_emp_password": mm_emp_password

            },
            async: false,
            success: function (_data) {
                var data = $.parseJSON(_data);
                if (data.success) {
                    alert("找回密码成功");
                    //登录页面跳转
                    window.location.href = "/webvLoginController/toLogin.do";
                } else {
                    var _case = {1: "找回密码失败", 2: ""};
                    alert(_case[data.code])
                }
            }
        });
    }
</script>
</html>