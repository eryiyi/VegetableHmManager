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
            <li><a href="javascript:void (0);">会员管理</a></li>
            <li><a href="javascript:void (0);">会员详情</a></li>
        </ol>

    </div>
</div>

<div class="row">
    <div class="col-xs-12 col-sm-12">
        <div class="box">
            <div class="box-header">
                <div class="box-name">
                    <i class="fa fa-search"></i>
                    <span>会员详情</span>
                </div>
            </div>
            <div class="box-content">
                <%--<h4 class="page-header">会员详情</h4>--%>
                <form class="form-horizontal" role="form">
                    <input type="hidden" value="${empVO.mm_emp_id}" id="mm_emp_id">
                    <input type="hidden" value="${empVO.mm_emp_cover}" id="mm_emp_cover">
                    <input type="hidden" value="${empVO.ad_pic}" id="ad_pic">

                    <div class="form-group">
                        <label class="col-sm-2 control-label">用户名</label>

                        <div class="col-sm-4">
                            <input type="text" id="mm_emp_nickname" class="form-control"
                                   value="${empVO.mm_emp_nickname}" data-toggle="tooltip" data-placement="bottom"
                                   title="Tooltip for name">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">用户手机号</label>

                        <div class="col-sm-4">
                            <input type="text" id="mm_emp_mobile" readonly="true" class="form-control"
                                   value="${empVO.mm_emp_mobile}" data-toggle="tooltip" data-placement="bottom"
                                   title="Tooltip for name">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">身份证号</label>

                        <div class="col-sm-4">
                            <input type="text" id="mm_emp_card" class="form-control" value="${empVO.mm_emp_card}"
                                   data-toggle="tooltip" data-placement="bottom" title="Tooltip for name">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">头像</label>

                        <div class="col-sm-10 col-md-2">
                            <img class="img-thumbnail" name="imagePath" id="imageDiv" style="cursor: pointer"
                                 src="${empVO.mm_emp_cover}"/>
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
                        <label class="col-sm-2 control-label">营业执照或公司门头</label>

                        <div class="col-sm-10 col-md-2">
                            <img class="img-thumbnail" name="mm_emp_company_pic" id="mm_emp_company_pic"
                                 style="cursor: pointer" src="${empVO.mm_emp_company_pic}"/>
                        </div>
                    </div>
                    <%--<div class="form-group">--%>
                    <%--<label class="col-sm-2 control-label">用户密码</label>--%>
                    <%--<div class="col-sm-4">--%>
                    <%--<input type="text" id="mm_emp_password" class="form-control" value="${empVO.mm_emp_password}" data-toggle="tooltip" data-placement="bottom" title="Tooltip for name">--%>
                    <%--</div>--%>
                    <%--</div>--%>

                    <div class="form-group">
                        <label class="col-sm-2 control-label">名片</label>

                        <div class="col-sm-10 col-md-2">
                            <img class="img-thumbnail" name="imagePath1" id="imageDiv1" style="cursor: pointer"
                                 src="${empVO.ad_pic}"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label"></label>

                        <div class="col-sm-10">
                            <input type="file" name="file" id="fileUpload1" style="float: left;"/>
                            <input type="button" value="上传" onclick="uploadImage('fileUpload1','imageDiv1')"
                                   style="float: left;"/><br/><br/>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-2 control-label">用户类型</label>

                        <div class="col-sm-4">
                            <select class="form-control" id="mm_emp_type">
                                <option value="">--选择用户类型--</option>
                                <option value="0" ${empVO.mm_emp_type=='0'?'selected':''}>蔬菜经营</option>
                                <option value="1" ${empVO.mm_emp_type=='1'?'selected':''}>蔬菜会员</option>
                            </select>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-2 control-label">允许发布信息的长度</label>

                        <div class="col-sm-4">
                            <input type="text" id="mm_msg_length" class="form-control" value="${empVO.mm_msg_length}"
                                   data-toggle="tooltip" data-placement="bottom" title="Tooltip for name">
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-2 control-label">公司名称</label>

                        <div class="col-sm-4">
                            <input type="text" id="mm_emp_company" class="form-control" value="${empVO.mm_emp_company}"
                                   data-toggle="tooltip" data-placement="bottom" title="Tooltip for name">
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-2 control-label">公司类型</label>

                        <div class="col-sm-4">
                            <select class="form-control" id="mm_emp_company_type">
                                <option value="">--选择公司类型--</option>
                                <option value="0" ${empVO.mm_emp_company_type=='0'?'selected':''}>蔬菜</option>
                                <option value="1" ${empVO.mm_emp_company_type=='1'?'selected':''}>菜园</option>
                            </select>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-2 control-label">公司地址</label>

                        <div class="col-sm-4">
                            <input type="text" id="mm_emp_company_address" class="form-control"
                                   value="${empVO.mm_emp_company_address}" data-toggle="tooltip" data-placement="bottom"
                                   title="Tooltip for name">
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-2 control-label">公司简介</label>

                        <div class="col-sm-4">
                            <input type="text" id="mm_emp_company_detail" class="form-control"
                                   value="${empVO.mm_emp_company_detail}" data-toggle="tooltip" data-placement="bottom"
                                   title="Tooltip for name">
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-2 control-label">公司微网站</label>

                        <div class="col-sm-4">
                            <input type="text" id="mm_emp_company_url" placeholder="网址链接" class="form-control"
                                   value="${empVO.mm_emp_company_url}" data-toggle="tooltip" data-placement="bottom"
                                   title="Tooltip for name">
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-2 control-label">省份</label>

                        <div class="col-sm-4">
                            <select class="form-control" id="mm_emp_provinceId" onchange="selectCitys()">
                                <option value="">--选择省份--</option>
                                <c:forEach items="${listProvinces}" var="e" varStatus="st">
                                    <option value="${e.provinceID}"  ${empVO.mm_emp_provinceId==e.provinceID?'selected':''}>${e.province}</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">城市</label>

                        <div class="col-sm-4">
                            <select class="form-control" id="mm_emp_cityId" onchange="selectCountrys()">
                                <option value="${empVO.mm_emp_cityId}" >${empVO.cityName}</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">县区</label>

                        <div class="col-sm-4">
                            <select class="form-control" id="mm_emp_countryId">
                                <option value="${empVO.mm_emp_countryId}">${empVO.areaName}</option>
                            </select>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-2 control-label">VIP星级</label>

                        <div class="col-sm-4">
                            <select class="form-control" id="mm_level_id">
                                <option value="">--选择VIP星级--</option>
                                <c:forEach items="${listLevels}" var="e" varStatus="st">
                                    <option value="${e.mm_level_id}"  ${empVO.mm_level_id==e.mm_level_id?'selected':''}>${e.mm_level_name}</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-2 control-label">Vip到期日期</label>

                        <div class="col-sm-2">
                            <input type="date" id="mm_emp_endtime" class="form-control" value="${empVO.mm_emp_endtime}">
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-2 control-label">注册日期</label>

                        <div class="col-sm-4">
                            <input type="text" id="mm_emp_regtime" readonly="true" class="form-control"
                                   value="${empVO.mm_emp_regtime}">
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-2 control-label">会员备注</label>

                        <div class="col-sm-4">
                            <input type="text" id="mm_emp_beizhu" class="form-control" value="${empVO.mm_emp_beizhu}"
                                   data-toggle="tooltip" data-placement="bottom" title="Tooltip for name">
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-2 control-label">允许发布信息数量</label>

                        <div class="col-sm-4">
                            <input type="text" id="mm_emp_msg_num" class="form-control" value="${empVO.mm_emp_msg_num}"
                                   data-toggle="tooltip" data-placement="bottom" title="Tooltip for name">
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-2 control-label">允许登陆</label>

                        <div class="col-sm-4">
                            <select class="form-control" id="is_login">
                                <option value="">--请选择--</option>
                                <option value="0" ${empVO.is_login=='0'?'selected':''}>允许</option>
                                <option value="1" ${empVO.is_login=='1'?'selected':''}>不允许</option>
                            </select>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-2 control-label">允许用户修改头像</label>

                        <div class="col-sm-4">
                            <select class="form-control" id="is_cover">
                                <option value="">--请选择--</option>
                                <option value="0" ${empVO.is_cover=='0'?'selected':''}>允许</option>
                                <option value="1" ${empVO.is_cover=='1'?'selected':''}>不允许</option>
                            </select>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-2 control-label">发布供应信息权限</label>

                        <div class="col-sm-4">
                            <select class="form-control" id="is_fabugongying">
                                <option value="">--请选择--</option>
                                <option value="0" ${empVO.is_fabugongying=='0'?'selected':''}>不允许</option>
                                <option value="1" ${empVO.is_fabugongying=='1'?'selected':''}>允许</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">发布求购信息权限</label>

                        <div class="col-sm-4">
                            <select class="form-control" id="is_fabuqiugou">
                                <option value="">--请选择--</option>
                                <option value="0" ${empVO.is_fabuqiugou=='0'?'selected':''}>不允许</option>
                                <option value="1" ${empVO.is_fabuqiugou=='1'?'selected':''}>允许</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">查看供应信息权限</label>

                        <div class="col-sm-4">
                            <select class="form-control" id="is_fabugongying_see">
                                <option value="">--请选择--</option>
                                <option value="0" ${empVO.is_fabugongying_see=='0'?'selected':''}>允许</option>
                                <option value="1" ${empVO.is_fabugongying_see=='1'?'selected':''}>不允许</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">查看求购信息权限</label>

                        <div class="col-sm-4">
                            <select class="form-control" id="is_fabuqiugou_see">
                                <option value="">--请选择--</option>
                                <option value="0" ${empVO.is_fabuqiugou_see=='0'?'selected':''}>允许</option>
                                <option value="1" ${empVO.is_fabuqiugou_see=='1'?'selected':''}>不允许</option>
                            </select>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-2 control-label">查看所有信息权限</label>

                        <div class="col-sm-4">
                            <select class="form-control" id="is_see_all">
                                <option value="">--请选择--</option>
                                <option value="0" ${empVO.is_see_all=='0'?'selected':''}>不允许</option>
                                <option value="1" ${empVO.is_see_all=='1'?'selected':''}>允许</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">照片发布权限</label>

                        <div class="col-sm-4">
                            <select class="form-control" id="is_pic">
                                <option value="">--请选择--</option>
                                <option value="0" ${empVO.is_pic=='0'?'selected':''}>不允许</option>
                                <option value="1" ${empVO.is_pic=='1'?'selected':''}>允许3张</option>
                                <option value="2" ${empVO.is_pic=='2'?'selected':''}>允许6张</option>
                                <option value="3" ${empVO.is_pic=='3'?'selected':''}>允许9张</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">发布视频</label>

                        <div class="col-sm-4">
                            <select class="form-control" id="is_video">
                                <option value="">--请选择--</option>
                                <option value="0" ${empVO.is_video=='0'?'selected':''}>不允许</option>
                                <option value="1" ${empVO.is_video=='1'?'selected':''}>允许</option>
                            </select>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-2 control-label">诚信单位</label>

                        <div class="col-sm-4">
                            <select class="form-control" id="is_chengxin">
                                <option value="">--请选择--</option>
                                <option value="0" ${empVO.is_chengxin=='0'?'selected':''}>否</option>
                                <option value="1" ${empVO.is_chengxin=='1'?'selected':''}>是</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">蔬菜协会</label>

                        <div class="col-sm-4">
                            <select class="form-control" id="is_miaomu">
                                <option value="">--请选择--</option>
                                <option value="0" ${empVO.is_miaomu=='0'?'selected':''}>否</option>
                                <option value="1" ${empVO.is_miaomu=='1'?'selected':''}>是</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">是否禁用</label>

                        <div class="col-sm-4">
                            <select class="form-control" id="is_use">
                                <option value="">--请选择--</option>
                                <option value="0" ${empVO.is_use=='0'?'selected':''}>否</option>
                                <option value="1" ${empVO.is_use=='1'?'selected':''}>是</option>
                            </select>
                        </div>
                    </div>

                    <%--<div class="form-group">--%>
                        <%--<label class="col-sm-2 control-label">经纬度</label>--%>

                        <%--<div class="col-sm-4">--%>
                            <%--<input type="text" id="lat" class="form-control" value="${empVO.lat}" data-toggle="tooltip"--%>
                                   <%--data-placement="bottom" title="Tooltip for name" readonly="true">--%>
                            <%--<input type="text" id="lng" class="form-control" value="${empVO.lng}" data-toggle="tooltip"--%>
                                   <%--data-placement="bottom" title="Tooltip for name" readonly="true">--%>
                        <%--</div>--%>
                    <%--</div>--%>

                    <div class="form-group">
                        <label class="col-sm-2 control-label">公司经纬度</label>

                        <div class="col-sm-4">
                            <input type="text" id="lat_company" class="form-control" value="${empVO.lat_company}"
                                   data-toggle="tooltip" data-placement="bottom" title="Tooltip for name">
                            <input type="text" id="lng_company" class="form-control" value="${empVO.lng_company}"
                                   data-toggle="tooltip" data-placement="bottom" title="Tooltip for name">
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-2 control-label">是否审核</label>

                        <div class="col-sm-4">
                            <select class="form-control" id="ischeck">
                                <option value="">--请选择--</option>
                                <option value="0" ${empVO.ischeck=='0'?'selected':''}>未审核</option>
                                <option value="1" ${empVO.ischeck=='1'?'selected':''}>已审核</option>
                                <option value="2" ${empVO.ischeck=='2'?'selected':''}>未通过</option>
                            </select>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-2 control-label">是否特殊会员</label>

                        <div class="col-sm-4">
                            <select class="form-control" id="is_special">
                                <option value="">--请选择--</option>
                                <option value="0" ${empVO.is_special=='0'?'selected':''}>否</option>
                                <option value="1" ${empVO.is_special=='1'?'selected':''}>是</option>
                            </select>
                        </div>
                    </div>

                    <div class="form-group">
                        <div class="col-sm-9 col-sm-offset-3">
                            <button type="button" class="btn btn-primary" onclick="saveRole('${empVO.mm_emp_id}')">
                                确定修改
                            </button>
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

    function saveRole(mm_emp_id) {
        var mm_emp_id = $("#mm_emp_id").val();
        var mm_emp_mobile = $("#mm_emp_mobile").val();
        var mm_msg_length = $("#mm_msg_length").val();
        var mm_emp_nickname = $("#mm_emp_nickname").val();
        var mm_emp_card = $("#mm_emp_card").val();
//    var mm_emp_password = $("#mm_emp_password").val();
        var mm_emp_type = $("#mm_emp_type").val();
        var mm_emp_company = $("#mm_emp_company").val();
        var mm_emp_company_type = $("#mm_emp_company_type").val();
        var mm_emp_company_address = $("#mm_emp_company_address").val();
        var mm_emp_company_detail = $("#mm_emp_company_detail").val();
        var mm_emp_company_url = $("#mm_emp_company_url").val();
        var mm_emp_provinceId = $("#mm_emp_provinceId").val();
        var mm_emp_cityId = $("#mm_emp_cityId").val();
        var mm_emp_countryId = $("#mm_emp_countryId").val();
        var mm_emp_regtime = $("#mm_emp_regtime").val();
        var mm_emp_endtime = $("#mm_emp_endtime").val();
        var mm_level_id = $("#mm_level_id").val();
        var mm_emp_beizhu = $("#mm_emp_beizhu").val();
        var mm_emp_msg_num = $("#mm_emp_msg_num").val();
        var is_login = $("#is_login").val();
        var is_cover = $("#is_cover").val();
        var is_fabugongying = $("#is_fabugongying").val();
        var is_fabuqiugou = $("#is_fabuqiugou").val();
        var is_fabugongying_see = $("#is_fabugongying_see").val();
        var is_fabuqiugou_see = $("#is_fabuqiugou_see").val();
        var is_see_all = $("#is_see_all").val();
        var is_pic = $("#is_pic").val();
        var is_chengxin = $("#is_chengxin").val();
        var is_miaomu = $("#is_miaomu").val();
        var is_use = $("#is_use").val();
//        var lat = $("#lat").val();
//        var lng = $("#lng").val();
        var is_video = $("#is_video").val();
        var ischeck = $("#ischeck").val();
        var lat_company = $("#lat_company").val();
        var lng_company = $("#lng_company").val();
        var is_special = $("#is_special").val();

        if (mm_emp_nickname.replace(/\s/g, '') == '') {
            alert("名称不能为空");
            return;
        }
        if (mm_emp_mobile.replace(/\s/g, '') == '') {
            alert("手机号不能为空");
            return;
        }
//    if(mm_emp_password.replace(/\s/g, '') == ''){
//        alert("密码不能为空");
//        return;
//    }
//    if(mm_emp_password.length<6 || mm_emp_password.length>18){
//      alert("密码长度至少6位,最多18位");
//      return;
//    }
//    mm_emp_password = hex_md5(mm_emp_password);
        if (mm_emp_type.replace(/\s/g, '') == '') {
            alert("请选择用户类型");
            return;
        }
//    if(mm_emp_company.replace(/\s/g, '') == ''){
//      alert("请填写公司名称");
//      return;
//    }
//    if(mm_emp_company_type.replace(/\s/g, '') == ''){
//      alert("请选择公司类型");
//      return;
//    }
//    if(mm_emp_company_address.replace(/\s/g, '') == ''){
//      alert("请填写公司地址");
//      return;
//    }
//    if(mm_emp_company_detail.replace(/\s/g, '') == ''){
//      alert("请填写公司简介");
//      return;
//    }
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

//    if(mm_level_id.replace(/\s/g, '') == ''){
//      alert("请选择VIP星级");
//      return;
//    }

//    if(mm_emp_endtime.replace(/\s/g, '') == ''){
//      alert("请选择VIP到期日期");
//      return;
//    }
//    if(mm_emp_beizhu.replace(/\s/g, '') == ''){
//      alert("请填写备注");
//      return;
//    }
        if (mm_emp_msg_num.replace(/\s/g, '') == '') {
            alert("请填写允许发布信息数量");
            return;
        }
        if (is_login.replace(/\s/g, '') == '') {
            alert("请选择是否允许登陆");
            return;
        }
        if (is_fabugongying.replace(/\s/g, '') == '') {
            alert("请选择发布供应信息权限");
            return;
        }
        if (is_fabuqiugou.replace(/\s/g, '') == '') {
            alert("请选择发布求购信息权限");
            return;
        }
        if (is_fabugongying_see.replace(/\s/g, '') == '') {
            alert("请选择查看供应信息权限");
            return;
        }
        if (is_fabuqiugou_see.replace(/\s/g, '') == '') {
            alert("请选择查看求购信息权限");
            return;
        }
        if (is_see_all.replace(/\s/g, '') == '') {
            alert("请选择查看所有信息权限");
            return;
        }

        if (is_pic.replace(/\s/g, '') == '') {
            alert("请选择发布图片权限");
            return;
        }
        if (is_video.replace(/\s/g, '') == '') {
            alert("请选择是否允许发布视频");
            return;
        }
        if (is_chengxin.replace(/\s/g, '') == '') {
            alert("请选择是否诚信单位");
            return;
        }
        if (is_miaomu.replace(/\s/g, '') == '') {
            alert("请选择是否蔬菜协会");
            return;
        }
        if (is_use.replace(/\s/g, '') == '') {
            alert("请选择是否禁用");
            return;
        }
        if (ischeck.replace(/\s/g, '') == '') {
            alert("请选择是否审核");
            return;
        }
        if (is_special.replace(/\s/g, '') == '') {
            alert("请选择是否特殊会员");
            return;
        }

        var imagePath = $("img[name='imagePath']").attr("src");

        if (imagePath == "" || imagePath == null) {
            imagePath = $("#mm_emp_cover").val();
            return;
        }

        var imagePath1 = $("img[name='imagePath1']").attr("src");

        if (imagePath1 == "" || imagePath1 == null) {
            imagePath1 = $("#ad_pic").val();
            return;
        }

        $.ajax({
            cache: true,
            type: "POST",
            url: "/emp/updateEmp.do",
            data: {
//        "mm_emp_password":mm_emp_password,
                "mm_emp_id": mm_emp_id,
                "mm_msg_length": mm_msg_length,
                "mm_emp_card": mm_emp_card,
                "mm_emp_cover": imagePath,
                "ad_pic": imagePath1,
                "mm_emp_mobile": mm_emp_mobile,
                "mm_emp_nickname": mm_emp_nickname,
                "mm_emp_type": mm_emp_type,
                "mm_emp_company": mm_emp_company,
                "mm_emp_company_type": mm_emp_company_type,
                "mm_emp_company_address": mm_emp_company_address,
                "mm_emp_company_detail": mm_emp_company_detail,
                "mm_emp_company_url": mm_emp_company_url,
                "mm_emp_provinceId": mm_emp_provinceId,
                "mm_emp_cityId": mm_emp_cityId,
                "mm_emp_countryId": mm_emp_countryId,
                "mm_emp_regtime": mm_emp_regtime,
                "mm_emp_endtime": mm_emp_endtime,
                "mm_level_id": mm_level_id,
                "mm_emp_beizhu": mm_emp_beizhu,
                "mm_emp_msg_num": mm_emp_msg_num,
                "is_login": is_login,
                "is_cover": is_cover,
                "is_fabugongying": is_fabugongying,
                "is_fabuqiugou": is_fabuqiugou,
                "is_fabugongying_see": is_fabugongying_see,
                "is_fabuqiugou_see": is_fabuqiugou_see,
                "is_see_all": is_see_all,
                "is_pic": is_pic,
                "is_chengxin": is_chengxin,
                "is_miaomu": is_miaomu,
                "is_use": is_use,
                "is_video": is_video,
//                "lat": lat,
//                "lng": lng,
                "lat_company": lat_company,
                "lng_company": lng_company,
                "is_special": is_special,
                "ischeck": ischeck
            },
            async: false,
            success: function (_data) {
                var data = $.parseJSON(_data);
                if (data.success) {
                    alert("修改成功");
//          window.location.href = "#module=emp/detail&mm_emp_id=" + mm_emp_id;
                    history.go(-1);
                } else {
                    var _case = {1: "修改失败"};
                    alert(_case[data.code])
                }
            }
        });
    }
    ;

    <%--function selectColleges(){--%>
    <%--var citys =${listCitysAll};--%>
    <%--var province = $("#mm_emp_provinceId").val();--%>
    <%--var ret = '';--%>
    <%--for(var i= citys.length-1; i>=0; i-- ){--%>
    <%--if(citys[i].father==province){--%>
    <%--ret += "<option value='"+citys[i].cityID+"'>"+citys[i].city+"</option>";--%>
    <%--}--%>
    <%--}--%>
    <%--$("#mm_emp_cityId").html(ret);--%>
    <%--};--%>

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
        document.getElementById("lat_company").value = e.lnglat.getLat();
        document.getElementById("lng_company").value = e.lnglat.getLng();

        marker.setMap(null);
        mapObj.setCenter(new AMap.LngLat(e.lnglat.getLng(), e.lnglat.getLat()));
        marker = new AMap.Marker({
            position: new AMap.LngLat(e.lnglat.getLng(), e.lnglat.getLat())
        });
        marker.setMap(mapObj);
    });
</script>