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
    <link rel="stylesheet" href="/css/location_select.css">

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
        <%--<a href="javascript:void(0)" onclick="toPage('/webv/toIndex.do','1')" class="back"><img--%>
                <%--src="/img/tree_icons_back.png" alt=""></a>--%>

        <%--<h1 class="head-title">地区选择</h1>--%>
    <%--</div>--%>

    <!-- CONTENT -->
    <div class="content w95">

        <c:if test="${is_guanzhu=='0'}"><span>您已经申请了关注区域！请等待管理员审核</span></c:if>
        <c:if test="${is_guanzhu=='1'}">
            <h2 class="label-title">我关注的区域</h2>
            <ul class="location-list location-list-green clearfix">
                <c:forEach items="${areaNames}" var="e" varStatus="st">
                    <li>
                        <a href="/webvGuanzhuController/guanzhuArea.do?page=1">
                            <span class="list-name">${e}</span>
                        </a>
                    </li>
                </c:forEach>
            </ul>

        </c:if>
        <c:if test="${is_guanzhu=='2'}"><span>您申请的关注区域未通过审核，请联系客服！</span></c:if>
        <c:if test="${is_guanzhu=='3'}"><span>您尚未申请关注区域，请设置关注区域！</span></c:if>

        <ul class="location-list clearfix">
            <h2 class="label-title">*热门区域</h2>
            <c:forEach items="${listhot}" var="e" varStatus="st">
                <li>
                    <a href="/webvHotController/toIndex.do?page=1&countryid=${e.areaID}&is_guanzhu='1'">
                        <span class="list-name">${e.cityName}${e.area}</span>
                    </a>
                </li>
            </c:forEach>
        </ul>

    </div>
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
</script>
</html>