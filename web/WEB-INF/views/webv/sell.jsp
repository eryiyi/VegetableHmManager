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

    <link rel="stylesheet" href="/css/glide.core.min.css">
    <link rel="stylesheet" href="/css/glide.theme.min.css">

    <script type="text/javascript" src="/js/jquery.min.js"></script>
    <script type="text/javascript" src="/js/md5.js"></script>
    <script type="text/javascript" src="/js/cookie.js"></script>
    <script type="text/javascript" src="/js/ajaxfileupload.js"></script>
    <script type="text/javascript" src="/js/Util.js"></script>
    <script type="text/javascript" src="/js/validation.js"></script>
    <script language="javascript" src="/js/jquery.js"></script>
    <script type="text/javascript" src="/js/jquery_latest.js"></script>
    <script type="text/javascript" src="/js/glide.min.js"></script>
    <style type="text/css">
        .hide {
            display: none;
        }

        .show {
            display: inline-block;
        }
    </style>
    <script type="text/javascript">
        /*注释发布下拉类别*/
        $(function () {
            $("#rightpic").click(function () {
                var isshow = $("#menu").attr("class");
                if (isshow == "imgboxtxt hide") {

                    $("#menu").removeClass("hide");
                    $("#menu").addClass("show");
                }
                else {
                    $("#menu").removeClass("show");
                    $("#menu").addClass("hide");
                }
            })
        })
    </script>
</head>
<body>
<div class="container">
    <!-- HEADING -->
    <div class="heading clearfix">
        <div class="left">
            <c:if test="${is_login=='1'}"><a class="location" onclick="selectPro()">${emp.areaName}-查看更多</a></c:if>
            <c:if test="${is_login=='0'}"><a class="login" href="javaScript:void(0)" onclick="login()">登录</a></c:if>
        </div>
        <form action="" class="search-bar clearfix">
            <input type="text" id="keyword" name="keyword" placeholder="标题|手机号|公司名称">
            <button onclick="searchIndex(event)" style="float:right ">搜索</button>
        </form>
        <div class="right"><a class="publish" href="javaScript:void(0)" onclick="addMsg()">发布</a></div>
    </div>
    <!-- CONTENT -->
    <div class="content">
        <c:if test="${listAd !=null && listAd.size() > 0}">
            <div id="Glide" class="glide">
                <div class="glide__wrapper">
                    <ul class="glide__track">
                        <c:forEach items="${listAd}" var="e" varStatus="st">
                            <a href="${e.mm_ad_url}" target="_blank">
                                <li class="glide__slide"><img src="${e.mm_ad_pic}" alt="${e.mm_ad_url}"></li>
                            </a>
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
        </c:if>

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
                    <a href="tel:${e.mm_emp_mobile}" class="button-phone"></a>
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

        <c:if test="${is_login=='1'}"><a href="/html/download.html" class="warning"
                                         target="_blank">下载客户端查看更多内容...</a></c:if>
        <c:if test="${is_login=='0'}"><a href="/webvLoginController/toLogin.do"
                                         class="warning">查看更多信息，请登录...</a></c:if>

        <c:if test="${is_login=='1'}">
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
        </c:if>

    </div>
    <!-- TOOLBAR -->
    <div class="toolbar">
        <c:if test="${is_login=='1'}">
            <a href="javaScript:void(0)" onclick="toPage('/webv/toIndex.do','1')" class="buy"></a>
            <a href="javaScript:void(0)" onclick="toPage('/webvSell/toSell.do','1')" class="sell sell-active"></a>
            <a href="javaScript:void(0)" onclick="toPage('/webvShangquanController/toShangquan.do','1')" class="recommend"></a>
            <a href="javaScript:void(0)" onclick="toPage('/webvServiceController/toService.do','1')" class="mine"></a>
        </c:if>
        <c:if test="${is_login=='0'}">
            <a href="/webvLoginController/toLogin.do" id="cd-popup-trigger1" class="buy"></a>
            <a href="/webvLoginController/toLogin.do" id="cd-popup-trigger2" class="sell sell-active"></a>
            <a href="/webvLoginController/toLogin.do" id="cd-popup-trigger3" class="recommend"></a>
            <a href="/webvLoginController/toLogin.do" id="cd-popup-trigger4" class="mine"></a>
        </c:if>
    </div>
    <!-- TOOLBAR -->
</div>

<%--<link rel="stylesheet" href="/css/dialog_reset.css">--%>
<%--<!-- CSS reset -->--%>
<%--<link rel="stylesheet" href="/css/dialog_style.css">--%>
<%--<!-- Resource style -->--%>
<%--<script src="/js/dialog_main.js"></script>--%>
<%--<!-- Resource jQuery -->--%>

<%--<div class="cd-popup" role="alert">--%>
    <%--<div class="cd-popup-container">--%>
        <%--<p>请先注册或联系管理员</p>--%>
        <%--<ul class="cd-buttons">--%>
            <%--<li><a href="javaScript:void(0)" onclick="reg()">注册</a></li>--%>
            <%--<li><a href="javaScript:void(0)" onclick="login()">登录</a></li>--%>
        <%--</ul>--%>
        <%--<ul style="background: #ffffff;line-height: 45px;">--%>
            <%--<li><a href="/webvKefuController/toKefu.do">客服中心</a></li>--%>
        <%--</ul>--%>
        <%--<a href="javaScript:void(0)" class="cd-popup-close img-replace">关闭</a>--%>
    <%--</div>--%>
    <%--<!-- cd-popup-container -->--%>
<%--</div>--%>
<!-- cd-popup -->

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
            alert("请先登录");
        }
    }

    function showDetail(_mm_msg_id) {
        window.location.href = "/webvRecordController/toDetail.do?mm_msg_id=" + _mm_msg_id;
    }

    function login() {
        //登录页面跳转
        window.location.href = "/webvLoginController/toLogin.do";
    }
    function reg() {
        //注册页面跳转
        window.location.href = "/webvRegController/toReg.do";
    }

    function selectPro() {
        //页面跳转
        window.location.href = "/webvSelectProvinceController/toSelectProvince.do";
    }
    function addMsg() {
        var is_login = $("#is_login").val();
        if (is_login == 1) {
            //登陆了
            if (${emp.is_upate_profile == '1'}) {
                window.location.href = "/webvAddRecordController/toAddRecord.do";
            } else {
                window.location.href = "/webvProfile/toUpdateProfile.do";
            }
        } else {
            //登录页面跳转
            window.location.href = "/webvLoginController/toLogin.do";
        }
    }

    function guanzhuArea() {
        var is_login = $("#is_login").val();
        if (is_login == 1) {
            //查询是否关注了区域
            var mm_emp_id = $("#mm_emp_id").val();
            $.ajax({
                cache: true,
                type: "POST",
                url: "/webvGuanzhuController/webvGetGuanzhu.do",
                data: {"index": "1", "size": "10", "mm_emp_id": mm_emp_id},
                async: false,
                success: function (_data) {
                    var data = $.parseJSON(_data);
                    if (data.success) {
                        window.location.href = "/webvGuanzhuController/guanzhuArea.do?page=1";
                    } else {
                        var _case = {
                            1: "操作失败，请稍后重试！",
                            2: "您尚未申请关注区域，请设置关注区域！",
                            3: "您已经申请了关注区域！请等待管理员审核",
                            4: "您申请的关注区域未通过审核，请联系客服！",
                            9: "账号过期，请重新登录！"
                        };
                        alert(_case[data.code])
                        if (data.code == 2) {
                            //跳转到设置关注区域页面
                            window.location.href = "/webvGuanzhuController/toGuanzhu.do";
                        }
                    }
                }
            });
        } else {
            //登录页面跳转
            window.location.href = "/webvLoginController/toLogin.do";
        }
    }

</script>

<script type="text/javascript" charset="UTF-8">
    function searchIndex(e) {
        if (e.keyCode != 13) return;
        var _index = $("#index").val();
        var page = parseInt(_page);
        var size = $("#size").val();
        var keyword = $("#keyword").val();
        if (_index <= ${page.pageCount} && _index >= 1) {
            window.location.href = "/webvSell/toSell.do?page=" + page + "&size=" + size + "&keyword=" + keyword+ "&_t=" + new Date().getTime();
        } else {
            alert("请输入1-${page.pageCount}的页码数");
        }
    }

    function nextPage(_page) {
        var page = parseInt(_page);
        var size = $("#size").val();
        var keyword = $("#keyword").val();
        addCookie("contract_size", size, 36);
        if ((page <= ${page.pageCount} && page >= 1)) {
            window.location.href = "/webvSell/toSell.do?page=" + page + "&size=" + size + "&keyword=" + keyword+ "&_t=" + new Date().getTime();
        } else {
            alert("请输入1-${page.pageCount}的页码数");
        }
    }

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