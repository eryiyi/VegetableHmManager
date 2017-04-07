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
            <li><a href="javascript:void(0)">活跃度</a></li>
            <li><a href="javascript:void(0)">活跃度</a></li>
        </ol>

    </div>
</div>

<div class="row">
    <div class="col-xs-12 col-sm-12">
        <div class="box ui-draggable ui-droppable">
            <div class="box-header">
                <div class="box-name ui-draggable-handle">
                    <i class="fa fa-table"></i>
                    <span>活跃度</span>
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
                <%--<form class="form-inline">--%>
                <%--<div class="form-group">--%>
                <%--<select class="form-control" id="is_use">--%>
                <%--<option value="">--选择处理状态--</option>--%>
                <%--<option value="0" ${query.is_use=='0'?'selected':''}>未处理</option>--%>
                <%--<option value="1" ${query.is_use=='1'?'selected':''}>已处理</option>--%>
                <%--</select>--%>
                <%--</div>--%>
                <%--<button type="submit" onclick="searchOrder('1')" class="btn form-control btn-warning btn-sm btn-block">查找</button>--%>
                <%--</form>--%>
                <%--<form action="" class="form">--%>
                <%--<div class="form-group">--%>
                <%--<div class="col-md-2 col-lg-2">--%>
                <%--<button type="button" onclick="Daochu_Select()" class="btn w12 form-control btn-block btn-danger btn-sm">批量导出Excel</button>--%>
                <%--</div>--%>
                <%--</div>--%>
                <%--</form>--%>
                <table class="table table-hover">
                    <thead>
                    <tr>
                        <%--<th>全选<input type="checkbox" name="allmails" onclick="checkAll()"></th>--%>
                        <th>手机号</th>
                        <th>姓名</th>
                        <th>登录时间</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${list}" var="e" varStatus="st">
                        <tr>
                                <%--<td><input type="checkbox" id="${e.mm_emp_login_num_id}" name="checkbox_one"></td>--%>
                            <td>${e.mm_emp_mobile}</td>
                            <td>${e.mm_emp_nickname}</td>
                            <td>${e.mm_emp_login_time}</td>
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

        if (_index <= ${page.pageCount} && _index >= 1) {
            window.location.href = "#module=/emp/getEmpLoginNumber&page=" + _index + "&size=" + size + "&_t=" + new Date().getTime();
        } else {
            alert("请输入1-${page.pageCount}的页码数");
        }
    }
    function nextPage(_page) {
        var page = parseInt(_page);
        var size = $("#size").val();
        addCookie("contract_size", size, 36);
        if ((page <= ${page.pageCount} && page >= 1)) {
            window.location.href = "#module=/emp/getEmpLoginNumber&page=" + page + "&size=" + size + "&_t=" + new Date().getTime();
        } else {
            alert("请输入1-${page.pageCount}的页码数");
        }
    }

    function searchOrder(_page) {
        var page = parseInt(_page);
        var size = $("#size").val();
        addCookie("contract_size", size, 36);
        if ((page <= ${page.pageCount} && page >= 1)) {
            window.location.href = "#module=/emp/getEmpLoginNumber&page=" + page + "&size=" + size + "&_t=" + new Date().getTime();
        } else {
            alert("请输入1-${page.pageCount}的页码数");
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

    //  function Daochu_Select(){
    //    var select_id = '';
    //    var select = document.getElementsByName("checkbox_one");
    //    for (var i = 0; i < select.length; i++) {
    //      if(select[i].checked == true){
    //        select_id = select_id+select[i].id +',';
    //      }
    //    }
    //    if(select_id == ''){
    //      alert('请选择数据！');
    //      return
    //    }else{
    //      if(confirm("确定要导出所选择的信息吗？")){
    //        $.ajax({
    //          url:"/emp/daochuAll.do",
    //          data:{"ids":select_id},
    //          type:"POST",
    //          success:function(_data){
    //            var data = $.parseJSON(_data);
    //            if(data.success){
    //              window.location.href = "/upload"+data.data ;//这样就可以弹出下载对话框了
    //            }else{
    //              var _case = {1:"导出失败"};
    //              alert(_case[data.code])
    //            }
    //          }
    //        });
    //      }
    //    }
    //
    //  }

</script>


