/**
 * 订单确页js
 */
var basePath = $("#basePath").val();
var html = $("#addOrModifyAdd").html();
$(function () {
    //在调用load方法之前利用该方法禁止load方法调用IE缓存文件
    $.ajaxSetup({cache: false});

    //错误提示
    if ($("#act_status").val() != "") {
        alert($("#act_status").val());
    }


    //加载收货地址
    $("#delivery_div").load(basePath + "order/purchase/delivery");

    $("#submitFormBut").click(function () {
        //是否有收货地址并且选择了收货地址
        var deliveryId = $("#deliveryId").val();
        if ($.trim(deliveryId) == "" || deliveryId == undefined) {
            alert("请填写收货地址！");
            return false;
        }
        //判断金额是否超过2000
        var totalAmount = $("#totalAmount").val();
        var noReminderCookie = $.cookie("cookie.order.noReminder");
        var hnResourceUrl = $("#hnResourceUrl").val();
        if (noReminderCookie != 1 && totalAmount > 2000) {
            //提交订单弹窗效果
            var html = '';
            html += '<p style="height:24px;line-height:24px;padding-left:30px;font-size:14px;font-weight:bold;margin-top:38px;">请使用支付宝[账户余额]支付方式支付此订单。</p>';
            html += '<p style="padding-left:30px;margin-top:34px;"><img src="' + hnResourceUrl + '/images/order/msg.png"/></p>';
            html += '<p style="height:28px;line-height:28px;padding-left:50px;margin-top:15px;">1、支付宝担保交易设置了银行卡支付限额:2000元，而[帐户余额]支付无限额</p>';
            html += '<p style="height:28px;line-height:28px;padding-left:50px;">2、如您的支付宝[帐户余额]不足，请用您绑定的储蓄卡充值至支付宝帐户</p>';
            html += '<p style="padding-top:50px;">';
            html += '<input name="noagain" id="noagain" type="checkbox" value="1" style="float:left;display:inline;margin-left:120px;margin-top:14px;" onclick="chooseNoReminder(this);"/><span style="float:left;display:inline;line-height:40px;heigjt:40px;margin-left:5px;">以后不再提示</span>';
            html += '<a href="javascript:submitOrder();" id="submitFormButSure" class="but" style="float:left;display:inline;line-height:40px;heigjt:40px;width:200px;margin-left:15px;fint-size:18px;">好的，继续提交订单</a>';
            html += '</p>';
            $('.confirmation').click(function () {
                windows_custom_open('提示信息', html, '530', '450');
            });
            return false;
        }

        $("#addOrderForm").submit();
    });
});
function submitOrder() {
    //是否有收货地址并且选择了收货地址
    var deliveryId = $("#deliveryId").val();
    if ($.trim(deliveryId) == "" || deliveryId == undefined) {
        alert("请填写收货地址！");
        return false;
    }
    if ($("#noReminder").val() == 1) {
        $.cookie("cookie.order.noReminder", "1", {expires: 30});
    }
    $("#addOrderForm").submit();
}


function chooseNoReminder(dom) {
    if ($(dom).attr("checked") == "checked") {
        $("#noReminder").val($(dom).val());
    } else {
        $("#noReminder").val('');
    }
    return false;
}


//新增收货地址
function addDelivery() {
    var receiver = $.trim($("#receiver").val());
    if (receiver == "") {
        alert("请填写收货人！");
        return;
    }
    var provinceId = $("#provinceId").val();
    if (provinceId == "") {
        alert("请选择省！");
        return;
    }
    var cityId = $("#cityId").val();
    if (cityId == "") {
        alert("请选择市！");
        return;
    }
    var areaId = $("#areaId").val();
    if (areaId == "") {
        alert("请选择区！");
        return;
    }
    var addressDetail = $.trim($("#addressDetail").val());
    if (addressDetail == "") {
        alert("请填写详细地址！");
        return;
    }
    var zipCode = $.trim($("#zipCode").val());
    var zipCodeReg = /^[0-9]\d{5}$/;
    if (zipCode == "") {
        alert("请填写邮政编码！");
        return false;
    }
    if (zipCode != "" && !zipCodeReg.test(zipCode)) {
        alert("邮编格式不正确！");
        return;
    }
    var mobile = $.trim($("#mobile").val());
    var teleZone = $.trim($("#teleZone").val());
    var telePhone = $.trim($("#telePhone").val());
    if (mobile == "" && telePhone == "") {
        alert("请填写联系方式！");
        return;
    }
    if ($.trim(telePhone) == "" && $.trim(teleZone) != "") {
        alert("请填写固定电话的电话号码!");
        return false;
    }

    if ($.trim(telePhone) != "" && $.trim(teleZone) == "") {
        alert("请填写固定电话的区号!");
        return false;
    }

    var mobileReg = /^(13[0-9]|15[0-9]|18[0-9]|14[0-9]|17[0-9])\d{8}$/;
    if (mobile != "" && !mobileReg.test(mobile)) {
        alert("手机号码格式不正确！");
        return;
    }
    var fixedReg = /^0\d{2,3}\d{5,9}|\d{5,9}$/;
    if (telePhone != "" && !fixedReg.test(telePhone)) {
        alert("固定号码格式不正确！");
        return;
    }

    var teleExt = $.trim($("#teleExt").val());
    var isDefault = $.trim($("#isDefault").val());
    //收货地址id
    var consigneeId = $("#consigneeId").val();
    //收货地址整个地址
    var addressDetailFull = $("#provinceId option:selected").text() + $("#cityId option:selected").text() + $("#areaId option:selected").text();
    var paramter = {
        "receiver": receiver, "provinceId": provinceId, "cityId": cityId,
        "areaId": areaId, "addressDetail": addressDetail, "zipCode": zipCode,
        "mobile": mobile, "teleZone": teleZone, "telePhone": telePhone,
        "addressDetailFull": addressDetailFull, "teleExt": teleExt, "isDefault": isDefault,
        "consigneeId": consigneeId
    };
    if (consigneeId != "") {
        //修改
        $.post(basePath + "order/purchase/update-delivery", paramter, function (data) {
            if (data == "hd_sucs") {
                //在调用load方法之前利用该方法禁止load方法调用IE缓存文件
                $.ajaxSetup({cache: false});
                //$("#delivery_div").load("order/purchase/delivery");
                alert("收货地址修改成功！");
            } else {
                alert("收货地址修改失败！");
            }
            $(".consigneeDel").click();
            $("#delivery_div").load(basePath + "order/purchase/delivery");
        });
    } else {
        //新增
        $.post(basePath + "order/purchase/add-delivery", paramter, function (data) {
            if (data == "hd_sucs") {
                //在调用load方法之前利用该方法禁止load方法调用IE缓存文件
                $.ajaxSetup({cache: false});
                //$("#delivery_div").load("order/purchase/delivery");
                alert("收货地址保存成功！");
            } else {
                alert("收货地址保存失败！");
            }
            $(".consigneeDel").click();
            $("#delivery_div").load(basePath + "order/purchase/delivery");
        });
    }
}


/*编辑收货地址弹出框*/
function consigneeInfoEdit(type, addressId) {
    var title = '添加';
    if (type == 'add') {
        //初始化每个输入框的值
        init();
        $("#consigneeId").val("");
    } else {
        title = '修改';
        $.post(basePath + "order/purchase/ajax-update-delovery-init", {"deliveryId": addressId}, function (data) {
            if (data.flag == "hd_sucs") {
                $("#receiver").val(data.consignee.receiver);
                $("#addressDetail").val(data.consignee.street);
                //省
                $("#provinceId").empty().append("<option value=\"0\">选择省</option>");
                $.each(data.provinceList, function (i, o) {
                    $("#provinceId").append("<option value=" + o.id + ">" + o.areaName + "</option>");
                });
                $("#provinceId").find("option[value='" + data.consignee.provinceId + "']").attr("selected", true);
                //市
                $("#cityId").empty().append("<option value=\"0\">选择市</option>");
                $.each(data.cityList, function (i, o) {
                    $("#cityId").append("<option value=" + o.id + ">" + o.areaName + "</option>");
                });
                $("#cityId").find("option[value='" + data.consignee.cityId + "']").attr("selected", true);

                //区
                $("#areaId").empty().append("<option value=\"0\">选择区</option>");
                $.each(data.areaList, function (i, o) {
                    $("#areaId").append("<option value=" + o.id + ">" + o.areaName + "</option>");
                });
                $("#areaId").find("option[value='" + data.consignee.areaId + "']").attr("selected", true);

                $("#zipCode").val(data.consignee.zipCode);
                $("#mobile").val(data.consignee.mobile);
                $("#teleZone").val(data.consignee.teleZone);
                $("#telePhone").val(data.consignee.telePhone);
                $("#teleExt").val(data.consignee.teleExt);
                $("#consigneeId").val(addressId);
                if (data.consignee.isDefault == 1) {
                    $("#isDefault").attr("checked", true);
                } else {
                    $("#isDefault").attr("checked", false);
                }
            } else {
                alert("操作失败！");
                return false;
            }
        });
    }
    $("#addTitle").html(title);
    bodys.append(html);
    $("#addOrModifyAdd").html('');
    bodys.find('.w-consignee').show();
    bodys.find('.consigneeDel').click(function () {
        consigneeClose();
    });
}
function consigneeClose() {
    bodys.find('.w-consignee').hide().remove();
    bodys.find(".w-bg").hide().remove();
}

/*初始化弹出框的的值*/
function init() {
    $("#receiver").val('');
    $("#addressDetail").val('');
    $("#cityId").empty().append("<option value=\"0\">选择市</option>");
    $("#areaId").empty().append("<option value=\"0\">选择区</option>");
    $("#zipCode").val('');
    $("#mobile").val('');
    $("#teleZone").val('');
    $("#telePhone").val('');
    $("#teleExt").val('');
    $("#isDefault").attr("checked", false);
}

function changeProvince(dom) {
    var consigneeProvinceId = $("#consigneeProvinceId").val();
    $.post(basePath + "cart/area", {"provinceId": $(dom).val()}, function (data) {
        var json = eval("(" + data + ")");
        var str = "";
        if (consigneeProvinceId == "" || consigneeProvinceId == null) {
            str = "<option value='' selected='selected' >选择市</option>";
        } else {
            str = "<option value='' >选择市</option>";
        }
        for (var i = 0; i < json.length; i++) {
            if (consigneeProvinceId == json[i].id) {
                str = str + "<option value='" + json[i].id + "' selected='selected' >" + json[i].areaName + "</option>";
            } else {
                str = str + "<option value='" + json[i].id + "'>" + json[i].areaName + "</option>";
            }
        }
        $("#cityId").html(str);
    });
}

function changeCity(dom) {
    var consigneeCityId = $("#consigneeCityId").val();
    $.post(basePath + "cart/area", {"cityId": $(dom).val()}, function (data) {
        var json = eval("(" + data + ")");
        var str = "";
        if (consigneeCityId == "" || consigneeCityId == null) {
            str = "<option value='' selected='selected'>选择区</option>";
        } else {
            str = "<option value=''>选择区</option>";
        }
        for (var i = 0; i < json.length; i++) {
            if (consigneeCityId == json[i].id) {
                str = str + "<option value='" + json[i].id + "' selected='selected' >" + json[i].areaName + "</option>";
            } else {
                str = str + "<option value='" + json[i].id + "'>" + json[i].areaName + "</option>";
            }
        }
        $("#areaId").html(str);
    });
}


//********文本域中字符长度计算的点击事件方法**************************/
function commGaugeLengths(count, id, idHtml) {
    var mytextarea = $("#" + id);
    var value = mytextarea[0].value.length;
    if (value > count) {
        mytextarea[0].value = mytextarea[0].value.substr(0, count);
    }
    else {
        //$("#"+idHtml)[0].innerHTML = "<font color='red' size='2px'>--共可输入 "+count+" 个字符，已输入 "+value+" 个字符--</font>";
    }
}
//********文本域中字符长度计算的点击事件方法 end**********************/