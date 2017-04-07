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
    <link rel="stylesheet" href="/css/report.css">
    <link rel="stylesheet" href="/css/user_profile.css">
    <link rel="stylesheet" href="/css/service.css">

    <script type="text/javascript" src="/js/jquery.min.js"></script>
    <script type="text/javascript" src="/js/md5.js"></script>
    <script type="text/javascript" src="/js/cookie.js"></script>
    <script type="text/javascript" src="/js/ajaxfileupload.js"></script>
    <script type="text/javascript" src="/js/Util.js"></script>
    <script type="text/javascript" src="/js/validation.js"></script>
    <style>
        .hidden { display: none !important; }
        .pic-holders{ margin-bottom: 10px; position: relative; }
        .pic-holder { margin-left: 1%; width: 32%; float: left; }
        .pic-holder > label { background-color: #fff; display: block; border: 1px solid #ccc; }
        .pic-holder .img-thumbnail { display: block; width: 100%; height: auto; }
        .upload-button { font-size: 1rem; line-height: 200%; width: 100% !important; display: block; }
    </style>
    <script>
        $().ready(function(){
            $(window).load(function(){
                $('.img-thumbnail').height(function(){
                    return $(this).width();
                })
            });
            $(window).resize(function(){
                $('.img-thumbnail').height(function(){
                    return $(this).width();
                })
            });
        });


    </script>

</head>
<div class="container">
    <!-- HEADING -->
    <%--<div class="heading clearfix">--%>
        <%--<!-- HEADING -->--%>
        <%--<div class="heading clearfix">--%>
            <%--<a href="javascript:history.back()" class="back"><img src="/img/tree_icons_back.png" alt=""></a>--%>

            <%--<h1 class="head-title">发布信息</h1>--%>
        <%--</div>--%>
    <%--</div>--%>
    <!-- CONTENT -->
    <div class="content regist w85">
        <div class="select-group mt2 mb2"><span>信息类型</span>
            <input type="hidden" id="server_url" name="server_url" value="${server_url}">
            <select name="mm_msg_type" id="mm_msg_type" class="bg-f2">
                <option value="0">蔬菜求购</option>
                <option value="1">蔬菜供应</option>
            </select>
        </div>
        <%--<span>信息标题：</span>--%>
        <%--<input class="report-reason" placeholder="信息标题" type="text" id="mm_msg_title" name="mm_msg_title">--%>
        <span>信息内容：</span>
		<textarea class="report-reason" name="mm_msg_content"
                  id="mm_msg_content" cols="30" placeholder="请输入您要发布的信息内容，包括您要求的品种、规格、质量及联系方式。您将对您发布信息的真实性负法律责任，请谨慎填写！"
                  rows="10"></textarea>

        <div class="ads clearfix">

            <input type="hidden" id="ad_1">
            <input type="hidden" id="ad_2">
            <input type="hidden" id="ad_3">
            <input type="hidden" id="ad_4">
            <input type="hidden" id="ad_5">
            <input type="hidden" id="ad_6">
            <input type="hidden" id="ad_7">
            <input type="hidden" id="ad_8">
            <input type="hidden" id="ad_9">

            <input type="hidden" id="ad_10">
            <input type="hidden" id="ad_11">
            <input type="hidden" id="ad_12">
            <input type="hidden" id="ad_13">
            <input type="hidden" id="ad_14">
            <input type="hidden" id="ad_15">
            <input type="hidden" id="ad_16">
            <input type="hidden" id="ad_17">
            <input type="hidden" id="ad_18">

            <c:if test="${emp.is_pic !=null && emp.is_pic !='0'}">
                <c:if test="${emp.is_pic =='1'}">
                    <div class="pic-holders">
                        <div class="pic-holder">
                            <label for="fileUpload1">
                                <img class="img-thumbnail" name="imagePath1" id="imagePath1" src="/img/pic_add.svg"/>
                            </label>
                            <input class="hidden" type="file" name="file" id="fileUpload1" style="float: left;"/>
                            <input class="upload-button fill-green" type="button" value="上传"
                                   onclick="uploadImage('ad_1','imagePath1','fileUpload1')" style="float: left;"/>
                        </div>
                        <div class="pic-holder">
                            <label for="fileUpload2">
                                <img class="img-thumbnail" name="imagePath2" id="imagePath2" src="/img/pic_add.svg"/>
                            </label>
                            <input class="hidden" type="file" name="file" id="fileUpload2" style="float: left;"/>
                            <input class="upload-button fill-green" type="button" value="上传"
                                   onclick="uploadImage('ad_2','imagePath2','fileUpload2')" style="float: left;"/>
                        </div>
                        <div class="pic-holder">
                            <label for="fileUpload3">
                                <img class="img-thumbnail" name="imagePath3" id="imagePath3" src="/img/pic_add.svg"/>
                            </label>
                            <input class="hidden" type="file" name="file" id="fileUpload3" style="float: left;"/>
                            <input class="upload-button fill-green" type="button" value="上传"
                                   onclick="uploadImage('ad_3','imagePath3','fileUpload3')" style="float: left;"/>
                        </div>
                    </div>
                </c:if>
                <c:if test="${emp.is_pic =='2'}">
                    <div class="pic-holders">
                        <div class="pic-holder">
                            <label for="fileUpload4">
                                <img class="img-thumbnail" name="imagePath4" id="imagePath4" src="/img/pic_add.svg"/>
                            </label>
                            <input class="hidden" type="file" name="file" id="fileUpload4" style="float: left;"/>
                            <input class="upload-button fill-green" type="button" value="上传"
                                   onclick="uploadImage('ad_4','imagePath4','fileUpload4')" style="float: left;"/>
                        </div>
                        <div class="pic-holder">
                            <label for="fileUpload5">
                                <img class="img-thumbnail" name="imagePath5" id="imagePath5" src="/img/pic_add.svg"/>
                            </label>
                            <input class="hidden" type="file" name="file" id="fileUpload5" style="float: left;"/>
                            <input class="upload-button fill-green" type="button" value="上传"
                                   onclick="uploadImage('ad_5','imagePath5','fileUpload5')" style="float: left;"/>
                        </div>
                        <div class="pic-holder">
                            <label for="fileUpload6">
                                <img class="img-thumbnail" name="imagePath6" id="imagePath6" src="/img/pic_add.svg"/>
                            </label>
                            <input class="hidden" type="file" name="file" id="fileUpload6" style="float: left;"/>
                            <input class="upload-button fill-green" type="button" value="上传"
                                   onclick="uploadImage('ad_6','imagePath6','fileUpload6')" style="float: left;"/>
                        </div>
                        <div class="clearfix"></div>
                    </div>
                   <div class="pic-holders">
                       <div class="pic-holder">
                           <label for="fileUpload7">
                               <img class="img-thumbnail" name="imagePath7" id="imagePath7" src="/img/pic_add.svg"/>
                           </label>
                           <input class="hidden" type="file" name="file" id="fileUpload7" style="float: left;"/>
                           <input class="upload-button fill-green" type="button" value="上传"
                                  onclick="uploadImage('ad_7','imagePath7','fileUpload7')" style="float: left;"/>
                       </div>
                       <div class="pic-holder">
                           <label for="fileUpload8">
                               <img class="img-thumbnail" name="imagePath8" id="imagePath8" src="/img/pic_add.svg"/>
                           </label>
                           <input class="hidden" type="file" name="file" id="fileUpload8" style="float: left;"/>
                           <input class="upload-button fill-green" type="button" value="上传"
                                  onclick="uploadImage('ad_8','imagePath8','fileUpload8')" style="float: left;"/>
                       </div>
                       <div class="pic-holder">
                           <label for="fileUpload9">
                               <img class="img-thumbnail" name="imagePath9" id="imagePath9" src="/img/pic_add.svg"/>
                           </label>
                           <input class="hidden" type="file" name="file" id="fileUpload9" style="float: left;"/>
                           <input class="upload-button fill-green" type="button" value="上传"
                                  onclick="uploadImage('ad_9','imagePath9','fileUpload9')" style="float: left;"/>
                       </div>
                   </div>
                </c:if>

                <c:if test="${emp.is_pic =='3'}">
                   <div class="pic-holders">
                       <div class="pic-holder">
                           <label for="fileUpload10">
                               <img class="img-thumbnail" name="imagePath10" id="imagePath10" src="/img/pic_add.svg"/>
                           </label>
                           <input class="hidden" type="file" name="file" id="fileUpload10" style="float: left;"/>
                           <input class="upload-button fill-green" type="button" value="上传"
                                  onclick="uploadImage('ad_10','imagePath10','fileUpload10')" style="float: left;"/>
                       </div>
                       <div class="pic-holder">
                           <label for="fileUpload11">
                               <img class="img-thumbnail" name="imagePath11" id="imagePath11" src="/img/pic_add.svg"/>
                           </label>
                           <input class="hidden" type="file" name="file" id="fileUpload11" style="float: left;"/>
                           <input class="upload-button fill-green" type="button" value="上传"
                                  onclick="uploadImage('ad_11','imagePath11','fileUpload11')" style="float: left;"/>
                       </div>
                       <div class="pic-holder">
                           <label for="fileUpload12">
                               <img class="img-thumbnail" name="imagePath12" id="imagePath12" src="/img/pic_add.svg"/>
                           </label>
                           <input class="hidden" type="file" name="file" id="fileUpload12" style="float: left;"/>
                           <input class="upload-button fill-green" type="button" value="上传"
                                  onclick="uploadImage('ad_12','imagePath12','fileUpload12')" style="float: left;"/>
                       </div>
                       <div class="clearfix"></div>
                   </div>
                    <div class="pic-holders">
                        <div class="pic-holder">
                            <label for="fileUpload13">
                                <img class="img-thumbnail" name="imagePath13" id="imagePath13" src="/img/pic_add.svg"/>
                            </label>
                            <input class="hidden" type="file" name="file" id="fileUpload13" style="float: left;"/>
                            <input class="upload-button fill-green" type="button" value="上传"
                                   onclick="uploadImage('ad_13','imagePath13','fileUpload13')" style="float: left;"/>
                        </div>
                        <div class="pic-holder">
                            <label for="fileUpload14">
                                <img class="img-thumbnail" name="imagePath14" id="imagePath14" src="/img/pic_add.svg"/>
                            </label>
                            <input class="hidden" type="file" name="file" id="fileUpload14" style="float: left;"/>
                            <input class="upload-button fill-green" type="button" value="上传"
                                   onclick="uploadImage('ad_14','imagePath14','fileUpload14')" style="float: left;"/>
                        </div>
                        <div class="pic-holder">
                            <label for="fileUpload15">
                                <img class="img-thumbnail" name="imagePath15" id="imagePath15" src="/img/pic_add.svg"/>
                            </label>
                            <input class="hidden" type="file" name="file" id="fileUpload15" style="float: left;"/>
                            <input class="upload-button fill-green" type="button" value="上传"
                                   onclick="uploadImage('ad_15','imagePath15','fileUpload15')" style="float: left;"/>
                        </div>
                        <div class="clearfix"></div>
                    </div>
                    <div class="pic-holders">
                        <div class="pic-holder">
                            <label for="fileUpload16">
                                <img class="img-thumbnail" name="imagePath16" id="imagePath16" src="/img/pic_add.svg"/>
                            </label>
                            <input class="hidden" type="file" name="file" id="fileUpload16" style="float: left;"/>
                            <input class="upload-button fill-green" type="button" value="上传"
                                   onclick="uploadImage('ad_16','imagePath16','fileUpload16')" style="float: left;"/>
                        </div>
                        <div class="pic-holder">
                            <label for="fileUpload17">
                                <img class="img-thumbnail" name="imagePath17" id="imagePath17" src="/img/pic_add.svg"/>
                            </label>
                            <input class="hidden" type="file" name="file" id="fileUpload17" style="float: left;"/>
                            <input class="upload-button fill-green" type="button" value="上传"
                                   onclick="uploadImage('ad_17','imagePath17','fileUpload17')" style="float: left;"/>
                        </div>
                        <div class="pic-holder">
                            <label for="fileUpload18">
                                <img class="img-thumbnail" name="imagePath18" id="imagePath18" src="/img/pic_add.svg"/>
                            </label>
                            <input class="hidden" type="file" name="file" id="fileUpload18" style="float: left;"/>
                            <input class="upload-button fill-green" type="button" value="上传"
                                   onclick="uploadImage('ad_18','imagePath18','fileUpload18')" style="float: left;"/>
                        </div>
                    </div>

                </c:if>
            </c:if>
        </div>
        <button class="button fill-orange mt2 w10 t-sh mb2" onclick="addRecord()">提交</button>
        <button class="button fill-orange mt2 w10 t-sh mb4" onclick="kefu()">客服中心</button>
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
    function kefu() {
        window.location.href = "/webvKefuController/toKefu.do";
    }

    function toPage(_url, _page) {
        if (_page != '') {
            window.location.href = _url + "?page=" + _page;
        } else {
            window.location.href = _url;
        }
    }
    function addRecord() {
        var mm_msg_type = $("#mm_msg_type").val();
//		var mm_msg_title = $("#mm_msg_title").val();
        var mm_msg_content = $("#mm_msg_content").val();
        if (mm_msg_type.replace(/\s/g, '') == '') {
            alert("请选择信息类型");
            return;
        }
        if (mm_msg_content.replace(/\s/g, '') == '') {
            alert("请输入您要发布的信息内容");
            return;
        }
        if (mm_msg_content.length > 300 || mm_msg_content.length < 2) {
            alert("请输入您要发布的信息内容，内容在2到300个字之间");
            return;
        }
        if ('${emp.is_fabugongying}' == '0' && mm_msg_type == '1') {
            alert("您暂无权限发布蔬菜供应信息，请联系客服！");
            return;
        }
        if ('${emp.is_fabuqiugou}' == '0' && mm_msg_type == '0') {
            alert("您暂无权限发布蔬菜求购信息，请联系客服！");
            return;
        }

        var ad_1 = $("#ad_1").val();
        var ad_2 = $("#ad_2").val();
        var ad_3 = $("#ad_3").val();
        var ad_4 = $("#ad_4").val();
        var ad_5 = $("#ad_5").val();
        var ad_6 = $("#ad_6").val();
        var ad_7 = $("#ad_7").val();
        var ad_8 = $("#ad_8").val();
        var ad_9 = $("#ad_9").val();

        var ad_10 = $("#ad_10").val();
        var ad_11 = $("#ad_11").val();
        var ad_12 = $("#ad_12").val();
        var ad_13 = $("#ad_13").val();
        var ad_14 = $("#ad_14").val();
        var ad_15 = $("#ad_15").val();
        var ad_16 = $("#ad_16").val();
        var ad_17 = $("#ad_17").val();
        var ad_18 = $("#ad_18").val();

        $.ajax({
            cache: true,
            type: "POST",
            url: "/webvAddRecordController/addRecord.do",
            data: {
                "mm_msg_type": mm_msg_type,
                "mm_msg_title": "",
                "ad_1": ad_1,
                "ad_2": ad_2,
                "ad_3": ad_3,
                "ad_4": ad_4,
                "ad_5": ad_5,
                "ad_6": ad_6,
                "ad_7": ad_7,
                "ad_8": ad_8,
                "ad_9": ad_9,
                "ad_10": ad_10,
                "ad_11": ad_11,
                "ad_12": ad_12,
                "ad_13": ad_13,
                "ad_14": ad_14,
                "ad_15": ad_15,
                "ad_16": ad_16,
                "ad_17": ad_17,
                "ad_18": ad_18,
                "mm_msg_content": mm_msg_content
            },
            async: false,
            success: function (_data) {
                var data = $.parseJSON(_data);
                if (data.success) {
                    alert("发布信息成功！");
                    window.history.go(-1);
                } else {
                    var _case = {
                        1: "发布信息失败",
                        2: "已经发布该信息，不能重复发布！",
                        3: "发布信息数量超出限制，要发布更多信息，请联系客服！",
                        9: "您的账号在其它设备上登录，请重新登录"
                    };
                    alert(_case[data.code])
                }
            }
        });
    }

    function uploadImage(_ad, _imagePath, _fileUpload) {
        $.ajaxFileUpload(
                {
                    url: "/uploadUnCompressImage.do?_t=" + new Date().getTime(),            //需要链接到服务器地址
                    secureuri: false,//是否启用安全提交，默认为false
                    fileElementId: _fileUpload,                        //文件选择框的id属性
                    dataType: 'json',                                     //服务器返回的格式，可以是json, xml
                    success: function (data, status)  //服务器成功响应处理函数
                    {
                        if (data.success) {
                            var server_url = $("#server_url").val();
                            document.getElementById(_ad).value = data.data;
                            document.getElementById(_imagePath).src = server_url + data.data;
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

</script>
</html>