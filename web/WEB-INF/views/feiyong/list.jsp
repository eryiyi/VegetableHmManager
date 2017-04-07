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
            <li><a href="javascript:void(0)">费用管理</a></li>
            <li><a href="javascript:void(0)">费用列表</a></li>
        </ol>

    </div>
</div>

<div class="row">
    <div class="col-xs-12 col-sm-12">
        <div class="box ui-draggable ui-droppable">
            <div class="box-header">
                <div class="box-name ui-draggable-handle">
                    <i class="fa fa-table"></i>
                    <span>费用列表</span>
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
                <%--<p>For basic styling add the base class <code>.table</code> to any <code>&lt;table&gt;</code>.</p>--%>
                <table class="table table-hover">
                    <thead>
                    <tr>
                        <th>费用名称</th>
                        <th>费用金额</th>
                        <th>购买的月数</th>
                        <th>对应的等级</th>
                        <th>操作</th>
                        <th>操作</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${list}" var="e" varStatus="st">
                        <tr>
                            <td>${e.mm_feiyong_name}</td>
                            <td>${e.mm_feiyong_jine}</td>
                            <td>${e.mm_feiyong_time}</td>
                            <td>${e.mm_level_name}</td>
                            <td>
                                <a class="btn btn-default btn-sm" href="javascript:void (0)"
                                   onclick="editRole('${e.mm_feiyong_id}')" role="button">编辑</a>
                            </td>
                            <td>
                                <a class="btn btn-default btn-sm" href="javascript:void (0)"
                                   onclick="deleteRole('${e.mm_feiyong_id}')" role="button">删除</a>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
    function deleteRole(_id) {
        if (confirm("确定要删除该会费么？")) {
            $.ajax({
                url: "/feiyong/delete.do",
                data: {"mm_feiyong_id": _id},
                type: "POST",
                success: function (_data) {
                    var data = $.parseJSON(_data);
                    if (data.success) {
                        alert("删除成功");
                        window.location.href = "#module=feiyong/list" + "&_t=" + new Date().getTime();
                    } else {
                        var _case = {1: "删除失败"};
                        alert(_case[data.code])
                    }
                }
            });
        }
    }

    function editRole(_id) {
        if (confirm("确定要编辑该会费么？")) {
            $.ajax({
                type: "GET",
                data: {"typeId": _id},
                url: "/feiyong/edit.do",
                success: function (response) {
                    $("#content").html(response);
                }
            });
        }
    }
</script>


