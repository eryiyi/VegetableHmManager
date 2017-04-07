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
            <li><a href="javascript:void(0)">控制信息显示天数</a></li>
            <li><a href="javascript:void(0)">控制信息显示天数</a></li>
        </ol>

    </div>
</div>

<div class="row">
    <div class="col-xs-12 col-sm-12">
        <div class="box">
            <div class="box-header">
                <div class="box-name">
                    <i class="fa fa-search"></i>
                    <span>控制信息显示天数</span>
                </div>
                <div class="box-icons">
                    <a class="collapse-link">
                        <i class="fa fa-chevron-up"></i>
                    </a>
                    <a class="expand-link">
                        <i class="fa fa-expand"></i>
                    </a>
                    <a class="close-link">
                        <i class="fa fa-times"></i>
                    </a>
                </div>
                <div class="no-move"></div>
            </div>
            <div class="box-content">
                <h4 class="page-header">控制信息显示天数</h4>

                <form class="form-horizontal" role="form">
                    <input type="hidden" id="mm_day_id" value="${aboutUs.mm_day_id}">

                    <div class="form-group">
                        <label class="col-sm-2 control-label">信息显示天数</label>

                        <div class="col-sm-4">
                            <input type="text" value="${aboutUs.mm_day_value}" id="mm_day_value" class="form-control"
                                   placeholder="控制信息显示天数" data-toggle="tooltip" data-placement="bottom"
                                   title="Tooltip for name">
                        </div>
                    </div>

                    <div class="form-group">
                        <div class="col-sm-9 col-sm-offset-3">
                            <button type="button" class="btn btn-primary" onclick="saveP()">保存</button>
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
    function saveP() {
        var mm_day_id = $("#mm_day_id").val();
        var mm_day_value = $("#mm_day_value").val();

        if (mm_day_value.replace(/\s/g, '') == '') {
            alert("请输入天数");
            return;
        }

        $.ajax({
            cache: true,
            type: "POST",
            url: "/dayValueController/update.do",
            data: {"mm_day_id": mm_day_id, "mm_day_value": mm_day_value},
            async: false,
            success: function (_data) {
                var data = $.parseJSON(_data);
                if (data.success) {
                    alert("执行成功");
                } else {
                    alert("执行失败，请检查")
                }
            }
        });
    }
</script>


