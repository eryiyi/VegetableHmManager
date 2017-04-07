// JavaScript Document
/*分销弹窗样式表*/
var basePath = $("#basePath").val();
if ($(window.parent.document)) {
    var bodys = $(window.parent.document).find('body');
} else {
    var bodys = $("body");
}

var fxCss = '';
fxCss += '<style>';

/*背景透明样式*/
fxCss += '.w-bg{position:fixed; z-index:9998; left:0; top:0; background-color:#000; width:100%; height:100%; opacity:0.5; filter:alpha(opacity=50);}';

/*隐藏样式*/
fxCss += '.d-none{display:none;}';

fxCss += '.fx-wds-m1{text-align:center;}';
fxCss += '.fx-wds-m2{padding-left:37px;}';
fxCss += '.fx-wds-m2 span{color:#0684cf;}';
fxCss += '.fx-wds-m2 a{color:#0684cf;}';
fxCss += '.fx-wds-m2 a.but{ display:block; width:66px; height:30px; line-height:30px; background-color:#f47912; color:#FFF; margin:10px auto 0 auto; text-align:center; overflow:hidden;}';
fxCss += '.fx-wds-m3 h3{line-height:36px; padding:5px 0 0 41px; font-size:12px; margin:0px;}';
fxCss += '.fx-wds-m3 p{width:590px; height:250px; overflow:scroll; margin:0 0 0 41px; padding:8px; border:#cccccc solid 1px; }';
fxCss += '.fx-wds-m3 span{text-align:center; display:block; line-height:40px; padding-top:12px;}';
fxCss += '.fx-wds-m3 a{display:block; width:105px; height:29px; line-height:29px; overflow:hidden; text-align:center; background-color:#ccc; color:#666; margin:auto;}';
fxCss += '.fx-wds-m3 a.cur{background-color:#f47912; color:#FFF;}';
fxCss += '.fx-wds-m4{margin:5px 0 0 26px; color:#666;}';
fxCss += '.fx-wds-m4 strong{font-size:14px; float:left; display:inline;color:#333;}';
fxCss += '.fx-wds-m4 img{float:left; display:inline;}';
fxCss += '.fx-wds-m4 span{color:#333;}';
fxCss += '.fx-wds-m4 a{width:88px; height:30px; overflow:hidden; display:block; margin:auto; line-height:30px; background-color:#f47912; color:#FFF; text-align:center; font-weight:bold;}';

/*弹出窗垂直水平居中样式*/
fxCss += '.fx-w{position:fixed; z-index:9999; left:50%; top:50%; margin-left:-160px; margin-top:-90px; font-family:"微软雅黑";}';

fxCss += '.fx-w-3{margin-left:-286px; margin-top:-144px;}';
fxCss += '.fx-w-4{margin-left:-338px; margin-top:-225px;}';
fxCss += '.fx-w .fx-s-1{width:310px; height:195px; overflow:hidden; border:#b9b8b8 solid 1px; background-color: #fff;}';
fxCss += '.fx-w .fx-s-2{width:676px; height:450px; overflow:hidden; border:#b9b8b8 solid 1px; background-color: #fff;}';
fxCss += '.fx-w .fx-s-3{width:572px; height:288px; overflow:hidden; border:#b9b8b8 solid 1px; background-color: #fff;}';
fxCss += '.fx-w h2{height:32px; background-color:#f3f3f3; margin:0px;}';
fxCss += '.fx-w h2 strong{font-weight:bold; line-height:32px; padding-left:19px; float:left; display:inline; font-size:14px;}';
fxCss += '.fx-w h2 a{float:right; display:inline; margin:0 16px 0 0; line-height:32px; color:#333; text-decoration:none;}';
fxCss += '.fx-w .line{display:block; height:1px; border-bottom:#cccccc solid 1px;}';
fxCss += '.fx-w .message{line-height:21px; color:#585858; font-size:12px;}';
fxCss += '.rule-h1{font-weight:bold;font-size:16px;line-height:30px;}';
fxCss += '.rule-h2{font-size:14px;line-height:28px;}';
fxCss += '.fx-w-5 .info{line-height:22px; padding-top:30px; text-align:center;}';
fxCss += '.fx-w-5 .message a{height:30px; float:left; width:80px; text-align:center; line-height:30px; color:#FFF; margin:30px 0 0 50px; cursor:pointer; border-radius:3px;}';
fxCss += '.fx-w-5 .message .a-yes{background-color:#009435;}';
fxCss += '.fx-w-5 .message .a-no{background-color:#f47a11;}';

/*收货地址样式*/
fxCss += '.w-box{position:fixed; z-index:9999; left:50%; top:50%; margin-left:-160px; margin-top:-90px; font-family:"微软雅黑";}';
fxCss += '.w-consignee{margin-left:-250px; margin-top:-175px;}';
fxCss += '.w-consignee-box{width:500px; height:350px; overflow:hidden; border:#b9b8b8 solid 1px; background-color: #fff;}';
fxCss += '.w-box h2{height:32px; background-color:#f3f3f3; margin:0px;}';
fxCss += '.w-box h2 strong{font-weight:bold; line-height:32px; padding-left:19px; float:left; display:inline; font-size:14px;}';
fxCss += '.w-box h2 a{float:right; display:inline; margin:0 16px 0 0; line-height:32px; color:#333; text-decoration:none;}';
fxCss += '.w-box .line{display:block; height:1px; border-bottom:#cccccc solid 1px;}';
fxCss += '.w-box .message{}';
fxCss += '.w-box .message ul{padding-left:20px;}';
fxCss += '.w-box .message li{height:26px; line-height:26px; padding-top:10px;}';
fxCss += '.w-box .message li em{float:left; display:inline; width:15px; text-align:center; color:#f00;}';
fxCss += '.w-box .message li span{float:left; display:inline; width:70px;}';
fxCss += '.w-box .message li p{float:left; display:inline; width:390px;}';
fxCss += '.w-box .message li p input{height:24px; line-height:24px; border:#e5e5e5 solid 1px; width:120px; padding-left:10px;}';
fxCss += '.w-box .message li p input.consignee-street{width:330px;}';
fxCss += '.w-box .message li p input.consignee-postal{width:120px;}';
fxCss += '.w-box .message li p input.consignee-phone{width:180px;}';
fxCss += '.w-box .message li p input.consignee-areaCode{width:40px;}';
fxCss += '.w-box .message li p input.consignee-tel{width:120px;}';
fxCss += '.w-box .message li p input.consignee-ext{width:40px;}';
fxCss += '.w-box .message .consignee-but{padding-top:50px;}';
fxCss += '.w-box .message .consignee-but p{float:left; display:inline; line-height:24px; margin-left:230px;}';
fxCss += '.w-box .message .consignee-but p input{margin-top:5px;float:left; display:inline;}';
fxCss += '.w-box .message .consignee-but .but{float:right; display:inline; line-height:24px; height:24px; width:130px; margin-right:20px;}';

fxCss += '</style>';
document.writeln(fxCss);

/*一行文字水平垂直居中样式弹窗*/
var fxHtml_1 = '';
fxHtml_1 += '<div class="w-bg"></div>';
fxHtml_1 += '<div class="fx-w fx-w-1 d-none">';
fxHtml_1 += '	<div class="fx-s-1">';
fxHtml_1 += '    	<h2><strong>提示</strong><a href="javascript:void(0);" onclick="windows_close();">×</a></h2>';
fxHtml_1 += '        <span class="line"></span>';
fxHtml_1 += '        <div class="message">';
fxHtml_1 += '        	<table width="100%" border="0" cellpadding="0" cellspacing="0">';
fxHtml_1 += '            	<tr>';
fxHtml_1 += '                	<td valign="middle" height="144" class="fx-wds-m1"></td>';
fxHtml_1 += '                </tr>';
fxHtml_1 += '            </table>';
fxHtml_1 += '      </div>';
fxHtml_1 += '    </div>';
fxHtml_1 += '</div>';

/*多行文字垂直居中样式弹窗*/
var fxHtml_2 = '';
fxHtml_2 += '<div class="w-bg"></div>';
fxHtml_2 += '<div class="fx-w fx-w-2 d-none">';
fxHtml_2 += '	<div class="fx-s-1">';
fxHtml_2 += '    	<h2><strong>提示</strong><a href="javascript:void(0);" onclick="windows_close();">×</a></h2>';
fxHtml_2 += '        <span class="line"></span>';
fxHtml_2 += '        <div class="message">';
fxHtml_2 += '        	<table width="100%" border="0" cellpadding="0" cellspacing="0">';
fxHtml_2 += '            	<tr>';
fxHtml_2 += '                	<td valign="middle" height="144" class="fx-wds-m2">';
fxHtml_2 += '                    </td>';
fxHtml_2 += '                </tr>';
fxHtml_2 += '            </table>';
fxHtml_2 += '        </div>';
fxHtml_2 += '    </div>';
fxHtml_2 += '</div>';

/*自定义大小弹窗*/
var fxHtml_3 = '';
fxHtml_3 += '<div class="w-bg"></div>';
fxHtml_3 += '<div class="fx-w fx-w-3 d-none">';
fxHtml_3 += '	<div class="fx-s-2">';
fxHtml_3 += '    	<h2><strong>提示</strong><a href="javascript:void(0);" onclick="windows_close();">×</a></h2>';
fxHtml_3 += '        <span class="line"></span>';
fxHtml_3 += '        <div class="message">';
fxHtml_3 += '        </div>';
fxHtml_3 += '    </div>';
fxHtml_3 += '</div>';

/*协议弹窗*/
/*协议文本*/
var xy_txt = '';
xy_txt += '<strong class="rule-h1">第一章 总则</strong><br />';
xy_txt += '<strong class="rule-h2">第一条</strong><br />';
xy_txt += '为了建立公平，诚信，透明的平台运营环境，规范卖家行为，更好的提升卖家服务，提高买家用户体验；保障蔬菜通分销平台供应商、分销商的合法权益、维护蔬菜通分销平台正常运营秩序，特制定本管理规范。<br />';
xy_txt += '<strong class="rule-h2">第二条</strong><br />';
xy_txt += '本管理规范用于规范供应商、分销商（统称为蔬菜通分销平台用户）入驻和退出蔬菜通分销平台，在蔬菜通分销平台的经营活动过程<br />';
xy_txt += '<strong class="rule-h2">第三条</strong><br />';
xy_txt += '供应商、分销商在蔬菜通分销平台的日常经营、管理中应诚实守信、遵纪守法，积极提升自身品质和信誉，给客户和消费者带来更好的体验。<br />';
xy_txt += '<strong class="rule-h1">第二章 定义</strong><br />';
xy_txt += '<strong class="rule-h2">第四条</strong><br />';
xy_txt += '蔬菜通分销平台，是指为蔬菜通分销平台用户提供分销服务的网络交易平台，域名为：fenxiao.cnhnb.com<br />';
xy_txt += '<strong class="rule-h2">第五条</strong><br />';
xy_txt += '供应商，是指通过蔬菜通分销平台向分销商提供产品供其销售的会员。<br />';
xy_txt += '<strong class="rule-h2">第六条</strong><br />';
xy_txt += '分销商，是指在蔬菜通网分销平台有购买商品资质的会员<br />';
xy_txt += '<strong class="rule-h2">第七条</strong><br />';
xy_txt += '同一个蔬菜通网帐号不充许同时拥有供应商和分销商身份。<br />';
xy_txt += '<strong class="rule-h2">第八条</strong><br />';
xy_txt += '产品，是指供应商在蔬菜通分销平台发布的商品。<br />';
xy_txt += '<strong class="rule-h1">第三章 入驻</strong><br />';
xy_txt += '<strong class="rule-h2">第九条</strong><br />';
xy_txt += '供应商和分销商入驻蔬菜通分销平台须至少同时具备以下条件：<br />';
xy_txt += '(一)已注册为蔬菜通网会员<br />';
xy_txt += '(二)持有并提交最新有效年检的《企业法人营业执照》副本的原件扫描件，且拟在蔬菜通分销平台开展的经营活动不超过其《企业法人营业执照》核准的经营范围；持有并提交《组织机构代码证》的原件扫描件。以上条件的审核通过蔬菜通网企业认证完成。<br />';
xy_txt += '(三)签署《蔬菜通分销平台入驻协议》。<br />';
xy_txt += '(四)供应商需为蔬菜通网农商易会员。<br />';
xy_txt += '<strong class="rule-h1">第四章 经营</strong><br />';
xy_txt += '<strong class="rule-h2">第十条</strong><br />';
xy_txt += '供应商在蔬菜通分销平台导入产品信息时，须遵守《中国蔬菜通网法律声明》和《中国蔬菜通网产品发布规则》关于发布商品或信息的规定。<br />';
xy_txt += '(一) 供应商成功入驻蔬菜通分销平台后即可导入产品。<br />';
xy_txt += '(二)供应商导入的产品不得包含以下外部链接：<br />';
xy_txt += '1.产品信息及页面中含有供应商自身店铺链接；<br />';
xy_txt += '2.产品信息及页面中含有供应商自身店铺的文字或图片广告及水印。<br />';
xy_txt += '<strong class="rule-h2">第十一条</strong><br />';
xy_txt += '供应商在蔬菜通分销平台不得发布、销售假冒伪劣产品或信息。<br />';
xy_txt += '<strong class="rule-h2">第十二条</strong><br />';
xy_txt += '供应商在产品描述页面、店铺页面等所有蔬菜通网提供的渠道中，应当对产品的基本属性、成色、瑕疵等必须说明的信息进行真实、完整的描述。<br />';
xy_txt += '供应商保证其出售的产品可以正常使用，符合法律法规及相关国家标准、行业标准，产品不存在任何危及人身财产安全的隐患，具备产品应当具备的使用性能、符合产品或其包装上注明采用的标准等。<br />';
xy_txt += '<strong class="rule-h2">第十三条</strong><br />';
xy_txt += '供应商在蔬菜通分销平台不得同时发布两件以上的同款产品。<br />';
xy_txt += '<strong class="rule-h2">第十四条</strong><br />';
xy_txt += '蔬菜通分销平台支持目前支持支付宝担保交易支付方式。<br />';
xy_txt += '<strong class="rule-h1">第五章 违规与处理</strong><br />';
xy_txt += '<strong class="rule-h2">第十五条</strong><br />';
xy_txt += '根据供应商违规情形的严重程度，蔬菜通分销平台处理措施划分如下：<br />';
xy_txt += '(一)分销限权15天，1个月，三个月或永久分销限权，且不能导入新产品，并在蔬菜通分销平台前台搜索屏蔽；<br />';
xy_txt += '(二)在蔬菜通分销平台内下架相关产品；<br />';
xy_txt += '(三)在蔬菜通分销平台内删除相关产品；<br />';
xy_txt += '(四)蔬菜通分销平台首页公示；<br />';
xy_txt += '(五)永久清退出蔬菜通分销平台。<br />';
xy_txt += '<strong class="rule-h2">第十六条</strong><br />';
xy_txt += '蔬菜通分销平台对供应商进行独立的违规次数统计，并对供应商的违规行为采取以下处理方式：<br />';
xy_txt += '供应商一般违规次数超过五次的，将在蔬菜通分销平台内下架供应商的所有产品；<br />';
xy_txt += '供应商严重违规次数超过十次的，将供应商清退出蔬菜通分销平台；<br />';
xy_txt += '供应商的违规次数在每年十二月三十一日二十四时清零。<br />';
xy_txt += '<strong class="rule-h2">第十七条</strong><br />';
xy_txt += '在供应商出现违规情形，蔬菜通分销平台经最终认定属实后，有权在不通知当事人的情况下进行处理。<br />';
xy_txt += '<strong class="rule-h2">第十八条</strong><br />';
xy_txt += '蔬菜通网将依据《中国蔬菜通网产品发布规则》或《中国蔬菜通网法律声明》的相关规定判定分销商违规并进行处理。<br />';
xy_txt += '<strong class="rule-h2">第十九条</strong><br />';
xy_txt += '供应商和分销商分别授权蔬菜通分销平台对其违规行为的责任承担进行独立判断，届时供应商和分销商应按照蔬菜通分销平台的要求提供相关证据材料。<br />';
xy_txt += '<strong class="rule-h1">第六章 退出</strong><br />';
xy_txt += '<strong class="rule-h2">第二十条</strong><br />';
xy_txt += '供应商、分销商有权根据自己的经营情况，可主动退出蔬菜通分销平台。<br />';
xy_txt += '<strong class="rule-h2">第二十一条</strong><br />';
xy_txt += '供应商退出后，蔬菜通分销平台将删除其在蔬菜通分销平台的产品信息。<br />';
xy_txt += '<strong class="rule-h2">第二十二条</strong><br />';
xy_txt += '供应商若退出后再入驻须符合以下条件：<br />';
xy_txt += '(一) 供应商因严重违规被清退的，永久不得重新入驻；<br />';
xy_txt += '(二)若符合以下任一情形，可在自被拒绝或被自主退出之日起算一个月后重新提交入驻申请：<br />';
xy_txt += '1.供应商自主申请退出的；<br />';
xy_txt += '2.供应商因审核未通过被拒绝入驻的。<br />';
xy_txt += '<strong class="rule-h2">第二十三条</strong><br />';
xy_txt += '分销商若出现以下任一情形，蔬菜通分销平台有权将其清退出蔬菜通分销平台：<br />';
xy_txt += '(一)分销商存在《中国蔬菜通网法律声明》中规定的严重违规行为；<br />';
xy_txt += '(一)分销商存在《中国蔬菜通网产品发布规则》中规定的严重违规行为；<br />';
xy_txt += '<strong class="rule-h2">第二十四条</strong><br />';
xy_txt += '分销商自主申请退出或被蔬菜通分销平台清退的，符合入驻条件后可重新申请入驻。<br />';
xy_txt += '<strong class="rule-h1">第七章 附则</strong><br />';
xy_txt += '<strong class="rule-h2">第二十五条</strong><br />';
xy_txt += '本管理规范自2015年2月10日起生效。<br />';
/*html样式代码*/
var fxHtml_4 = '';
fxHtml_4 += '<div class="w-bg"></div>';
fxHtml_4 += '<div class="fx-w fx-w-4 d-none">';
fxHtml_4 += '	<div class="fx-s-2">';
fxHtml_4 += '    	<h2><strong>协议</strong><a href="javascript:void(0);" onclick="windows_close();">×</a></h2>';
fxHtml_4 += '        <span class="line"></span>';
fxHtml_4 += '        <div class="message">';
fxHtml_4 += '        	<table width="100%" border="0" cellpadding="0" cellspacing="0">';
fxHtml_4 += '            	<tr>';
fxHtml_4 += '                	<td valign="middle" height="144" class="fx-wds-m3">';
fxHtml_4 += '                    	<h3>尊敬的农商易用户,入驻前请仔细阅读您以下协议</h3>';
fxHtml_4 += '                        <p>' + xy_txt + '</p>';
fxHtml_4 += '                        <span><input name="" class="w-agree" type="checkbox" value="" />我同意以上协议，并已知晓相关的权利和义务</span>';
fxHtml_4 += '                        <a href="javascript:void(0);" class="agree">我同意</a>';
fxHtml_4 += '                    </td>';
fxHtml_4 += '                </tr>';
fxHtml_4 += '            </table>';
fxHtml_4 += '        </div>';
fxHtml_4 += '    </div>';
fxHtml_4 += '</div>';

/*一行或多行文字弹窗*/
function windows_open(i, txt) {
    if (bodys.find('.fx-w-' + i).length == 0) {
        bodys.find('.fx-w-' + i).remove();
    }
    if (i == '1') {
        bodys.append(fxHtml_1);
        bodys.find('.fx-w-' + i).show();
    }
    if (i == '2') {
        bodys.append(fxHtml_2);
        bodys.find('.fx-w-' + i).show();
    }
    bodys.find('.fx-wds-m' + i).html(txt);
}

/*自定义弹窗提示框*/
function windows_custom_open(t, c, w, h) {
    if (bodys.find('.fx-w-3').length == 0) {
        bodys.find('.fx-w-3').hide().remove();
    }
    bodys.append(fxHtml_3);
    bodys.find('.fx-s-2').width(w);
    bodys.find('.fx-s-2').height(h);
    bodys.find('.fx-w-3').css('margin-left', -w / 2);
    bodys.find('.fx-w-3').css('margin-top', -h / 2);
    bodys.find('.fx-w-3 h2 strong').html(t);
    bodys.find('.fx-w-3').show();
    bodys.find('.fx-w-3 .message').html(c);
}

/*分销弹窗关闭事件*/
function windows_close() {
    bodys.find(".fx-w").hide().remove();
    bodys.find(".w-bg").hide().remove();
}

/*协议弹窗*/
function xy_window(id) {
    if ($('.fx-w-4').length == 0) {
        $('.fx-w-4').hide().remove();
    }
    $("body").append(fxHtml_4);
    $('.fx-w-4').show();
    if ($('#' + id).attr('checked')) {
        $('.w-agree').attr('checked', true);
    } else {
        $('.w-agree').attr('checked', false);
    }
    $('.fx-w-4 ').find('input').click(function () {
        if ($('.fx-w-4 ').find('input').attr('checked')) {
            $('.fx-w-4 .message a').addClass('cur');
            //$('.fx-w-3 .message a').attr('href',url);
        } else {
            $('.fx-w-4 .message a').removeClass('cur');
            //$('.fx-w-3 .message a').attr('href','javascript:void(0);');	
        }
    });
    $('.fx-w-4 ').find('.agree').click(function () {
        if ($('.w-agree').attr('checked')) {
            $('#' + id).attr('checked', true);
        } else {
            $('#' + id).attr('checked', false);
        }
        windows_close();
    });

}

/*确认提示弹窗*/
function fx_confirm_window(msg) {
    var url = arguments[1] ? arguments[1] : '';
    var obj = arguments[2] ? arguments[2] : '';
    var fn = null;
    if (typeof url == 'function') {
        fn = url;
        url = '';
    }
    if (bodys.find('.fx-w-5').length == 0) {
        bodys.find('.fx-w-5').hide().remove();
        bodys.find(".w-bg").hide().remove();
    }
    var fxHtml_5 = '';
    fxHtml_5 += '<div class="w-bg"></div>';
    fxHtml_5 += '<div class="fx-w fx-w-5 d-none">';
    fxHtml_5 += '  <div class="fx-s-1">';
    fxHtml_5 += '    <h2><strong>提示</strong></h2>';
    fxHtml_5 += '    <span class="line"></span>';
    fxHtml_5 += '    <div class="message">';
    fxHtml_5 += '      <div class="info"></div>';
    fxHtml_5 += "      <a href=\"javascript:void(0);\" class='a-yes'>确认</a>&nbsp;<a href=\"javascript:void(0);\" class='a-no'>取消</a>";
    fxHtml_5 += '    </div>';
    fxHtml_5 += '  </div>';
    fxHtml_5 += '</div>';
    //$("body").append(fxHtml_5);
    bodys.append(fxCss);
    bodys.append(fxHtml_5);
    bodys.find('.fx-w-5').show();
    bodys.find('.fx-w-5 .info').html(msg);
    bodys.find('.a-yes').click(function () {
        fx_confirm_close(url);
        fx_confirm_call_back(fn, obj);
    });
    bodys.find('.a-no').click(function () {
        fx_confirm_close();
    });
}
function fx_confirm_close(url) {
    if (url && url != '') {
        location = url;
    } else {
        bodys.find('.fx-w-5').hide().remove();
        bodys.find(".w-bg").hide().remove();
    }
}
function fx_confirm_call_back(fn, obj) {
    if (typeof fn == 'function') {
        setTimeout(fn(obj), 10);
    }
}
