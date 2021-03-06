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
    <title>蔬菜通|我的收藏</title>
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


    <script type="text/javascript" src="../js/jquery.min.js"></script>
    <script type="text/javascript" src="../js/md5.js"></script>
    <script type="text/javascript" src="../js/cookie.js"></script>
    <script type="text/javascript" src="../js/ajaxfileupload.js"></script>
    <script type="text/javascript" src="../js/Util.js"></script>
    <script type="text/javascript" src="../js/validation.js"></script>
    <script language="javascript" src="../js/jquery.js"></script>
    <script type="text/javascript" src="../js/jquery_latest.js"></script>

    <style type="text/css">
        #bd #detail a.rr-taobao-big {
            float: left;
            line-height: 38px;
            padding: 0 15px;
            font-size: 14px;
            border-radius: 2px;
            margin-left: 8px;
            border: 1px #f40 solid;
        }

        #bd #detail a.rrfl-before-big {
            background: #f40;
            color: #fff;
        }

        #bd #detail a.rrfl-before-big:hover {
            background: #f20;
        }

        #bd #detail a.rrfl-after-big {
            background: #fff;
            color: #f40;
        }

        #bd #detail a.rrfl-after-big:hover {
            background: #fff;
        }

        #bd #detail a.rr-taobao-normal {
            display: inline-block;
            padding: 0 5px;
            border-radius: 2px;
            line-height: 23px;
            margin-left: 5px;
            border: 1px #ff8e1b solid;
        }

        #bd #detail a.rr-taobao-normal:hover {
            background: #f60;
        }

        #bd #detail a.rrfl-before-normal {
            background: #ff8e1b;
            color: #fff;
        }

        #bd #detail a.rrfl-before-normal:hover {
            background: #f60;
        }

        #bd #detail a.rrfl-after-normal {
            background: #fff;
            color: #ff8e1b;
        }

        #bd #detail a.rrfl-after-normal:hover {
            background: #fff;
        }

        #page a.rr-tmall-big, #page a.rr-tmall-normal {
            display: inline-block;
            line-height: 30px;
            padding: 0 10px;
            border-radius: 2px;
            margin-left: 12px;
            border: 1px #c40000 solid;
        }

        #page .tb-attention a.rr-tmall-big, #page .tb-attention a.rr-tmall-normal {
            position: absolute;
            right: 50px;
        }

        #page a.rrfl-after-big, #page a.rrfl-after-normal {
            background: #fff;
            color: #c40000;
        }

        #page a.rrfl-after-big:hover, #page a.rrfl-after-normal:hover {
            background: #fff;
            text-decoration: none;
        }

        #page a.rrfl-before-big, #page a.rrfl-before-normal {
            background: #c40000;
            color: #fff;
        }

        #page a.rrfl-before-big:hover, #page a.rrfl-before-normal:hover {
            background: #c40000;
            text-decoration: none;
        }

        #itemInfo #choose-btn-append a.rr-jd-big, #itemInfo #choose-btn-append a.rr-jd-normal {
            line-height: 36px;
            background-color: rgb(222, 53, 60);
            color: #f0f0f0;
            padding: 0 10px;
            border-radius: 2px;
            text-shadow: 1px 1px 1px #999;
        }

        #itemInfo #choose-btn-append a.rr-jd-big:hover, #itemInfo #choose-btn-append a.rr-jd-normal:hover {
            background-color: rgb(237, 82, 87);
            color: #f0f0f0;
            padding: 0 10px;
            border-radius: 2px;
            text-shadow: 1px 1px 1px #999;
        }
    </style>
</head>
<body>
<!-- 顶部 -->
<div class="topbar">
    <div class="container clearfix">
        <ul class="top-login fl">
            <c:if test="${is_login=='1'}">
                <ul class="fl">
                    <li>
                        <div class="label" id="userName">
                            <a href="javascript:void(0)">${emp.mm_emp_nickname}</a>
                        </div>
                    </li>
                    <li>
                        <div class="label o-login">
                            <a href="javascript:void(0)" onclick="quiteClick()">退出</a></div>
                    </li>
                    <li>
                        <div class="label pr">
                            <a href="/netNoticeController/list.do?page=1" class="msg">消息<span
                                    class="msg-mark"></span></a></div>
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
                        <a title="马上注册，共享无限商机" href="javascript:void(0)" onclick="reg()"
                           rel="nofollow">免费注册 </a>
                    </li>
                </c:if>
            </ul>
        </ul>
        <ul class="top-nav fr">
            <li id="hn_home_id">
                <div class="label">
                    <a href="/hmtIndex/toIndex.do?page=1">蔬菜通求购信息</a></div>
            </li>
            <c:if test="${is_login=='1'}">
                <li>
                    <div class="label">
                        <a href="/netCenterController/toCenter.do" rel="nofollow">我的中心</a>
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
                    <i>&nbsp;</i><span><a href="javascript:void(0)" target="_blank" rel="nofollow">帮助中心</a></span></div>
                <div class="dropdown-layer dd-help-center">
                    <p>
                        <a href="/netWeixinController/toKefu.do" target="_blank" rel="nofollow">微信客服</a>
                        <a href="/netKefuController/toKefu.do" target="_blank" rel="nofollow">电话客服</a></p>
                </div>
            </li>
        </ul>
    </div>
</div>
<!--头部 导航-->
<div class="type-head">
    <h1 class="logo">
        <a href="/hmtIndex/toIndex.do?page=1&mm_msg_type=0" title="蔬菜通信息平台"></a>
    </h1>
</div>

<div class="type-nav">
    <div class="nav-con">
        <!-- 顶部栏目-->
        <ul class="nav-con-tit">
            <li><a href="/hmtIndex/toIndex.do?page=1&mm_msg_type=0" class="nav-tstj">求购大厅</a></li>
            <li><a href="/hmtIndex/toIndex.do?page=1&mm_msg_type=1" class="nav-dptj">供应大厅</a></li>
            <li><a href="/netTopController/toTop.do?page=1" class="nav-tstj">金牌榜</a></li>
            <li><a href="/netCenterController/toCenter.do" class="nav-zxhq">服务中心</a></li>
            <li><a href="../html/download.html" target="_blank" class="nav-zxhq">手机版</a></li>
        </ul>
    </div>
</div>
<!--头部 导航 end-->

<input type="hidden" id="is_login" name="is_login" value="${is_login}">
<input type="hidden" id="accessToken" name="accessToken" value="${emp.access_token}">
<input type="hidden" id="mm_emp_id" name="mm_emp_id" value="${emp.mm_emp_id}">

<div class="container wrap-1190">

    <form action="supply.htm" id="filterForm" class="fl" style="width: 956px;">
        <%--<div class="noticebar mt_15">--%>
        <%--<input type="text" id="keyword" name="keyword" autocomplete="off" class="notice-input" value="" placeholder="标题|手机号|公司名称|联系人">--%>
        <%--<a href="javaScript:void(0)" onclick="searchIndex(event)" class="notice-submit"> <i class="lee-ico lee-cx"></i>搜索</a>--%>
        <%--<span class="notice-msg"><a href="#" target="_blank" rel="nofollow">欢迎使用蔬菜通信息平台，请谨慎核实信息内容!</a></span>--%>
        <%--</div>--%>
        <div class="tabs mt_15">
            <ul class="tabs-list">
                <li class="cur" onclick="javascript:changeShowType('0');"><a>我的收藏</a></li>
            </ul>
        </div>
        <div class="pro-list mb_10">
            <ul class="pro-list-title pt_15">
                <li class="l4">时间</li>
                <li class="l1">内容</li>
                <li class="l5">联系人</li>
            </ul>
            <ul>

                <c:forEach items="${list}" var="e" varStatus="st">
                    <li class="text-list">
                        <a href="javascript:void(0)" onclick="showDetail('${e.mm_msg_id}')">
                            <span class="l4">${e.dateline}</span>
                            <span class="l1">${e.mm_msg_title}</span>
                            <span class="l5">${e.mm_emp_nickname}</span>
			                <span class="l6">
                                <c:if test="${e.is_miaomu=='1'}"><img style="width: 25px;height: 32px;"
                                                                      src="../img/tree_icons_trust.png"
                                                                      title="蔬菜协会"></c:if>
								<c:if test="${e.is_chengxin=='1'}"><img style="width: 25px;height: 32px;"
                                                                        src="../img/tree_icons_group.png"
                                                                        title="诚信会员"></c:if>
			                </span>
                            <span class="l6"><em class="text-list-view">查看详情</em></span>
                        </a>
                    </li>
                </c:forEach>

            </ul>

            <div class="clear"></div>
        </div>
    </form>
    <div class="sides mt_15">
        <div class="release-but mb_15"><a href="javascript:void(0)" target="_blank" onclick="addMsg()"><i
                class="lee-ico lee-fb"></i> &nbsp; 发布供应</a></div>
        <div class="release-but mb_15"><a href="/netKefuController/toKefu.do" target="_blank"><i
                class="lee-ico lee-fb"></i> &nbsp; 客服中心</a></div>
        <div class="ad2">


            <a href="../html/download.html" target="_blank" title="蔬菜通app" rel="nofollow">
                <img src="../hmt/images/2C604DU858ChRkRlcHTCeAU9-hAAHy19HEc7E108.jpg" alt="蔬菜通app" width="216"
                     height="353">
            </a>


        </div>
        <div class="sides-hot mtb_15">
            <h2>热门信息</h2>
            <ul>
                <c:forEach items="${listsHot}" var="e" varStatus="st">
                    <li>
                        <c:if test="${e.mm_msg_type=='0'}"><em class="hot">[求购]</em></c:if>
                        <c:if test="${e.mm_msg_type=='1'}"><em>[供应]</em></c:if>
                        <h3><a target="_blank" href="javascript:void(0)"
                               onclick="showDetail('${e.mm_msg_id}')">${e.mm_msg_title}</a></h3>

                        <p></p>
                    </li>
                </c:forEach>
            </ul>
        </div>
    </div>

</div>
<!--内容 end-->

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

    function addMsg() {
        var is_login = $("#is_login").val();
        if (is_login == 1) {
            //登陆了
            if (${emp.is_upate_profile == '1'}) {
                window.location.href = "/netAddRecordController/toAddRecord.do";
            } else {
                alert("请先完善您的个人资料");
                window.location.href = "/netProfileController/toUpdateProfile.do";
            }
        } else {
            //登录页面跳转
            window.location.href = "/netLoginController/toLogin.do";
        }
    }
</script>

<script type="text/javascript" charset="UTF-8">
    <%--function searchIndex(e,_page){--%>
    <%--var _index = $("#index").val();--%>
    <%--var page = parseInt(_page);--%>
    <%--var size = $("#size").val();--%>
    <%--var keyword = $("#keyword").val();--%>
    <%--if(_index <= ${page.pageCount} && _index >= 1){--%>
    <%--window.location.href="/hmtIndex/toIndex.do?page="+_index+"&size="+size+"&keyword="+keyword;--%>
    <%--}else{--%>
    <%--alert("请输入1-${page.pageCount}的页码数");--%>
    <%--}--%>
    <%--}--%>

    <%--function nextPage(_page) {--%>
    <%--var page = parseInt(_page);--%>
    <%--var size = $("#size").val();--%>
    <%--var keyword = $("#keyword").val();--%>
    <%--addCookie("contract_size", size, 36);--%>
    <%--if ((page <= ${page.pageCount} && page >= 1)) {--%>
    <%--window.location.href="/hmtIndex/toIndex.do?page="+page+"&size="+size+"&keyword="+keyword;--%>
    <%--} else {--%>
    <%--alert("请输入1-${page.pageCount}的页码数");--%>
    <%--}--%>
    <%--}--%>

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

