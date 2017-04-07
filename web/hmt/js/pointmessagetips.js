var pdomain = "";
var homeUrl = "";
var timers;
function loadDomainUrl() {
    var local = document.location.href;
    var index = local.indexOf(".cn/");
    index = index < 0 ? (local.indexOf(".com") + ".com/".length) : (index + ".cn/".length);
    var sdomain = local.substring(0, index + 1);
    pdomain = "cnhnb.com";
    homeUrl = "http://www.cnhnb.com";
    if (sdomain.indexOf("cnhnkj") >= 0) {
        pdomain = "cnhnkj.cn";
        homeUrl = "http://test.cnhnkj.cn";
    } else if (sdomain.indexOf("zym888") >= 0) {
        pdomain = "zym888.com";
        homeUrl = "http://www.zym888.com";
    } else if (sdomain.indexOf("lvsema") >= 0) {
        pdomain = "lvsema.cn";
        homeUrl = "http://www.lvsema.cn";
    }
    return pdomain;
}
pdomain = "im." + loadDomainUrl();
document.write("<script language='javascript' src='http://" + pdomain + "/Scripts/jquery.signalR.js'></script>");
document.write("<script language='javascript' src='http://" + pdomain + "/signalr/hubs'></script>");

function initStart() {

    $.connection.hub.url = 'http://' + pdomain + '/signalr';
    var chat = $.connection.pushHub;
    $.connection.hub.logging = false;

    chat.client.notification = function (conversition) {
        var data = JSON.parse(conversition);
        if (isUserLogin() && data) {
            viewPoint(data);
        }
    }


    //用户信息
    $.connection.hub.start({
        xdomain: true,
        transport: ['longPolling', 'serverSentEvents', 'foreverFrame', 'webSockets']
    }).done(function () {
        //console.log("连接成功");
    });

    $.connection.hub.error(function (error) {
        //console.log('SignalR error: ' + error)
    });
}

function isUserLogin() {
    var flag = false;
    if (!($("#userName").is(":hidden")) && $("#userName").text() != "") {
        flag = true;
    }
    return flag;
}

function viewPoint(result) {
    if ($("#my-message")) {
        $("#my-message").remove();
    }
    if (result) {
        var titps = '<div class="tp-cont my-message" id="my-message" style="z-index:9999">';
        titps += '<b><img src="' + homeUrl + '/img/msg-ico-top.png" /></b>';
        titps += '<dl class="message-buy">';
        titps += '<dt>恭喜您完成' + decodeURI(result.name) + '任务</dt>';
        titps += '<dd>已获得<i>+' + result.points + '</i>积分</dd>';
        titps += '</dl>';
        titps += '</div>';
        $(".msg").parent().parent().find(".label").append(titps);
        $("#my-message").show().delay(5000).hide(0);
        $("#my-message").unbind("mouseenter").unbind("mouseleave");
    }
}


function startpush() {
    if (isUserLogin()) {
        initStart();
        //setTimeout("initStart()",1500);
    }
}