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
    <title>蔬菜通|法律声明</title>
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
        <div class="rightbox_head"><i class="bg"></i>法律声明</div>
        <div class="exp-content format-exp" id="format-exp">
            <div class="exp-content-body">
                <ol class="exp-conent-orderlist">
                    <li class="exp-content-list list-item-1">
                        <div class="list-icon" style="visibility: visible;">1</div>
                        <div class="content-list-text">
                            <p><strong>蔬菜通信息平台法律声明</strong></p>
                        </div>
                        <div class="content-list-media">
                            <div class="content-list-image clearfix">
                                <p class="mt5 t2em"> 使用本网站前，请您仔细阅读下述条款。如您不同意本服务条款或蔬菜通信息平台对其进行的修改，您可以主动取消蔬菜通信息平台
                                    提供的服务；您一旦使用蔬菜通信息平台提供的服务，即视为您已了解并完全同意本服务条款各项内容，包括蔬菜通信息平台对服务条款
                                    所做的任何修改，并成为蔬菜通信息平台的用户（以下简称“用户”）。 </p>
                            </div>
                        </div>
                    </li>
                    <li class="exp-content-list list-item-2">
                        <div class="list-icon" style="visibility: visible;">2</div>
                        <div class="content-list-text">
                            <p><strong>1、版权归属</strong></p>
                        </div>
                        <div class="content-list-media">
                            <div class="content-list-image clearfix">
                                <p>（1）本网站所有资料包含但不限于以下内容：文本、图形、LOGO、网页设计、软件等的版权归山东惠民县茹园科技服务有限公司所有，受 中国及国际版权法的保护。</p>

                                <p class="mt10">（2）除非另有明确说明，您在使用本网站之内容时，应遵守下列条件：</p>

                                <p class="pl20 mt10">（i）未经书面许可，不得复制、留存、编辑、组合、镜像、转发、出版、演示，或以其他任何形式使用；</p>

                                <p class="pl20 mt10">（ii）经许可的使用应载明授权方；</p>

                                <p class="pl20 mt10">（iii）任何使用不可对内容有任何修改；</p>

                                <p class="pl20 mt10">（iv）任何使用均应遵守中华人民共和国法律；</p>

                                <p class="pl20 mt10">（v）山东惠民县茹园科技服务有限公司保留随时撤销该授权的权利，无论何种形式的使用，均应于收到山东惠民县茹园科技服务有限公司之书面通知
                                    当日起立刻停止。</p>

                                <p class="mt10">（3）本网站中任何可供下载及使用之软件（以下简称“软件”）的版权均为山东惠民县茹园科技服务有限公司所有。对软件的下载使用应
                                    了解并遵守下列条件：</p>

                                <p class="pl20 mt10">（i）任何对该软件的使用必须受到附于该软件之授权许可合约条款之限制，请您务必在使用该软件之前，认真阅读并全部接受 该授权合约；</p>

                                <p class="pl20 mt10">（ii）任何对授权许可合约及中华人民共和国法律的违反而导致的法律后果，由使用者自行承担；</p>

                                <p class="pl20 mt10">（iii）山东惠民县茹园科技服务有限公司不为于本网站使用的任何第三方软件的功能和安全作任何保证。</p>
                            </div>
                        </div>
                    </li>
                    <li class="exp-content-list list-item-3">
                        <div class="list-icon" style="visibility: visible;">3</div>
                        <div class="content-list-text">
                            <p><strong>2、免责声明</strong></p>
                        </div>
                        <div class="content-list-media">
                            <div class="content-list-image clearfix">
                                <p>（1）对本网站上所有内容及互联网传输，山东惠民县茹园科技服务有限公司不提供任何明示或暗示的担保。</p>

                                <p class="mt10">（2）本网站对用户上载的信息、软件的真实性以及由此引起的任何损失或任何由于使用该内容而引起的损失，包括但不限于
                                    直接的，间接的，偶然的、惩罚性的损失，不承担责任。</p>

                                <p class="mt10">（3）对于因互联网传输故障及其他不可抗力导致的后果，山东惠民县茹园科技服务有限公司不承担任何责任。</p>

                                <p class="mt10">（4）本网站转载的相关文章、资料中表述或暗示的观点不代表山东惠民县茹园科技服务有限公司的观点。</p>

                                <p class="mt10">（5）本网站遵循互利互惠的原则
                                    进行内容合作。所转载的信息都已经过版权所有者的口头或书面的许可，如有遗漏，请与我们联系并提供相应的证明资料。</p>

                                <p class="mt10">（6）会员注册名、密码和保密</p>

                                <p class="mt5 t2em">在您按照注册页面提示填写信息、阅读并同意本协议并完成全部注册程序后或以其他蔬菜通信息平台允许的方式实际使用中国惠
                                    农网网站服务时，您即成为蔬菜通信息平台会员（亦称会员），蔬菜通信息平台根据会员注册名和密码确认您的身份。您须自行负责对您的
                                    会员注册名和密码保密，且须对您在会员注册名和密码下发生的所有活动（包括但不限于发布信息资料、网上点击同意或提交各类
                                    规则协议、网上续签协议或购买服务等）承担责任。您同意：(a) 如发现任何人未经授权使用您的会员注册名或密码，或发生违反
                                    保密规定的任何其他情况，您会立即通知蔬菜通信息平台；及 (b) 确保您在每个上网时段结束时，以正确步骤离开网站。蔬菜通信息平台
                                    不能也不会对因您未能遵守本款规定而发生的任何损失或损毁负责。您理解蔬菜通信息平台对您的请求采取行动需要合理时间，中国
                                    蔬菜通网对在采取行动前已经产生的后果（包括但不限于您的任何损失）不承担任何责任。</p>

                                <p class="mt10">（7）处理交易争议</p>

                                <p class="mt10 t2em"> 蔬菜通信息平台不涉及用户间因交易而产生的法律关系及法律纠纷，不会且不能牵涉进交易各方的交易当中。倘若您与一名或一名
                                    以上用户，或与您通过本公司网站获取其服务的第三者服务供应商发生争议，您免除蔬菜通信息平台 (及本公司代理人和雇员) 在因
                                    该等争议而引起的，或在任何方面与该等争议有关的不同种类和性质的任何(实际和后果性的) 权利主张、要求和损害赔偿等方面 的责任。</p>

                                <p class="mt10">（8）蔬菜通信息平台网站仅作为交易地点</p>

                                <p class="mt10 t2em"> 本公司网站仅作为用户物色交易对象，就货物和服务的交易进行协商，以及获取各类与贸易相关的服务的地点。但是，本公司
                                    不能控制交易所涉及的物品的质量、安全或合法性，商贸信息的真实性或准确性，以及交易方履行其在贸易协议项下的各项义务的
                                    能力。本公司不能也不会控制交易各方能否履行协议义务。此外，您应注意到，与外国国民、未成年人或以欺诈手段行事的人进行 交易的风险是客观存在的。</p>
                            </div>
                        </div>
                    </li>
                    <li class="exp-content-list list-item-4">
                        <div class="list-icon" style="visibility: visible;">4</div>
                        <div class="content-list-text">
                            <p><strong>3、隐私权保护</strong></p>
                        </div>
                        <div class="content-list-media">
                            <div class="content-list-image clearfix">
                                <p>（1）用户在匿名的状态下即可访问我们的网站并获取信息。在本网站请求用户提供有关信息之前，本网站会解释这些信息的用途，
                                    有些服务需要用户注册后才能够提供。在通常情况下，这类注册只要求用户提供一个电子邮件地址和一些诸如用户的工作、职务
                                    一类的基本信息。有时本网站也会请用户提供更多的信息，这样做是为了使本网站更好的理解用户的需求，以便向用户提供更为
                                    有效的服务。本网站收集的信息包括姓名，地址和移动电话号码等，用户有权随时决定不接受来自我们的任何资料。</p>

                                <p class="mt10">
                                    （2）用户的注册义务：用户如希望使用本网站需注册后才能够提供的服务，应同意以下事项∶依本服务注册表之提示提供您本人真实、正确、最新及完整的资料，并随时更新登记资料，确保其为真实、正确、最新及完整的资料。若您提供任何错误、不实、过时或不完整
                                    或具误导性的资料，或者本网站有理由怀疑前述资料为错误、不实、过时或不完整或具误导性的，本网站有权暂停或终止您的帐号，
                                    并拒绝您于现在和未来使用本网站所提供服务之全部或任何部分。</p>

                                <p class="mt10">（3）本网站将采取合理的安全手段保护用户已存储的个人信息，
                                    除非根据法律或政府的强制性规定，在未得到用户许可之前，本网站不会将用户的任何个人信息提供给任何无关的第三方（包括 公司或个人）。</p>

                                <p class="mt10">（4）用户应了解：本网站可能会应法律之要求公开个人资料，或者因善意确信这样的作法对于下列各项有其 必要性：</p>

                                <p class="mt10 pl20">（i）符合法律公告或遵守适用于蔬菜通信息平台的合法程序；</p>

                                <p class="mt10 pl20">（ii）保护本网站用户的权利或财产；</p>

                                <p class="mt10 pl20">（iii）在紧急的情况下， 为了保护本网站及其用户之个人或公众安全。</p>

                            </div>
                        </div>
                    </li>
                    <li class="exp-content-list list-item-5">
                        <div class="list-icon" style="visibility: visible;">5</div>
                        <div class="content-list-text">
                            <p><strong>4、预测性陈述</strong></p>
                        </div>
                        <div class="content-list-media">
                            <div class="content-list-image clearfix">
                                <p class="t2em">
                                    本网站所发布的信息中可能会包含某些预测性的陈述。这些陈述本质上具有相当风险和不确定性，对本网站所发布的有关山东省惠民县茹园科技服务有限公司及相关业务的预测性陈述，目的均是要指明其属预测性陈述，本公司并不打算不断地更新这些预测性陈述。
                                    此等预测性陈述反映本公司对未来事件的目前看法，而并非关于将来业务表现的保证。</p>

                            </div>
                        </div>
                    </li>
                    <li class="exp-content-list list-item-6">
                        <div class="list-icon" style="visibility: visible;">6</div>
                        <div class="content-list-text">
                            <p><strong>5、知识产权</strong></p>
                        </div>
                        <div class="content-list-media">
                            <div class="content-list-image clearfix">
                                <p class="t2em"> 本网站所载述的域名商标、文字、视像及声音内容、图形及图象均受有关商标和著作权的法律保护。未经山东惠民县茹园科技服务有限
                                    公司事先以书面明确允许，任何企业或个人不得以任何形式复制或传递。</p>

                            </div>
                        </div>
                    </li>
                    <li class="exp-content-list list-item-7">
                        <div class="list-icon" style="visibility: visible;">7</div>
                        <div class="content-list-text">
                            <p><strong>6、链接</strong></p>
                        </div>
                        <div class="content-list-media">
                            <div class="content-list-image clearfix">
                                <p class="t2em">蔬菜通信息平台上的链接服务可以直接进入其他站点，这些链接的站点不受蔬菜通信息平台的控制，蔬菜通信息平台对任何与本站链接网站
                                    的内容不负责任。</p>

                            </div>
                        </div>
                    </li>
                    <li class="exp-content-list list-item-8">
                        <div class="list-icon" style="visibility: visible;">8</div>
                        <div class="content-list-text">
                            <p><strong>7、操作规则</strong></p>
                        </div>
                        <div class="content-list-media">
                            <div class="content-list-image clearfix">
                                <p class="t2em">下面的条款和前面所述的条款均适用于本网站上的论坛，讨论组，聊天组，公告板和任何在网站上发生有相互影响作用区域的
                                    行为。网上用户使用、进入或参与上述区域或网站上的任何其他具相互影响作用区域，则表示同意所有这些条款。您参与的在线
                                    沟通是实时发生的，没有经过任何来自本网站的编辑、压缩、或任何其他形式的控制。本网站不能也没有甄别所有网站用户提供的
                                    内容。但本网站保留对本网站上内容的监控权，并对本网站认为具有危害性，引起争议性的或违反本操作规则的其他内容进行删除
                                    的权利。为了提供满足本网站用户需求的高价值信息的服务，并避免本网站用户遭受因对他人权利的不实、恶意攻击或其他有害
                                    陈述而引起的损失，本网站有必要建立下列操作规则以避免本网站之被滥用：</p>

                                <p class="mt10">当您使用本网站服务时，您不可以：</p>

                                <p class="pl20 mt10"> 1） 粘贴或传播任何非法的，具威胁性的，诽谤性的，贬损的，报复的、亵渎的或任何其他法律禁止的信息，包括但不限于
                                    传播任何煽动性鼓励犯罪的，或违反公民义务或任何其他违反地方法规、国家法律、法规或国际法律、惯例或公约的内容。</p>

                                <p class="pl20 mt10">2） 粘贴或传播任何散布任何他人的私人事件，粘贴或传播带有病毒，或任何带有贬损或损害性特征的内容；</p>

                                <p class="pl20 mt10"> 3） 粘贴或传播任何可能侵害其他人财`产权利的数据、图形或程序，包括以非 法形式使用未经注册的版权文本、图形或程序，
                                    商业秘密及其他保密信息、 商标、服务标识等；</p>

                                <p class="pl20 mt10">4） 以任何形式干扰本网站的其他用户。</p>
                            </div>
                        </div>
                    </li>
                    <li class="exp-content-list list-item-9">
                        <div class="list-icon" style="visibility: visible;">9</div>
                        <div class="content-list-text">
                            <p><strong>8、适用法律</strong></p>
                        </div>
                        <div class="content-list-media">
                            <div class="content-list-image clearfix">
                                <p class="t2em">蔬菜通信息平台由山东惠民县茹园科技服务有限公司运营和控制，适用中华人民共和国法律。我们保留随时更改我们的网站和上述免责及 条款的权利。</p>
                            </div>
                        </div>
                        <div class="last-item"><span class="last-item-end">END</span></div>
                    </li>


                </ol>
            </div>
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

