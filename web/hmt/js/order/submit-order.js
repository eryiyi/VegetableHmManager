// JavaScript Document
var basePath = $("#basePath").val();
$(document).ready(function () {

    /*支付方式选中效果*/
    $(function () {
        $(".pay-list .list").click(function () {
            $("#payWay").val($(this).attr("rel"));
            $('.pay-list .list').removeClass('cur');
            $(this).addClass('cur');
        });
    });


    /*商品清单 订单商品数量改变效果*/
    $(function () {
        //订单留言点击可编辑状态改变
        $(".guess .input .msg").bind("click", function () {
            $(this).addClass('cur');
            if ($.trim($(this).val()) == '' || $.trim($(this).val()) == '给卖家留言') {
                $(this).val('');
            }
            $(this).focus();
        }).bind("blur", function () {
            if ($(this).val() == '') {
                $(this).removeClass('cur');
                $(this).val('给卖家留言');
            }
        });
    })

});