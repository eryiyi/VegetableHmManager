// JavaScript Document

//banner
var ary = location.href.split("&");
jQuery(".slideBox").slide({
    mainCell: ".bd ul",
    effect: ary[1],
    autoPlay: ary[2],
    trigger: ary[3],
    easing: ary[4],
    delayTime: ary[5],
    mouseOverStop: ary[6],
    pnLoop: ary[7]
});

$(document).ready(function () {

    //初始化悬浮置顶按钮
    $("#cx_zd_but").css("right", ($(window).width() - 1190) / 2 - 54);
    $("#cx_zd_but").css("bottom", "105px");
    $("#cx_zd_but").hide();
    $("#cx_xf1").css("right", ($(window).width() - 1190) / 2 - 54);
    $("#cx_xf1").css("bottom", "10px");
    //当滚动条的位置处于距顶部100像素以下时，跳转链接出现，否则消失
    $(window).scroll(function () {
        if ($(window).scrollTop() > 200) {
            $("#cx_zd_but").fadeIn();
        }
        else {
            $("#cx_zd_but").fadeOut();
        }

    });
    //当窗口大小改变 按钮位置随之改变
    $(window).resize(function () {
        if ($(window).width() > 1115) {
            $("#cx_zd_but").css("right", ($(window).width() - 1190) / 2 - 54);
            $("#cx_xf1").css("right", ($(window).width() - 1190) / 2 - 54);
        } else {
            $("#cx_zd_but").css("right", "10px");
            $("#cx_xf1").css("right", "10px");
        }
        $("#cx_zd_but").css("bottom", "105px");
        $("#cx_xf1").css("bottom", "10px");
    });
    //当点击跳转链接后，回到页面顶部位置
    $("#cx_zd_but").click(function () {
        $('body,html').animate({scrollTop: 0}, 500);
        return false;
    });
    //店铺左侧导航
    var aMenuOneLi = $(".menu_1 > li");
    var aMenuTwo = $(".menu_2");
    $(".menu_1 > li > .header").each(function (i) {
        $(this).click(function () {
            if ($(aMenuTwo[i]).css("display") == "block") {
                $(aMenuTwo[i]).slideUp(300);
                $(aMenuOneLi[i]).removeClass("menu_show")
            } else {
                for (var j = 0; j < aMenuTwo.length; j++) {
                    $(aMenuTwo[j]).slideUp(300);
                    $(aMenuOneLi[j]).removeClass("menu_show");
                }
                $(aMenuTwo[i]).slideDown(300);
                $(aMenuOneLi[i]).addClass("menu_show")
            }
        });
    });

    /*橱窗产品上下切换*/
    var s_recommend_tab = function () {
        var ListWidth = 177; //每项宽度
        var tab = $(".s-recommend .tabs");
        var demo = tab.find(".demo");
        var demo1 = tab.find(".demo1");
        var demo2 = tab.find(".demo2");
        var demo3 = tab.find(".demo3");
        var tablListNumber = demo1.find(".list").length; //获取数量
        if (tablListNumber > 1) {
            var TotalWidth = tablListNumber * ListWidth; //总宽度
            demo1.height(TotalWidth);
            demo2.height(TotalWidth);
            demo3.height(TotalWidth);
            demo.height(TotalWidth * 3);
            demo2.html(demo1.html());
            demo3.html(demo1.html());
            demo.css('margin-top', '-' + TotalWidth + 'px');
            var demo1Width = demo.height();
            var intTime = 5000;
            var speed = 500; //速度
            var currentNum = 1; //初始化显示第几张图片
            var isRun = 1; //定义当前是否在运行中 运行中点击无效
            var direction = 'right'; //默认方向向右轮换
            var timer; //定义延迟函数

            function init() {
                clearTimeout(timer);
                if (direction == 'left') {
                    currentNum--;
                }
                if (direction == 'right') {
                    currentNum++;
                }
                if (isRun == 1) {
                    isRun = 0;
                    var marginLeftCss = -(currentNum - 1) * ListWidth - TotalWidth;
                    demo.animate({
                        marginTop: marginLeftCss
                    }, {
                        duration: speed, easing: "easeInOutCubic", complete: function () {
                            if (currentNum >= tablListNumber + 1) {
                                currentNum = parseInt(currentNum - tablListNumber);
                                demo.css('margin-top', '-' + TotalWidth + 'px');
                            }
                            if (currentNum <= 0) {
                                currentNum = parseInt(tablListNumber + currentNum);
                                demo.css('margin-top', '-' + (TotalWidth * 2 - ListWidth) + 'px');
                            }
                            isRun = 1;
                            timer = setTimeout(init, intTime);
                        }
                    });
                }
            }

            setTimeout(init, intTime);
        }

    }
    s_recommend_tab();

});