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
            <li><a href="javascript:void(0)">活跃度统计</a></li>
            <li><a href="javascript:void(0)">登录次数统计</a></li>
        </ol>

    </div>
</div>

<div class="row">
    <div class="col-xs-12 col-sm-12">
        <div class="box ui-draggable ui-droppable">
            <div class="box-header">
                <div class="box-name ui-draggable-handle">
                    <i class="fa fa-table"></i>
                    <span>登录次数统计</span>
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
                <style>
                    .w12 {
                        max-width: 12rem;
                    }
                </style>
                <form class="form-inline">
                    <div class="form-group">
                        <select class="form-control w12" id="mm_emp_provinceId" onchange="selectCitys()">
                            <option value="">--选择省份--</option>
                            <c:forEach items="${listProvinces}" var="e" varStatus="st">
                                <option value="${e.provinceID}" ${query.mm_emp_provinceId == e.provinceID?'selected':''}>${e.province}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="form-group">
                        <select class="form-control w12" id="mm_emp_cityId" onchange="selectCountrys()">
                            <option value="">--选择城市--</option>
                            <c:forEach items="${listCitys}" var="e" varStatus="st">
                                <option value="${e.cityID}" ${query.mm_emp_cityId == e.cityID?'selected':''}>${e.city}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="form-group">
                        <select class="form-control w12" id="mm_emp_countryId" onchange="selectArea()">
                            <option value="">--选择县区--</option>
                            <c:forEach items="${listsCountry}" var="e" varStatus="st">
                                <option value="${e.areaID}" ${query.mm_emp_countryId == e.areaID?'selected':''}>${e.area}</option>
                            </c:forEach>
                        </select>
                    </div>

                    <div class="form-group">
                        <button type="submit" onclick="searchOrder('1')"
                                class="btn form-control btn-warning btn-sm btn-block">查找
                        </button>
                    </div>
                </form>

                <table class="table table-hover">
                    <thead>
                    <tr>
                        <th>姓名</th>
                        <th>电话</th>
                        <th>公司名称</th>
                        <th>所属地区</th>
                        <th>诚信</th>
                        <th>协会</th>
                        <th>星级</th>
                        <th>到期时间</th>
                        <th>允许登陆</th>
                        <th>发布供应</th>
                        <th>发布求购</th>
                        <th>登录次数</th>
                        <th>备注</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${list}" var="e" varStatus="st">
                        <tr>
                            <td><a href="#module=/emp/detail&mm_emp_id=${e.mm_emp_id}">${e.mm_emp_nickname}</a></td>

                            <td>${e.mm_emp_mobile}</td>
                            <td>${e.mm_emp_company}</td>
                            <td>${e.provinceName}${e.cityName}${e.areaName}</td>
                            <td>
                                <c:if test="${e.is_chengxin=='0'}">否</c:if>
                                <c:if test="${e.is_chengxin=='1'}">是</c:if>
                            </td>
                            <td>
                                <c:if test="${e.is_miaomu=='0'}">否</c:if>
                                <c:if test="${e.is_miaomu=='1'}">是</c:if>
                            </td>
                            <td>${e.levelName}</td>

                                <%--<c:if test="${e.is_dq=='0'}"><td>无</td></c:if>--%>

                            <td>
                                <c:if test="${e.is_dq=='1'}"><font color="red">${e.mm_emp_endtime}</font></c:if>
                                <c:if test="${e.is_dq=='0'}">${e.mm_emp_endtime}</c:if>
                            </td>

                            <td>
                                <c:if test="${e.is_login=='0'}">是</c:if>
                                <c:if test="${e.is_login=='1'}">否</c:if>
                            </td>
                            <td>
                                <c:if test="${e.is_fabugongying=='0'}">不允许</c:if>
                                <c:if test="${e.is_fabugongying=='1'}">允许</c:if>
                            </td>
                            <td>
                                <c:if test="${e.is_fabuqiugou=='0'}">不允许</c:if>
                                <c:if test="${e.is_fabuqiugou=='1'}">允许</c:if>
                            </td>

                            <td>
                                    ${e.countLoginNum}
                            </td>
                            <td>${e.mm_emp_beizhu}</td>
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
        var province = $("#mm_emp_provinceId").val();
        var city = $("#mm_emp_cityId").val();
        var mm_emp_countryId = $("#mm_emp_countryId").val();
        if (_index <= ${page.pageCount} && _index >= 1) {
            alert("searchIndex");
            window.location.href = "#module=/emp/getEmpNum&page=" + _index + "&size=" + size
            + "&mm_emp_provinceId=" + province
            + "&mm_emp_cityId=" + city
            + "&mm_emp_countryId=" + mm_emp_countryId + "&_t=" + new Date().getTime();
        } else {
            alert("请输入1-${page.pageCount}的页码数");
        }
    }

    function nextPage(_page) {
        var page = parseInt(_page);
        var size = $("#size").val();
        var province = $("#mm_emp_provinceId").val();
        var city = $("#mm_emp_cityId").val();
        var mm_emp_countryId = $("#mm_emp_countryId").val();
        addCookie("contract_size", size, 36);
        if ((page <= ${page.pageCount} && page >= 1)) {
            window.location.href = "#module=/emp/getEmpNum&page=" + page + "&size=" + size
            + "&mm_emp_provinceId=" + province
            + "&mm_emp_cityId=" + city
            + "&mm_emp_countryId=" + mm_emp_countryId + "&_t=" + new Date().getTime();
        } else {
            alert("请输入1-${page.pageCount}的页码数");
        }
    }


    function searchOrder(_page) {
        var page = parseInt(_page);
        var size = $("#size").val();
        var province = $("#mm_emp_provinceId").val();
        var city = $("#mm_emp_cityId").val();
        var mm_emp_countryId = $("#mm_emp_countryId").val();

        addCookie("contract_size", size, 36);
        if ((page <= ${page.pageCount} && page >= 1)) {
            window.location.href = "#module=/emp/getEmpNum&page=" + page + "&size=" + size
            + "&mm_emp_provinceId=" + province
            + "&mm_emp_cityId=" + city
            + "&mm_emp_countryId=" + mm_emp_countryId + "&_t=" + new Date().getTime();
        } else {
            alert("请输入1-${page.pageCount}的页码数");
        }
    }

    function selectCitys() {
        var province = $("#mm_emp_provinceId").val();
        $.ajax({
            cache: true,
            type: "POST",
            url: "/getAllCitys.do",
            data: {
                "father": province
            },
            async: false,
            contentType: "application/x-www-form-urlencoded; charset=utf-8",
            success: function (_data) {
                var data = $.parseJSON(_data);
                if (data.success) {
                    <%--var citys = ${listCitysAll};--%>
                    var citys = data.data;
                    var ret = "<option value=''>" + '请选择城市' + "</option>";
                    for (var i = citys.length - 1; i >= 0; i--) {
                        if (citys[i].father == province) {
                            ret += "<option value='" + citys[i].cityID + "'>" + citys[i].city + "</option>";
                        }
                    }
                    $("#mm_emp_cityId").html(ret);
                } else {
                    var _case = {1: "获取数据失败"};
                    alert(_case[data.code])
                }
            }
        });
    }
    ;

    function selectCountrys() {
        var city = $("#mm_emp_cityId").val();
        $.ajax({
            cache: true,
            type: "POST",
            url: "/getAllCountrys.do",
            data: {
                "father": city
            },
            async: false,
            success: function (_data) {
                var data = $.parseJSON(_data);
                if (data.success) {
                    var countrys = data.data;
                    var ret = "<option value=''>" + '请选择县区' + "</option>";
                    for (var i = countrys.length - 1; i >= 0; i--) {
                        if (countrys[i].father == city) {
                            ret += "<option value='" + countrys[i].areaID + "'>" + countrys[i].area + "</option>";
                        }
                    }
                    $("#mm_emp_countryId").html(ret);
                } else {
                    var _case = {1: "获取数据失败"};
                    alert(_case[data.code])
                }
            }
        });
    }
    ;

    function selectArea() {
        var mm_emp_provinceId = $("#mm_emp_provinceId").val();
        var mm_emp_cityId = $("#mm_emp_cityId").val();
        var mm_emp_countryId = $("#mm_emp_countryId").val();
    }
    ;


</script>


