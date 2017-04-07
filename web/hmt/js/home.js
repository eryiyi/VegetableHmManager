$(function () {
    var userId = null;
    var username = null;
    var basepath = "http://www.cnhnb.com/";
    //请求用户信息
    $.ajax({
        url: basepath + "getUserLoginInfo",  // 跨域URL    
        type: 'POST',
        dataType: 'jsonp',
        jsonp: "callback",
        jsonpCallback: "userLoginState",
        success: function (data) {
            if (data) {
                userId = data.userId;
                username = data.userName;
                if (userId != null && userId != "") {
                    $(".topbar-name").show();
                    $(".userName").html(username);
                    $(".topbar-login").hide();
                    //系统未读消息
                    $.getJSON(basepath + "common/getusermsg?userid='" + userId + "'&callback=?", function (data) {
                        if (data.success) {
                            $(".msgnum").html(data.msgcount);
                        } else {
                            $(".msgnum").html(0);
                        }
                    });
                    $("#releaseLogin").show();
                    $("#releaseNoLogin").hide();
                } else {
                    $(".topbar-name").hide();
                    $(".topbar-login").show();
                    $("#releaseLogin").hide();
                    $("#releaseNoLogin").show();
                }
            } else {
                $(".topbar-name").hide();
            }
        }
    });


    $("#topmenu1 li").hover(function () {
        $(this).addClass("hover").find("div.tp-cont").show();
    }, function () {
        $(this).removeClass("hover").find("div.tp-cont").hide();
    });

});


$(document).ready(function () {


    $("#topmenu li, #topmenu_wel li").hover(function () {
        $(this).addClass("hover").find("div.tp-cont").show();
    }, function () {
        $(this).removeClass("hover").find("div.tp-cont").hide();
    });

    $(".select").each(function () {
        var s = $(this);
        var z = parseInt(s.css("z-index"));
        var dt = $(this).children("dt");
        var dd = $(this).children("dd");
        var _show = function () {
            dd.slideDown(200);
            dt.addClass("cur");
            s.css("z-index", z + 1);
        };   //灞曞紑鏁堟灉
        var _hide = function () {
            dd.slideUp(200);
            dt.removeClass("cur");
            s.css("z-index", z);
        };    //鍏抽棴鏁堟灉
        dt.click(function () {
            dd.is(":hidden") ? _show() : _hide();
        });
        dd.find("a").click(function () {
            dt.html($(this).html());
            _hide();
        });     //閫夋嫨鏁堟灉锛堝闇�浼犲�锛屽彲鑷畾涔夊弬鏁帮紝鍦ㄦ澶勮繑鍥炲搴旂殑"value"鍊�锛�
        $("body").click(function (i) {
            !$(i.target).parents(".select").first().is(s) ? _hide() : "";
        });
    })

    $curtainopen = false;

    $(".rope").click(function () {
        $(this).blur();
        if ($curtainopen == false) {
            $(this).stop().animate({top: '0px'}, {queue: false, duration: 350, easing: 'easeOutBounce'});
            $(".leftcurtain").stop().animate({width: '60px'}, 2000);
            $(".rightcurtain").stop().animate({width: '60px'}, 2000, function () {
                $(".leftcurtain").fadeOut(1000);
                $(".rightcurtain").fadeOut(1000);
            });
            $("#mask").fadeOut(2500);
            $("body").css("overflow", "auto");
            $(".rope").fadeOut(300);

            $curtainopen = true;
        } else {
            $(this).stop().animate({top: '-40px'}, {queue: false, duration: 350, easing: 'easeOutBounce'});
            $(".leftcurtain").stop().animate({width: '50%'}, 2000);
            $(".rightcurtain").stop().animate({width: '51%'}, 2000);
            $curtainopen = false;
        }
        return false;
    });

});


//幻灯片
$(function () {
    var sw = 0;
    $(".focus .num a").mouseover(function () {
        sw = $(".num a").index(this);
        myShow(sw);
    });
    function myShow(i) {
        $(".focus .num a").eq(i).addClass("cur").siblings("a").removeClass("cur");
        $(".focus ul li").eq(i).stop(true, true).fadeIn(600).siblings("li").fadeOut(600);
    }

    //滑入停止动画，滑出开始动画
    $(".focus").hover(function () {
        if (myTime) {
            clearInterval(myTime);
        }
    }, function () {
        myTime = setInterval(function () {
            myShow(sw)
            sw++;
            if (sw == 3) {
                sw = 0;
            }
        }, 5000);
    });
    //自动开始
    var myTime = setInterval(function () {
        myShow(sw)
        sw++;
        if (sw == 3) {
            sw = 0;
        }
    }, 5000);
});