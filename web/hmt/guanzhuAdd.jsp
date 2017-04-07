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
    <title>蔬菜通|添加关注区域</title>
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
    <link href="../hmt/css/location_focus.css" rel="stylesheet" type="text/css"/>


    <script type="text/javascript" src="../js/jquery.min.js"></script>
    <script type="text/javascript" src="../js/md5.js"></script>
    <script type="text/javascript" src="../js/cookie.js"></script>
    <script type="text/javascript" src="../js/ajaxfileupload.js"></script>
    <script type="text/javascript" src="../js/Util.js"></script>
    <script type="text/javascript" src="../js/validation.js"></script>
    <script language="javascript" src="../js/jquery.js"></script>
    <script type="text/javascript" src="../js/jquery_latest.js"></script>
    <style>
        .index-button {
            display: block;
            width: 300px;
            line-height: 150%;
            -webkit-border-radius: 4rem;
            -moz-border-radius: 4rem;
            border-radius: 4rem;
            text-align: center;
            margin: 0 auto;
            font-size: 1.5rem;
            color: #fff !important;
            background-color: #009237;
        }
    </style>


</head>
<body>

<!-- 顶部 -->
<div class="topbar">
    <div class="container clearfix">
        <ul class="top-login fl">

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
                        <a href="/netNoticeController/list.do?page=1" class="msg">消息<span class="msg-mark"></span></a>
                    </div>
                </li>
            </ul>

            <ul class="fl">
                <li class="label orange">您好，欢迎来到蔬菜通信息平台</li>
            </ul>
        </ul>
        <ul class="top-nav fr">
            <li id="hn_home_id">
                <div class="label">
                    <a href="/hmtIndex/toIndex.do?page=1">蔬菜通求购信息</a></div>
            </li>
            <li>
                <div class="label">
                    <a href="/netCenterController/toCenter.do" rel="nofollow">我的中心</a>
                </div>
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

<input type="hidden" id="is_login" name="is_login" value="${is_login}">
<input type="hidden" id="accessToken" name="accessToken" value="${emp.access_token}">
<input type="hidden" id="mm_emp_id" name="mm_emp_id" value="${emp.mm_emp_id}">

<div class="container wrap-1190">

    <div class="pro-list mb_10 mt_10">
        <div class="info">
            *选择省市县然后点击‘添加’按钮，可选择多个地区！
        </div>

        <div class="select-line clearfix">
            <select class="select-three " name="mm_emp_provinceId" id="mm_emp_provinceId" onchange="selectCitys()">
                <option value="">--选择省份--</option>
                <c:forEach items="${listProvinces}" var="e" varStatus="st">
                    <option value="${e.provinceID}">${e.province}</option>
                </c:forEach>
            </select>

            <select class="select-three " id="mm_emp_cityId" onchange="selectCountrys()">
                <option value="">--选择城市--</option>
                <c:forEach items="${listCitys}" var="e" varStatus="st">
                    <option value="${e.cityID}">${e.city}</option>
                </c:forEach>
            </select>

            <select class="select-three " id="mm_emp_countryId">
                <option value="">--选择县区--</option>
                <c:forEach items="${listsCountry}" var="e" varStatus="st">
                    <option value="${e.areaID}">${e.area}</option>
                </c:forEach>
            </select>
        </div>

        <button class="btn-green wone mb4" onclick="add()">添加</button>
        <input type="hidden" id="areaid1">
        <input class="display" readonly="true" type="text" id="mm_msg_title" name="mm_msg_title">
        <button class="btn-green wone mb2" onclick="subAll()">提交审核</button>
        <div class="info">
            *1.关注区域只能设置一次，请谨慎！<br>
            2.提交申请后，由后台管理员进行审核，您可以联系客服查询进度！
        </div>

    </div>

    <div class="clear"></div>

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

    <%--<div class="page p_30 mb_10 tr">--%>
    <%--<center>--%>
    <%--<c:if test="${is_login=='1'}">--%>
    <%--<input type="hidden" id="pageCount" value="6443">--%>
    <%--<input type="hidden" name="size" id="size" value="${query.size}">--%>
    <%--<a href="javascript:void(0);" onclick="nextPage('1')">第一页 </a>--%>
    <%--<a href="javascript:void(0);" onclick="nextPage('${page.page-1}')">上一页</a>--%>
    <%--<a href="javascript:void(0);" onclick="nextPage('${page.page+1}')">下一页</a>--%>
    <%--<a href="javascript:void(0);" onclick="nextPage('${page.pageCount}')">最后页</a>--%>
    <%--<span>跳到</span>--%>
    <%--<span><input type="text" id="index" name="index" value="${page.page}"--%>
    <%--autocomplete="off" maxlength="6"--%>
    <%--value="${page.page}"--%>
    <%--onpaste="return false" style="text-align:center;"></span>--%>
    <%--<span>页 </span>--%>
    <%--<span><button type="button" onclick="searchIndex(event, '${page.page}')">GO</button></span>--%>
    <%--</c:if>--%>
    <%--<c:if test="${is_login=='0'}">--%>
    <%--<a class="index-button" href="javaScript:void(0)" onclick="login()">登录查看更多信息</a>--%>
    <%--</c:if>--%>
    <%--</center>--%>
    <%--</div>--%>

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
                    window.location.href = "/netGuanzhuController/toLogin.do";
                } else {
                    var _case = {1: "退出账号失败！", 9: "账号过期，请重新登录！"};
                    alert(_case[data.code])
                }
            }
        });
    }

    function add() {
        var areaid1 = $("#areaid1").val();
        var mm_emp_countryId = $("#mm_emp_countryId").val();
        var mm_emp_countryName = $("#mm_emp_countryId").find("option:selected").text();

        if ($("#areaid1").val().split(',').length > 5) {
            alert("最多选择5个县区！");
        } else {
            if ($("#areaid1").val().indexOf(mm_emp_countryId) > -1) {
                //说明存在这个值了
                alert("不能重复选择同一个县区！");
            } else {
                $("#mm_msg_title").val($("#mm_msg_title").val() + mm_emp_countryName + ",");
                $("#areaid1").val($("#areaid1").val() + mm_emp_countryId + ",");
            }
        }
    }

    function subAll() {
        //提交审核]
        var areaid1 = $("#areaid1").val();
        var mm_msg_title = $("#mm_msg_title").val();
        if (areaid1 == '' || mm_msg_title == '') {
            alert("请先选择地区！");
        } else {
            $.ajax({
                cache: true,
                type: "POST",
                url: "/netGuanzhuController/saveGuanzhuArea.do",
                data: {
                    "area_name": mm_msg_title,
                    "areaid": areaid1
                },
                async: false,
                success: function (_data) {
                    var data = $.parseJSON(_data);
                    if (data.success) {
                        alert("提交申请成功，请等待管理员审核！");
                        window.history.go(-1);
                    } else {
                        var _case = {1: "提交申请失败", 2: "已经提交申请，不能重复发布！", 9: "您的账号在其它设备上登录，请重新登录"};
                        alert(_case[data.code])
                    }
                }
            });
        }
    }
    function toPage(_url, _page) {
        if (_page != '') {
            window.location.href = _url + "?page=" + _page;
        } else {
            window.location.href = _url;
        }
    }

    function selectCitys() {
        var province = $("#mm_emp_provinceId").val();
        $.ajax({
            cache: true,
            type: "POST",
            url: "/getAllCitys.do",
            data: {
                "father": province
            },
            async: false,
            contentType: "application/x-www-form-urlencoded; charset=utf-8",
            success: function (_data) {
                var data = $.parseJSON(_data);
                if (data.success) {
                    <%--var citys = ${listCitysAll};--%>
                    var citys = data.data;
                    var ret = "<option value=''>" + '请选择城市' + "</option>";
                    for (var i = citys.length - 1; i >= 0; i--) {
                        if (citys[i].father == province) {
                            ret += "<option value='" + citys[i].cityID + "'>" + citys[i].city + "</option>";
                        }
                    }
                    $("#mm_emp_cityId").html(ret);
                } else {
                    var _case = {1: "获取数据失败"};
                    alert(_case[data.code])
                }
            }
        });
    }
    ;

    function selectCountrys() {
        var city = $("#mm_emp_cityId").val();
        $.ajax({
            cache: true,
            type: "POST",
            url: "/getAllCountrys.do",
            data: {
                "father": city
            },
            async: false,
            success: function (_data) {
                var data = $.parseJSON(_data);
                if (data.success) {
                    var countrys = data.data;
                    var ret = "<option value=''>" + '请选择县区' + "</option>";
                    for (var i = countrys.length - 1; i >= 0; i--) {
                        if (countrys[i].father == city) {
                            ret += "<option value='" + countrys[i].areaID + "'>" + countrys[i].area + "</option>";
                        }
                    }
                    $("#mm_emp_countryId").html(ret);
                } else {
                    var _case = {1: "获取数据失败"};
                    alert(_case[data.code])
                }
            }
        });
    }
    ;


</script>

</html>

