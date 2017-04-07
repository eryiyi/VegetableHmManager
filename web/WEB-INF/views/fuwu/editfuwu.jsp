<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="um" uri="/unimanager-tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" trimDirectiveWhitespaces="true" %>

<div class="row">
    <div id="breadcrumb" class="col-xs-12">
        <a href="#" class="show-sidebar">
            <i class="fa fa-bars"></i>
        </a>
        <ol class="breadcrumb pull-left">
            <li><a href="javascript:void(0)" onclick="toPage('mainPage','')">主页</a></li>
            <li><a href="javascript:void(0)">服务管理</a></li>
            <li><a href="javascript:void(0)">服务修改</a></li>
        </ol>
    </div>
</div>
<input type="hidden" id="mm_fuwu_cover" name="mm_fuwu_cover" value="${levelObj.mm_fuwu_cover}">
<div class="row">
    <div class="col-xs-12 col-sm-12">
        <div class="box">
            <div class="box-header">
                <div class="box-name">
                    <i class="fa fa-search"></i>
                    <span>修改服务</span>
                </div>
                <div class="box-icons">
                    <a class="collapse-link">
                        <i class="fa fa-chevron-up"></i>
                    </a>
                    <a class="expand-link">
                        <i class="fa fa-expand"></i>
                    </a>
                    <a class="close-link">
                        <i class="fa fa-times"></i>
                    </a>
                </div>
                <div class="no-move"></div>
            </div>
            <div class="box-content">
                <h4 class="page-header">修改服务</h4>

                <form class="form-horizontal" role="form">
                    <input type="hidden" id="mm_fuwu_id" value="${levelObj.mm_fuwu_id}">


                    <div class="form-group">
                        <label class="col-sm-2 control-label">服务名称</label>

                        <div class="col-sm-4">
                            <input type="text" id="add_one" value="${levelObj.mm_fuwu_nickname}" class="form-control"
                                   placeholder="服务名称" data-toggle="tooltip" data-placement="bottom"
                                   title="Tooltip for name">
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-2 control-label">头像</label>

                        <div class="col-sm-10 col-md-2">
                            <img class="img-thumbnail" name="imagePath" id="imageDiv" style="cursor: pointer"
                                    src="${levelObj.mm_fuwu_cover}"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label"></label>

                        <div class="col-sm-10">
                            <input type="file" name="file" id="fileUpload" style="float: left;"/>
                            <input type="button" value="上传" onclick="uploadImage('fileUpload','imageDiv')"
                                   style="float: left;"/><br/><br/>
                            <font color="red">*如果需要修改头像，请右键“图片另存为”，修改之后重新上传！</font>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-2 control-label">服务电话</label>

                        <div class="col-sm-4">
                            <input type="text" id="add_two" value="${levelObj.mm_fuwu_tel}" class="form-control"
                                   placeholder="服务电话" data-toggle="tooltip" data-placement="bottom"
                                   title="Tooltip for name">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">服务内容</label>

                        <div class="col-sm-4">
                            <input type="text" id="add_three" value="${levelObj.mm_fuwu_content}" class="form-control"
                                   placeholder="服务内容" data-toggle="tooltip" data-placement="bottom"
                                   title="Tooltip for name">
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-2 control-label">服务类型</label>

                        <div class="col-sm-4">
                            <select class="form-control" id="mm_fuwu_type">
                                <option value="">--请选择--</option>
                                <option value="0" ${levelObj.mm_fuwu_type=='0'?'selected':''}>蔬菜商店</option>
                                <option value="1" ${levelObj.mm_fuwu_type=='1'?'selected':''}>装车工人</option>
                                <option value="2" ${levelObj.mm_fuwu_type=='2'?'selected':''}>物流中心</option>
                                <option value="3" ${levelObj.mm_fuwu_type=='3'?'selected':''}>嫁接团队</option>
                                <option value="4" ${levelObj.mm_fuwu_type=='4'?'selected':''}>吊车服务</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">微网站链接</label>

                        <div class="col-sm-4">
                            <input type="text" id="mm_fuwu_url" value="${levelObj.mm_fuwu_url}" class="form-control"
                                   placeholder="微网站链接" data-toggle="tooltip" data-placement="bottom"
                                   title="Tooltip for name">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">经纬度</label>

                        <div class="col-sm-4">
                            <input type="text" id="lat" class="form-control" value="${levelObj.lat}" placeholder="纬度"
                                   data-toggle="tooltip" data-placement="bottom" title="Tooltip for name">
                        </div>
                        <div class="col-sm-4">
                            <input type="text" id="lng" class="form-control" value="${levelObj.lng}" placeholder="经度"
                                   data-toggle="tooltip" data-placement="bottom" title="Tooltip for name">
                        </div>
                    </div>

                    <%--<input type="hidden" id="mm_emp_provinceId" value="${levelObj.provinceid}">--%>
                    <%--<input type="hidden" id="mm_emp_cityId" value="${levelObj.cityid}">--%>
                    <%--<input type="hidden" id="mm_emp_countryId" value="${levelObj.countryid}">--%>

                    <div class="form-group">
                        <label class="col-sm-2 control-label">省份</label>

                        <div class="col-sm-4">
                            <select class="form-control" id="mm_emp_provinceId" onchange="selectCitys()">
                                <option value="">--选择省份--</option>
                                <c:forEach items="${listProvinces}" var="e" varStatus="st">
                                    <option value="${e.provinceID}"  ${levelObj.provinceid==e.provinceID?'selected':''}>${e.province}</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">城市</label>

                        <div class="col-sm-4">
                            <select class="form-control" id="mm_emp_cityId" onchange="selectCountrys()">
                                    <option value="${levelObj.cityid}">${levelObj.cityName}</option>
                            </select>

                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">县区</label>

                        <div class="col-sm-4">
                            <select class="form-control" id="mm_emp_countryId">
                                    <option value="${levelObj.countryid}">${levelObj.areaName}</option>
                            </select>
                        </div>
                    </div>

                    <div class="form-group">
                        <div class="col-sm-9 col-sm-offset-3">
                            <button type="button" class="btn btn-primary" onclick="saveP()">确定</button>
                            <button type="button" class="btn btn-primary" onclick="javascript :history.back(-1)">返回
                            </button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>


    <div class="col-xs-12 col-sm-12">
        <div class="box">
            <div class="box-header">
                <div class="box-icons">
                    <a class="collapse-link">
                        <i class="fa fa-chevron-up"></i>
                    </a>
                    <a class="expand-link">
                        <i class="fa fa-expand"></i>
                    </a>
                    <a class="close-link">
                        <i class="fa fa-times"></i>
                    </a>
                </div>
                <div class="no-move"></div>
            </div>
            <div class="box-content" style="height: 500px">
                <h4 class="page-header">地图</h4>

                <div id="mapContainer"></div>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript">
    function saveP() {
        var mm_fuwu_id = $("#mm_fuwu_id").val();
        var add_one = $("#add_one").val();
        var add_two = $("#add_two").val();
        var add_three = $("#add_three").val();
        var mm_fuwu_type = $("#mm_fuwu_type").val();
        var lat = $("#lat").val();
        var lng = $("#lng").val();
        var mm_fuwu_url = $("#mm_fuwu_url").val();

        var mm_emp_provinceId = $("#mm_emp_provinceId").val();
        var mm_emp_cityId = $("#mm_emp_cityId").val();
        var mm_emp_countryId = $("#mm_emp_countryId").val();


        if (add_one.replace(/\s/g, '') == '') {
            alert("请输入正确的服务名称");
            return;
        }
        if (add_two.replace(/\s/g, '') == '') {
            alert("请输入正确的服务电话");
            return;
        }
        if (mm_fuwu_type.replace(/\s/g, '') == '') {
            alert("请输入正确的服务类型");
            return;
        }
        if (lat.replace(/\s/g, '') == '') {
            alert("请点击地图选择经纬度");
            return;
        }
        if (lng.replace(/\s/g, '') == '') {
            alert("请点击地图选择经纬度");
            return;
        }

        var imagePath = $("img[name='imagePath']").attr("src");

        if (imagePath == "" || imagePath == null) {
            imagePath =  $("#mm_fuwu_cover").val();
            return;
        }


        $.ajax({
            cache: true,
            type: "POST",
            url: "/fuwu/editFuwu.do",
            data: {
                "mm_fuwu_nickname": add_one,
                "mm_fuwu_tel": add_two,
                "mm_fuwu_content": add_three,
                "mm_fuwu_id": mm_fuwu_id,
                "mm_fuwu_type": mm_fuwu_type,
                "lat": lat,
                "lng": lng,

                "provinceid": mm_emp_provinceId,
                "cityid": mm_emp_cityId,
                "countryid": mm_emp_countryId,
                "mm_fuwu_cover": imagePath,

                "mm_fuwu_url": mm_fuwu_url
            },
            async: false,
            success: function (_data) {
                var data = $.parseJSON(_data);
                if (data.success) {
                    alert("执行成功");
                    window.location.href = "#module=fuwu/list" + "&_t=" + new Date().getTime();
                } else {
                    alert("执行失败，请检查")
                }
            }
        });
    }
</script>
<script type="text/javascript">
    //初始化地图对象，加载地图
    ////初始化加载地图时，若center及level属性缺省，地图默认显示用户当前城市范围
    var map = new AMap.Map('mapContainer', {
        resizeEnable: true
    });
    //地图中添加地图操作ToolBar插件
    map.plugin(['AMap.ToolBar'], function () {
        //设置地位标记为自定义标记
        var toolBar = new AMap.ToolBar();
        map.addControl(toolBar);
    });

    var mapObj = new AMap.Map("mapContainer", {
        rotateEnable: true,
        dragEnable: true,
        zoomEnable: true,
        zooms: [3, 18],
        resizeEnable: true,
        zoom:11,
        center: [117.488969, 37.410742]
        //二维地图显示视口
//    view: new AMap.View2D({
//      center:new AMap.LngLat(118.783897, 32.058875),//地图中心点
//      zoom:15 //地图显示的缩放级别
//    })
    });
    //  mapObj.plugin(["AMap.ToolBar"],function(){
    //    toolBar = new AMap.ToolBar();
    //    mapObj.addControl(toolBar);
    //  });
    var marker = new AMap.Marker({
        position: mapObj.getCenter()
    });
    marker.setMap(mapObj);

    //为地图注册click事件获取鼠标点击出的经纬度坐标
    var clickEventListener = AMap.event.addListener(mapObj, 'click', function (e) {
        document.getElementById("lat").value = e.lnglat.getLat();
        document.getElementById("lng").value = e.lnglat.getLng();

        marker.setMap(null);
        mapObj.setCenter(new AMap.LngLat(e.lnglat.getLng(), e.lnglat.getLat()));
        marker = new AMap.Marker({
            position: new AMap.LngLat(e.lnglat.getLng(), e.lnglat.getLat())
        });
        marker.setMap(mapObj);
    });


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

<script type="text/javascript">
    function uploadImage(_fileUpload, _imageDiv) {
        $.ajaxFileUpload(
                {
                    url: "/uploadUnCompressImage.do?_t=" + new Date().getTime(),            //需要链接到服务器地址
                    secureuri: false,//是否启用安全提交，默认为false
                    fileElementId: _fileUpload,                        //文件选择框的id属性
                    dataType: 'json',                                     //服务器返回的格式，可以是json, xml
                    success: function (data, status)  //服务器成功响应处理函数
                    {
                        if (data.success) {
                            document.getElementById(_imageDiv).src = data.data;
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
</script>