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
    <title>蔬菜通|更新个人资料</title>
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

    <link rel="stylesheet" href="../hmt/css/profileupdate/common.css"/>
    <link rel="stylesheet" href="../hmt/css/profileupdate/common_2.css"/>

    <script type="text/javascript" src="../js/jquery.min.js"></script>
    <script type="text/javascript" src="../js/md5.js"></script>
    <script type="text/javascript" src="../js/cookie.js"></script>
    <script type="text/javascript" src="../js/ajaxfileupload.js"></script>
    <script type="text/javascript" src="../js/Util.js"></script>
    <script type="text/javascript" src="../js/validation.js"></script>
    <script language="javascript" src="../js/jquery.js"></script>
    <script type="text/javascript" src="../js/jquery_latest.js"></script>
    <style>
        .hidden {
            display: none !important;
        }

        .pic-holder {
            width: 50%;
            float: left;
        }

        .pic-holder > label {
            background-color: #fff;
            display: block;
            border: 1px solid #ccc;
        }

        .pic-holder .img-thumbnail {
            display: block;
            width: 100%;
            height: auto;

        }

        button, .upload-button {
            outline: none;
            border: none;
            width: 100% !important;
            display: block;
        }

        .update-profile {
            width: 600px;
            margin: 20px auto;
        }

    </style>
</head>
<body style="background-color: #fff !important;">
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
            <c:if test="${query.mm_msg_type=='0'}">
                <li><a href="/hmtIndex/toIndex.do?page=1&mm_msg_type=0" class="nav-tstj nav-active">求购大厅</a></li>
                <li><a href="/hmtIndex/toIndex.do?page=1&mm_msg_type=1" class="nav-dptj">供应大厅</a></li>
            </c:if>
            <c:if test="${query.mm_msg_type=='1'}">
                <li><a href="/hmtIndex/toIndex.do?page=1&mm_msg_type=0" class="nav-dptj">求购大厅</a></li>
                <li><a href="/hmtIndex/toIndex.do?page=1&mm_msg_type=1" class="nav-dptj nav-active">供应大厅</a></li>
            </c:if>

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

<div class="container">
    <%--中间内容区--%>
    <form action="supply.htm" id="filterForm" class="update-profile">
        <div class="mb_10" style="width: 500px; margin: 0 auto;">
            <input type="hidden" id="server_url" name="server_url" value="${server_url}">

            <div class="input-group-regist"><span>公司名称</span>
                <input type="text" placeholder="公司名称" id="mm_emp_company">
            </div>
            <div class="input-group-regist"><span>公司地址</span>
                <input placeholder="公司地址" type="text" id="mm_emp_company_address">
            </div>
            <div class="input-group-regist">
                <span>头像</span>
                <%--<a href="" class="pic-upload">--%>
                <%--<input id="fileUpload_1" type="file" onchange="change('adpic_1','fileUpload_1')">--%>
                <%--<label for="fileUpload_1">--%>
                <%--<img id="adpic_1" src="/img/pic_add.svg" alt="">--%>
                <%--</label>--%>
                <%--</a>--%>
                <div class="pic-holder">
                    <input type="hidden" id="mm_emp_cover">
                    <label for="fileUpload">
                        <img class="img-thumbnail" name="imagePath" id="imageDiv" src="/img/pic_add.svg"/>
                    </label>
                    <input class="hidden" type="file" name="file" id="fileUpload" style="float: left;"/>
                    <input class="upload-button fill-green" type="button" value="上传" onclick="uploadImage()"
                           style="float: left;"/>
                </div>
            </div>
            <div class="input-group-regist"><span>营业执照或公司门头</span>
                <%--<a href="" class="pic-upload">--%>
                <%--<input id="fileUpload_2" type="file" onchange="change('adpic_2','fileUpload_2')">--%>
                <%--<label for="fileUpload_2">--%>
                <%--<img id="adpic_2" src="/img/pic_add.svg" alt="">--%>
                <%--</label>--%>
                <%--</a>--%>

                <div class="pic-holder">
                    <input type="hidden" id="mm_emp_company_pic">
                    <label for="fileUpload1">
                        <img class="img-thumbnail" name="imageDiv1" id="imageDiv1" src="/img/pic_add.svg"/>
                    </label>
                    <input class="hidden" type="file" name="file" id="fileUpload1" style="float: left;"/>
                    <input class="upload-button fill-green" type="button" value="上传" onclick="uploadImage1()"
                           style="float: left;"/>
                </div>
            </div>
            <button class="mt4 w10 fill-green" type="button" onclick="reg()">提交</button>
        </div>
    </form>
    <%--中间内容区结束--%>
    <%--边栏--%>


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
                    window.location.href = "/netLoginController/toLogin.do";
                } else {
                    var _case = {1: "退出账号失败！", 9: "账号过期，请重新登录！"};
                    alert(_case[data.code])
                }
            }
        });
    }

</script>

<script>
    function toPage(_url, _page) {
        if (_page != '') {
            window.location.href = _url + "?page=" + _page;
        } else {
            window.location.href = _url;
        }
    }

    function reg() {
        var mm_emp_company = $("#mm_emp_company").val();
        var mm_emp_company_address = $("#mm_emp_company_address").val();
        var mm_emp_cover = $("#mm_emp_cover").val();
        var mm_emp_company_pic = $("#mm_emp_company_pic").val();
        if (mm_emp_company.replace(/\s/g, '') == '') {
            alert("公司名称不能为空");
            return;
        }
        if (mm_emp_company.length > 14) {
            alert("公司名称超出字段限制，最多14个字");
            return;
        }
        if (mm_emp_company_address.replace(/\s/g, '') == '') {
            alert("公司地址不能为空");
            return;
        }
        if (mm_emp_company_address.length > 20) {
            alert("公司名称超出字段限制，最多20个字");
            return;
        }
        if (mm_emp_cover.replace(/\s/g, '') == '') {
            alert("请选择头像");
            return;
        }
        if (mm_emp_company_pic.replace(/\s/g, '') == '') {
            alert("请选择营业执照");
            return;
        }
        $.ajax({
            cache: true,
            type: "POST",
            url: "/webvProfile/webMemberUpdateProfile.do",
            data: {
                "mm_emp_company": mm_emp_company,
                "mm_emp_company_pic": mm_emp_company_pic,
                "mm_emp_cover": mm_emp_cover,
                "mm_emp_company_address": mm_emp_company_address
            },
            async: false,
            success: function (_data) {
                var data = $.parseJSON(_data);
                if (data.success) {
                    alert("补充资料成功");
                    //登录页面跳转
                    window.location.href = "/webv/toIndex.do";
                } else {
                    var _case = {1: "提交失败", 9: "请登录！"};
                    alert(_case[data.code])
                }
            }
        });
    }

    function uploadImage() {
        $.ajaxFileUpload(
                {
                    url: "/uploadUnCompressImage.do?_t=" + new Date().getTime(),            //需要链接到服务器地址
                    secureuri: false,//是否启用安全提交，默认为false
                    fileElementId: 'fileUpload',                        //文件选择框的id属性
                    dataType: 'json',                                     //服务器返回的格式，可以是json, xml
                    success: function (data, status)  //服务器成功响应处理函数
                    {
                        if (data.success) {
                            var server_url = $("#server_url").val();
                            document.getElementById('mm_emp_cover').value = data.data;
                            document.getElementById('imageDiv').src = server_url + data.data;
                        } else {
                            if (data.code == 1) {
                                alert("上传图片失败");
                            } else if (data.code == 2) {
                                alert("上传图片格式只能为：jpg、png、gif、bmp、jpeg");
                            } else if (data.code == 3) {
                                alert("请选择上传图片");
                            } else {
                                alert("上传失败");
                            }
                        }
                    }
                }
        );
    }

    function uploadImage1() {
        $.ajaxFileUpload(
                {
                    url: "/uploadUnCompressImage.do?_t=" + new Date().getTime(),            //需要链接到服务器地址
                    secureuri: false,//是否启用安全提交，默认为false
                    fileElementId: 'fileUpload1',                        //文件选择框的id属性
                    dataType: 'json',                                     //服务器返回的格式，可以是json, xml
                    success: function (data, status)  //服务器成功响应处理函数
                    {
                        if (data.success) {
                            document.getElementById('mm_emp_company_pic').value = data.data;
                            var server_url = $("#server_url").val();
                            document.getElementById('imageDiv1').src = server_url + data.data;
                        } else {
                            if (data.code == 1) {
                                alert("上传图片失败");
                            } else if (data.code == 2) {
                                alert("上传图片格式只能为：jpg、png、gif、bmp、jpeg");
                            } else if (data.code == 3) {
                                alert("请选择上传图片");
                            } else {
                                alert("上传失败");
                            }
                        }
                    }
                }
        );
    }

    function deleteImage(e, node) {
        if (e.button == 2) {
            if (confirm("确定移除该图片吗？")) {
                $(node).remove();
            }
        }
    }
    ;
    //2016-04-27 17:46
    //即时显示图片代码
    //使用IE条件注释来判断是否IE6，通过判断userAgent不一定准确
    if (document.all) document.write('<!--[if lte IE 6]><script type="text/javascript">window.ie6= true<\/script><![endif]-->');
    // var ie6 = /msie 6/i.test(navigator.userAgent);//不推荐，有些系统的ie6 userAgent会是IE7或者IE8
    function change(picId, fileId) {
        var pic = document.getElementById(picId);
        var file = document.getElementById(fileId);
        if (window.FileReader) {//chrome,firefox7+,opera,IE10,IE9，IE9也可以用滤镜来实现
            oFReader = new FileReader();
            oFReader.readAsDataURL(file.files[0]);
            oFReader.onload = function (oFREvent) {
                pic.src = oFREvent.target.result;
            };
        }
        else if (document.all) {//IE8-
            file.select();
            var reallocalpath = document.selection.createRange().text//IE下获取实际的本地文件路径
            if (window.ie6) pic.src = reallocalpath; //IE6浏览器设置img的src为本地路径可以直接显示图片
            else { //非IE6版本的IE由于安全问题直接设置img的src无法显示本地图片，但是可以通过滤镜来实现，IE10浏览器不支持滤镜，需要用FileReader来实现，所以注意判断FileReader先
                pic.style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod='image',src=\"" + reallocalpath + "\")";
                pic.src = 'data:image/gif;base64,R0lGODlhAQABAIAAAP///wAAACH5BAEAAAAALAAAAAABAAEAAAICRAEAOw==';//设置img的src为base64编码的透明图片，要不会显示红xx
            }
        }
        else if (file.files) {//firefox6-
            if (file.files.item(0)) {
                url = file.files.item(0).getAsDataURL();
                pic.src = url;
            }
        }
    }
</script>

</html>

