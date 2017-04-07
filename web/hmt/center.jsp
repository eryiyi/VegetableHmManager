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
    <title>蔬菜通|个人中心</title>
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
    <link href="../hmt/css/buyercommon/base.min.css" rel="stylesheet" type="text/css"/>
    <link href="../hmt/css/buyercommon/common.css" rel="stylesheet" type="text/css"/>
    <link href="../hmt/css/buyer/index.css" rel="stylesheet" type="text/css"/>
    <link href="../hmt/css/buyer/common.css" rel="stylesheet" type="text/css"/>

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
                        <a title="马上注册，共享无限农业商机" href="javascript:void(0)" onclick="reg()"
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
                        <a href="javascript:void(0)" target="_blank" rel="nofollow">常见问题</a><a
                            href="javascript:void(0)" target="_blank" rel="nofollow">联系客服</a></p>
                </div>
            </li>
        </ul>
    </div>
</div>

<div class="header">
    <div class="wrap">
        <a href="/hmtIndex/toIndex.do?page=1" target="_blank" class="logo"><img
                src="../hmt/images/category-vegetable/logo_type.png" width="194px" height="38px"></a>

        <div class="webname">
            <h2>用户中心</h2>
            <span>${emp.mm_emp_nickname}</span>
        </div>
    </div>
    <input type="hidden" id="is_login" name="is_login" value="${is_login}">
    <input type="hidden" id="accessToken" name="accessToken" value="${emp.access_token}">
    <input type="hidden" id="mm_emp_id" name="mm_emp_id" value="${emp.mm_emp_id}">
</div>
<div class="main wrap" style=" margin-top: 20px;">
    <div class="mains">
        <div class="mainL">
            <div class="info">
                <div class="userinfo">
                    <em>
                        <img src="${emp.mm_emp_cover}" width="66" height="66" id="userPic">
                    </em>

                    <div class="text">
                        <div class="name">
                            <strong>${emp.mm_emp_nickname}</strong>
                            <a href="javascript:void(0);">
                                <c:if test="${emp.mm_level_num==0}"><img src="../hmt/images/grade-1.png" alt="我的等级"
                                                                         title="县级会员，只能查看注册县区的信息" id="pointPic"></c:if>
                                <c:if test="${emp.mm_level_num==1}"><img src="../hmt/images/grade-1.png" alt="我的等级"
                                                                         title="市级会员，只能查看注册地市的信息" id="pointPic"></c:if>
                                <c:if test="${emp.mm_level_num==2}"><img src="../hmt/images/grade-1.png" alt="我的等级"
                                                                         title="省级会员，只能查看注册省份的信息" id="pointPic"></c:if>
                                <c:if test="${emp.mm_level_num==3}"><img src="../hmt/images/grade-1.png" alt="我的等级"
                                                                         title="全国会员，能查看全部信息" id="pointPic"></c:if>
                                <c:if test="${emp.mm_level_num==4}"><img src="../hmt/images/grade-1.png" alt="我的等级"
                                                                         title="顶级会员，能查看所有信息" id="pointPic"></c:if>
                            </a>
                        </div>
                    </div>
                </div>
                <div class="userstate">
                    <strong>账户状态：</strong> <span>
            <a href="javascript:void(0);"><img alt="手机认证" title="手机认证" src="../hmt/images/phone-yes.png"></a>
            <c:if test="${emp.is_miaomu=='1'}"><a href="javascript:void(0);"><img alt="诚信单位" title="诚信单位"
                                                                                  src="/img/tree_icons_trust.png"
                                                                                  style="width: 18px;height: 22px"></a></c:if>
			<c:if test="${emp.is_chengxin=='1'}"><a href="javascript:void(0);"><img alt="认证会员" title="认证会员"
                                                                                    src="/img/tree_icons_group.png"
                                                                                    style="width: 18px;height: 22px"></a></c:if>
	</span>
                </div>
                <div class="userbind userbind-buy">
                    <ul>
                        <li class="phone isbind"><em><a href="javascript:void(0);" onclick="quiteClick()"></a></em>
                            <span><a id="w3-2" href="javascript:void(0);" onclick="quiteClick()">切换账号</a></span></li>
                        <%--<li class="email"><em><a href="javascript:void(0);"></a></em> <span>--%>
                        <%--<a id="w3" href="javascript:void(0);">绑定邮箱</a></span></li>--%>
                        <li class="password"><em><a href="/netUpdatePwrController/toFindPwr.do"></a></em>
                            <span><a href="/netUpdatePwrController/toFindPwr.do">修改密码</a></span></li>
                    </ul>
                </div>
            </div>
            <div id="LEFT_FETURES">
                <div class="left-side left-side-4" myid="BUYERS_LEFT_FIX_child1">
                    <a href="/netMineFavourController/favour.do?page=1">
                        <h2>我的收藏</h2>

                        <p> 已收藏 <span class="number">${count}</span> 条</p>
                    </a>
                </div>
            </div>
            <div class="left-side left-side-4" myid="BUYERS_LEFT_FIX_child1">
                <a href="/netKefuController/toKefu.do">
                    <h2>申请认证会员</h2>

                    <p>点此联系客服</p>
                </a>
            </div>
            <div class="left-side left-side-4" myid="BUYERS_LEFT_FIX_child1">
                <a href="/netKefuController/toKefu.do">
                    <h2>申请诚信单位</h2>

                    <p>点此联系客服</p>
                </a>
            </div>
            <%--<div class="left-side left-side-4" myid="BUYERS_LEFT_FIX_child1">--%>
            <%--<a href="/netSelectProvinceController/toSelectProvince.do">--%>
            <%--<h2>地区选择</h2>--%>
            <%--</a>--%>
            <%--</div>--%>
        </div>
        <div class="mainC">
            <!-- module -->
            <div class="module" id="MIDDEL_FETURES">
                <div class="modules modu-wdcg" myid="BUYES_MIDDLE_FEATURES_child0">
                    <div class="title">
                        <h2>短信平台</h2>
                    </div>
                    <div class="box">
                        <a href="http://139.129.207.95:82" target="_blank">
                            <h3>蔬菜通短信平台</h3>

                            <p></p>
                        </a>
                    </div>
                </div>
                <div class="modules modu-syyh" myid="BUYES_MIDDLE_FEATURES_child0">
                    <div class="title">
                        <h2>商业银行</h2>
                    </div>
                    <div class="box">
                        <a href="http://www.sdnxs.com/Channel/23166" target="_blank">
                            <h3>商业银行</h3>

                            <p></p>
                        </a>
                    </div>
                </div>
                <div class="modules modu-wdxd" myid="BUYES_MIDDLE_FEATURES_child1">
                    <div class="title">
                        <h2>我的关注</h2>
                    </div>
                    <div class="box">
                        <a href="javascript:void(0)" onclick="guanzhuArea()">
                            <h3>关注区域</h3>
                            <p></p>
                        </a>
                    </div>
                </div>
                <div class="modules modu-jygl" myid="BUYES_MIDDLE_FEATURES_child2">
                    <div class="title">
                        <h2>我的</h2>
                    </div>
                    <div class="box">
                        <ul class="w594">
                            <li class="link">
                                <a href="/netNearbyController/nearby.do?page=1" class="number1"></a>

                                <p class="txt"><span>经纪人</span></p>
                            </li>
                            <li class="line  w180"><span></span></li>
                            <li class="link">
                                <a href="/netKefuController/toKefu.do" class="number2"></a>

                                <p class="txt"><span>客服中心</span></p>
                            </li>
                            <li class="line  w180"><span></span></li>
                            <li class="link">
                                <a href="/netWeixinController/toKefu.do" class="number3"></a>

                                <p class="txt"><span>微信客服</span></p>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>

    </div>
    <div class="mainR">
        <div class="plug">
            <h2>快捷入口</h2>
            <ul id="RIGHT_MENU">
                <li menuid="29">
                    <a href="/netNoticeController/list.do?page=1">
                        <em><img src="../hmt/images/tree_user_notice.png"></em>
                        <span>公告信息</span>
                    </a>
                </li>
                <li menuid="34">
                    <a href="javascript:void(0)" target="_blank">
                        <em><img src="../hmt/images/plug-7.png"></em>
                        <span>公司招商</span>
                    </a>
                </li>
                <%--<li menuid="30">--%>
                <%--<a href="http://www.sdnxs.com/Channel/23166" target="_blank">--%>
                <%--<em><img src="../hmt/images/tree_user_bank.png"></em>--%>
                <%--<span>商业银行</span>--%>
                <%--</a>--%>
                <%--</li>--%>
                <li menuid="35">
                    <a href="/netFuwuCenterController/toCenter.do?mm_fuwu_type=0&page=1">
                        <em><img src="../hmt/images/tree_user_shop.png"></em>
                        <span>蔬菜商店</span>
                    </a>
                </li>
                <li menuid="36">
                    <a href="/netFuwuCenterController/toCenter.do?mm_fuwu_type=1&page=1">
                        <em><img src="../hmt/images/tree_user_worker.png"></em>
                        <span>装车工人</span>
                    </a>
                </li>
                <li menuid="37">
                    <a href="/netFuwuCenterController/toCenter.do?mm_fuwu_type=2&page=1">
                        <em><img src="../hmt/images/tree_user_package.png"></em>
                        <span>物流中心</span>
                    </a>
                </li>
                <li menuid="32">
                    <a href="/netFuwuCenterController/toCenter.do?mm_fuwu_type=3&page=1">
                        <em><img src="../hmt/images/plug-3.png"></em>
                        <span>嫁接团队</span>
                    </a>
                </li>
                <li class="add">
                    <a href="/netFuwuCenterController/toCenter.do?mm_fuwu_type=4&page=1">
                        <em><img src="../hmt/images/tree_user_crane.png"></em>
                        <span>吊车服务</span>
                    </a>
                </li>
            </ul>
        </div>

        <div class="customer">
            <div class="tel">
                <h3>客服热线：</h3>
                <span>400-0242-103</span>
            </div>
            <div class="mail">
                <h3>客服电话：</h3>
                <span>18706637302</span>
            </div>
            <div class="mail">
                <h3>招商电话：</h3>
                <span>18854337802</span>
            </div>

        </div>
    </div>
</div>
<div class="popup-plug-add">
    <div class="screen"></div>
    <div class="popup">
        <div class="bg-t"></div>
        <div class="bg-c">
            <div class="title"><h2>新增入口</h2><span><img
                    src="http://static.cnhnb.com/4.0/images/personal/home/popup-close.png"></span></div>
            <div class="box">
                <ul id="menu_add_container">
                </ul>
                <div class="tip">更多快捷入口持续开放中</div>
            </div>
        </div>
        <div class="bg-f"></div>
    </div>
</div>
<div class="popup-modu-add" style="display: none;">
    <div class="screen"></div>
    <div class="popup" style="margin-top: -163.5px;">
        <div class="bg-t"></div>
        <div class="bg-c">
            <div class="box">
            </div>
        </div>
        <div class="bg-f"></div>
    </div>
</div>
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

    function login() {
        //登录页面跳转
        window.location.href = "/netLoginController/toLogin.do";
    }
</script>

<script type="text/javascript" charset="UTF-8">
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


    function guanzhuArea() {
        //查询是否关注了区域
        var mm_emp_id = $("#mm_emp_id").val();
        $.ajax({
            cache: true,
            type: "POST",
            url: "/netGuanzhuController/webvGetGuanzhu.do",
            data: {"index": "1", "size": "10", "mm_emp_id": mm_emp_id},
            async: false,
            success: function (_data) {
                var data = $.parseJSON(_data);
                if (data.success) {
                    window.location.href = "/netGuanzhuController/guanzhuArea.do?page=1";
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
                        window.location.href = "/netGuanzhuController/toGuanzhu.do";
                    }
                }
            }
        });
    }

</script>

</html>

