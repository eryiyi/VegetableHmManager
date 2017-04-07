$(document).ready(function () {
    userPic()
    initqrcode();
    initCharts();
    featuresManagerBind();
    eventBind();
});


var domain = init.domain;
function featuresManagerBind() {
    //模块添加功能
    $('.modu-manager').on('click', function () {
        $('.popup-modu-add').show();
        var h = $('.popup-modu-add .popup').height();
        $('.popup-modu-add .popup').css('margin-top', -h / 2);
        $('.popup-modu-add .title span').on('click', function () {
            $('.popup-modu-add').hide();
        });
        $('.popup-modu-add .box li').on('click', function () {
            //点击添加入口事件
            $('.popup-modu-add').hide();
        });
    });

    //重置右侧快捷入口高度
    function plugReSize() {
        var mainHeight = $('.main').height();
        var mainRHeight = $('.mainR').height();
        var customerHeight = $('.customer').height();
        if (mainHeight > mainRHeight) $('.plug').height(mainHeight - customerHeight);
    }
}

//店铺二维码
function initqrcode() {
    var param = {
        render: "table", //table方式 
        width: 90, //宽度 
        height: 90, //高度 
        text: init.shopUrl //任意内容 
    };
    //支持H5
    if (window.applicationCache) {
        param.render = 'canvas';
    }
    $(".ewm-img").qrcode(param);
}

function userPic() {
    var userPic = init.userPic;
    var size = "!60x60";
    var defalue = "_60x60";
    if (userPic != "" && userPic.length > 0 && userPic.indexOf(".") > 0) {
        if (userPic.indexOf("group") > 0) {
            $("#userPic").prop("src", init.imgUrl + userPic.substring(0, userPic.lastIndexOf(".")) + size + userPic.substring(userPic.lastIndexOf(".")));
        } else {
            $("#userPic").prop("src", init.imgUrl + userPic.substring(0, userPic.lastIndexOf(".")) + defalue + userPic.substring(userPic.lastIndexOf(".")));
        }
    }
}


//流量图表
function initCharts() {
    var json = {
        "times": [],
        "result": [{"name": "", "color": "", "data": [], tooltip: {}}, {
            "name": "",
            "color": "",
            "data": [],
            tooltip: {}
        }, {"name": "", "color": "", "data": [], tooltip: {}}]
    };
    $.ajax({
        type: "post",
        async: false,
        url: init.userWebUrl + "sellers/getChartModel?t=" + new Date(),
        dataType: "json",
        success: function (result) {
            json = result;
        }
    });
    getHighcharts(json);
    function getHighcharts(json) {
        $('#visit').highcharts({
            chart: {
                type: 'spline'
            },
            title: {
                text: ''
            },
            subtitle: {
                text: ''
            },
            xAxis: {
                categories: json['times']
            },
            yAxis: {
                title: {
                    text: '',
                    enabled: false
                },
                min: 0,
                gridLineWidth: 1
            },
            tooltip: {
                crosshairs: [{// 设置准星线样式
                    width: 1,
                    color: '#ccc'
                }],
                shared: false, //设置数据共享
                useHTML: true,
                headerFormat: '',
                pointFormat: '<span style="color: {series.color}">{series.name}: </span><span style="text-align: right">{point.y}</span>',
                footerFormat: '',
                valueDecimals: 0//几位小数
            },
            credits: {
                enabled: false
            },
            legend: {
                enabled: false
            },
            plotOptions: {
                spline: {
                    marker: {
                        radius: 4,
                        lineWidth: 1
                    }
                },
                series: {
                    cursor: 'pointer',
                    point: {
                        events: {
                            click: function () {
                                window.location.href = this.options.url;
                            }
                        }
                    }
                }
            },
            series: json['result']
        });
    }
}

function eventBind() {
    //上传头像
    $("#userPic").click(function () {
        window.location.href = "uploadPic";
    });

    //修改密码
    $("a[id$='_Pwds']").click(function () {
        window.location.href = "userPwd";
    });

    //收款账号
    $("a[id$='_Accounts']").click(function () {
        window.location.href = "payAccount";
    });

    //认证引导页
    $("img[id^='logos_']").click(function () {
        //window.location.href="goCertification";
    });

    //积分页面
    $("#pointPic").click(function () {
        window.location.href = "userlevel";
    });

    //系统消息
    $("#message #messagenum").click(function () {
        window.loacation.href = "userMessage";
    });

    hnUtil.view.html("getMessageCount", {}, function (data) {
        $("#messagenum").html(data);
    });


    var local = document.location.href;
    if (local.indexOf("/buyers/") > 0) {
        hnUtil.view.html(init.userWebUrl + "buyers/lastProductBrower", {}, function (data) {
            $(".browseb-record").html(data);
            $(".picScroll-left").slide({
                titCell: ".hd ul",
                mainCell: ".bd ul",
                autoPage: true,
                effect: "left",
                autoPlay: true,
                vis: 5
            });
        });
    }
    if (local.indexOf("/sellers/") > 0) {
        hnUtil.view.html(init.userWebUrl + "sellers/getChartRingModel", {}, function (data) {
            $(".visit .data").html(data);
        });
        //百度分享
        window._bd_share_config = {
            common: {
                bdText: init.shopName,
                bdDesc: "我在中国蔬菜通网发现了农产品批发的好货源【" + init.shopName + "】，快来看看吧",
                bdUrl: init.shopUrl + "/",
                bdPic: ''
            },
            share: [{
                "bdSize": 16
            }]
        }
        with (document) 0[(getElementsByTagName('head')[0] || body).appendChild(createElement('script')).src = 'http://bdimg.share.baidu.com/static/api/js/share.js?cdnversion=' + ~(-new Date() / 36e5)];
    }
}

