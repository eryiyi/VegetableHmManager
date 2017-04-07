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
            <li><a href="javascript:void (0);">信息管理</a></li>
            <li><a href="javascript:void (0);">信息详情</a></li>
        </ol>

    </div>
</div>

<div class="row">
    <div class="col-xs-12 col-sm-12">
        <div class="box">
            <div class="box-header">
                <div class="box-name">
                    <i class="fa fa-search"></i>
                    <span>信息详情</span>
                </div>
            </div>
            <div class="box-content">
                <%--<h4 class="page-header">会员详情</h4>--%>
                <form class="form-horizontal" role="form">
                    <input type="hidden" value="${recordVO.mm_msg_id}" id="mm_msg_id">

                    <div class="form-group">
                        <label class="col-sm-2 control-label">信息类型</label>

                        <div class="col-sm-4">
                            <select class="form-control" id="mm_msg_type">
                                <option value="0" ${recordVO.mm_msg_type=='0'?'selected':''}>求购</option>
                                <option value="1" ${recordVO.mm_msg_type=='1'?'selected':''}>供应</option>
                            </select>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-2 control-label">内容</label>
                        <%--<div class="col-lg-8">--%>
                        <%--<div id="mm_msg_content">${recordVO.mm_msg_content}</div>--%>
                        <%--</div>--%>
                        <div class="col-lg-8">
                <textarea class="report-reason" name="mm_msg_content" content="${recordVO.mm_msg_content}"
                          id="mm_msg_content" cols="70" rows="10" placeholder="内容">${recordVO.mm_msg_content}</textarea>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-2 control-label">信息图片</label>
                        <%--<div id="mm_msg_picurl">${recordVO.mm_msg_picurl}</div>--%>
                        <div class="col-sm-10 col-md-2">
                            <c:forEach items="${arrPics}" var="e" varStatus="st">
                                <img class="img-thumbnail" style="cursor: pointer" src="${e}"/>
                            </c:forEach>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-2 control-label">所属地区</label>

                        <div class="col-lg-8">
                            <div id="area">${recordVO.cityName}${recordVO.area}</div>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">时间戳</label>

                        <div class="col-lg-8">
                            <div id="dateline">${um:format(recordVO.dateline, "yyyy-MM-dd HH:mm:ss")}</div>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-2 control-label">是否置顶</label>

                        <div class="col-sm-4">
                            <select class="form-control" id="is_top">
                                <option value="">--请选择--</option>
                                <option value="0" ${recordVO.is_top=='0'?'selected':''}>否</option>
                                <option value="1" ${recordVO.is_top=='1'?'selected':''}>是</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">是否审核</label>

                        <div class="col-sm-4">
                            <select class="form-control" id="is_check">
                                <option value="">--请选择--</option>
                                <option value="0" ${recordVO.is_check=='0'?'selected':''}>否</option>
                                <option value="1" ${recordVO.is_check=='1'?'selected':''}>是</option>
                            </select>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-2 control-label">置顶数字</label>

                        <div class="col-sm-4">
                            <input type="text" id="top_num" class="form-control" placeholder="置顶数字越大 越靠前"
                                   value="${recordVO.top_num}" data-toggle="tooltip" data-placement="bottom"
                                   title="Tooltip for name">
                        </div>
                    </div>

                    <div class="form-group">
                        <div class="col-sm-9 col-sm-offset-3">
                            <button type="button" class="btn btn-primary" onclick="updateMsg('${recordVO.mm_msg_id}')">
                                修改
                            </button>
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

    function updateMsg(mm_emp_id) {
        var mm_msg_type = $("#mm_msg_type").val();//信息ID
        var mm_msg_content = $("#mm_msg_content").val();//信息内容
        var mm_msg_id = $("#mm_msg_id").val();
        var is_top = $("#is_top").val();
        var top_num = $("#top_num").val();
        var is_check = $("#is_check").val();
        $.ajax({
            cache: true,
            type: "POST",
            url: "/record/update.do",
            data: {
                "mm_msg_id": mm_msg_id,
                "mm_msg_type": mm_msg_type,
                "mm_msg_content": mm_msg_content,
                "is_top": is_top,
                "is_check": is_check,
                "top_num": top_num
            },
            async: false,
            success: function (_data) {
                var data = $.parseJSON(_data);
                if (data.success) {
                    alert("修改成功");
                    window.location.href = "#module=record/listQiugou"+ "&_t=" + new Date().getTime();
                } else {
                    var _case = {1: "修改失败"};
                    alert(_case[data.code])
                }
            }
        });
    }
    ;

    <%--function selectColleges(){--%>
    <%--var citys =${listCitysAll};--%>
    <%--var province = $("#mm_emp_provinceId").val();--%>
    <%--var ret = '';--%>
    <%--for(var i= citys.length-1; i>=0; i-- ){--%>
    <%--if(citys[i].father==province){--%>
    <%--ret += "<option value='"+citys[i].cityID+"'>"+citys[i].city+"</option>";--%>
    <%--}--%>
    <%--}--%>
    <%--$("#mm_emp_cityId").html(ret);--%>
    <%--};--%>

</script>


