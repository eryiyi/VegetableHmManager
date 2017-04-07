<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="um" uri="/unimanager-tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" trimDirectiveWhitespaces="true" %>
<div class="row">
    <div id="breadcrumb" class="col-xs-12">
        <a href="#" class="show-sidebar">
            <i class="fa fa-bars"></i>
        </a>
        <ol class="breadcrumb pull-left">
            <li><a href="javascript:void(0)" onclick="toPage('mainPage','')">主页</a></li>
            <li><a href="javascript:void (0);">金牌榜</a></li>
            <li><a href="javascript:void (0);">添加商户</a></li>
        </ol>

    </div>
</div>

<div class="row">
    <div class="col-xs-12 col-sm-12">
        <div class="box">
            <div class="box-header">
                <div class="box-name">
                    <i class="fa fa-search"></i>
                    <span>添加商户</span>
                </div>
            </div>
            <div class="box-content">
                <%--<h4 class="page-header">会员详情</h4>--%>
                <form class="form-horizontal" role="form">
                    <input type="hidden" value="${empVO.mm_emp_id}" id="mm_emp_id">

                    <div class="form-group">
                        <label class="col-sm-2 control-label">用户名</label>

                        <div class="col-sm-4">
                            <input type="text" id="mm_emp_nickname" readonly="true" value="${empVO.mm_emp_nickname}"
                                   placeholder="用户名" class="form-control" data-toggle="tooltip" data-placement="bottom"
                                   title="Tooltip for name">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">用户手机号</label>

                        <div class="col-sm-4">
                            <input type="text" id="mm_emp_mobile" readonly="true" value="${empVO.mm_emp_mobile}"
                                   placeholder="手机号" class="form-control" data-toggle="tooltip" data-placement="bottom"
                                   title="Tooltip for name">
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-2 control-label">置顶数字</label>

                        <div class="col-sm-4">
                            <input type="text" id="top_num" placeholder="置顶数字" value="0" class="form-control"
                                   data-toggle="tooltip" data-placement="bottom" title="Tooltip for name">
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-2 control-label">是否上榜显示</label>

                        <div class="col-sm-4">
                            <select class="form-control" id="is_del">
                                <option value="">--选择是否显示--</option>
                                <option value="0" selected="selected">是</option>
                                <option value="1">否</option>
                            </select>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-2 control-label">上榜到期日期</label>

                        <div class="col-sm-2">
                            <input type="date" id="end_time" class="form-control">
                        </div>
                    </div>

                    <div class="form-group">
                        <div class="col-sm-9 col-sm-offset-3">
                            <button type="button" class="btn btn-primary" onclick="addPaihang()">确定</button>
                            <button type="button" class="btn btn-primary" onclick="javascript :history.back(-1)">返回
                            </button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript">

    function addPaihang() {
        var mm_emp_id = $("#mm_emp_id").val();
        var is_del = $("#is_del").val();
        var top_num = $("#top_num").val();
        var end_time = $("#end_time").val();

        if (is_del.replace(/\s/g, '') == '') {
            alert("请选择是否显示");
            return;
        }

        $.ajax({
            cache: true,
            type: "POST",
            url: "/paihang/add.do",
            data: {
                "mm_emp_id": mm_emp_id,
                "is_del": is_del,
                "top_num": top_num,
                "end_time": end_time
            },
            async: false,
            success: function (_data) {
                var data = $.parseJSON(_data);
                if (data.success) {
                    alert("添加成功");
                    window.location.href = "#module=/paihang/list&page=1"+ "&_t=" + new Date().getTime();
                } else {
                    var _case = {1: "添加失败", 2: "添加失败，该用户已经上榜"};
                    alert(_case[data.code])
                }
            }
        });
    }
    ;

</script>


