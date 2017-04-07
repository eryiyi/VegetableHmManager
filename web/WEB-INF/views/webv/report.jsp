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
    <link rel="stylesheet" href="/css/report.css">

    <script type="text/javascript" src="/js/jquery.min.js"></script>
    <script type="text/javascript" src="/js/md5.js"></script>
    <script type="text/javascript" src="/js/cookie.js"></script>
    <script type="text/javascript" src="/js/ajaxfileupload.js"></script>
    <script type="text/javascript" src="/js/Util.js"></script>
    <script type="text/javascript" src="/js/validation.js"></script>

</head>
<div class="container">
    <!-- HEADING -->
    <%--<div class="heading clearfix">--%>
        <%--<!-- HEADING -->--%>
        <%--<div class="heading clearfix">--%>
            <%--<a href="javascript:history.back()" class="back"><img src="/img/tree_icons_back.png" alt=""></a>--%>

            <%--<h1 class="head-title">举报</h1>--%>
        <%--</div>--%>
    <%--</div>--%>
    <!-- CONTENT -->
    <div class="content regist w85">
        <input type="hidden" value="${mm_msg_id}" id="mm_msg_id">
        <input type="hidden" value="${mm_emp_id}" id="mm_emp_id">
        <input type="hidden" value="${mm_emp_id_t}" id="mm_emp_id_t">
        <h2 class="title">请填写举报内容：</h2>
        <textarea class="report-reason" name="mm_report_content" id="mm_report_content" cols="30" rows="10"
                  placeholder="请简要描述举报内容"></textarea>
        <button class="button fill-orange mt3 w10 t-sh mb4" onclick="addSuggest()">提交</button>
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

    function addSuggest() {
        var mm_msg_id = $("#mm_msg_id").val();
        var mm_emp_id = $("#mm_emp_id").val();
        var mm_emp_id_t = $("#mm_emp_id_t").val();
        var mm_report_content = $("#mm_report_content").val();
        if (mm_report_content.replace(/\s/g, '') == '') {
            alert("请简要描述举报内容");
            return;
        }
        if (mm_report_content.length > 200 || mm_report_content.length < 2) {
            alert("请简要描述举报内容，内容在2到200个字之间");
            return;
        }

        $.ajax({
            cache: true,
            type: "POST",
            url: "/webvReportController/addReport.do",
            data: {
                "mm_msg_id": mm_msg_id,
                "mm_emp_id": mm_emp_id,
                "mm_emp_id_t": mm_emp_id_t,
                "mm_report_content": mm_report_content
            },
            async: false,
            success: function (_data) {
                var data = $.parseJSON(_data);
                if (data.success) {
                    alert("举报成功，感谢您的参与");
                } else {
                    var _case = {1: "提交举报失败", 9: "您的账号登陆过期，请重新登陆！"};
                    alert(_case[data.code])
                }
            }
        });
    }
</script>
</html>