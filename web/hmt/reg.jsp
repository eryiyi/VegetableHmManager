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
    <title>蔬菜通|会员注册</title>
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
    <link href="../hmt/css/frame.css" rel="stylesheet" type="text/css"/>
    <link href="../hmt/css/reg.css" rel="stylesheet" type="text/css"/>
    <link href="../hmt/css/base.min.css" rel="stylesheet" type="text/css"/>
    <link href="../hmt/css/login/common.css" rel="stylesheet" type="text/css"/>
    <link href="../hmt/css/login/login.css" rel="stylesheet" type="text/css"/>

    <script type="text/javascript" src="../js/jquery.min.js"></script>
    <script type="text/javascript" src="../js/md5.js"></script>
    <script type="text/javascript" src="../js/cookie.js"></script>
    <script type="text/javascript" src="../js/ajaxfileupload.js"></script>
    <script type="text/javascript" src="../js/Util.js"></script>
    <script type="text/javascript" src="../js/validation.js"></script>
    <%--<script language="javascript" src="../js/jquery.js"></script>--%>
    <%--<script type="text/javascript" src="../js/jquery_latest.js"></script>--%>

</head>
<body>
<!--头部 导航-->
<div class="header clearfix">
    <div class="logo-box fl">
        <div class="logo fl">
            <a href="/hmtIndex/toIndex.do?page=1"><img src="../hmt/images/category-vegetable/logo_type.png"
                                                       alt="蔬菜通信息平台" width="205px" height="40px"></a>
        </div>
    </div>
</div>
<!--头部 导航 end-->

<!--内容-->
<div class="container">
    <div class="reg-top clearfix">
             <span class="reg-fr">
                 已经注册，去&nbsp;<a href="javascript:void(0)" onclick="login()" target="_self" style="color:#1faa50;">登录</a>
             </span>
    </div>

    <ul class="text-input">
        <li>
            <span><i>*</i>手机号：</span>
               <span class="input-box">
                   <input type="text" id="mm_emp_mobile" name="mm_emp_mobile" maxlength="11"
                          placeholder="常用手机号码" value="常用手机号码"
                          onfocus="this.value=this.value=='常用手机号码'?'':this.value;"
                          onblur="this.value=this.value==''?'常用手机号码':this.value"
                          autocomplete="off">
                   <%--<i id="mobilev" class="reg-ico-1" style="display: none;"></i>--%>
                   <%--<div id="mobile-error" class="errorWrapper">--%>
                     <%--<label class="error">手机号不能为空</label>--%>
                   <%--</div>--%>
               </span>
        </li>
        <li><span><i>*</i>登录密码：</span>
               <span class="input-box">
                   <input type="password" id="mm_emp_password" name="mm_emp_password" attr_name="password" minlength="6"
                          maxlength="18" placeholder="设置密码" autocomplete="off">
                   <%--<span class="passwordbox">--%>
                       <%--<a class="button-password hidden" href="javascript:void(0);" id="togglePassword" target="_self"></a>--%>
                   <%--</span>--%>
                   <%--<i class="reg-ico-1" id="passwordv" style="display: none;"></i>--%>
                   <%--<span class="password-prompt hidden">温馨提示：新增密码明细切换显示</span>--%>
                   <%--<div id="password-error" class="errorWrapper">--%>
                       <%--<label class="error">请输入6~18位数字、字母或常用符号，字母区分大小写</label>--%>
                   <%--</div>--%>
               </span>
        </li>
        <li>
            <span><i>*</i>联系人：</span>
               <span class="input-box">
                   <input type="text" attr_name="linkMan" placeholder="真实姓名" id="mm_emp_nickname" name="mm_emp_nickname"
                          onfocus="this.value=this.value==''?'':this.value;"
                          onblur="this.value=this.value==''?'':this.value"
                          autocomplete="off">
                   <%--<i class="reg-ico-1" id="linkManv" style="display: none;"></i>--%>
                   <%--<div id="linkMan-error" class="errorWrapper">--%>
                     <%--<label class="error">联系人姓名不能为空，请输入3~12位中文字符</label>--%>
                   <%--</div>--%>
               </span>
        </li>
        <li>
            <span><i>*</i>身份证号：</span>
               <span class="input-box">
                   <input type="text" attr_name="linkMan" placeholder="身份证号" id="mm_emp_card" name="mm_emp_card"
                          onfocus="this.value=this.value==''?'':this.value;"
                          onblur="this.value=this.value==''?'':this.value"
                          autocomplete="off">
                   <%--<div id="mm_emp_card-error" class="errorWrapper">--%>
                       <%--<label class="error">身份证号不能为空，请输入！</label>--%>
                   <%--</div>--%>
               </span>
        </li>
        <li>
        <li>
            <span><i>*</i>省：</span>
               <span class="input-box">
                   <select name="mm_emp_provinceId" id="mm_emp_provinceId" onchange="selectCitys()">
                       <option value="">--选择省份--</option>
                       <c:forEach items="${listProvinces}" var="e" varStatus="st">
                           <option value="${e.provinceID}">${e.province}</option>
                       </c:forEach>
                   </select>
               </span>
        </li>
        <li>
            <span><i>*</i>市：</span>
               <span class="input-box">
                   <select name="mm_emp_cityId" id="mm_emp_cityId" onchange="selectCountrys()">
                       <option value="">--选择城市--</option>
                       <c:forEach items="${listCitys}" var="e" varStatus="st">
                           <option value="${e.cityID}">${e.city}</option>
                       </c:forEach>
                   </select>
               </span>
        </li>
        <li>
            <span><i>*</i>县区：</span>
               <span class="input-box">
                   <select name="mm_emp_countryId" id="mm_emp_countryId">
                       <option value="">--选择县区--</option>
                       <c:forEach items="${listsCountry}" var="e" varStatus="st">
                           <option value="${e.areaID}">${e.area}</option>
                       </c:forEach>
                   </select>
               </span>
        </li>

        <li>
            <span></span>
            <input type="button" onclick="reg()" class="submit" value="同意服务协议，完成注册">

            <div class="provision mb10">
                <a id="treaty" href="/netAboutUsController/toXieyie.do" target="_blank">《蔬菜通服务条款》</a>
            </div>
        </li>
    </ul>

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
<script  charset="utf-8">
    function login() {
        //登录页面跳转
        window.location.href = "/netLoginController/toLogin.do";
    }

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

    function reg() {
        var mm_emp_mobile = $("#mm_emp_mobile").val();
        var mm_emp_card = $("#mm_emp_card").val();
        var mm_emp_nickname = $("#mm_emp_nickname").val();
        var mm_emp_password = $("#mm_emp_password").val();
        var mm_emp_provinceId = $("#mm_emp_provinceId").val();
        var mm_emp_cityId = $("#mm_emp_cityId").val();
        var mm_emp_countryId = $("#mm_emp_countryId").val();

        if (mm_emp_mobile.replace(/\s/g, '') == '') {
            alert("手机号不能为空");
            return;
        }
        if (mm_emp_mobile.length != 11) {
            alert("手机号格式不正确");
            return;
        }
        if (mm_emp_password.replace(/\s/g, '') == '') {
            alert("密码不能为空");
            return;
        }
        if (mm_emp_password.length > 18 || mm_emp_password.length < 6) {
            alert("密码长度在6到18为之间");
            return;
        }

        if (mm_emp_nickname.replace(/\s/g, '') == '') {
            alert("姓名不能为空");
            return;
        }
        if (mm_emp_nickname.length > 10 || mm_emp_nickname.length < 2) {
            alert("姓名2到10个字以内");
            return;
        }
        if (mm_emp_card.replace(/\s/g, '') == '') {
            alert("身份证号不能为空");
            return;
        }
        if (mm_emp_card.length != 18) {
            alert("身份证号格式不正确");
            return;
        }
        if (mm_emp_provinceId.replace(/\s/g, '') == '') {
            alert("请选择省份");
            return;
        }
        if (mm_emp_cityId.replace(/\s/g, '') == '') {
            alert("请选择城市");
            return;
        }
        if (mm_emp_countryId.replace(/\s/g, '') == '') {
            alert("请选择县区");
            return;
        }
        $.ajax({
            cache: true,
            type: "POST",
            url: "/netRegController/empReg.do",
            data: {
                "mm_emp_mobile": mm_emp_mobile,
                "mm_emp_nickname": mm_emp_nickname,
                "mm_emp_card": mm_emp_card,
                "mm_emp_type": "1",
                "mm_emp_password": mm_emp_password,
                "mm_emp_company": "",
                "mm_emp_company_type": "0",
                "mm_emp_company_address": "",
                "mm_emp_company_detail": "",
                "mm_emp_company_url": "",
                "mm_emp_provinceId": mm_emp_provinceId,
                "mm_emp_cityId": mm_emp_cityId,
                "mm_emp_countryId": mm_emp_countryId,
                "mm_emp_endtime": "",
                "mm_level_id": "",
                "mm_emp_beizhu": "",
                "mm_emp_msg_num": "0",
                "is_login": "0",
                "is_fabugongying": "0",
                "is_fabuqiugou": "0",
                "is_fabugongying_see": "0",
                "is_fabuqiugou_see": "0",
                "is_see_all": "0",
                "is_pic": "0",
                "is_chengxin": "0",
                "is_miaomu": "0",
                "is_use": "0",
                "ischeck": "0"
            },
            async: false,
            success: function (_data) {
                var data = $.parseJSON(_data);
                if (data.success) {
                    alert("注册成功");
                    //登录页面跳转
                    window.location.href = "/netLoginController/toLogin.do";
                } else {
                    var _case = {1: "注册失败", 2: "该手机号已经注册", 3: "该身份证号已经注册"};
                    alert(_case[data.code])
                }
            }
        });

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
