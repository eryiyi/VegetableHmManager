var supplier = (function () {
    return {
        /**
         * 使用标签来判断导致界面变形，直接使用js来控制
         */
        initCertInfo: function (isCertCompany, isCertUser, imgUrl) {
            var html = "<span>认证信息：</span>";
            if (isCertCompany && isCertCompany == "1") {
                //$("#certInfo").html();
                html += '【企业认证】<img src="' + imgUrl + '/img/shop/images/dp_ico1.png" align="absmiddle"/>&nbsp;<img src="' + imgUrl + '/img/shop/images/dp_ico2.png" align="absmiddle"/>';
            } else if (isCertUser && isCertUser == "1") {
                html += '【个人认证】<img src="' + imgUrl + '"/img/shop/images/dp_ico1.png" align="absmiddle"/>&nbsp;<img src="' + imgUrl + '"/img/shop/images/dp_ico2.png" align="absmiddle"/>';
            } else {
                html += "【未认证】";
            }
            $("#certInfo").html(html);
        },
        addShopCollect: function (url) {
            $.ajax({
                async: false,
                url: url + "common/addShopCollect",
                type: 'GET',
                dataType: "jsonp",
                jsonp: "callback",
                jsonpCallback: "callback",
                data: "shopId=" + shopinfo.shopId,
                success: function (json) {
                    if (json.msg == "00") {
                        hnUtil.message.alert("收藏成功");
                    } else if (json.msg == "01") {
                        hnUtil.message.alert("已收藏过，请勿重复收藏");
                    } else if (json.msg == "02") {
                        hnUtil.message.alert("收藏失败，请先登录");
                    } else if (json.msg == "03") {
                        hnUtil.message.alert("请勿收藏自己的店铺！！");
                    } else {
                        hnUtil.message.alert("收藏失败。未知错误");
                    }
                }
            });
        }
    };
})();