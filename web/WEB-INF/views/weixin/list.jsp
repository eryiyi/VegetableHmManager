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
            <li><a href="javascript:void(0)">微信客服</a></li>
            <li><a href="javascript:void(0)">微信客服</a></li>
        </ol>

    </div>
</div>

<div class="row">
    <div class="col-xs-12 col-sm-12">
        <div class="box ui-draggable ui-droppable">
            <div class="box-header">
                <div class="box-name ui-draggable-handle">
                    <i class="fa fa-table"></i>
                    <span>微信客服</span>
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
                        <th>微信名/qq昵称</th>
                        <th>微信号/qq号</th>
                        <th>类型</th>
                        <th>操作</th>
                        <th>操作</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${list}" var="e" varStatus="st">
                        <tr>
                            <td>${e.mm_weixin_name}</td>
                            <td>${e.mm_weixin}</td>
                            <td>
                                <c:if test="${e.mm_weixin_type=='0'}">微信</c:if>
                                <c:if test="${e.mm_weixin_type=='1'}">QQ</c:if>
                            </td>
                            <td>
                                <a class="btn btn-default btn-sm" href="javascript:void (0)"
                                   onclick="editRole('${e.mm_weixin_id}')" role="button">编辑</a>
                            </td>
                            <td>
                                <a class="btn btn-default btn-sm" href="javascript:void (0)"
                                   onclick="deleteRole('${e.mm_weixin_id}')" role="button">删除</a>
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

    function editRole(_id) {
        if (confirm("确定要编辑该微信客服么？")) {
            $.ajax({
                type: "GET",
                data: {"typeId": _id},
                url: "/weixin/edit.do",
                success: function (response) {
                    $("#content").html(response);
                }
            });
        }
    }

    function deleteRole(_id) {
        if (confirm("确定要删除该客服么？")) {
            $.ajax({
                url: "/weixin/delete.do",
                data: {"mm_weixin_id": _id},
                type: "POST",
                success: function (_data) {
                    var data = $.parseJSON(_data);
                    if (data.success) {
                        alert("删除成功");
                        window.location.href = "#module=weixin/list"+ "&_t=" + new Date().getTime();
                    } else {
                        var _case = {1: "删除失败"};
                        alert(_case[data.code])
                    }
                }
            });
        }
    }

</script>


