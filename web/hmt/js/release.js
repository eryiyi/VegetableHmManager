var regUrl = $("#regUrl").val();
//已经校验过是否存在
var phoneValided = false;
//验证码通过标识
var valCodeValide = false;
//手机验证码通过标识
var mobileCodeValide = false
var _purchase = {
    success_url: '/success',
    view: {},
    process: {},
    event: {},
    /**
     * 地址配置信息
     */
    address: {
        _address_level_province: 1,
        _address_level_city: 2,
        _address_city_default: 0,
        _address_cities_set: {},
        _address_cities_key: "province_province_"
    },

    price: {
        format: /^\d{1,7}\.?(\d{1,2})?$/,
        int_format: /^\d{1,7}$/,
        decimal_format: /^\d{1,7}\.(\d{1,2})?$/,
        last_cur_price: ""
    },

    description: {
        maxLength: 200,
        minLength: 10
    },

    phone: {
        m_pattern: /^1[3|4|5|7|8][0-9]{9}$/,
        t_pattern: /^(0\d{2,3}-)?\d{5,9}$/
    },
    qty: {
        format: /^\d{1,7}\.?(\d{1,2})?$/,
        int_format: /^\d{1,7}$/,
        decimal_format: /^\d{1,7}\.(\d{1,2})?$/
    }
};

_purchase.view = {
    showPurchaseNameMsg: function (msg) {
        $(".release .row-1 .col-msg").text(msg).show();
    },
    hidePurchaseNameMsg: function () {
        $(".release .row-1 .col-msg").text("").hide();
    },
    showQtyMsg: function (msg) {
        $(".release .row-2 .col-msg").text(msg).show();
    },
    hideQtyMsg: function () {
        $(".release .row-2 .col-msg").text("").hide();
    },
    showPriceMsg: function (msg) {
        $("#price_msg").text(msg).show();
    },
    hidePriceMsg: function () {
        $("#price_msg").text("").hide();
    },
    showTimeMsg: function (msg) {
        $("#time_msg").text(msg).show();
    },
    hideTimeMsg: function () {
        $("#time_msg").text("").hide();
    },
    showAddressMsg: function (msg) {
        $("#address_msg").text(msg).show();
    },
    hideAddressMsg: function (msg) {
        $("#address_msg").text("").hide();
    },
    hidePhoneCodeMsg: function () {
        $("#phonecode_msg").text("").hide();
    },
    showPhoneCodeMsg: function (msg) {
        $("#phonecode_msg").text(msg).show();
    },
    hideImgCodeMsg: function () {
        $("#imgcode_msg").text("").hide();
    },
    showImgCodeMsg: function (msg) {
        $("#imgcode_msg").text(msg).show();
    },
    showLinkManMsg: function (msg) {
        $("#linkName_msg").text(msg).show();
    },
    hideLinkManMsg: function () {
        $("#linkName_msg").text("").hide();
    },
    showPhoneMsg: function (msg) {
        $("#telephone_msg").text(msg).show();
    },
    hidePhoneMsg: function () {
        $("#telephone_msg").text("").hide();
    },
    disabledSumitBtn: function () {
        var btn = $("#submitBtn");
        btn.val("发布中 ...");
        btn.attr("disabled", "disabled");
    },
    showQtyMsg: function (msg) {

        $("#qty_msg").text(msg).show();

    },
    hideQtyMsg: function () {
        $("#qty_msg").text("").hide();
    },
    ableSubmitBtn: function () {
        var btn = $("#submitBtn");
        btn.val("确认发布");
        btn.attr("disabled", false);
    },
    showDescriptionMsg: function (msg) {
        $("#explantion_msg").text(msg).show();
    },
    hideDescriptionMsg: function () {
        $("#explantion_msg").text("").hide();
    }
};

/**
 * 发布供应业务处理方法
 */
_purchase.process = {
    /**
     * 发布供应
     */
    release: function () {

    },

    /**
     * 初始化所在地
     * parentId : 父节点地址
     * level : 区域级别
     */
    fetchAreaData: function (level, parentId) {
        var url = "../purchase/area";
        var area = [];
        var request = {};
        if (level) request['level'] = level;
        if (parentId) request['parentId'] = parentId;
        $.ajax({
            type: 'post',
            url: url,
            data: request,
            dataType: 'json',
            async: false,
            cache: false,
            success: function (data) {
                data = data || [];
                if (typeof data === 'string') data = eval("(" + data + ")");
                area = data;
            }
        });
        return area;
    },

    /**
     * 初始化省份信息
     * privinceId:默认省份选中的编号
     */
    initProvince: function (privinceId) {
        var ps = this.fetchAreaData(_purchase.address._address_level_province);
        ps = ps || [];
        var html = "<dt><label>省份:</label></dt>";
        for (var i = 0; i < ps.length; i++) {
            var province = ps[i];
            if (province) {
                html += "<dd><label><input type='checkbox' name='chk_scope'  value='" + province.id + "'>" + province.name + "</label></dd>";
            }
        }
        $("#province").html(html);
        $("#province").val(privinceId);
    },
    /**
     * 提交表单
     */
    submit: function () {
        var bool = this.valide();
        if (bool) {
            var iframe = $("iframe[id='purchaseform']");
            if (!iframe || iframe.length == 0) {
                iframe = $("<iframe id='purchaseform' name='purchaseform' src='javascript:false;'></iframe>")
                $("body").append($("<div style='display:none;'></div>").append(iframe));
                //这一行位置很重要，解决chorme加载2次的bug
                iframe.on('load', this._iframeLoadHandler);
            }
            if (_cate3Id && _cate3Id != null && _cate3Id != "" && _cate3Id != "init") {
                this.addParam("cateId", _cate3Id);
            }
            if (_product_breed && _product_breed != null && _product_breed != "") {
                this.addParam("breedId", _product_breed);
            }
            var time = $(".label-select li.cur a").attr("data-val") || "";
            var cityText = $("#citylist").html();
            var cityId = $("#citylist").attr("data-cityid");
            var scopeAddress = $("#scopeAddress").text();
            var register = '0';

            if (!$("#div_reg_ck").is(":hidden") && $("#reg_checkbox").is(':checked') == true) {
                register = '1';
            }
            this.addParam("addressFull", cityText);
            if (typeof (cityId) == 'undefined') {
                cityId = null;
            }
            this.addParam("placeCityId", cityId);
            this.addParam("placeDetail", $("#fulladdress").val());
            this.addParam("measureUnit", $("#unit option:selected").text());
            this.addParam("duration", time)
            this.addParam("scopeFullName", scopeAddress);
            this.addParam("isReg", register);
            $("form").submit();
        } else {
            _purchase.event.refreshImgCode();
            _purchase.view.ableSubmitBtn();
        }
    },

    /**
     * 获取结果
     */
    _iframeLoadHandler: function () {
        var iframe = $("iframe[id='purchaseform']");
        var doc = iframe.contentDocument || window.frames[iframe.attr("id")].document;
        var response = doc.body.innerHTML;
        //输出为直接退出
        if (response == "") {
            alert("保存失败： 服务器异常返回结果!");
            return;
        }
        var result = eval("(" + response + ")");
        result == result || {};
        if (result && result.status == '0') {
            //正确返回结果
            var purchase_id = result.source;
            $("iframe[id='purchaseform']").remove();
            _isSubmiting = true;
            var ssoUrls = result.ssoUrls || "";
            setCookie(ssoUrls);
            window.location.href = _purchase_url + _purchase.success_url + "_" + purchase_id;
        } else if (result.loginF == "-1") {
            //alert(result.msg || "服务器异常");
            //需要弹出登录
            _isSubmiting = false;
            dp_opentheme();
        } else {
            _isSubmiting = false;
            alert(result.msg || "服务器异常");
        }


    },
    valide: function () {
        _purchase.view.hidePurchaseNameMsg();
        _purchase.view.hideQtyMsg();
        _purchase.view.hidePriceMsg();
        _purchase.view.hideTimeMsg();
        _purchase.view.hideAddressMsg();
        _purchase.view.hideLinkManMsg();
        _purchase.view.hidePhoneMsg();

        var bool = true;
        var name = $("#purchase_name").val() || "";
        if ($.trim(name) == "") {
            _purchase.view.showPurchaseNameMsg("请输入产品名称");
            bool = false;
        }
        if ($.trim(name).length > 8) {
            _purchase.view.showPurchaseNameMsg("产品名称长度在8个字以内");
            bool = false;
        }
        var qty = $("#qty").val();
        var unit = $("#unit").val();
        if (qty != "" && qty <= 0) {
            _purchase.view.showQtyMsg("采购量必须为大于0的数值");
            bool = false;
        }
        if (qty != "" && !(_purchase.qty.decimal_format.test(qty) || _purchase.qty.int_format.test(qty))) {
            _purchase.view.showQtyMsg("需求量为最多七位整数加两位小数");
            bool = false;
        }
        var priceMin = $("#minPrice").val() || "";
        var priceMax = $("#maxPrice").val() || "";
        priceMax = $.trim(priceMax);
        priceMin = $.trim(priceMin);
        if ((priceMin != "" && priceMin == 0) || (priceMax != "" && priceMax == 0)) {
            _purchase.view.showPriceMsg("价格必须为大于0的数值(可保留2位小数)");
            bool = false;
        }
        var time = $(".label-select li.cur a").attr("data-val") || "";
        if (time == "") {
            _purchase.view.showTimeMsg("请选择采购时长");
            bool = false;
        }
        var linkman = $("#linkman").val() || "";
        linkman = $.trim(linkman);
        if (linkman == "" || linkman.length > 20) {
            _purchase.view.showLinkManMsg("联系人不能为空且长度必须在20个字以内");
            bool = false;
        }
        var telephone = $("#telephone").val();
        telephone = $.trim(telephone);
        if (telephone == "") {
            _purchase.view.showPhoneMsg("请填写手机号码");
            bool = false;
        }

        var address = $("#fulladdress").val();
        if (address == "") {
            _purchase.view.showAddressMsg("请填写收货地");
            bool = false;
        }
        var cityId = $("#citylist").attr("data-cityid");
        if (typeof (cityId) == 'undefined' || cityId == "" || cityId == null) {
            _purchase.view.showAddressMsg("请选择城市");
            bool = false;
        }
        if (hnUserId == null || hnUserId == "") {
            var phonecode = $("#phonecode").val();
            if (phonecode == "") {
                _purchase.view.showPhoneCodeMsg("请填写手机验证码");
                bool = false;
            }
            var imgcode = $("#imgcode").val();
            if (imgcode == "") {
                _purchase.view.showImgCodeMsg("请填写右侧验证码");
                bool = false;
            }
            if (!valCodeValide) {
                bool = false;
                _purchase.view.showImgCodeMsg("请输入正确的验证码");
            }
            if (!mobileCodeValide) {
                bool = false;
                _purchase.view.showPhoneCodeMsg("请输入正确的验证码");
            }
        }

        var textarea = $("#textarea").val();
        textarea = $.trim(textarea);
        var length = $.trim(textarea).length;
        if (textarea != "" && (length > _purchase.description.maxLength || length < _purchase.description.minLength)) {
            _purchase.view.showDescriptionMsg("采购补充说明长度必须在" + _purchase.description.minLength + "-" + _purchase.description.maxLength + "之间");
            bool = false;
        }

        if (!_purchase.phone.m_pattern.test(telephone)) {
            _purchase.view.showPhoneMsg("请输入正确的手机号码");
            bool = false;
        }

        return bool;
    },
    addParam: function (name, value) {
        var input = $(":input[name='" + name + "']");
        if (input && input.length > 0) {
            input.val(value)
        } else {
            input = $("<input type='hidden' name ='" + name + "'  value='" + value + "' />");
        }
        $("form").append(input);
    },
    /**
     * 适配产品、品种信息
     */
    adaptProductBreed: function (name) {
        //没有找到分类信息
        if (_cate3Id == "" || _cate3Id == null || _cate3Id == "init") {
            $.ajax({
                type: 'post',
                url: "../purchase/adaptor",
                data: {name: encodeURIComponent(name)},
                dataType: 'json',
                async: false,
                cache: false,
                success: function (data) {
                    data = data || {};
                    if (typeof data === 'string') data = eval("(" + data + ")");
                    var cate3Id = data.cateId || "";
                    if (cate3Id != null && cate3Id != "") {
                        var cName = data.cName || "";
                        var breedId = data.breedId || "";
                        $(".product-name").val(cName);
                        _lastkeyword = cName;
                        if (breedId != null && breedId != "") {
                            //匹配到品种
                            selectedFourCategory(cate3Id, breedId);
                        } else {
                            //匹配到分类
                            _cate3Id = cate3Id;
                        }
                        $(".release .row-1 .col-ico").hide();
                    } else {
                        //啥都没匹配到则警告
                        $(".release .row-1 .col-ico").show();
                    }
                }
            });
        }
    }

}

var _isSubmiting = false;
_purchase.event = {
    init: function () {
        $("#maxPrice , #minPrice").on("click", function () {
            _purchase.price.last_cur_price = "";
        })
        $("#maxPrice , #minPrice").live("keyup input", this.priceFormat);
        $("#maxPrice").live("blur", this.priceMax_blur);
        $("#minPrice").live("blur", this.priceMin_blur);
        $("#textarea").live("keyup input", this.detailInput);
        $("#submitBtn").live("click", this.submit);
        $("#telephone").live("blur", this.valideTel);
        $("#linkman").on("blur", this.linkMan_blur);
        $("#textarea").on("blur", this.description_blur);
        //			$("#unit").on("blur",this.unit_blur);
        $("#fulladdress").on("blur", this.city_blur);
        $("#phonecode").on("blur", this.validePhoneCode);
        $("#imgcode").live("blur", this.valideImgCode);
        $(".product-name").on("blur", this.productNameTip);
        $("#unit").on("change", this.unit_change);
        $("#telephone").live("keyup", this.valideTel);
        $(".code-phone").live("click", this.send_telPhoneCode);
        $(".code-image").live("click", this.refreshImgCode);
        $("#qty").live("keyup", this.valideQty);
        $("#qty").live("blur", this.valideQty);
        $(".publish").on("click", function () {
            $(".login-tips").hide();
        });
    },

    /**
     * 产品名称提醒
     */
    productNameTip: function () {
        var productName = $(".release .row-1 .product-name").val();
        if ($.trim(productName) == "") {
            $(".release .row-1 .col-msg").text("请输入产品名称").show();
            $(".release .row-1 .col-ico").hide();
            return;
        } else if (productName.length > 8) {
            $(".release .row-1 .col-msg").text("产品名称不能超过8个字").show();
            $(".release .row-1 .col-ico").hide();
            return;
        } else {
            //匹配产品、品种信息
            _purchase.process.adaptProductBreed(productName);
        }
    },

    /**
     * 最大价格处理事件
     */
    priceMax_blur: function () {
        _purchase.view.hidePriceMsg();
        var priceMax = $(this).val();

        if (priceMax != null && priceMax != "" && (!_purchase.price.format.test(priceMax) || Number(priceMax) == 0)) {
            _purchase.view.showPriceMsg("价格必须为大于0的数值(可保留2位小数)");
            $(this).focus();
            return;
        }
        ;

        if (priceMax != "") {
            priceMax = Number(priceMax).toFixed(2);
            $(this).val(priceMax);
        }

        var priceMin = $("#minPrice").val();
        if (priceMin == "" || typeof priceMin == 'undefined') {
            $("#minPrice").focus();
            return;
        }

        if (priceMax != "" && typeof priceMax != 'undefined') {
            if (Number(priceMax) < Number(priceMin)) {
                $("#minPrice").val(priceMax);
                $("#maxPrice").val(priceMin);
            }
        }

        var unit = $("#unit").val();
        if (unit == null || unit == 0) {
            $("#unit").focus();
        }
    },
    /**
     * 最小价格处理事件
     */
    priceMin_blur: function () {
        _purchase.view.hidePriceMsg();
        var priceMin = $(this).val();
        if (priceMin != null && priceMin != "" && (!_purchase.price.format.test(priceMin) || Number(priceMin) == 0)) {
            _purchase.view.showPriceMsg("价格必须为大于0的数值(可保留2位小数)");
            $(this).focus();
            return;
        }
        if (priceMin != "") {
            priceMin = Number(priceMin).toFixed(2);
            $(this).val(priceMin);
        }
        var priceMax = $("#maxPrice").val();
        if (priceMax != "") {
            if (Number(priceMax) < Number(priceMin)) {
                _purchase.view.showPriceMsg("区间起始价格应小于区间结束价格");
            }
        }
    },
    /**
     * 价格格式处理
     */
    priceFormat: function (event) {
        var keyCode = event.keyCode || event.which;
        if (keyCode >= 37 && keyCode <= 40) return;
        var priceValue = $(this).val();
        priceValue = priceValue.replace(/[^(\d\.)]/g, "")
        $(this).val(priceValue);
        if (priceValue == "") {
            _purchase.price.last_min_price = "";
            return;
        }
        if (_purchase.price.int_format.test(priceValue) || _purchase.price.decimal_format.test(priceValue)) {
            _purchase.price.last_min_price = priceValue;
        } else {
            $(this).val(_purchase.price.last_min_price);
        }
    },
    detailInput: function () {
        _purchase.view.hideDescriptionMsg();
        var description = $(this).val() || "";
        description = $.trim(description);
        var length = description.length;
        var tip = length >= _purchase.description.maxLength ? ("<font color='red'>" + length + "</font>") : length;
        $(".release .row-4 .col-2 p").html(tip + "/" + _purchase.description.maxLength);
    },
    valideTel: function () {
        _purchase.view.hidePhoneMsg();
        var telephone = $(this).val();
        telephone = $.trim(telephone || "");
        if (telephone.length == 0) {
            _purchase.view.showPhoneMsg("请输入手机号码");
            return;
        }
        if (!_purchase.phone.m_pattern.test(telephone)) {
            _purchase.view.showPhoneMsg("请输入正确的手机号码");
            return;
        }
        phoneValided = false;
        var t = $(this);
        //			var phoneValue = t.val();
        //替换非数字
        telephone = telephone.replace(/[^0-9]/g, "");
        t.val(telephone);
        var bool = true;

        if (telephone.length == 11) {
            $.ajax({
                type: "post",
                async: false,
                jsonp: "callback",
                url: regUrl + "myinfo/existsPhoneJsonp",
                data: {
                    mobile: telephone
                },
                dataType: "jsonp",
                success: function (result) {
                    if (result.msg == 1) {
                        //已注册用户
                        $("#imgcode").attr("disabled", false);
                        $(".code-image").show();
                        $(".code-image img").attr("src", regUrl + "validateCode/regRandCode?time=" + new Date());
                        $(".agreement clearfix").hide();
                    } else if (result.msg == 2) {
                        _purchase.view.showPhoneMsg("该号码已被禁用");
                        $(".agreement clearfix").hide();
                    } else if (result.msg == 3) {
                        _purchase.view.showPhoneMsg("该号码已被锁定");
                        $(".agreement clearfix").hide();
                    } else {
                        phoneValided = true;
                        $("#imgcode").attr("disabled", false);
                        $(".code-image").show();
                        $(".code-image img").attr("src", regUrl + "validateCode/regRandCode?time=" + new Date());
                        if ($("#hnUserId").val() == null || $("#hnUserId").val() == "") {
                            $("#div_reg_ck").show();
                        }
                    }
                }
            });
        }
        //			if(!bool){
        //				showError(error_tips,"#mobilev");
        //				//禁用图像验证
        //				return ;
        //			}else{
        //				//校验通过
        //				phoneValided = true ;
        //				$("#imgValidate").attr("src",webUrl+"validateCode/regRandCode?time="+new Date());
        //			}
        //取消异常信息

    },
    valideImgCode: function () {
        var t = $(this);
        valCodeValide = false;
        var value = $.trim(t.val());
        if (value && value.length == 4) {
            value = value.toLowerCase();
            var bool = true
            $.ajax({
                type: "post",
                async: false,
                jsonp: "callback",
                url: regUrl + "myinfo/getRegValCodeJsonp?t=" + new Date(),
                data: {code: value},
                dataType: "jsonp",
                success: function (result) {
                    //						alert(result.code==0);
                    //						if(result.code!=1){
                    //							bool = false;
                    //						}
                    if (result.code == 0) {
                        _purchase.view.showImgCodeMsg("验证码错误");
                        $("#phonecode").attr("disabled", true);
                        return;
                    } else {
                        valCodeValide = true;
                        _purchase.view.hideImgCodeMsg();
                        $(".code-phone").show();
                        $("#phonecode").attr("disabled", false);
                    }
                }
            });
        } else {
            //隐藏手机验证
            _purchase.view.showImgCodeMsg("验证码为4位字母或数字");
            $("#code-phone").hide();
            $("#phonecode").attr("disabled", true);
        }
    },
    validePhoneCode: function () {
        var phonecode = $(this).val();
        //			var mobileCode = t.val();
        phonecode = phonecode.replace(/[^0-9]/g, "");
        if (phonecode != null && phonecode != "") {
            _purchase.view.hidePhoneCodeMsg();
        } else {
            _purchase.view.showPhoneCodeMsg("请填写手机验证码");
        }
        mobileCodeValide = false;
        var tel = $.trim($("#telephone").val());
        var t = $(this);

        t.val(phonecode);
        //			var bool = true ;
        if (phonecode && phonecode.length == 6) {
            $.ajax({
                type: "post",
                async: false,
                url: regUrl + "myinfo/validateMobileCodeJsonp",
                data: {
                    phoneCode: phonecode,
                    phoneNo: tel
                },
                dataType: "jsonp",
                jsonp: "callback",
                success: function (result) {
                    if (result.msg && result.msg == '1') {
                        _purchase.view.showPhoneCodeMsg("手机验证码错误");
                        mobileCodeValide = false;
                        //							bool = false  ;
                    } else {
                        mobileCodeValide = true;
                        _purchase.view.hidePhoneCodeMsg();
                    }
                }
            });
        }
        //			else{
        //				$("#phoneCodev").siblings(".reg-ico-1").hide();
        //			}
    },
    submit: function () {
        var btn = $(this);
        _purchase.view.disabledSumitBtn();
        setTimeout(_purchase.view.ableSubmitBtn, 5000);
        _purchase.process.submit();
    },
    telKeyDown: function (event) {
        var keyCode = event.keyCode || event.which;
        //数字类型
        if ((keyCode <= 96 && keyCode >= 105) || (keyCode >= 48 && keyCode <= 57) || keyCode == 189 || keyCode == 109) {
            return true;
        }

        //退格键 上下左右键 删除键需要通过
        if (keyCode == 8 || keyCode == 46 || (keyCode >= 37 && keyCode <= 40)) {
            return true;
        }

        return false;
    },
    telTip: function () {
        /*无品名 提示*/
        $('.release .row-6 .col-ico').hover(function () {
            var top = $(this).offset().top - 32;
            var left = $(this).offset().left + 15;
            $('.phone-msg').css('top', top);
            $('.phone-msg').css('left', left);
            $('.phone-msg').show();
        }, function () {
            $('.phone-msg').hide();
        });
    },
    linkMan_blur: function () {
        _purchase.view.hideLinkManMsg();
        var linkman = $(this).val();
        var length = $.trim(linkman).length;
        if (length == 0 || length > 20) {
            _purchase.view.showLinkManMsg("联系人不能为空且长度必须在20个字以内");
            return;
        }
    },
    description_blur: function () {
        _purchase.view.hideDescriptionMsg();
        var description = $(this).val();
        var length = $.trim(description).length;
        if (length > _purchase.description.maxLength || length < _purchase.description.minLength) {
            _purchase.view.showDescriptionMsg("采购补充说明长度必须在" + _purchase.description.minLength + "-" + _purchase.description.maxLength + "之间");
            return;
        }
    },
    unit_blur: function () {
        _purchase.view.hidePriceMsg();
        var unit = $(this).val();
        if (unit == null || unit == "0") {
            _purchase.view.showPriceMsg("请选择单位信息");
        }
    },
    unit_change: function () {
        var unit = $(this).val();
        if (unit != null || unit != "0") {
            var unitText = $("#unit option:selected").text();
            $(".col-tips span").text("元/" + unitText);
        }
    },
    city_blur: function () {
        var address = $(this).val();
        if (address != null && address != "") {
            _purchase.view.hideAddressMsg();
        } else {
            _purchase.view.showAddressMsg("请填写收货地");
        }
    },
    //		phonecode_blur : function(){
    //			
    //		},
    imgcode_blur: function () {
        var imgcode = $(this).val();
        if (imgcode != null && imgcode != "") {
            _purchase.view.hideImgCodeMsg();
        } else {
            _purchase.view.showImgCodeMsg("请填写右侧验证码");
        }
    },
    send_telPhoneCode: function () {
        var code = $("#imgcode").val();
        if (!code || $.trim(code) == "") {
            _purchase.view.showImgCodeMsg("请先输入图形验证码");
            return;
        }
        var tel = $.trim($("#telephone").val());
        if (!valCodeValide) {
            $("#code-phone").hide();
            $("#phonecode").attr("disabled", true);
            return;
        }
        if (!button_allow) {
            alert("验证码已经发送，发送完一分钟后方可重发。");
        }
        if (tel.length > 0) {
            $.ajax({
                type: "POST",
                url: regUrl + "myinfo/sendMobileValidateCodeJsonp",
                data: {mobile: tel, code: code},
                dataType: "jsonp",
                jsonp: "callback",
                success: function (result) {
                    if (result.msg == "2") {
                        alert("您当前操作过于频繁，请在10分钟后重新进行发送。");
                        $("#code-phone").hide();
                        $("#phonecode").attr("disabled", true);
                        return;
                    }
                    if (result.msg == "3") {
                        alert("您当天操作超过限制，请于明天重新进行发送。");
                        $("#code-phone").hide();
                        $("#phonecode").attr("disabled", true);
                        return;
                    }
                    if (result.msg == "4") {
                        alert("图片验证码已失效");
                        $("#code-phone").hide();
                        $("#phonecode").attr("disabled", true);
                        return;
                    }
                    if (result.msg == "5") {
                        alert("验证码错误");
                        $("#code-phone").hide();
                        $("#phonecode").attr("disabled", true);
                        return;
                    }
                    if (result.msg == "1") {
                        timer();
                    }
                }
            });
        } else {
            _purchase.view.showPhoneCodeMsg("手机号码不能为空");
            return true;
        }
    },
    refreshImgCode: function () {
        $("#img_code").attr("src", regUrl + "validateCode/regRandCode?time=" + new Date());
    },
    valideQty: function () {
        _purchase.view.hideQtyMsg();
        var qty = $(this).val();
        qty = $.trim(qty || "");
        //替换非数字
        //			qty = qty.replace(/[^0-9]/g,"");
        $("#qty").val(qty);
        if (qty.length != 0) {
            if (!(_purchase.qty.decimal_format.test(qty) || _purchase.qty.int_format.test(qty))) {
                _purchase.view.showQtyMsg("需求量为最多七位整数加两位小数");
                return;
            }
        }
    }
};
var m = 59;
var t;
var button_allow = true;
function timer() {
    if (m > 0) {
        $(".code-phone").attr("disabled", true).css('color', '#aaa');
        button_allow = false;
        $(".code-phone").text(m + "秒后可重新发送");
        m--;
        t = setTimeout("timer()", 1000);
    } else {
        $(".code-phone").text("点击获取");
        $(".code-phone").attr("disabled", false).css('color', '#f5f5f5');
        $(".code-phone").attr("style", "");
        button_allow = true;
        m = 59;
    }
}
//设置Cookie
function setCookie(ssoUrl) {
    if (ssoUrl != "") {
        $.ajax({
            type: "POST",
            async: false,
            url: ssoUrl,
            dataType: "jsonp", //数据类型为jsonp  
            jsonp: "jsonpCallback", //服务端用于接收callback调用的function名的参数  
            success: function (result) {
                //					if (returnUrl == null || "" == returnUrl) {
                //						//默认
                //						window.location.href = '${passportUrl}';
                //					} else {
                //						window.location.href = returnUrl;
                //					}
                //					//关闭弹窗
                //					popupClose();
            }
        });
    }
}