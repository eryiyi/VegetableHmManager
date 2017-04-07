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
    <meta http-equiv="Content-Type" content="multipart/form-data; charset=utf-8"/>
    <link rel="shortcut icon" type="image/png" href="/img/logo.png">
    <link rel="stylesheet" href="/css/reset.css">
    <link rel="stylesheet" href="/css/common.css">
    <link rel="stylesheet" href="/css/common_2.css">


    <script type="text/javascript" src="/js/jquery.min.js"></script>
    <script type="text/javascript" src="/js/md5.js"></script>
    <script type="text/javascript" src="/js/cookie.js"></script>
    <script type="text/javascript" src="/js/ajaxfileupload.js"></script>
    <script type="text/javascript" src="/js/Util.js"></script>
    <script type="text/javascript" src="/js/validation.js"></script>
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

        .upload-button {
            width: 100% !important;
            display: block;
        }

    </style>

</head>
<body>
<div class="container">
    <!-- HEADING -->
    <div class="heading clearfix">
        <!-- HEADING -->
        <div class="heading clearfix">
            <%--<a href="javascript:history.back()" class="back"><img src="/img/tree_icons_back.png" alt=""></a>--%>

            <h1 class="head-title">请先完善个人资料</h1>
        </div>
    </div>
    <!-- CONTENT -->
    <div class="content regist w85">
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
    <!-- TOOLBAR -->
    <div class="toolbar">
        <a href="javaScript:void(0)" onclick="toPage('/webv/toIndex.do','1')" class="buy"></a>
        <a href="javaScript:void(0)" onclick="toPage('/webvSell/toSell.do','1')" class="sell"></a>
        <a href="javaScript:void(0)" onclick="toPage('/webvShangquanController/toShangquan.do','1')" class="recommend"></a>
        <a href="javaScript:void(0)" onclick="toPage('/webvServiceController/toService.do','1')" class="mine"></a>
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