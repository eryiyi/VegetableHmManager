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
            <li><a href="javascript:void (0);">审核方式</a></li>
            <li><a href="javascript:void (0);">信息审核方式</a></li>
        </ol>

    </div>
</div>

<div class="row">
    <div class="col-xs-12 col-sm-12">
        <div class="box">
            <div class="box-header">
                <div class="box-name">
                    <i class="fa fa-search"></i>
                    <span>信息审核方式</span>
                </div>
            </div>
            <div class="box-content">
                <%--<h4 class="page-header">会员详情</h4>--%>
                <form class="form-horizontal" role="form">
                    <input type="hidden" value="${shenhe.mm_record_shenhe_id}" id="mm_record_shenhe_id">

                    <div class="form-group">
                        <label class="col-sm-2 control-label">信息审核方式</label>

                        <div class="col-sm-4">
                            <select class="form-control" id="mm_record_shenhe_type">
                                <option value="">--信息审核方式--</option>
                                <option value="0" ${shenhe.mm_record_shenhe_type=='0'?'selected':''}>自动审核</option>
                                <option value="1" ${shenhe.mm_record_shenhe_type=='1'?'selected':''}>人工审核</option>
                            </select>
                        </div>
                    </div>

                    <div class="form-group">
                        <div class="col-sm-9 col-sm-offset-3">
                            <button type="button" class="btn btn-primary" onclick="saveRole()">确定</button>
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

    function saveRole(mm_emp_id) {
        var mm_record_shenhe_id = $("#mm_record_shenhe_id").val();
        var mm_record_shenhe_type = $("#mm_record_shenhe_type").val();

        $.ajax({
            cache: true,
            type: "POST",
            url: "/shenheRecordController/update.do",
            data: {
                "mm_record_shenhe_id": mm_record_shenhe_id,
                "mm_record_shenhe_type": mm_record_shenhe_type
            },
            async: false,
            success: function (_data) {
                var data = $.parseJSON(_data);
                if (data.success) {
                    alert("设置信息审核方式成功");
                } else {
                    var _case = {1: "设置信息审核方式失败"};
                    alert(_case[data.code])
                }
            }
        });
    }

</script>


