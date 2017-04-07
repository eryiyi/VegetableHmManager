<%@ taglib prefix="um" uri="/unimanager-tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html lang="zh_CH">
<head>
    <meta charset="utf-8">
    <title>${emp.mm_emp_nickname}花木蔬菜求购信息、供应信息、金牌榜和服务中心，具备一键拨号、一键导航、一键分享功能。整合全国蔬菜行业资源，服务于全国蔬菜行业发展，受到全国蔬菜行业人士好评.以蔬菜行业供求信息为基础，搭建起农村信息及电商为一体的网络平台</title>
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
<body>
<div class="container">
    <%--<div class="heading clearfix">--%>
        <%--<h1 class="head-title">用户中心</h1>--%>
    <%--</div>--%>
    <input type="hidden" id="is_login" name="is_login" value="${is_login}">
    <input type="hidden" id="accessToken" name="accessToken" value="${emp.access_token}">
    <input type="hidden" id="mm_emp_id" name="mm_emp_id" value="${emp.mm_emp_id}">

    <div id="Glide" class="glide">
        <div class="panel clearfix">
            <img src="${emp.mm_emp_cover}" alt="${emp.mm_emp_nickname}" class="head-pic">

            <div class="user-info">
                <h2 class="name">${emp.mm_emp_nickname}</h2>
                <%--<c:if test="${emp.mm_emp_type==0}"><h3 class="type">蔬菜经营户</h3></c:if>--%>
                <%--<c:if test="${emp.mm_emp_type==1}"><h3 class="type">蔬菜会员</h3></c:if>--%>
                <c:if test="${emp.mm_level_num==0}"><h3 class="type">会员等级:vip1</h3></c:if>
                <c:if test="${emp.mm_level_num==1}"><h3 class="type">会员等级:vip2</h3>

                    <h3 class="type">到期时间：${emp.mm_emp_endtime}</h3></c:if>
                <c:if test="${emp.mm_level_num==2}"><h3 class="type">会员等级:vip3</h3>

                    <h3 class="type">到期时间：${emp.mm_emp_endtime}</h3></c:if>
                <c:if test="${emp.mm_level_num==3}"><h3 class="type">会员等级:vip4</h3>

                    <h3 class="type">到期时间：${emp.mm_emp_endtime}</h3></c:if>
                <c:if test="${emp.mm_level_num==4}"><h3 class="type">会员等级:vip5</h3>

                    <h3 class="type">到期时间：${emp.mm_emp_endtime}</h3></c:if>
                <%--<h3 class="type">注册时间：${emp.mm_emp_regtime}</h3>--%>

                <%--<h3 class="type">注册地区：${emp.provinceName}${emp.cityName}${emp.areaName}</h3>--%>
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
    <div class="content">
        <!-- mine -->
        <h4 class="title">我的</h4>

        <div class="icons clearfix">
            <a href="/webvProfile/toProfile.do?mm_emp_id=${emp.mm_emp_id}&page=1" class="icon">
                <div class="icon-pic"><img src="/img/tree_user_profile.png" alt=""></div>
                <h5 class="icon-name">个人主页</h5>
            </a>
            <a href="http://139.129.207.95:82" target="_blank" class="icon">
                <div class="icon-pic"><img src="/img/tree_user_massage.png" alt=""></div>
                <h5 class="icon-name">短信平台</h5>
            </a>
            <a href="javaScript:void(0)" onclick="guanzhuArea()" class="icon">
                <div class="icon-pic"><img src="/img/tree_user_see.png" alt=""></div>
                <h5 class="icon-name">关注区域</h5>
            </a>
            <a href="/webvNoticeController/list.do?page=1" class="icon">
                <div class="icon-pic"><img src="/img/tree_user_notice.png" alt=""></div>
                <h5 class="icon-name">公告</h5>
            </a>
            <a href="javaScript:void(0)" onclick="vipClick()" class="icon">
                <div class="icon-pic"><img src="/img/tree_user_VIP.png" alt=""></div>
                <h5 class="icon-name">升级VIP</h5>
            </a>
            <a href="/webvNearbyController/nearby.do" class="icon">
                <div class="icon-pic"><img src="/img/tree_user_nearby.png" alt=""></div>
                <h5 class="icon-name">附近经纪人</h5>
            </a>
            <a href="/webvMineFavourController/favour.do?mm_emp_id=${emp.mm_emp_id}" class="icon">
                <div class="icon-pic"><img src="/img/tree_user_fav.png" alt=""></div>
                <h5 class="icon-name">我的收藏</h5>
            </a>
            <a href="/webvKefuController/toKefu.do" class="icon">
                <div class="icon-pic"><img src="/img/tree_user_crs.png" alt=""></div>
                <h5 class="icon-name">客服中心</h5>
            </a>
            <a href="javaScript:void(0)" class="icon" onclick="noClick()">
                <div class="icon-pic"><img src="/img/tree_user_zhaoshang.png" alt=""></div>
                <h5 class="icon-name">全国招商</h5>
            </a>

            <a href="/webvWeixinController/toKefu.do" class="icon">
                <div class="icon-pic"><img src="/img/tree_user_weixin.png" alt=""></div>
                <h5 class="icon-name">微信客服</h5>
            </a>
            <a href="http://xhmt.sdhmmm.cn/html/download.html" target="_blank" class="icon">
                <div class="icon-pic"><img src="/img/btn_erweima_n.png" alt=""></div>
                <h5 class="icon-name">二维码</h5>
            </a>
            <a href="http://map.baidu.com/mobile/webapp/index/index" target="_blank" class="icon">
                <div class="icon-pic"><img src="/img/btn_map_n.png" alt=""></div>
                <h5 class="icon-name">地图导航</h5>
            </a>
        </div>

        <!-- services -->
        <h4 class="title">服务</h4>

        <div class="icons clearfix">
            <a href="http://www.sdnxs.com/Channel/23166" class="icon">
                <div class="icon-pic"><img src="/img/tree_user_bank.png" alt=""></div>
                <h5 class="icon-name">商业银行</h5>
            </a>
            <a href="/webvFuwuCenterController/toCenter.do?mm_fuwu_type=0&page=1" class="icon">
                <div class="icon-pic"><img src="/img/tree_user_shop.png" alt=""></div>
                <h5 class="icon-name">菜园资材</h5>
            </a>
            <a href="/webvFuwuCenterController/toCenter.do?mm_fuwu_type=1&page=1" class="icon">
                <div class="icon-pic"><img src="/img/tree_user_worker.png" alt=""></div>
                <h5 class="icon-name">装车工人</h5>
            </a>
            <a href="/webvFuwuCenterController/toCenter.do?mm_fuwu_type=2&page=1" class="icon">
                <div class="icon-pic"><img src="/img/tree_user_package.png" alt=""></div>
                <h5 class="icon-name">物流中心</h5>
            </a>

            <a href="/webvFuwuCenterController/toCenter.do?mm_fuwu_type=3&page=1" class="icon">
                <div class="icon-pic"><img src="/img/tree_user_graft.png" alt=""></div>
                <h5 class="icon-name">嫁接团队</h5>
            </a>
            <a href="/webvFuwuCenterController/toCenter.do?mm_fuwu_type=4&page=1" class="icon">
                <div class="icon-pic"><img src="/img/tree_user_crane.png" alt=""></div>
                <h5 class="icon-name">吊车服务</h5>
            </a>
            <a href="/webvSuggestController/toSuggest.do" class="icon">
                <div class="icon-pic"><img src="/img/tree_user_report.png" alt=""></div>
                <h5 class="icon-name">意见反馈</h5>
            </a>
            <a href="http://m.ctrip.com/html5" target="_blank" class="icon">
                <div class="icon-pic"><img src="/img/btn_car_n.png" alt=""></div>
                <h5 class="icon-name">汽火飞</h5>
            </a>
            <a href="/webvUpdatePwrController/toFindPwr.do" class="icon">
                <div class="icon-pic"><img src="/img/tree_user_changepw.png" alt=""></div>
                <h5 class="icon-name">修改密码</h5>
            </a>
            <a href="javaScript:void(0)" onclick="quiteClick()" class="icon">
                <div class="icon-pic"><img src="/img/tree_user_setup.png" alt=""></div>
                <h5 class="icon-name">切换账号</h5>
            </a>
            <a href="/webvAboutUsController/toAboutUs.do" class="icon">
                <div class="icon-pic"><img src="/img/tree_user_aboutus.png" alt=""></div>
                <h5 class="icon-name">关于我们</h5>
            </a>
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
    function vipClick() {
        alert("暂未开通在线支付功能，升级vip请联系客服");
    }
    function noClick() {
        alert("该功能暂未开通");
    }

    function quiteClick() {
        //退出
        $.ajax({
            cache: true,
            type: "POST",
            url: "/webvLoginController/toQuite.do",
            data: {},
            async: false,
            success: function (_data) {
                var data = $.parseJSON(_data);
                if (data.success) {
                    alert("您已退出账号，请重新登录！");
                    window.location.href = "/webvLoginController/toLogin.do";
                } else {
                    var _case = {1: "退出账号失败！", 9: "账号过期，请重新登录！"};
                    alert(_case[data.code])
                }
            }
        });
    }

    function guanzhuArea() {
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
    }

</script>

</html>