(function () {
    $.getScript(init.resoruceUrl + "uc/js/features.mgr.js", function () {
        F.loadFeatures("BUYERS_LEFT_FIX", "LEFT_FETURES");
        F.loadFeatures("BUYES_MIDDLE_FEATURES", "MIDDEL_FETURES");
        F.loadMenus("BUYERS_RIGHT_MENU", "RIGHT_MENU", function () {
            initRightMenuEvent();
            //初始化引导页右边菜单HTML
            g_initHtml();
        });
    });


    function initFeaturesEvent() {
        //快捷入口管理功能
        $('.plug .plug-manager').live('click', function () {
            if ($(this).html() == '管理菜单') {
                $('.plug li').not(".add").prepend('<div class="del-bg"></div><div class="del"><img src="http://static.' + domain + '/4.0/images/personal/home/plug-del.png" /></div>');
                $('.plug .plug-manager').html('取消操作');
            } else {
                $('.plug li .del').remove();
                $('.plug li .del-bg').remove();
                $('.plug .plug-manager').html('管理菜单');
            }
        });

        $('.plug li .del').live('click', delMenu);
        //快捷入口添加功能
        $('.plug li.add').live('click', function () {
            $('.popup-plug-add').show();
            var h = $('.popup-plug-add .popup').height();
            $('.popup-plug-add .popup').css('margin-top', -h / 2);
        });
        $('.popup-plug-add .title span').live('click', function () {
            $('.popup-plug-add').hide();
        });
        $('.popup-plug-add .box li').live('click', addMenu);

    }


    function delMenu() {
        var $this = $(this).parent();
        windows_custom_open('删除菜单操作', '<div class="plug-del-popup"><h3>确认此菜单不是您经常会使用的吗？</h3><a id="confirm">确认删除</a><a onclick="windows_close();">考虑一下</a></div>', '350', '200');
        $('#confirm').on('click', function () {
            var menuId = $this.attr("menuId");
            $this.find(".del").remove();
            $this.find(".del-bg").remove();
            hideMenu(menuId, $this[0].outerHTML);
            $this.remove();
            windows_close();
        })
    }

    function addMenu(event) {
        var menu = $(this);
        var menuId = menu.attr("menuId");
        menu.remove();
        var html = F.reconvertMenu(menu[0].outerHTML);
        $(html).insertBefore($("#RIGHT_MENU").children(":last"));
        $('.popup-plug-add').hide();
        if ($("#menu_add_container").children().length == 0) $('.plug li.add').hide();
        F.saveFavoriteMenus(menuId, 'BUYERS_RIGHT_MENU');
    }

    function hideMenu(menuId, html) {
        html = F.convertMenu(menuId, html);
        F.hideMenus[menuId] = html;
        $("#menu_add_container").append(html);
        $("#RIGHT_MENU").find(".add").show();
        //删除用户常用模块
        F.deleteFavoriteMenus(menuId, 'BUYERS_RIGHT_MENU');
    }


    function fillMenuAddArea() {
        var hasMenus = false;
        for (var menuId in F.hideMenus) {
            if (menuId && F.hideMenus[menuId]) {
                $("#menu_add_container").append(F.hideMenus[menuId]);
                hasMenus = true;
            }
        }
        if (hasMenus) $("#RIGHT_MENU").find(".add").show();
    }

    function initRightMenuEvent() {
        $(".plug-manager").show();
        F.loadHideMenus('BUYERS_RIGHT_MENU', fillMenuAddArea);
    }

    initFeaturesEvent();


    /**业务JS start*/
    $("#newhelp").click(function () {
        gb();
    });
    var guids = init.guides;
    if (guids != null && guids == "BUYERS_GUIDE_") {
        gb();
    }
    function gb() {
        var g = new guide();
        g.guide_buyer_open();
        g_initHtml(g);
    }

    function g_initHtml(g) {
        if (!g) {
            g = new guide();
        }
        g.guide_init();
    }
})();