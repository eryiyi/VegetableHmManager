<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="um" uri="/unimanager-tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html lang="zh_CH">
<head>
    <meta charset="utf-8">
    <title>${recordVO.mm_emp_nickname}${recordVO.mm_msg_content}</title>
    <meta name="Keywords" content="蔬菜通,花木,花草,苗联通,白蜡,菜园,惠民皂户李镇,蔬菜协会"/>
    <meta name="Description" content="蔬菜通是最优秀的花木信息软件，为客户提供最优质的服务"/>
    <meta property="og:title" content="蔬菜通_详细信息"/>
    <meta property="og:description" content="蔬菜通_详细信息"/>
    <meta name="author" content="蔬菜通"/>
    <meta name="Copyright" content="蔬菜通版权所有"/>
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <link rel="shortcut icon" type="image/png" href="/img/logo.png">
    <link rel="stylesheet" href="/css/reset.css">
    <link rel="stylesheet" href="/css/common.css">
    <link rel="stylesheet" href="/css/index.css">
    <link rel="stylesheet" href="/css/mingpianshare.css">

    <script type="text/javascript" src="/js/jquery.min.js"></script>
    <script type="text/javascript" src="/js/md5.js"></script>
    <script type="text/javascript" src="/js/cookie.js"></script>
    <script type="text/javascript" src="/js/ajaxfileupload.js"></script>
    <script type="text/javascript" src="/js/Util.js"></script>
    <script type="text/javascript" src="/js/validation.js"></script>
    <style>
        .share-seciton {
            width: 100%;
        }
    </style>

</head>
<body style="background-color: #fff; background: none;">
<div class="container">
    <!-- HEADING -->
    <%--<div class="heading clearfix">--%>
        <%--<a href="javascript:history.back()" class="back"><img src="/img/tree_icons_back.png" alt=""></a>--%>

        <%--<h1 class="head-title">详情</h1>--%>
    <%--</div>--%>
    <!-- CONTENT -->
    <div class="content">
        <input type="hidden" id="is_login" name="is_login" value="${is_login}">
        <input type="hidden" id="accessToken" name="accessToken" value="${emp.access_token}">
        <input type="hidden" id="mm_emp_id" name="mm_emp_id" value="${recordVO.mm_emp_id}">

        <div class="item">
            <div class="item-heading clearfix">
                <a href="/webvProfile/toProfile.do?mm_emp_id=${recordVO.mm_emp_id}&page=1" class="left clearfix">
                    <img src="${recordVO.mm_emp_cover}" alt="" class="head-pic">

                    <div class="detail">
                        <h1 class="company">${recordVO.mm_emp_company} &nbsp;${recordVO.mm_emp_nickname}</h1>

                        <h3 class="time">${recordVO.dateline}&nbsp;${recordVO.area}</h3>
                    </div>
                </a>

                <div class="right">
                    <div class="top clearfix">
                        <c:if test="${recordVO.is_miaomu=='1'}"><img src="/img/tree_icons_trust.png" alt=""></c:if>
                        <c:if test="${recordVO.is_chengxin=='1'}"><img src="/img/tree_icons_group.png" alt=""></c:if>
                    </div>
                    <div class="botton clearfix">
                        <c:if test="${recordVO.mm_level_num=='0'}"><img src="/img/tree_icons_star_1.png" alt=""></c:if>
                        <c:if test="${recordVO.mm_level_num=='1'}"><img src="/img/tree_icons_star_2.png" alt=""></c:if>
                        <c:if test="${recordVO.mm_level_num=='2'}"><img src="/img/tree_icons_star_3.png" alt=""></c:if>
                        <c:if test="${recordVO.mm_level_num=='3'}"><img src="/img/tree_icons_star_4.png" alt=""></c:if>
                        <c:if test="${recordVO.mm_level_num=='4'}"><img src="/img/tree_icons_star_5.png" alt=""></c:if>
                    </div>
                </div>
            </div>
            <div class="item-content">
                <p>${recordVO.mm_msg_content}</p>
                <div class="img-holder clearfix">

                    <c:if test="${recordVO.mm_msg_video == null}">
                        <%--处理图片--%>
                        <c:forEach items="${pics}" var="e" varStatus="st">
                            <a href="${e}" target="_blank"><img src="${e}" alt=""></a>
                        </c:forEach>
                    </c:if>
                    <c:if test="${recordVO.mm_msg_video != null}">
                        <p> 微信版暂不支持视频播放，请下载APP手机版查看更多信息！</p>
                    </c:if>


                </div>
            </div>
            <div class="item-footer clearfix">
                <%--<a class="button-share"></a>--%>
                <a class="button-fav" href="javaScript:void(0)" onclick="favourClick('${recordVO.mm_msg_id}')"></a>
                <a href="javaScript:void(0)" onclick="reportClick('${recordVO.mm_emp_id}','${recordVO.mm_msg_id}')"
                   class="button-report"></a>
            </div>
            <a href="tel:(${recordVO.mm_emp_mobile}" class="button-phone-big clearfix">
                <%--<img src="/img/tree_button_icon_phone.png" alt="" class="phone-icon">--%>
                <h2 class="phone-number">${recordVO.mm_emp_nickname} ${recordVO.mm_emp_mobile}</h2>
            </a>
        </div>
        <div class="share-seciton">
            <div class="side">
                <div class="side-content">
                    <div class="pic-holder">
                        <img class="cqr" src="/img/mobile_erweima.png" alt=""/>
                    </div>
                    <a class="btn-download">长按识别二维码-安卓版</a>
                </div>
            </div>
            <div class="side">
                <div class="side-content">
                    <div class="pic-holder">
                        <img class="cqr" src="/img/weixin_erweima.png" alt=""/>
                    </div>
                    <a class="btn-download">长按识别二维码-微信版</a>
                </div>
            </div>
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

    function login() {
        //登录页面跳转
        window.location.href = "/webvLoginController/toLogin.do";
    }

    function reportClick(_mm_emp_id, _mm_msg_id) {
        //举报
        window.location.href = "/webvReportController/toReport.do?mm_msg_id=" + _mm_msg_id + "&mm_emp_id=" + _mm_emp_id;
    }
</script>


</html>