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
  <link rel="shortcut icon" type="image/png" href="/img/logo.png">
  <link rel="stylesheet" href="/css/reset.css">
  <link rel="stylesheet" href="/css/common.css">
  <link rel="stylesheet" href="/css/index.css">
  <link rel="stylesheet" href="/css/shangquan.css"/>

  <script type="text/javascript" src="/js/jquery.min.js"></script>
  <script type="text/javascript" src="/js/md5.js"></script>
  <script type="text/javascript" src="/js/cookie.js"></script>
  <script type="text/javascript" src="/js/ajaxfileupload.js"></script>
  <script type="text/javascript" src="/js/Util.js"></script>
  <script type="text/javascript" src="/js/validation.js"></script>
  <script language="javascript" src="/js/jquery.js"></script>
  <script type="text/javascript" src="/js/jquery_latest.js"></script>
  <script type="text/javascript" src="/js/glide.min.js"></script>

</head>
<body>

<input type="hidden" id="is_login" name="is_login" value="${is_login}">

<div class="container">
  <!-- HEADING -->
  <div class="heading clearfix">
    <h2 class="head-title">商圈</h2>
  </div>
  <!-- CONTENT -->
  <div class="content">
    <ul class="menu-list">
      <li onclick="clickSq('1')">
        <a href="javascript:void(0)" >
          <img class="img-icon" src="/img/star_circle.png" />
          <h5>金牌榜</h5>
          <img class="img-more" src="/img/sm_more.png" />
        </a>
      </li>
      <li onclick="clickSq('2')">
        <a href="javascript:void(0)" >
          <img class="img-icon" src="/img/afd.png" />
          <h5>附近经济人</h5>
          <img class="img-more" src="/img/sm_more.png" />
        </a>
      </li>
      <li onclick="clickSq('3')">
        <a href="javascript:void(0)" >
          <img class="img-icon" src="/img/icon_ylzc.png" />
          <h5>菜园资材</h5>
          <img class="img-more" src="/img/sm_more.png" />
        </a>
      </li>
    </ul>
  </div>

  <!-- TOOLBAR -->
  <div class="toolbar">
    <c:if test="${is_login=='1'}">
        <a href="javaScript:void(0)" onclick="toPage('/webv/toIndex.do','1')" class="buy"></a>
        <a href="javaScript:void(0)" onclick="toPage('/webvSell/toSell.do','1')" class="sell"></a>
        <a href="javaScript:void(0)" onclick="toPage('/webvShangquanController/toShangquan.do','1')" class="recommend recommend-active"></a>
        <a href="javaScript:void(0)" onclick="toPage('/webvServiceController/toService.do','1')" class="mine"></a>
    </c:if>
    <c:if test="${is_login=='0'}">
        <a href="/webvLoginController/toLogin.do" id="cd-popup-trigger1" class="buy"></a>
        <a href="/webvLoginController/toLogin.do" id="cd-popup-trigger2" class="sell"></a>
        <a href="/webvLoginController/toLogin.do" id="cd-popup-trigger3" class="recommend  recommend-active"></a>
        <a href="/webvLoginController/toLogin.do" id="cd-popup-trigger4" class="mine"></a>
    </c:if>
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

  function clickSq(istype){
    //点击事件
    var is_login = $("#is_login").val();
    if (is_login == 1) {
      if(istype == '1'){
        //金牌榜
        window.location.href = "/webvTopController/toTop.do?page=1" + "&size=10" + "&_t=" + new Date().getTime();
      }
      if(istype == '2'){
        //附近经纪人
        window.location.href = "/webvNearbyController/nearby.do?page=1"  + "&size=10" + "&_t=" + new Date().getTime();
      }
      if(istype == '3'){
        //菜园资材
        window.location.href = "/webvFuwuCenterController/toCenter.do?mm_fuwu_type=0&page=1"  + "&size=10" + "&_t=" + new Date().getTime();
      }
    }else {
      //没登陆
      window.location.href = "/webvLoginController/toLogin.do";
    }

  }
</script>
</html>
