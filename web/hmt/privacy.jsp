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
    <title>蔬菜通|版权隐私</title>
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
        <div class="rightbox_head"><i class="bg"></i>隐私版权</div>
        <div class="exp-content format-exp" id="format-exp">
            <div class="exp-content-body">
                <p class="mt20 t2em" style="padding-left:10px">欢迎访问蔬菜通信息平台！我们以本隐私声明声明对访问者隐私保护的许诺。以下文字公开我站对信息收集和使用的
                    情况。本站的隐私声明正在不断改进中，随着我站服务范围的扩大，我们会随时更新我们的隐私声明。我们欢迎您随时回来查看本声明。并反馈您的意见。</p>

                <p class="mt10 t2em">在同意蔬菜通信息平台服务协议（“协议”）之时，您已经同意我们按照本隐私声明来使用和披露您的个人信息。本隐私声明的全部 条款属于该协议的一部份。</p>
                <ol class="exp-conent-orderlist">
                    <li class="exp-content-list list-item-1">
                        <div class="list-icon" style="visibility: visible;">1</div>
                        <div class="content-list-text">
                            <p><strong>未成年人的特别注意事项</strong></p>
                        </div>
                        <div class="content-list-media">
                            <div class="content-list-image clearfix">
                                <p class="t2em">如果您未满18周岁，您无权使用本公司服务，因此我们希望您不要向我们提供任何个人信息。如果您未满18周岁，您只能在父母
                                    或监护人的陪同下才可以使用本公司服务。</p>
                            </div>
                        </div>
                    </li>
                    <li class="exp-content-list list-item-2">
                        <div class="list-icon" style="visibility: visible;">2</div>
                        <div class="content-list-text">
                            <p><strong>用户名和密码</strong></p>
                        </div>
                        <div class="content-list-media">
                            <div class="content-list-image clearfix">
                                <p class="t2em">当您打算注册成会员后，我们要求您选择一个用户名和密码，还要提供密码提示问题及其答案以便在您丢失密码后我们可以确认
                                    您的身份。您只能通过您的密码来使用您的帐号。如果您泄漏了密码，您可能丢失了您的个人识别信息，并且可能出现对您不利的
                                    后果。因此，无论任何原因危及您的密码安全，您应该立即我们取得联系。</p>

                            </div>
                        </div>
                    </li>
                    <li class="exp-content-list list-item-3">
                        <div class="list-icon" style="visibility: visible;">3</div>
                        <div class="content-list-text">
                            <p><strong>注册信息</strong></p>
                        </div>
                        <div class="content-list-media">
                            <div class="content-list-image clearfix">
                                <p class="t2em">当您在注册为会员时，我们要求您填写一张注册表。注册表要求提供您的真实姓名，电话号码和电子邮件地址。另外。我们通过
                                    注册信息来获得会员的统计资料。我们将会用这些统计数据来给我们的会员分类，我们会通过您的邮件地址来通知您这些新的 服务和机会。</p>
                            </div>
                        </div>
                    </li>
                    <li class="exp-content-list list-item-4">
                        <div class="list-icon" style="visibility: visible;">4</div>
                        <div class="content-list-text">
                            <p><strong>您的交易行为</strong></p>
                        </div>
                        <div class="content-list-media">
                            <div class="content-list-image clearfix">
                                <p class="t2em">我们跟踪全天的页面访问数据。全天页面访问数据被用来反映网站的流量，以使我们可以为未来的发展制定计划 （例如，增加服务器）。
                                    因您交易行为而产生的其它数据，我们将会用这些统计数据来给会员分类，以便有针对性地向我们的会员提供新的服务和机会。
                                    我们会通过您的邮件地址来通知您这些新的服务和机会。</p>
                            </div>
                        </div>
                    </li>
                    <li class="exp-content-list list-item-5">
                        <div class="list-icon" style="visibility: visible;">5</div>
                        <div class="content-list-text">
                            <p><strong>信息自动收集</strong></p>
                        </div>
                        <div class="content-list-media">
                            <div class="content-list-image clearfix">
                                <p class="t2em">蔬菜通信息平台有可能自动接收并记录您的浏览器和计算机上的信息，其中包括您的 IP 地址，蔬菜通信息平台cookie 中的信息、软硬件
                                    特征信息、以及您需求的网页记录。</p>
                            </div>
                        </div>
                    </li>
                    <li class="exp-content-list list-item-6">
                        <div class="list-icon" style="visibility: visible;">6</div>
                        <div class="content-list-text">
                            <p><strong>Cookie的使用</strong></p>
                        </div>
                        <div class="content-list-media">
                            <div class="content-list-image clearfix">
                                <p class="t2em"> cookies是少量的数据，在您未拒绝接受cookies的情况下，cookies将被发送到您的浏览器，并储存在您的计算机硬盘。我们使用
                                    cookies储存您访问我们网站的相关数据，在您访问或再次访问我们的网站时,我们能识别您的身份，并通过分析数据为您提供更好 更多的服务。
                                    您有权选择接受或拒绝接受cookies。您可以通过修改浏览器的设置以拒绝接受cookies，但是我们需要提醒您，因为您拒绝接受
                                    cookies，您可能无法使用依赖于cookies的我们网站的部分功能。</p>

                            </div>
                        </div>
                    </li>
                    <li class="exp-content-list list-item-7">
                        <div class="list-icon" style="visibility: visible;">7</div>
                        <div class="content-list-text">
                            <p><strong>信息的披露和使用</strong></p>
                        </div>
                        <div class="content-list-media">
                            <div class="content-list-image clearfix">
                                <p class="t2em">我们不会向任何无关第三方提供，出售，出租，分享和交易用户的个人信息，但为方便您使用蔬菜通信息平台服务及蔬菜通信息平台关联
                                    公司或其他组织的服务（以下称其 他服务），您同意并授权蔬菜通信息平台将您的个人信息传递给您同时接受其他服务的蔬菜通信息平台
                                    关联公司或其他组织，或从为您提供其他服务的蔬菜通信息平台关联公司或其他组 织获取您的个人信息。
                                    我们会对您及（或）您的公司的身份和交易数据进行综合统计，并以蔬菜通信息平台判断合理的目的和用途将该综合统计向广告主披露。
                                    但是，在这些情况下，我们不会向这些机构披露任何可能用以识别用户的个人身份的资料，但从用户的用户名或其它可披露资料分析得出的资料不受此限。</p>

                                <p class="t2em">您同意我们可批露或使用您的个人信息以用于识别和（或）确认您的身份，或解决争议，或有助于确保网站安全、限制欺诈、非法
                                    或其他刑事犯罪活动，以执行我们的服务协议。</p>

                                <p class="t2em">您同意我们可批露或使用您的个人信息以保护您的生命、财产之安全或为防止严重侵害他人之合法权益或为公共利益之需要。</p>

                                <p class="t2em">您同意我们可批露或使用您的个人信息以改进我们的服务，并使我们的服务更能符合您的要求，从而使您在使用我们服务时得到 更好的使用体验。</p>

                                <p class="t2em">您同意我们利用您的个人信息与您联络，并向您提供您感兴趣的信息，如：产品信息。您接受“服务协议”和本隐私声明即为明示 同意收取这些资料。</p>

                                <p class="t2em">我们的网站公布了用户提交的商业机会和报价，而其他用户可以查询这些报价和商业机会。
                                    当我们被法律强制或依照政府或依权利人因识别涉嫌侵权行为人的要求而提供您的信息时，我们将善意地披露您的资料。 信息的存储和交换
                                    所收集的用户信息和资料将保存在蔬菜通信息平台及（或）其关联公司的服务器上。</p>
                            </div>
                        </div>
                    </li>
                    <li class="exp-content-list list-item-8">
                        <div class="list-icon" style="visibility: visible;">8</div>
                        <div class="content-list-text">
                            <p><strong>外部链接</strong></p>
                        </div>
                        <div class="content-list-media">
                            <div class="content-list-image clearfix">
                                <p class="t2em">本站含有到其他网站的链接。蔬菜通信息平台对那些网站的隐私保护措施不负任何责任。我们可能在任何需要的时候增加商业伙伴或 共用品牌的网站。</p>
                            </div>
                        </div>
                    </li>
                    <li class="exp-content-list list-item-9">
                        <div class="list-icon" style="visibility: visible;">9</div>
                        <div class="content-list-text">
                            <p><strong>公开的交易信息</strong></p>
                        </div>
                        <div class="content-list-media">
                            <div class="content-list-image clearfix">
                                <p class="t2em">您提供发布的供贸易的物品信息或报价将被显示在公共区域，对任何用户来说是公开的。请注意所有在这些场所公开的信息会成为
                                    公共信息，请您在决定公布您的个人信息前仔细考虑。</p>
                            </div>
                        </div>
                    </li>
                    <li class="exp-content-list list-item-10">
                        <div class="list-icon" style="visibility: visible;">10</div>
                        <div class="content-list-text">
                            <p><strong>安全</strong></p>
                        </div>
                        <div class="content-list-media">
                            <div class="content-list-image clearfix">
                                <p class="t2em">我们网站有相应的安全措施来确保我们掌握的信息不丢失，不被滥用和变造。这些安全措施包括向其它服务器备份数据和对
                                    用户密码加密。尽管我们有这些安全措施，但请注意在因特网上不存在“完善的安全措施”。</p>
                            </div>
                        </div>
                    </li>
                    <li class="exp-content-list list-item-11">
                        <div class="list-icon" style="visibility: visible;">11</div>
                        <div class="content-list-text">
                            <p><strong>联系我们</strong></p>
                        </div>
                        <div class="content-list-media">
                            <div class="content-list-image clearfix">
                                <p class="t2em">如果您对本隐私声明或蔬菜通信息平台的隐私保护措施以及您在使用中的问题有任何意见和建议请和我们联系。</p>
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
