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
    <title>蔬菜通|友情链接</title>
    <meta name="keywords" content="蔬菜通,蔬菜,花木,蔬菜交易,花木求购,蔬菜求购,花木资讯,花木论坛,花木销售,蔬菜销售,蔬菜资讯,绿化蔬菜">
    <meta name="Description"
          content=" 蔬菜通是惠民县本地第一蔬菜供求信息平台、信息通讯平台，突破了蔬菜大市场、绿化工程公司、经纪人、苗农之间的信息壁垒，让市场订单蔬菜不愁买，苗农种植蔬菜不愁卖！为本地蔬菜行业发展助力，让经纪人足不出户，随时随地做生意！让苗农及时了解市场行情，蔬菜卖价更高更容易！">

    <link rel="stylesheet" href="../hmt/css/help/base.css"/>
    <link rel="stylesheet" href="../hmt/css/help/common.css"/>
    <link href="../hmt/css/help/public.css" rel="stylesheet" type="text/css"/>
    <link href="../hmt/css/help/service.css" rel="stylesheet" type="text/css"/>
    <link href="../hmt/css/common/index-type.css" rel="stylesheet" type="text/css"/>
    <link href="../hmt/css/common/common.css" rel="stylesheet" type="text/css"/>
    <link href="../hmt/css/common/base.css" rel="stylesheet" type="text/css"/>
    <link href="../hmt/css/frame.css" rel="stylesheet" type="text/css"/>
    <link href="../hmt/css/category-vegetable/common.css" rel="stylesheet" type="text/css"/>
    <link href="../hmt/css/search/style.css" rel="stylesheet" type="text/css"/>
    <link href="../hmt/css/search/base.css" rel="stylesheet" type="text/css"/>
    <link href="../hmt/css/supply/index.css" rel="stylesheet" type="text/css"/>

    <script type="text/javascript" src="../hmt/js/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="../hmt/js/home.js"></script>
    <script async="" src="../hmt/js/agt.js"></script>
    <script src="../hmt/js/hm.js"></script>

</head>
<body>
<!-- 顶部 -->
<!-- 顶部 -->
<div class="topbar">
    <div class="container clearfix">
        <ul class="top-login fl">

            <ul class="fl">
                <li class="label orange">您好，欢迎来到蔬菜通信息平台</li>
                <%--<li class="label p-login">--%>
                <%--<a title="马上登录，享受更多会员专享服务" href="javascript:void(0)" onclick="login()"--%>
                <%--rel="nofollow">请登录</a>--%>
                <%--</li>--%>
                <%--<li class="label">--%>
                <%--<a title="马上注册，共享无限商机" href="javascript:void(0)" onclick="reg()"--%>
                <%--rel="nofollow">免费注册 </a>--%>
                <%--</li>--%>
            </ul>
        </ul>
        <ul class="top-nav fr">
            <li id="hn_home_id">
                <div class="label">
                    <a href="/hmtIndex/toIndex.do?page=1">蔬菜通求购信息</a></div>
            </li>

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
<!--wrap-->
<div id="wrapper">
    <div class="leftbox">
        <div class="leftbox_head">蔬菜通信息平台</div>
        <ul class="leftmenu">
            <li><a href="/netAboutUsController/toLegal.do">法律声明</a></li>
            <li><a href="/netAboutUsController/toLink.do">友情链接</a></li>
            <li><a href="/netAboutUsController/toPrivacy.do">版权隐私</a></li>
            <li><a href="/netAboutUsController/toXieyie.do">使用协议</a></li>
            <li><a href="/netAboutUsController/toAboutUs.do">关于我们</a></li>
        </ul>
    </div>
    <div class="rightbox">
        <div class="rightbox_head"><i class="bg"></i>友情链接</div>
        <div class="link_tit"><span>友情链接</span></div>
        <div class="link_con">
            <ul class="linklist">
                <li><a href="http://www.zgncpw.com/" target="_blank">中国农产品网</a></li>
                <li><a href="http://www.chunguowang.com/" target="_blank">水果网</a></li>
                <li><a href="http://www.asae.cn/" target="_blank">亚洲渔港海鲜网</a></li>
                <li><a href="http://www.mvomvo.com/" target="_blank">礼物网</a></li>
                <li><a href="http://jk.lcxw.cn/" target="_blank">健康养生</a></li>
                <li><a href="http://www.zhebabai.cn/" target="_blank">折八百</a></li>
                <li><a href="http://www.xn121.com/" target="_blank">中国兴农网</a></li>
                <li><a href="http://www.nx28.com/" target="_blank">农享网</a></li>
                <li><a href="http://www.agronet.com.cn/" target="_blank">农业网</a></li>
                <li><a href="http://www.ysali.com/" target="_blank">渔商阿里</a></li>
                <li><a href="http://www.nongyao001.com/" target="_blank">中国农药第一网</a></li>
                <li><a href="http://www.cx987.cn/" target="_blank">今日蔬菜网</a></li>
                <li><a href="http://www.shuichan.cc/" target="_blank">中国水产养殖网</a></li>
                <li><a href="http://www.jbzyw.com/" target="_blank">鸡病专业网</a></li>
                <li><a href="http://www.114guoshu.com/" target="_blank">水果批发网</a></li>
                <li><a href="http://www.nongyao168.com/" target="_blank">中国农药网</a></li>
                <li><a href="http://www.ync365.com/" target="_blank">云农场</a></li>
                <li><a href="http://www.quandier.com/" target="_blank">农地圈</a></li>
            </ul>
        </div>
        <%--<div class="link_tit"><span>申请链接</span></div>--%>
        <%--<div class="link_con">--%>
        <%--<ul class="linksteps">--%>
        <%--<h3>申请步骤:</h3>--%>
        <%--<li><i class="nums">1</i> 请先在贵网站做好中国蔬菜通网的文字友情链接, 链接文字： 中国蔬菜通网链接地址：http://www.cnhnb.com</li>--%>
        <%--<li><i class="nums">2</i>做好链接后，请填写申请信息。</li>--%>
        <%--<li><i class="nums">3</i>已经开通我站友情链接且内容健康，符合本站友情链接要求的网站，经中国蔬菜通网管理员审核后，可以显示在此友情链接页面。</li>--%>
        <%--</ul>--%>
        <%--<div class="servicebox">--%>
        <%--<p><strong>中国蔬菜通网客服热线:</strong></p>--%>
        <%--<p><strong>400-008-8688</strong></p>--%>
        <%--<p class="mt15">工作时间：周一至周日9:00 - 17:30</p>--%>
        <%--<p><a href="http://b.qq.com/webc.htm?new=0&sid=4000088688&eid=218808P8z8p8q8Q8Q8q8x&o=www.cnhnb.com&q=7" class="linkbtn">QQ交谈</a></p>--%>
        <%--</div>--%>

    </div>
</div>
</div>
<div class="clear"></div>
<!-- footer_wrapper -->
<jsp:include page="footer.jsp" flush="true"/>
<!--/.footer-->
<script src="../hmt/js/home.js" type="text/javascript"></script>
<script src="../hmt/js/jquery.SuperSlide.2.1.1.js" type="text/javascript"></script>
<!--首页右侧焦点图调用js-->
<!--搜索调用js 会将logo链接至生产-->
<script src="../hmt/js/top_foot.js" type="text/javascript"></script>
<script src="../hmt/js/vegetable.js" type="text/javascript"></script>
<!--蔬菜二级类目调用js--
</html>-->
</body>

</html>
