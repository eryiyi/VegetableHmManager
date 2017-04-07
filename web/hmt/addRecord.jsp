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
    <title>蔬菜通|发布信息</title>
    <meta name="keywords" content="蔬菜通,蔬菜,花木,蔬菜交易,花木求购,蔬菜求购,花木资讯,花木论坛,花木销售,蔬菜销售,蔬菜资讯,绿化蔬菜">
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
    <link href="../hmt/css/reg.css" rel="stylesheet" type="text/css"/>
    <link href="../hmt/css/base.min.css" rel="stylesheet" type="text/css"/>
    <link href="../hmt/css/login/common.css" rel="stylesheet" type="text/css"/>
    <link href="../hmt/css/login/login.css" rel="stylesheet" type="text/css"/>
    <link href="../hmt/css/release.css" rel="stylesheet" type="text/css"/>
    <link href="../hmt/css/v.css" rel="stylesheet" type="text/css"/>
    <script language="javascript" src="../js/jquery.js"></script>
    <script type="text/javascript" src="../js/md5.js"></script>
    <script type="text/javascript" src="../js/cookie.js"></script>
    <script type="text/javascript" src="../js/ajaxfileupload.js"></script>
    <script type="text/javascript" src="../js/Util.js"></script>
    <script type="text/javascript" src="../js/validation.js"></script>


    <style>
        .hidden {
            display: none !important;
        }

        .pic-holder {
            margin-left: 1%;
            width: 32%;
            float: left;
            margin-bottom: 20px;
        }

        .pic-holder > label {
            background-color: #fff;
            display: block;
            border: 1px solid #ccc;
        }

        .pic-holder .img-thumbnail {
            display: block;
            width: 100%;
        }

        .upload-button {
            outline: none;
            border: none;
            font-size: 1rem;
            line-height: 250%;
            width: 100% !important;
            display: block;
        }

        .fill-green {
            background-color: #0EBB4F;
            color: #fff;
        }

    </style>

</head>
<body>
<div class="header clearfix">
    <div class="logo-box fl">
        <div class="logo fl">
            <a href="/hmtIndex/toIndex.do?page=1"><img src="../hmt/images/category-vegetable/logo_type.png"
                                                       alt="蔬菜通信息平台" title="蔬菜通信息平台-首页" width="205px" height="40px"></a>
        </div>
        <div class="logotext lh22 fl ml10">
            <div class="fs18">发布信息</div>
            <div class="">客服热线：0543-5253666</div>
        </div>
    </div>
    <div class="links fr">
            <span>
                <i class="fl"><img src="../hmt/images/top_ico_01.jpg"></i>
                <div class="lh22 fs14 fl ml10">
                    <p>海量供应</p>

                    <p>实时更新</p>
                </div>
            </span>
            <span>
                <i class="fl"><img src="../hmt/images/top_ico_02.jpg"></i>
                <div class="lh22 fs14 fl ml10">
                    <p>采购信息</p>

                    <p>免费发布</p>
                </div>
            </span>
            <span>
                <i class="fl"><img src="../hmt/images/top_ico_03.jpg"></i>
                <div class="lh22 fs14 fl ml10">
                    <p>知名产地 </p>

                    <p>源头好货</p>
                </div>
            </span>
    </div>
</div>
<!--头部 导航 end-->

<!--内容-->
<div class="container wrap-1200">
    <div class="release-title">
        <h2>发布信息</h2>
        <input type="hidden" id="server_url" name="server_url" value="${server_url}">
        <input type="hidden" id="ad_1">
        <input type="hidden" id="ad_2">
        <input type="hidden" id="ad_3">
        <input type="hidden" id="ad_4">
        <input type="hidden" id="ad_5">
        <input type="hidden" id="ad_6">
        <input type="hidden" id="ad_7">
        <input type="hidden" id="ad_8">
        <input type="hidden" id="ad_9">

        <%--<a target="_blank" href="#">发布信息指南</a>--%>
    </div>
    <div class="release mb_50" style="padding: 50px 200px;">

        <ul class="row-3">
            <li class="col-1">信息类型</li>
            <li class="col-2">
                <select id="mm_msg_type" name="mm_msg_type">
                    <option value="0">蔬菜求购</option>
                    <option value="1">蔬菜供应</option>
                </select>
            </li>
        </ul>

        <ul class="row-4">
            <li class="col-1">信息内容</li>
            <li class="col-2"><p>${emp.mm_msg_length}字以内</p><textarea name="supplyDetail" name="mm_msg_content"
                                                                      id="mm_msg_content" cols="45" rows="5"
                                                                      placeholder="请输入您要发布的信息内容，包括您要求的品种、规格、质量及联系方式。您将对您发布信息的真实性负法律责任，请谨慎填写！"></textarea>
            </li>
            <li class="col-msg"></li>
        </ul>
        <ul class="row-5">
            <c:if test="${emp.is_pic !=null && emp.is_pic !='0'}">
                <c:if test="${emp.is_pic =='1'}">
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
                </c:if>
                <c:if test="${emp.is_pic =='2'}">
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


                </c:if>

                <c:if test="${emp.is_pic =='3'}">
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
                </c:if>
            </c:if>
        </ul>
        <ul class="row-7">
            <li class="col-2">
                <div class="release-submit">
                    <input type="button" onclick="addRecord()" name="" value="确认发布">
                    <input type="button" onclick="kefu()" name="" value="客服中心">
                </div>
            </li>
        </ul>
    </div>
</div>
<!--内容 end-->

<jsp:include page="footer.jsp" flush="true"/>

</body>
<script>
    function toPage(_url, _page) {
        if (_page != '') {
            window.location.href = _url + "?page=" + _page;
        } else {
            window.location.href = _url;
        }
    }

    function kefu() {
        window.location.href = "/netWeixinController/toKefu.do";
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
    function addRecord() {
        var mm_msg_type = $("#mm_msg_type").val();
        var mm_msg_content = $("#mm_msg_content").val();
        if (mm_msg_type.replace(/\s/g, '') == '') {
            alert("请选择信息类型");
            return;
        }
        if (mm_msg_content.replace(/\s/g, '') == '') {
            alert("请输入您要发布的信息内容");
            return;
        }
        var mm_msg_length = ${emp.mm_msg_length};
        if (mm_msg_content.length > mm_msg_length || mm_msg_content.length < 2) {
            alert("请输入您要发布的信息内容，内容在2到" + mm_msg_length + "个字之间");
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

        $.ajax({
            cache: true,
            type: "POST",
            url: "/netAddRecordController/addRecord.do",
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
