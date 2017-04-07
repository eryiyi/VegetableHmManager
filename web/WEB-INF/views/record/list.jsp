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
            <li><a href="javascript:void(0)">信息管理</a></li>
            <li><a href="javascript:void(0)">信息列表</a></li>
        </ol>

    </div>
</div>

<div class="row">
    <div class="col-xs-12 col-sm-12">
        <div class="box ui-draggable ui-droppable">
            <div class="box-header">
                <div class="box-name ui-draggable-handle">
                    <i class="fa fa-table"></i>
                    <span>信息列表</span>
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
                <form class="form-inline">
                    <input type="hidden" value="${mm_msg_type}" id="mm_msg_type">

                    <div class="form-group">
                        <div class="col-sm-4">
                            <input type="text" value="${query.keyword}" placeholder="用户名、手机号、内容、公司名称" id="keywords"
                                   class="form-control" data-toggle="tooltip" data-placement="bottom"
                                   title="Tooltip for name">
                        </div>

                    </div>
                    <div class="form-group">
                        <div class="form-group">
                            <select class="form-control w12" id="is_check">
                                <option value="">--是否审核--</option>
                                <option value="0" ${query.is_check=='0'?'selected':''}>否</option>
                                <option value="1" ${query.is_check=='1'?'selected':''}>是</option>
                            </select>
                        </div>
                    </div>

                    <button type="submit" onclick="searchOrder('1')"
                            class="btn form-control btn-warning btn-sm btn-block">查找
                    </button>
                </form>
                <c:if test="${is_manager=='0'}">
                    <form action="" class="form">
                        <div class="form-group">
                            <div class="col-md-2 col-lg-2">
                                <button type="button" onclick="Daochu_Select()"
                                        class="btn w12 form-control btn-block btn-danger btn-sm">批量导出Excel
                                </button>
                            </div>
                        </div>
                    </form>
                </c:if>
                <table class="table table-hover">
                    <thead>
                    <tr>
                        <th><input type="checkbox" name="allmails" onclick="checkAll()"></th>
                        <th>类型</th>
                        <th>姓名</th>
                        <th>信息</th>
                        <th>发布时间</th>
                        <th>公司名称</th>
                        <th>电话</th>
                        <th>所属地区</th>
                        <th>是否审核</th>
                        <th>操作</th>
                        <th>操作</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${list}" var="e" varStatus="st">
                        <tr>
                            <td><input type="checkbox" id="${e.mm_msg_id}" name="checkbox_one"></td>
                            <td>
                                <c:if test="${e.mm_msg_type=='0'}">求购</c:if>
                                <c:if test="${e.mm_msg_type=='1'}">供应</c:if>
                            </td>
                            <td>${e.mm_emp_nickname}</td>
                            <td>${e.mm_msg_title}</td>
                            <td>${um:format(e.dateline, 'yyyy-MM-dd HH:mm:ss')}</td>
                            <td>${e.mm_emp_company}</td>
                            <td>${e.mm_emp_mobile}</td>
                            <td>${e.cityName} ${e.area}</td>
                            <td>
                                <c:if test="${e.is_check=='0'}">否</c:if>
                                <c:if test="${e.is_check=='1'}">是</c:if>
                            </td>
                            <td>
                                <a class="btn btn-default btn-sm" onclick="deleteRole('${e.mm_msg_id}')" role="button">删除</a>
                            </td>
                            <td>
                                <a class="btn btn-default btn-sm"
                                   href="#module=/record/toDetail&mm_msg_id=${e.mm_msg_id}" role="button">管理</a>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>

                <div style="margin-top: 20px;border-top: 1px solid #dedede;padding-bottom:15px; height: 50px">
                    <span style="line-height:28px;margin-top:25px;padding-left:10px; float: left">共${page.count}条/${page.pageCount}页</span>
                    <ul class="pagination" style="padding-left:100px; float: right">
                        <li>
                            <a style="margin-right:20px">每页显示&nbsp;<select name="size" id="size"
                                                                           onchange="nextPage('1')">
                                <option value="10" ${query.size==10?'selected':''}>10</option>
                                <option value="20" ${query.size==20?'selected':''}>20</option>
                                <option value="30" ${query.size==30?'selected':''}>30</option>
                                <option value="100" ${query.size==100?'selected':''}>100</option>
                            </select>&nbsp;条</a>
                        </li>
                        <c:choose>
                            <c:when test="${page.page == 1}">
                                <li><a href="javascript:void(0)">首页</a></li>
                                <li><a href="javascript:void(0)"><span class="left">《</span></a></li>
                            </c:when>
                            <c:otherwise>
                                <li><a href="javascript:void(0);" onclick="nextPage('1')">首页</a></li>
                                <li><a href="javascript:void(0);" onclick="nextPage('${page.page-1}')"><span
                                        class="left">《</span></a></li>
                            </c:otherwise>
                        </c:choose>
                        <li><a style="height: 30px; width: 100px">第<input style="width: 40px;height:20px;" type="text"
                                                                          id="index" name="index"
                                                                          onkeyup="searchIndex(event)"
                                                                          value="${page.page}"/> 页</a></li>

                        <c:choose>
                            <c:when test="${page.page == page.pageCount}">
                                <li><a href="javascript:void(0)"><span class="right">》</span></a></li>
                                <li><a href="javascript:void(0)">末页</a></li>
                            </c:when>
                            <c:otherwise>
                                <li><a href="javascript:void(0);" onclick="nextPage('${page.page+1}')"><span
                                        class="right">》</span></a></li>
                                <li><a href="javascript:void(0);" onclick="nextPage('${page.pageCount}')">末页</a></li>
                            </c:otherwise>
                        </c:choose>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
    function searchIndex(e) {
        if (e.keyCode != 13) return;
        var _index = $("#index").val();
        var size = getCookie("contract_size");
        var keywords = $("#keywords").val();
        var mm_msg_type = $("#mm_msg_type").val();
        var is_check = $("#is_check").val();

        if (_index <= ${page.pageCount} && _index >= 1) {
            if (mm_msg_type == 0) {
                window.location.href = "#module=/record/listQiugou&page=" + page + "&size=" + size + "&keyword=" + keywords+ "&is_check=" + is_check + "&_t=" + new Date().getTime();
            } else {
                window.location.href = "#module=/record/listGongying&page=" + page + "&size=" + size + "&keyword=" + keywords + "&is_check=" + is_check + "&_t=" + new Date().getTime();
            }

        } else {
            alert("请输入1-${page.pageCount}的页码数");
        }
    }
    function nextPage(_page) {
        var page = parseInt(_page);
        var size = $("#size").val();
        var keywords = $("#keywords").val();
        var mm_msg_type = $("#mm_msg_type").val();
        var is_check = $("#is_check").val();

        addCookie("contract_size", size, 36);
        if ((page <= ${page.pageCount} && page >= 1)) {
            if (mm_msg_type == 0) {
                window.location.href = "#module=/record/listQiugou&page=" + page + "&size=" + size + "&keyword=" + keywords + "&is_check=" +is_check + "&_t=" + new Date().getTime();
            } else {
                window.location.href = "#module=/record/listGongying&page=" + page + "&size=" + size + "&keyword=" + keywords + "&is_check=" + is_check + "&_t=" + new Date().getTime();
            }
        } else {
            alert("请输入1-${page.pageCount}的页码数");
        }
    }

    function searchOrder(_page) {
        var page = parseInt(_page);
        var size = $("#size").val();
        var keywords = $("#keywords").val();
        var mm_msg_type = $("#mm_msg_type").val();
        var is_check = $("#is_check").val();

        addCookie("contract_size", size, 36);
        if ((page <= ${page.pageCount} && page >= 1)) {

            if (mm_msg_type == 0) {
                window.location.href = "#module=/record/listQiugou&page=" + page + "&size=" + size + "&keyword=" + keywords+ "&is_check=" +is_check + "&_t=" + new Date().getTime();
            } else {
                window.location.href = "#module=/record/listGongying&page=" + page + "&size=" + size + "&keyword=" + keywords + "&is_check=" +is_check  + "&_t=" + new Date().getTime();
            }
        } else {
            alert("请输入1-${page.pageCount}的页码数");
        }
    }

    function deleteRole(_id) {
        var mm_msg_type = $("#mm_msg_type").val();
        if (confirm("确定要删除该信息么？")) {
            $.ajax({
                url: "/record/delete.do",
                data: {"mm_msg_id": _id},
                type: "POST",
                success: function (_data) {
                    var data = $.parseJSON(_data);
                    if (data.success) {
                        alert("删除成功");
                        var is_check = $("#is_check").val();
                        if (mm_msg_type == 0) {
                            window.location.href = "#module=/record/listQiugou&page=1"+"&mm_msg_type="+mm_msg_type+"&is_check="+is_check + "&_t=" + new Date().getTime();
                        } else {
                            window.location.href = "#module=/record/listGongying&page=1"+"&mm_msg_type="+mm_msg_type+"&is_check="+is_check + "&_t=" + new Date().getTime();
                        }
                    } else {
                        var _case = {1: "删除失败"};
                        alert(_case[data.code])
                    }
                }
            });
        }
    }


    function checkAll() {
        var all = document.getElementsByName("allmails")[0];
        var select = document.getElementsByName("checkbox_one");
        if (all.checked) {
            for (var i = 0; i < select.length; i++) {
                select[i].checked = true;
            }
        } else {
            for (var i = 0; i < select.length; i++) {
                select[i].checked = false;
            }
        }
    }

    function Daochu_Select() {
        var select_id = '';
        var select = document.getElementsByName("checkbox_one");
        for (var i = 0; i < select.length; i++) {
            if (select[i].checked == true) {
                select_id = select_id + select[i].id + ',';
            }
        }
        if (select_id == '') {
            alert('请选择数据！');
            return
        } else {
            if (confirm("确定要导出所选择的信息吗？")) {
                $.ajax({
                    url: "/record/daochuAll.do",
                    data: {"ids": select_id},
                    type: "POST",
                    success: function (_data) {
                        var data = $.parseJSON(_data);
                        if (data.success) {
                            window.location.href = "/upload" + data.data;//这样就可以弹出下载对话框了
                        } else {
                            var _case = {1: "导出失败"};
                            alert(_case[data.code])
                        }
                    }
                });
            }
        }

    }

</script>


