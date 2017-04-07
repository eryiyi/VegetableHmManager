/**购物车js 周宙*/
var cart = {
    //记录产品信息的容器（起订量、库存量、单价）
    pdtInfosArray: [],
    process: {},
    event: {},
    allProduct: [],
    allShop: [],
    priceUnit: "元",
    timer: null,
    basePath: null,
    staticPath: null,
};

cart.process = {
    checkShop: function (domObj) {
        var id = domObj.attr("id") || "";
        var shopId = id.substring(0, id.indexOf("_shop"));
        var checked = domObj.attr("checked");
        $(":checkbox[productShopId='" + shopId + "']").attr("checked", (checked == 'checked' || checked ) ? true : false);
        this.countAmount();
        cart.process.proSelect();
    },
    checkProduct: function (domObj) {
        var shopId = domObj.attr("productShopId") || "";
        var shopObj = $("#" + shopId + "_shop");
        var checked = domObj.attr("checked");
        var c = (checked == "checked" || checked ) ? true : false;
        var id = domObj.attr("id") || "";
        var pid = id.substring(0, id.indexOf("_product"));
        var number = $("#" + pid + "_qty").val() || 0;
        if (!(c && this.validQty(domObj, pid, number))) {
            //如果选中以后没校验通过则不选中
            domObj.attr("checked", false);
        }

        //设置商铺和全选checkbox值
        c = true;
        var checkedPdts = $(":checkbox[productShopId='" + shopId + "']:checked");
        if (checkedPdts == null || checkedPdts.length == 0) c = false;
        if (shopObj) shopObj.attr("checked", c);
        //如果所有的选项都没选中 则全选按钮撤销选择
        c = true;
        var allCheckedPdts = $(":checkbox[id$='_product']:checked");
        if (allCheckedPdts == null || allCheckedPdts.length == 0) {
            $(":checkbox[name='allCheck']").attr('checked', false);
            c = false;
        }

        if (!c) {
            $("#totalAmount").text("0.00");
            $("#total_count").text(0);
            $("#top_total_count").text(0);
        } else {
            //如果存在一个选中 则计算金额
            this.countAmount();
        }
        cart.process.proSelect();

    },
    checkAll: function (domObj) {
        var c = true;
        if (domObj) {
            var checked = domObj.attr("checked");
            c = (checked == "checked" || checked ) ? true : false;
        }
        cart.allShop.attr("checked", c);
        cart.allProduct.attr('checked', c);
        $(":checkbox[name='allCheck']").attr('checked', c);
        //全选以后 则需要判断是是否能勾选产品
        if (c) {
            this.validAfterCheckAll();
        }
        this.countAmount();
        cart.process.proSelect();
    },
    deleteAll: function () {
        var checkedProducts = $(":checkbox[id$='_product']:checked");
        var pids = "";
        var pidArray = [];
        var sourceFroms = "";
        if (checkedProducts != null && checkedProducts.length > 0) {
            if (confirm("确认删除选中的数据?")) {
                for (var i = 0; i < checkedProducts.length; i++) {
                    var checkedPdt = $(checkedProducts[i]);
                    var id = checkedPdt.attr("id");
                    var pid = id.substring(0, id.indexOf("_product"));
                    if (i != checkedProducts.length - 1) {
                        pids += pid.split("_")[0] + ",";
                    } else {
                        pids += pid.split("_")[0];
                    }
                    if (i != checkedProducts.length - 1) {
                        if (pid.split("_")[1] == "" || pid.split("_")[1] == null) {
                            sourceFroms += "2" + ",";
                        } else {
                            sourceFroms += pid.split("_")[1] + ",";
                        }
                    } else {
                        if (pid.split("_")[1] == "" || pid.split("_")[1] == null) {
                            sourceFroms += "2";
                        } else {
                            sourceFroms += pid.split("_")[1];
                        }
                    }
                    pidArray.push(pid);
                }
                $.post(cart.basePath + "cart/delete", {"productId": pids, "sourceFrom": sourceFroms}, function (data) {
                    if (data == "hd_sucs") {
                        alert("删除成功!");
                        if (pidArray != null && pidArray.length > 0) {
                            for (var i = 0; i < pidArray.length; i++)
                                cart.process.deleteRow(pidArray[i]);
                        }
                        cart.process.countAmount();
                        cart.process.clear();
                    } else {
                        alert(data);
                    }
                });
            }
        }

    },
    initPdtInfo: function () {
        $(":checkbox[id$='_product']").each(function () {
            var product = $(this);
            var id = product.attr("id") || "";
            var productId = id.substring(0, id.indexOf("_product"));
            var pdtInfo = {};
            pdtInfo.minBuyCount = $("#minBuyCount_" + productId).val() || 0;
            pdtInfo.stockCount = $("#stockCount_" + productId).val() || 0;
            pdtInfo.price = $("#price_" + productId).val() || 0.00;
            pdtInfo.id = productId || 0;
            var productPriceArray = [];
            var productPrices = $(":input[name='product_price_" + productId + "']");
            if (productPrices != null && productPrices.length > 0) {
                for (var i = 0; i < productPrices.length; i++) {
                    var productPrice = {};
                    var item = productPrices[i];
                    var startNumber = $(item).attr("startNumber") || 0;
                    productPrice.startNumber = startNumber;
                    var endNumber = $(item).attr("endNumber") || 0;
                    productPrice.endNumber = endNumber;
                    var price = $(item).val() || 0;
                    productPrice.price = price;
                    productPriceArray.push(productPrice);
                }
            }
            pdtInfo.productPriceArray = productPriceArray;
            cart.pdtInfosArray.push(pdtInfo);
        });
    },
    //计算所有金额
    countAmount: function () {
        var allAmount = 0.0;
        var pdtNumber = 0;
        $(":checkbox[id$='_product']:checked").each(function () {
            var product = $(this);
            var id = product.attr("id") || "";
            var pid = id.substring(0, id.indexOf("_product"));
            var buyNumber = $("#" + pid + "_qty").val() || 0;
            var pdt = cart.process.getPdtInfo(pid);
            var amount = 0.00;
            if (pdt) {
                var price = cart.process.getPriceByQty(pdt, buyNumber);
                $("#display_price_" + pid).text(Number(price).toFixed(2) + cart.priceUnit);
                amount = Number(buyNumber) * Number(price);
                allAmount += amount;
                amount = amount.toFixed(2);
                $("#amount_" + pid).text(amount + cart.priceUnit);
                pdtNumber += Number(buyNumber);
            }
        });
        if (allAmount <= 0) {
            $("#submitOrder").attr("style", "background-color:#e2e0de");
        } else {
            $("#submitOrder").attr("style", "background-color:#f47a11;");
        }
        allAmount = Number(allAmount).toFixed(2);

        pdtNumber = Number(pdtNumber).toFixed(0);
        $("#totalAmount").text(allAmount);
        $("#total_count").text(pdtNumber);
        $("#top_total_count").text(pdtNumber);
    },
    validAfterCheckAll: function () {
        cart.allProduct.each(function () {
            var p = $(this);
            var id = p.attr("id") || "";
            var pid = id.substring(0, id.indexOf("_product"));
            //获取到产品信息
            var pdt = cart.process.getPdtInfo(pid);
            var buyNumber = $("#" + pid + "_qty").val() || 0;
            var stockCount = pdt.stockCount || 0;
            var minBuyCount = pdt.minBuyCount || 0;
            if (Number(buyNumber) > Number(stockCount)) {
                //购买数量大于库存量
                p.attr("checked", false);
                $("#msg_" + pid).text("库存不足,库存:" + stockCount);
                cart.process.clearMsg(pid);
            }
            if (Number(stockCount) < Number(minBuyCount)) {
                p.attr("checked", false);
                $("#msg_" + pid).text("库存小于最小起订量，最小起订量：" + minBuyCount + ",库存:" + stockCount);
                cart.process.clearMsg(pid);
            }
        });
        //如果所有的产品都没选中，则需要将商铺的勾选框取消选中
        cart.allShop.each(function () {
            var s = $(this);
            var id = s.attr("id") || "";
            var sid = id.substring(0, id.indexOf("_shop"));
            //商铺下选中的产品
            var checkedPdts = $(":checkbox[productShopId='" + sid + "']:checked");
            if (checkedPdts == null || checkedPdts.length == 0) $(this).attr("checked", false);
        });

    },
    getPdtInfo: function (pid) {
        var pdtArray = cart.pdtInfosArray;
        if (pdtArray != null && pdtArray.length > 0) {
            for (var i = 0; i < pdtArray.length; i++) {
                if (pdtArray[i] && pdtArray[i].id == pid) {
                    return pdtArray[i];
                }
            }
            return {};
        } else {
            var pdt = {};
            pdt.price = $("#price_" + pid).val() || 0.00;
            pdt.minBuyCount = $("#minBuyCount_" + pid).val() || 0;
            pdt.stockCount = $("#stockCount_" + pid).val() || 0;
            pdt.price = $("#price_" + pid).val() || 0.00;
            pdt.id = pid || 0;
            return pdt;
        }
    },
    setQty: function (dom) {
        clearTimeout(cart.timer);
        qty = dom.val() || "";
        dom.val(qty.replace(/\D/g, ''));
        qty = dom.val() || "";
        dom.val(this.clearZore(qty));
        qty = dom.val() || "";
        var id = dom.attr("id");
        var pid = id.substring(0, id.indexOf("_qty"));
        var sourceFrom = $("#" + pid + "_sourceFrom").val();
        if (sourceFrom == undefined) {
            sourceFrom = "";
        }
        qty = qty * 1;
        var stockCount = $("#stockCount_" + pid + sourceFrom).val() * 1;
        var minBuyCount = $("#minBuyCount_" + pid + sourceFrom).val() * 1;
        if (qty < minBuyCount) {
            $("#c_min_" + pid + sourceFrom).removeClass("hidden");
            $("#c_max_" + pid + sourceFrom).addClass("hidden");
        } else if (qty > stockCount) {
            $("#c_min_" + pid + sourceFrom).addClass("hidden");
            $("#c_max_" + pid + sourceFrom).removeClass("hidden");
        } else {
            $("#c_min_" + pid + sourceFrom).addClass("hidden");
            $("#c_max_" + pid + sourceFrom).addClass("hidden");
        }
        if (cart.process.validQty(dom, pid, qty)) {
            //相隔0.5秒没有值没有变化则进行操作
            cart.timer = setTimeout(function () {
                cart.process.updateDBQty(pid, qty, sourceFrom);
                cart.process.countAmount();
                cart.process.countSinglePdtAmount(pid, qty);
            }, 800);
        }
    },
    clearZore: function (value) {
        var v = value || "";
        while (v.length > 0 && v.indexOf(0) == "0" && /\d+/.test(v)) {
            v = v.substring(1, v.length);
        }
        return v == "" ? "1" : v;
    },
    updateDBQty: function (pid, value, sourceFrom) {
        $.post(cart.basePath + "cart/update-qty", {"productId": pid, "qty": value, "sourceFrom": sourceFrom});
    },
    countSinglePdtAmount: function (pid, number) {
        var pdt = cart.process.getPdtInfo(pid);
        var amount = 0.00;
        if (pdt) {
            var price = cart.process.getPriceByQty(pdt, number) * 1;
            $("#display_price_" + pid).text(Number(price).toFixed(2) + cart.priceUnit);
            amount = Number(number) * Number(price);
        }
        amount = amount.toFixed(2);
        $("#amount_" + pid).text(amount + cart.priceUnit);
    },
    validQty: function (dom, pid, number) {
        var pdt = cart.process.getPdtInfo(pid);
        var stockCount = pdt.stockCount || 0;
        var minBuyCount = pdt.minBuyCount || 0;
        var result = true;
        if (Number(number) > Number(stockCount)) {
            //购买数量大于库存量
            //$("#msg_"+pid).text("库存不足,库存:"+stockCount);
            $("#c_max_" + pid).removeClass("hidden");
            $("#c_min_" + pid).addClass("hidden");
            dom.val(stockCount);
            cart.process.clearMsg(pid);
            return false;
        }
        if (Number(stockCount) < Number(minBuyCount)) {
            $("#c_max_" + pid).addClass("hidden");
            $("#c_min_" + pid).removeClass("hidden");
            //$("#msg_"+pid).text("库存小于最小起订量，最小起订量："+minBuyCount+",库存:"+stockCount);
            dom.val(stockCount);
            cart.process.clearMsg(pid);
            return false;
        }

        if (Number(number) < Number(minBuyCount)) {
            //$("#msg_"+pid).text("购买量必须大于最小起订量："+minBuyCount);
            $("#c_max_" + pid).addClass("hidden");
            $("#c_min_" + pid).removeClass("hidden");
            dom.val(minBuyCount);
            cart.process.clearMsg(pid);
            return false;
        }

        if (Number(stockCount) < 0) {
            dom.val(0);
            return false;
        }
        return result;
    },
    clearMsg: function (pid) {
        setTimeout(function () {
            $("#msg_" + pid).text("");
        }, 2000);
    },
    minusQty: function (pid) {
        clearTimeout(cart.timer);
        var sourceFrom;
        var key = pid;
        if (pid.indexOf("_") > 0) {
            sourceFrom = pid.split("_")[1];
            pid = pid.split("_")[0];
        }
        var qtyDom = $("#" + key + "_qty");
        var cValue = qtyDom.val() * 1 || 0;
        var minBuyCount = $("#minBuyCount_" + pid + "_" + sourceFrom).val();
        if (cValue <= minBuyCount) {
            $("#c_min_" + pid + "_" + sourceFrom).removeClass("hidden");
            $("#c_max_" + pid + "_" + sourceFrom).addClass("hidden");
        } else {
            $("#c_min_" + pid + "_" + sourceFrom).addClass("hidden");
            $("#c_max_" + pid + "_" + sourceFrom).addClass("hidden");
        }

        if (Number(cValue) > 1) {
            qtyDom.val(Number(cValue) - 1);
            cValue = qtyDom.val();
            if (cart.process.validQty(qtyDom, key, cValue)) {
                //相隔0.5秒没有值没有变化则进行操作
                cart.timer = setTimeout(function () {
                    cart.process.updateDBQty(pid, cValue, sourceFrom);
                    cart.process.countAmount();
                    cart.process.countSinglePdtAmount(key, cValue);
                }, 800);
            }
        } else {
            qtyDom.val(1);
        }


    },
    addQty: function (pid) {
        clearTimeout(cart.timer);
        var sourceFrom;
        var key = pid;
        if (pid.indexOf("_") > 0) {
            sourceFrom = pid.split("_")[1];
            pid = pid.split("_")[0];
        }
        var qtyDom = $("#" + key + "_qty");
        var cValue = qtyDom.val() || 0;
        qtyDom.val(Number(cValue) + 1);
        cValue = qtyDom.val();
        var stockCount = $("#stockCount_" + pid + "_" + sourceFrom).val() * 1;
        if (cValue >= stockCount) {
            $("#c_min_" + pid + "_" + sourceFrom).addClass("hidden");
            $("#c_max_" + pid + "_" + sourceFrom).removeClass("hidden");
        } else {
            $("#c_min_" + pid + "_" + sourceFrom).addClass("hidden");
            $("#c_max_" + pid + "_" + sourceFrom).addClass("hidden");
        }
        if (cart.process.validQty(qtyDom, key, cValue)) {
            //相隔0.8秒没有值没有变化则进行操作
            cart.timer = setTimeout(function () {
                cart.process.updateDBQty(pid, cValue, sourceFrom);
                cart.process.countAmount();
                cart.process.countSinglePdtAmount(key, cValue);
            }, 800);
        }
    },
    deleteCartPdt: function (pid) {
        var sourceFrom;
        var key = pid;
        if (pid.indexOf("_") > 0) {
            sourceFrom = pid.split("_")[1];
            pid = pid.split("_")[0];
        }
        if (confirm("确认删除本条记录?")) {
            $.post(cart.basePath + "cart/delete", {"productId": pid, "sourceFrom": sourceFrom}, function (data) {
                if (data == "hd_sucs") {
                    alert("删除成功!");
                    cart.process.deleteRow(key);
                    cart.process.countAmount();
                    cart.process.clear();

                } else {
                    alert(data);
                }
            });
        }
    },
    deleteRow: function (pid) {
        var row = $("#rows_" + pid);
        var pdtDom = $("#" + pid + "_product");
        var sid = pdtDom.attr("productShopId") || 0;
        var shopDiv = $("#shop_container_" + sid);
        row.remove();
        //如果商铺没有商品则整个样式全部删除
        var pcheckproduct = $(":checkbox[productShopId='" + sid + "']");
        if (pcheckproduct == null || pcheckproduct.length == 0) {
            $("#" + sid + "_shopinfo").remove();
        }
        if (shopDiv) {
            var pCheckboxes = shopDiv.find(":checkbox[id$='_product']");
            if (pCheckboxes == null || pCheckboxes.length == 0) {
                shopDiv.html("");
            }
        }
    },
    clear: function () {
        var pdts = $(":checkbox[id$='_product']");
        var homeUrl = $("#homeUrl").val();
        if (pdts == null || pdts.length == 0) {
            $("#cart_div").html('');
            $("#cart_div").html(
                '<div class="content">' +
                '<div class="cart-not">' +
                '<img src="' + cart.staticPath + 'images/cart/cart.png" width="138" height="110" class="fl mr_30" />' +
                '<span class="fl fs_20 mt_20">购物车内没有商品，去找一找您需要的商品吧！</span>' +
                '<a href="' + homeUrl + '" class="but">去首页</a>' +
                '</div>' +
                '</div>');
        }
    },
    addToCollection: function (id) {
        //当跳至登录页面，成功登陆后，需要返回的路径。根据自己的业务需求来定
        var _d = {returnUrl: cart.basePath + "cart/detail"};
        //sourceFrom:订单来源
        var sourceFrom;
        if (id.indexOf("_")) {
            sourceFrom = id.split("_")[1];
            id = id.split("_")[0];
        }
        $.ajax({
            //验证的URL
            url: cart.basePath + 'validate-login',
            //url: "http://chncpa.cnhnkj.cn/b2bWeb-order/validate-login",
            data: _d,
            type: 'post',
            success: function (data) {
                //后台验证通过,此用户已登录
                if (data.login) {
                    //以下是业务处理的代码
                    $.post(cart.basePath + "order/purchase/collect", {
                        "productId": id,
                        "sourceFrom": sourceFrom
                    }, function (data) {
                        alert(data);
                    });
                } else {
                    //跳转至登陆域
                    window.location.href = data.redirectUrl;
                }
            }
        });
    },
    //所有的收藏
    addAllToCollection: function () {
        //当跳至登录页面，成功登陆后，需要返回的路径。根据自己的业务需求来定
        var _d = {returnUrl: cart.basePath + "cart/detail"};
        var allCheckedPdts = $(":checkbox[id$='_product']:checked");
        if (null == allCheckedPdts || allCheckedPdts.length == 0) {
            alert("请先选择需要收藏的商品！")
            return false;
        }
        var ids;
        var sourceFroms;
        $(":checkbox[id$='_product']:checked").each(function () {
            var idSource = $(this).val();
            if (idSource.indexOf("_")) {
                if (ids == undefined || ids == "") {
                    sourceFroms = idSource.split("_")[1];
                    ids = idSource.split("_")[0];
                } else {
                    sourceFroms += "," + idSource.split("_")[1];
                    ids += "," + idSource.split("_")[0];
                }
            }
        });

        $.ajax({
            //验证的URL
            url: cart.basePath + 'validate-login',
            //url: "http://chncpa.cnhnkj.cn//b2bWeb-order/validate-login",
            data: _d,
            type: 'post',
            success: function (data) {
                //后台验证通过,此用户已登录
                if (data.login) {
                    //以下是业务处理的代码
                    $.post(cart.basePath + "order/purchase/collect", {
                        "productId": ids,
                        "sourceFrom": sourceFroms
                    }, function (data) {
                        alert(data);
                    });
                } else {
                    //跳转至登陆域
                    window.location.href = data.redirectUrl;
                }
            }
        });
    },
    getPriceByQty: function (pdt, number) {
        if (pdt) {
            var productPriceArray = pdt.productPriceArray;
            if (productPriceArray && productPriceArray.length > 0) {
                for (var i = 0; i < productPriceArray.length; i++) {
                    var productPriceObj = productPriceArray[i];
                    var startNumber = productPriceObj.startNumber;
                    var endNumber = productPriceObj.endNumber;
                    var price = productPriceObj.price;
                    if (startNumber && endNumber && price) {
                        if (Number(startNumber) <= Number(number) && Number(endNumber) >= Number(number)) {
                            return Number(price);
                        }
                    }
                }
            }
            return pdt.price || 0.00;
        }
        return 0.00;
    },
    proSelect: function () {
        var checkObj = $(":checkbox[id$='_product']");
        for (var i = 0; i < checkObj.length; i++) {
            if (checkObj.eq(i).attr('checked')) {
                checkObj.eq(i).parent().parent().addClass("cart-cur");
            } else {
                checkObj.eq(i).parent().parent().removeClass("cart-cur");
            }
        }
    }
};
cart.event = {
    init: function () {
        cart.allProduct = $(":checkbox[id$='_product']");
        cart.allShop = $(":checkbox[id$='_shop']");
        cart.basePath = $("#basePath").val();
        cart.staticPath = $("#staticPath").val();
        //商店勾选
        cart.allShop.bind("click", function () {
            cart.process.checkShop($(this));
        });
        //产品勾选
        cart.allProduct.bind("click", function () {
            cart.process.checkProduct($(this));
        });

        $(":checkbox[name='allCheck']").bind("click", function () {
            cart.process.checkAll($(this));
        });

        $("a[name='allCheck']").bind("click", function () {
            cart.process.checkAll();
        });

        $("#deletePdt_btn").bind("click", function () {
            cart.process.deleteAll();
        });

        //数量输入框事件注入
        //clearTimeout(dblClickTimer);
        $(":input[id$='_qty']").bind("keyup input", function () {
            cart.process.setQty($(this));
        });
        //错误提示
        if ($("#act_status").val() != "") {
            alert($("#act_status").val());
        }
        cart.process.initPdtInfo();
        //确认下单
        $("#submitOrder").click(function () {
            //获取被勾选的订单
            var value = "";
            //产品来源（1：分销产品 2 :非分销产品）
            var sourceFrom = "";
            var qty = "";
            $(".cart_product:checked").each(function () {
                if (value != "") {
                    value += "," + $(this).val().split("_")[0];
                } else {
                    value = $(this).val().split("_")[0];
                }

                if (qty != "") {
                    qty += "," + $("#" + $(this).val() + "_qty").val();
                } else {
                    qty = $("#" + $(this).val() + "_qty").val();
                }
                if (sourceFrom != "") {
                    if ($(this).val().split("_")[1] == "" || $(this).val().split("_")[1] == null) {
                        sourceFrom += "," + "2";
                    } else {
                        sourceFrom += "," + $(this).val().split("_")[1];
                    }
                } else {
                    if ($(this).val().split("_")[1] == "" || $(this).val().split("_")[1] == null) {
                        sourceFrom = "2";
                    } else {
                        sourceFrom = $(this).val().split("_")[1];
                    }

                }
            });
            if (value == "") {
                alert("请选择你要购买的产品！");
                return false;
            }
            var sd = value + "^" + qty;
            // 提交后台，进行产品购买校验
            $.ajax({
                type: "post",
                async: false,
                url: cart.basePath + "cart/validate",
                data: {sd: sd},
                dataType: "json",
                success: function (data) {
                    if (data.flag != 3) {
                        alert(data.msg);
                        return false;
                    } else {
                        $("#productId").val(value);
                        $("#sourceFrom").val(sourceFrom);
                        $("#submitOrderForm").submit();
                    }
                }
            });
        });
    }
}

$(document).ready(function () {
    cart.event.init();
});