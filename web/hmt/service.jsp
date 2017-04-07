<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="um" uri="/unimanager-tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html lang="zh_CH">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <link rel="icon" href="../img/icon.png" type="image/png"/>
    <meta name="renderer" content="webkit">
    <title>蔬菜通|服务中心</title>
    <meta name="keywords" content="蔬菜通,惠民,蔬菜,花木,蔬菜交易,花木求购,蔬菜求购,花木资讯,花木论坛,花木销售,蔬菜销售,蔬菜资讯,绿化蔬菜,花草,苗联通,白蜡,菜园,惠民皂户李镇,蔬菜协会">
    <meta name="Description"
          content=" 蔬菜通是惠民县本地第一蔬菜供求信息平台、信息通讯平台，突破了蔬菜大市场、绿化工程公司、经纪人、苗农之间的信息壁垒，让市场订单蔬菜不愁买，苗农种植蔬菜不愁卖！为本地蔬菜行业发展助力，让经纪人足不出户，随时随地做生意！让苗农及时了解市场行情，蔬菜卖价更高更容易！">
    <link href="../hmt/css/common/index-type.css" rel="stylesheet" type="text/css"/>
    <link href="../hmt/css/common/common.css" rel="stylesheet" type="text/css"/>
    <link href="../hmt/css/common/base.css" rel="stylesheet" type="text/css"/>
    <link href="../hmt/css/frame.css" rel="stylesheet" type="text/css"/>
    <link href="../hmt/css/category-vegetable/common.css" rel="stylesheet" type="text/css"/>
    <link href="../hmt/css/search/style.css" rel="stylesheet" type="text/css"/>
    <link href="../hmt/css/search/base.css" rel="stylesheet" type="text/css"/>
    <link href="../hmt/css/supply/index.css" rel="stylesheet" type="text/css"/>
    <link href="../hmt/css/xihongshi.css" rel="stylesheet" type="text/css"/>

    <script type="text/javascript" src="../js/jquery.min.js"></script>
    <script type="text/javascript" src="../js/md5.js"></script>
    <script type="text/javascript" src="../js/cookie.js"></script>
    <script type="text/javascript" src="../js/ajaxfileupload.js"></script>
    <script type="text/javascript" src="../js/Util.js"></script>
    <script type="text/javascript" src="../js/validation.js"></script>
    <script language="javascript" src="../js/jquery.js"></script>
    <script type="text/javascript" src="../js/jquery_latest.js"></script>

</head>
<body>

<!-- 顶部 -->
<!-- 顶部 -->
<div class="topbar">
    <div class="container clearfix">
        <ul class="top-login fl">
            <li class="dropdown">
                <div class="dropdown-label dl-city">
                    <i>&nbsp;</i><span class="tit">所在地：</span><span id="topbar_address">山东</span></div>
                <div class="dropdown-layer dd-city-list">
                    <div class="list">
                        <a data-id="45081" href="javascript:void(0)">北京</a><a data-id="45083" href="javascript:void(0)">上海</a><a
                            data-id="45082" href="javascript:void(0)">天津</a><a data-id="45084"
                                                                               href="javascript:void(0)">重庆</a><a
                            data-id="3" href="javascript:void(0)">河北</a><a data-id="4"
                                                                           href="javascript:void(0)">山西</a><a
                            data-id="16" href="javascript:void(0)">河南</a><a data-id="6" href="javascript:void(0)">辽宁</a><a
                            data-id="7" href="javascript:void(0)">吉林</a><a data-id="8" href="javascript:void(0)">黑龙江</a><a
                            data-id="5" href="javascript:void(0)">内蒙古</a><a data-id="10"
                                                                            href="javascript:void(0)">江苏</a><a
                            data-id="15" href="javascript:void(0)" class="selected">山东</a><a data-id="12"
                                                                                             href="javascript:void(0)">安徽</a><a
                            data-id="11" href="javascript:void(0)">浙江</a><a data-id="13"
                                                                            href="javascript:void(0)">福建</a><a
                            data-id="17" href="javascript:void(0)">湖北</a><a data-id="18" href="javascript:void(0)"
                                                                            class="">湖南</a>
                        <a data-id="19" href="javascript:void(0)">广东</a>
                        <a data-id="20" href="javascript:void(0)">广西</a><a
                            data-id="14" href="javascript:void(0)">江西</a><a data-id="23"
                                                                            href="javascript:void(0)">四川</a><a
                            data-id="21" href="javascript:void(0)">海南</a><a data-id="24"
                                                                            href="javascript:void(0)">贵州</a><a
                            data-id="25" href="javascript:void(0)">云南</a><a data-id="26"
                                                                            href="javascript:void(0)">西藏</a><a
                            data-id="27" href="javascript:void(0)">陕西</a><a data-id="28"
                                                                            href="javascript:void(0)">甘肃</a><a
                            data-id="29" href="javascript:void(0)">青海</a><a data-id="30"
                                                                            href="javascript:void(0)">宁夏</a><a
                            data-id="31" href="javascript:void(0)">新疆</a><a data-id="32"
                                                                            href="javascript:void(0)">台湾</a><a
                            data-id="33" href="javascript:void(0)">香港</a><a data-id="34"
                                                                            href="javascript:void(0)">澳门</a></div>
                </div>
            </li>

            <c:if test="${is_login=='1'}">
                <ul class="fl">
                    <li>
                        <div class="label" id="userName">
                            <a href="javascript:void(0)">${emp.mm_emp_nickname}</a>
                        </div>
                    </li>
                    <li>
                        <div class="label o-login">
                            <a href="javascript:void(0)" onclick="quiteClick()">
                                退出</a></div>
                    </li>
                    <li>
                        <div class="label pr">
                            <a href="javascript:void(0)" class="msg">消息<span class="msg-mark"></span></a></div>
                    </li>
                </ul>
            </c:if>

            <ul class="fl">
                <li class="label orange">您好，欢迎来到蔬菜通信息平台</li>
                <c:if test="${is_login=='0'}">
                    <li class="label p-login">
                        <a title="马上登录，享受更多会员专享服务" href="javascript:void(0)" onclick="login()"
                           rel="nofollow">请登录</a>
                    </li>
                    <li class="label">
                        <a title="马上注册，共享无限农业商机" href="javascript:void(0)" onclick="reg()"
                           rel="nofollow">免费注册 </a>
                    </li>
                </c:if>
            </ul>
        </ul>
        <ul class="top-nav fr">
            <li id="hn_home_id">
                <div class="label">
                    <a href="index.htm">蔬菜通求购信息</a></div>
            </li>

            <c:if test="${is_login=='1'}">
                <li>
                    <div class="label">
                        <a href="buyer/main.htm" rel="nofollow">我的中心</a>
                    </div>
                </li>
            </c:if>

            <li class="dropdown">
                <div class="dropdown-label">
                    <i>&nbsp;</i><span><a href="javaScript:void(0)" target="_blank"
                                          rel="nofollow">手机蔬菜通</a></span></div>
                <div class="dropdown-layer dd-hn-qrcode">
                    <div class="qrcode">
                        <img src="../hmt/images/category-vegetable/topbar-hn-app.png" alt="手机蔬菜通">

                        <p>
                            <span>扫一扫下载</span><span>手机蔬菜通App</span></p>
                    </div>
                </div>
            </li>
            <li class="dropdown">
                <div class="dropdown-label">
                    <i>&nbsp;</i><span>关注蔬菜通</span></div>
                <div class="dropdown-layer dd-hn-qrcode">
                    <div class="qrcode">
                        <img src="../hmt/images/category-vegetable/topbar-hn-weixin.png" alt="蔬菜通官方微信">

                        <p>
                            <span>扫码关注</span><span>蔬菜通官方微信</span></p>
                    </div>
                </div>
            </li>
            <li class="dropdown">
                <div class="dropdown-label">
                    <i>&nbsp;</i><span><a href="#" target="_blank" rel="nofollow">帮助中心</a></span></div>
                <div class="dropdown-layer dd-help-center">
                    <p>
                        <a href="#" target="_blank" rel="nofollow">常见问题</a><a
                            href="#" target="_blank" rel="nofollow">联系客服</a></p>
                </div>
            </li>
        </ul>
    </div>
</div>
<!--头部 导航-->
<div class="type-head">
    <h1 class="logo">
        <a href="index.htm" title="蔬菜通信息平台"></a>
    </h1>

    <div class="search">
        <form target="_blank" method="get" id="searchForm" action="category.htm">
            <div class="sear-area">
                <div style="z-index: 15" class="autoComplete">
                    <input type="text" placeholder="西红柿" defaulturl="" class="sear-inpt broder_r_no"
                           autocomplete="off">
                    <ul class="green" style="display: none;">
                        <li></li>
                    </ul>
                </div>
                <input type="submit" value="搜索" class="sear-btn">
            </div>
        </form>
        <ul style="display: block;" class="keylist" id="idkeyList">
            <li>热门搜索：</li>
            <li><a title="大白菜" href="#" rel="nofollow">大白菜</a></li>
            <li><a title="包菜" href="#" rel="nofollow">包菜</a></li>
            <li><a title="萝卜" href="#" rel="nofollow">萝卜</a></li>
            <li><a title="丝瓜" href="#" rel="nofollow">丝瓜</a></li>
            <li><a title="西红柿" href="category.htm" rel="nofollow">西红柿</a></li>
        </ul>
    </div>

</div>
<div class="type-nav">
    <div class="nav-con">
        <div class="menu-c-nav">
            <!-- 精选分类 title-->
            <a href="/netTopController/toTop.do?page=1">
                <div class="menu-c-tit">
                    <span class="">金牌榜</span>
                </div>
            </a>
        </div>
        <!-- 顶部栏目-->
        <ul class="nav-con-tit">
            <li><a href="/hmtIndex/toIndex.do?page=1&mm_msg_type=0" class="nav-tstj">求购大厅</a></li>
            <li><a href="/hmtIndex/toIndex.do?page=1&mm_msg_type=1" class="nav-dptj">供应大厅</a></li>
            <li><a href="javascript:void(0)" class="nav-zxhq">服务中心</a></li>
            <li><a href="../html/download.html" target="_blank" class="nav-zxhq">手机版</a></li>
        </ul>
    </div>
</div>

<!--头部 导航 end-->


<jsp:include page="footer.jsp" flush="true"/>

<script src="../hmt/js/home.js" type="text/javascript"></script>
<script src="../hmt/js/jquery.SuperSlide.2.1.1.js" type="text/javascript"></script>
<!--首页右侧焦点图调用js-->
<!--搜索调用js 会将logo链接至生产-->
<script src="../hmt/js/top_foot.js" type="text/javascript"></script>
<script src="../hmt/js/vegetable.js" type="text/javascript"></script>
<!--蔬菜二级类目调用js--
</html>-->
</body>

<script>
    function reg() {
        //注册页面跳转
        window.location.href = "/netRegController/toReg.do";
    }
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
        window.location.href = "/netRecordController/toDetail.do?mm_msg_id=" + _mm_msg_id;
    }

    function login() {
        //登录页面跳转
        window.location.href = "/netLoginController/toLogin.do";
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
</script>

<script type="text/javascript" charset="UTF-8">
    function searchIndex(e, _page) {
        var _index = $("#index").val();
        var page = parseInt(_page);
        var size = $("#size").val();
        var keyword = $("#keyword").val();
        if (_index <= ${page.pageCount} && _index >= 1) {
            window.location.href = "/hmtIndex/toIndex.do?page=" + _index + "&size=" + size + "&keyword=" + keyword;
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
            window.location.href = "/hmtIndex/toIndex.do?page=" + page + "&size=" + size + "&keyword=" + keyword;
        } else {
            alert("请输入1-${page.pageCount}的页码数");
        }
    }

    function quiteClick() {
        //退出
        $.ajax({
            cache: true,
            type: "POST",
            url: "/netLoginController/toQuite.do",
            data: {},
            async: false,
            success: function (_data) {
                var data = $.parseJSON(_data);
                if (data.success) {
                    alert("您已退出账号，请重新登录！");
                    window.location.href = "/netLoginController/toLogin.do";
                } else {
                    var _case = {1: "退出账号失败！", 9: "账号过期，请重新登录！"};
                    alert(_case[data.code])
                }
            }
        });
    }
</script>
</html>
