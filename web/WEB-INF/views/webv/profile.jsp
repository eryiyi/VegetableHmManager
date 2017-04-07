<%@ taglib prefix="um" uri="/unimanager-tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html lang="zh_CH">
<head>
    <meta charset="utf-8">
    <title>${emp.mm_emp_nickname}${emp.mm_emp_company}花木蔬菜求购信息、供应信息、金牌榜和服务中心，具备一键拨号、一键导航、一键分享功能。整合全国蔬菜行业资源，服务于全国蔬菜行业发展，受到全国蔬菜行业人士好评.以蔬菜行业供求信息为基础，搭建起农村信息及电商为一体的网络平台</title>
    <meta name="Keywords" content="蔬菜通,花木,花草,苗联通,白蜡,菜园,绿化,蔬菜,花草,草坪"/>
    <meta name="Description" content="花木蔬菜求购信息、供应信息、金牌榜和服务中心，具备一键拨号、一键导航、一键分享功能。整合全国蔬菜行业资源，服务于全国蔬菜行业发展，受到全国蔬菜行业人士好评.以蔬菜行业供求信息为基础，搭建起农村信息及电商为一体的网络平台"/>
    <meta name="author" content="蔬菜通"/>
    <meta name="Copyright" content="蔬菜通版权所有"/>
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <link rel="shortcut icon" type="image/png" href="/img/logo.png">
    <link rel="stylesheet" href="/css/reset.css">
    <link rel="stylesheet" href="/css/index.css">
    <link rel="stylesheet" href="/css/common.css">
    <link rel="stylesheet" href="/css/common_2.css">
    <link rel="stylesheet" href="/css/user_profile.css">
    <link rel="stylesheet" href="/css/service.css">
    <link rel="stylesheet" href="/css/glide.core.min.css">
    <link rel="stylesheet" href="/css/glide.theme.min.css">

    <script type="text/javascript" src="/js/jquery.min.js"></script>
    <script type="text/javascript" src="/js/md5.js"></script>
    <script type="text/javascript" src="/js/cookie.js"></script>
    <script type="text/javascript" src="/js/ajaxfileupload.js"></script>
    <script type="text/javascript" src="/js/Util.js"></script>
    <script type="text/javascript" src="/js/validation.js"></script>
    <script type="text/javascript" src="/js/jquery_latest.js"></script>
    <script type="text/javascript" src="/js/glide.min.js"></script>


</head>
<body style="background-color: #fff;">
<div class="container">
    <%--<div class="heading clearfix">--%>
        <%--<div class="heading clearfix">--%>
            <%--<a href="javascript:history.back()" class="back"><img src="/img/tree_icons_back.png"></a>--%>

            <%--<h1 class="head-title">${emp.mm_emp_nickname}</h1>--%>
        <%--</div>--%>
    <%--</div>--%>
    <div class="content" style="width: 100%">
        <div id="Glide" class="glide">

            <div class="panel clearfix">
                <img src="${emp.mm_emp_cover}" alt="${emp.mm_emp_nickname}" class="head-pic">

                <div class="user-info">
                    <h2 class="name">${emp.mm_emp_nickname}</h2>
                    <%--<c:if test="${emp.mm_emp_type==0}"><h3 class="type">蔬菜经营户</h3></c:if>--%>
                    <%--<c:if test="${emp.mm_emp_type==1}"><h3 class="type">蔬菜会员</h3></c:if>--%>
                    <%--<h3 class="type">${emp.mm_level_num}</h3>--%>
                    <c:if test="${emp.mm_level_num==0}"><h3 class="type">vip1</h3></c:if>
                    <c:if test="${emp.mm_level_num==1}"><h3 class="type">vip2</h3></c:if>
                    <c:if test="${emp.mm_level_num==2}"><h3 class="type">vip3</h3></c:if>
                    <c:if test="${emp.mm_level_num==3}"><h3 class="type">vip4</h3></c:if>
                    <c:if test="${emp.mm_level_num==4}"><h3 class="type">vip5</h3></c:if>
                </div>
            </div>
            <div class="glide__wrapper">
                <ul class="glide__track">
                    <c:forEach items="${empAdVO}" var="e" varStatus="st">
                        <li class="glide__slide"><img src="${e.mm_emp_ad_pic}" alt="${e.mm_emp_ad_url}"></li>
                    </c:forEach>
                </ul>
            </div>

            <div class="glide__bullets"></div>

        </div>
        <script>
            $(function () {
                $('.glide').glide({
                    mode: 'horizontal',     // 幻灯片走向
                    autoplay: 5000,         // 自动播放，false为关闭自动播放
                    startAt: 0,             // 开始于哪个幻灯片
                    // paddings:'1rem',       // 幻灯片左右的padding 可以是单位，%
                    centered: true,         // 当前幻灯片在slides的中间
                    hoverpause: true,       // 鼠标悬停的时候暂停播放
                    autoheight: false,      // 设置包裹的slider为当前幻灯片的高度
                    keyboard: true,         // 光标方向键使幻灯片左右滑动
                    touchDistance: 80,      // 最小手指滑动距离，以触发滑动操作
                    dragDistance: 120,      // 最小鼠标拖动距离，以触发滑动操作
                    animationDuration: 400 // 动画时间 ms
                });
            })
        </script>
        <!-- GLIDE SLIDE END -->

        <!-- user-info -->
        <div class="content mb2">
            <div class="user-info w9">
                <h3 class="area-head">公司简介：</h3>

                <p class="company-info mb1">${emp.mm_emp_company}</p>
                <a class="button fill-green mb2" href="${emp.mm_emp_company_url}" target="_blank">公司微网站</a>

            </div>
            <div class="switcher mt1">
                <div class="w9">
                    <h2 class="area-head tac mb1">发布过的信息</h2>

                    <div class="button-group-x2">
                        <a class="button fill-green" href="javaScript:void(0)" onclick="searchProfile('0')">求购</a>
                        <a class="button fill-green" href="javaScript:void(0)" onclick="searchProfile('1')">供应</a>
                    </div>
                </div>
            </div>
        </div>

        <div class="recent">
            <c:forEach items="${list}" var="e" varStatus="st">
                <div class="item">
                    <div class="item-heading clearfix">
                        <a href="javaScript:void(0)" class="left clearfix">
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
                    <a href="javaScript:void(0)" onclick="showDetail('${e.mm_msg_id}')" class="item-content">
                            ${e.mm_msg_title}
                            ${e.mm_msg_content}
                    </a>

                    <div class="item-footer clearfix">
                            <%--<button class="read-status-unread"></button>--%>
                            <%--<div  class="share-left">--%>
                            <%--<div class="bdsharebuttonbox" >--%>
                            <%--<a class="bds_mshare" data-cmd="mshare"></a>--%>
                            <%--<a class="bds_qzone" data-cmd="qzone" href="javaScript:void(0)"></a>--%>
                            <%--<a class="bds_tsina" data-cmd="tsina"></a>--%>
                            <%--<a class="bds_tqq" data-cmd="tqq"></a>--%>
                            <%--<a class="bds_more" data-cmd="more">更多</a>--%>
                            <%--<a class="bds_count" data-cmd="count"></a>--%>
                            <%--</div>--%>
                            <%--</div>--%>
                        <a type="button" href="tel:${e.mm_emp_mobile}" class="button-phone"></a>
                        <a type="button" href="javaScript:void(0)" onclick="favourClick('${e.mm_msg_id}')"
                           class="button-fav"></a>

                                <c:if test="${ e.mm_msg_video ==null && e.mm_msg_picurl !='' && e.mm_msg_picurl != nul}">
                                    <a type="button" onclick="showDetail('${e.mm_msg_id}')" class="button-pic"></a>
                                </c:if>

                                <c:if test="${e.mm_msg_video !='' && e.mm_msg_video != nul}">
                                    <a type="button" onclick="showDetail('${e.mm_msg_id}')" class="button-video"></a>
                                </c:if>

                    </div>
                </div>
            </c:forEach>

            <input type="hidden" id="mm_msg_type" name="mm_msg_type" value="${query.mm_msg_type}">
            <input type="hidden" id="mm_emp_id" name="mm_emp_id" value="${query.mm_emp_id}">
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
<script type="text/javascript" charset="UTF-8">
    function searchIndex(e) {
        if (e.keyCode != 13) return;
        var _index = $("#index").val();
        var page = parseInt(_page);
        var mm_msg_type = $("#mm_msg_type").val();
        var mm_emp_id = $("#mm_emp_id").val();
        var size = $("#size").val();
        if (_index <= ${page.pageCount} && _index >= 1) {
            window.location.href = "/webvProfile/toProfile.do?page=" + page + "&size=" + size + "&mm_msg_type=" + mm_msg_type + "&mm_emp_id=" + mm_emp_id+ "&_t=" + new Date().getTime();
        } else {
            alert("请输入1-${page.pageCount}的页码数");
        }
    }
    function searchProfile(_mm_msg_type) {
        var mm_emp_id = $("#mm_emp_id").val();
        window.location.href = "/webvProfile/toProfile.do?page=1" + "&size=10" + "&mm_msg_type=" + _mm_msg_type + "&mm_emp_id=" + mm_emp_id+ "&_t=" + new Date().getTime();
    }

    function nextPage(_page) {
        var page = parseInt(_page);
        var mm_msg_type = $("#mm_msg_type").val();
        var size = $("#size").val();
        var mm_emp_id = $("#mm_emp_id").val();
        addCookie("contract_size", size, 36);
        if ((page <= ${page.pageCount} && page >= 1)) {
            window.location.href = "/webvProfile/toProfile.do?page=" + page + "&size=" + size + "&mm_msg_type=" + mm_msg_type + "&mm_emp_id=" + mm_emp_id+ "&_t=" + new Date().getTime();
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
</html>