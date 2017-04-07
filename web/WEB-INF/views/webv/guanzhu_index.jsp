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
    <script language="javascript" src="/js/jquery.js"></script>
    <style type="text/css">
        .hide {
            display: none;
        }

        .show {
            display: inline-block;
        }
    </style>

</head>
<body>
<div class="container">
    <!-- HEADING -->
    <%--<div class="heading clearfix">--%>
        <%--<!-- HEADING -->--%>
        <%--<div class="heading clearfix">--%>
            <%--<a href="javascript:voi(0)" onclick="selectPro()" class="back"><img src="/img/tree_icons_back.png"--%>
                                                                                <%--alt=""></a>--%>

            <%--<h1 class="head-title">关注区域</h1>--%>
        <%--</div>--%>
    <%--</div>--%>
    <!-- CONTENT -->
    <div class="content">
        <ul class="category clearfix">
            <c:forEach items="${listArea}" var="e" varStatus="st">
                <c:if test="${countryid == e.areaID}">
                    <li><a class="active" href="javaScript:void(0)" onclick="gzClickArea('${e.areaID}')">${e.area}</a>
                    </li>
                </c:if>
                <c:if test="${countryid != e.areaID}">
                    <li><a href="javaScript:void(0)" onclick="gzClickArea('${e.areaID}')">${e.area}</a></li>
                </c:if>
            </c:forEach>
        </ul>

        <input type="hidden" id="mm_msg_type" name="mm_msg_type" value="${query.mm_msg_type}">
        <input type="hidden" id="countryid" name="countryid" value="${countryid}">
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
        <c:if test="${is_login=='0'}"><a href="/webvLoginController/toLogin.do" class="warning">请先登录...</a></c:if>
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
    <div class="toolbar-2">

        <c:if test="${query.mm_msg_type =='0'}">
            <a href="javaScript:void(0)" onclick="gzClickAreaT('${countryid}','0')"
               class="buy buy-active"></a>
            <a href="javaScript:void(0)"  onclick="gzClickAreaT('${countryid}','1')"
               class="sell"></a>
        </c:if>
        <c:if test="${query.mm_msg_type =='1'}">
            <a href="javaScript:void(0)"  onclick="gzClickAreaT('${countryid}','0')"
               class="buy"></a>
            <a href="javaScript:void(0)"  onclick="gzClickAreaT('${countryid}','1')"
               class="sell sell-active"></a>
        </c:if>
    </div>
    <!-- TOOLBAR -->
</div>

</body>

<script>
    function selectPro() {
        //页面跳转
        window.location.href = "/webvSelectProvinceController/toSelectProvince.do";
    }

//    function toPage(_url, _page, _type) {
//
//        if (_page != '') {
//            window.location.href = _url + "?page=" + _page + "&mm_msg_type=" + _type;
//        }
//    }
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

    function searchIndex(e) {
        if (e.keyCode != 13) return;
        var _index = $("#index").val();
        var page = parseInt(_page);
        var size = $("#size").val();
        var mm_msg_type = $("#mm_msg_type").val();
        var countryid = $("#countryid").val();
        if (_index <= ${page.pageCount} && _index >= 1) {
            window.location.href = "/webvGuanzhuController/guanzhuArea.do?page=" + page + "&size=" + size + "&countryid=" + countryid + "mm_msg_type" + mm_msg_type+ "&_t=" + new Date().getTime();
        } else {
            alert("请输入1-${page.pageCount}的页码数");
        }
    }

    function nextPage(_page) {
        var page = parseInt(_page);
        var size = $("#size").val();
        var mm_msg_type = $("#mm_msg_type").val();
        var countryid = $("#countryid").val();
        addCookie("contract_size", size, 36);
        if ((page <= ${page.pageCount} && page >= 1)) {
            window.location.href = "/webvGuanzhuController/guanzhuArea.do?page=" + page + "&size=" + size + "&countryid=" + countryid + "&mm_msg_type=" + mm_msg_type+ "&_t=" + new Date().getTime();
        } else {
            alert("请输入1-${page.pageCount}的页码数");
        }
    }

    function gzClickArea(_countryid) {
        var size = $("#size").val();
        var mm_msg_type = $("#mm_msg_type").val();
        window.location.href = "/webvGuanzhuController/guanzhuArea.do?page=1" + "&size=" + size + "&countryid=" + _countryid + "&mm_msg_type=" + mm_msg_type+ "&_t=" + new Date().getTime();
    }

    function gzClickAreaT(_countryid,_mm_msg_type) {
        var size = $("#size").val();
        window.location.href = "/webvGuanzhuController/guanzhuArea.do?page=1" + "&size=" + size + "&countryid=" + _countryid + "&mm_msg_type=" + _mm_msg_type+ "&_t=" + new Date().getTime();
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