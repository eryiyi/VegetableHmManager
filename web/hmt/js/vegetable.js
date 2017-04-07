//首页焦点图效果
$(function () {
    var obj = $('.menu-c-banner');
    var objPic = obj.find('.bd');
    var objBtn = obj.find('.hd');
    var picNumber = objPic.find('li').length;
    var btnHtml = '';
    for (var i = 1; i <= picNumber; i++) {//初始化banner图片和按钮隐藏
        i == 1 ? btnHtml += '<li class="on"></li>' : btnHtml += '<li></li>';
        //objPic.find('li').eq(i-1).css('z-index',picNumber+1-i);
        objPic.find('li').hide();
        objBtn.find('li').hide();
    }
    objBtn.find('ul').html(btnHtml);
    var cur = 1; //初始化第一次显示的图片
    var pre = 1; //定义上次显示的图片
    var next;
    var speed = 500; //运行速度
    var times = 3000; //自动切换间隔时间
    var timer;
    var isPlay = 0; //是否在运行中
    init(cur);
    function init(c) {
        if (isPlay == 0) {
            isPlay = 1;
            clearTimeout(timer);
            objBtn.find('li').show();
            objBtn.find('li').removeClass('on');
            objBtn.find('li').eq(c - 1).addClass('on');
            objPic.find('li').eq(pre - 1).fadeOut(speed);
            objPic.find('li').eq(c - 1).fadeIn(speed, function () {
                pre = c;
                isPlay = 0;
                next = c + 1;
                if (next > picNumber) {
                    next = 1;
                }
                timer = setTimeout(_init(next), times);
                function _init(c) {
                    return function () {
                        init(c);
                    }
                }
            });
        }
    }

    objBtn.find('li').on('click', function () {
        var indexs = objBtn.find('li').index(this);
        init(indexs + 1);
    })

})

/*首页右侧焦点图*/
jQuery(".slideBox").slide({mainCell: ".bd ul", autoPlay: true});

/*导航*/
$(function () {
    $(".nav-djrx").click(function () {
        $("html,body").animate({scrollTop: $(".vegetable-good").offset().top - 30}, 500);
    });
    $(".nav-tstj").click(function () {
        $("html,body").animate({scrollTop: $(".vegetable-local").offset().top - 30}, 650);
    });
    $(".nav-dptj").click(function () {
        $("html,body").animate({scrollTop: $(".vegetable-base").offset().top - 30}, 800);
    });
    $(".nav-zxhq").click(function () {
        $("html,body").animate({scrollTop: $(".vegetable-market").offset().top - 30}, 1000);
    });

    function nav() {
        if ($(window).scrollTop() >= '151') {
            $(".type-nav").addClass("type-nav-fixed");
            $(".menu-c-tit span").addClass("menu-c-tit-v");
            $(".type-menu").css("margin-top", "49px");
            $(".menu-c-list").hide();
            $(".menu-c-bottom").hide();
            $(".menu-c-tit,.menu-c-list").hover(
                function () {
                    $(".menu-c-list").show();
                    $(".menu-c-list").css("height", "auto");
                },
                function () {
                    $(".menu-c-list").hide();
                }
            );
        } else if ($(window).scrollTop() <= '150') {
            $(".type-nav").removeClass("type-nav-fixed");
            $(".menu-c-tit span").removeClass("menu-c-tit-v");
            $(".type-menu").css("margin-top", "0px");
            $(".menu-c-list").show();
            $(".menu-c-bottom").show();
            $(".menu-c-tit,.menu-c-bottom,.menu-c-list").hover(
                function () {
                    $(".menu-c-list").show();
                    $(".menu-c-list").css("height", "auto");
                },
                function () {
                    $(".menu-c-list").show();
                    $(".menu-c-list").css("height", "345px");
                }
            );
        }
    }

    $(window).scroll(function () {
        nav();
    });
    $(document).ready(function () {
        nav();
    });

});


/*当季热销tabs切换效果*/
$(function () {
    $(".good-top li").click(function () {
        $(".good-top li").removeClass("cur");
        $(this).addClass("cur");
        var indexs = $('.good-top li').index(this);
        $('.goodbox').hide();
        $('.goodbox').eq(indexs).show();
    });
})

/*特色推荐tabs切换效果*/
$(function () {
    $(".local-top li").click(function () {
        $(".local-top li").removeClass("cur");
        $(this).addClass("cur");
        var indexs = $('.local-top li').index(this);
        $('.localbox').hide();
        $('.localbox').eq(indexs).show();
    });
})

/*特色推荐tabs切换效果*/
$(function () {
    $(".base-top li").click(function () {
        $(".base-top li").removeClass("cur");
        $(this).addClass("cur");
        var indexs = $('.base-top li').index(this);
        $('.basebox').hide();
        $('.basebox').eq(indexs).show();
    });
})


