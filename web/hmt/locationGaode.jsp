<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="um" uri="/unimanager-tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" trimDirectiveWhitespaces="true" %>

<link rel="stylesheet" href="http://cache.amap.com/lbs/static/main.css?v=1.0"/>
<script type="text/javascript"
        src="http://webapi.amap.com/maps?v=1.3&key=98ec561802a0063ec6d8301ae2321505"></script>

<!DOCTYPE html>
<html lang="zh_CH">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="chrome=1">
    <meta name="viewport" content="initial-scale=1.0, user-scalable=no, width=device-width">
    <%--<style type="text/css">--%>
        <%--body, html, #container {--%>
            <%--height: 100%;--%>
            <%--margin: 0px--%>
        <%--}--%>
    <%--</style>--%>

    <%--<script type="text/javascript" src="http://webapi.amap.com/maps?v=1.3&key=6928be14197e6c629302aa3884084e05"></script>--%>

    <link rel="stylesheet" href="http://cache.amap.com/lbs/static/main1119.css"/>
    <script src="http://webapi.amap.com/maps?v=1.3&key=6928be14197e6c629302aa3884084e05"></script>
    <script type="text/javascript" src="http://cache.amap.com/lbs/static/addToolbar.js"></script>

</head>
<body>
<%
    String lat=request.getParameter("lat");
    String lng=request.getParameter("lng");
    String mm_emp_nickname=request.getParameter("mm_emp_nickname");
    String mm_emp_company=request.getParameter("mm_emp_company");
%>

<%--<div id="container" tabindex="0"></div>--%>
<input type="hidden" id="latStr" name="latStr" value="<%=lat%>">
<input type="hidden" id="lngStr" name="lngStr" value="<%=lng%>">
<input type="hidden" id="mm_emp_nickname" name="mm_emp_nickname" value="<%=mm_emp_nickname%>">
<input type="hidden" id="mm_emp_company" name="mm_emp_company" value="<%=mm_emp_company%>">
<div id="container" style="widows: 100%;height: 220px;"></div>
<%--<div id="tip" class="tip">鼠标移入点标记试试</div>--%>

<script type="text/javascript">
     latStr = $("#latStr").val();
     lngStr = $("#lngStr").val();
     mm_emp_nickname = $("#mm_emp_nickname").val();
     mm_emp_company = $("#mm_emp_company").val();
        var map = new AMap.Map('container', {
            resizeEnable: true,
            center: [lngStr,latStr],
            zoom: 13
        });
        var marker = new AMap.Marker({
            position: map.getCenter()
        });
        marker.setMap(map);
        // 设置鼠标划过点标记显示的文字提示
        marker.setTitle(mm_emp_nickname);

        // 设置label标签
        marker.setLabel({//label默认蓝框白底左上角显示，样式className为：amap-marker-label
            offset: new AMap.Pixel(20, 20),//修改label相对于maker的位置
            content: mm_emp_company
        });

</script>

</body>
</html>
