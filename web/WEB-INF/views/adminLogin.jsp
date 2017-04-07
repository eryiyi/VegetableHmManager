<%@ page contentType="text/html;charset=UTF-8" language="java" trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html lang="zh_CH">
<head>
    <meta charset="utf-8">
    <title>蔬菜通后台登陆</title>
    <meta name="description" content="description">
    <meta name="author" content="Evgeniya">
    <meta name="keyword" content="keywords">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0"/>
    <%--<meta name="viewport" content="width=device-width, initial-scale=1">--%>
    <link href="/plugins/bootstrap/bootstrap.css" rel="stylesheet">
    <%--<link href="http://netdna.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.css" rel="stylesheet">--%>
    <%--<link href="/css/style_v2.css" rel="stylesheet">--%>
    <script src="/plugins/jquery/jquery.min.js"></script>
    <script src="/js/md5.js"></script>
    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
            <script src="http://getbootstrap.com/docs-assets/js/html5shiv.js"></script>
            <script src="http://getbootstrap.com/docs-assets/js/respond.min.js"></script>
    <![endif]-->
    <%--</head>--%>
    <%--<body>--%>
    <%--<div class="container-fluid">--%>
    <%--<div id="page-login" class="row">--%>
    <%--<div class="col-xs-12 col-md-4 col-md-offset-4 col-sm-6 col-sm-offset-3">--%>
    <%--<div class="box">--%>
    <%--<div class="box-content">--%>
    <%--<div class="text-center">--%>
    <%--<h3 class="page-header">蔬菜通后台登陆</h3>--%>
    <%--</div>--%>
    <%--<div class="form-group">--%>
    <%--<label class="control-label">用户名</label>--%>
    <%--<input type="text" id="username" class="form-control" name="username" />--%>
    <%--</div>--%>
    <%--<div class="form-group">--%>
    <%--<label class="control-label">密码</label>--%>
    <%--<input type="password" id="password" class="form-control" name="password" />--%>
    <%--</div>--%>
    <%--<div class="text-center">--%>
    <%--<input type="button" onclick="login();" value="登陆"/>--%>
    <%--</div>--%>
    <%--</div>--%>
    <%--</div>--%>
    <%--</div>--%>
    <%--</div>--%>
    <%--</div>--%>

    <style type="text/css">
        html {
            height: 100%;
            background: url(/img/devoops_getdata.gif) no-repeat;
            background-size: cover;
        }

        body {
            background-color: transparent;
        }

        .box {
            font-family: "Microsoft Yahei";
            border: 1px solid #eee;
            background-color: #fff;
            padding: 2rem 3rem;
            margin-top: 8rem;
            border-radius: 1rem;
        }

        .space {
            display: block;
            height: 2rem;
        }
    </style>
</head>
<body>
<div class="container-fluid">
    <div id="page-login" class="row">
        <div class="col-xs-12 col-md-4 col-md-offset-4 col-sm-6 col-sm-offset-3">
            <div class="box">
                <form>
                <div class="box-content">
                    <div class="text-center">
                        <h3>蔬菜通后台登陆</h3>
                    </div>
                    <div class="space"></div>
                    <div class="form-group">
                        <label for="username" class="sr-only">用户名</label>

                        <div class="input-group">
                            <span class="input-group-addon">用户名</span>
                            <input type="text" class="form-control" id="username" placeholder="">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="password" class="sr-only">密　码</label>

                        <div class="input-group">
                            <span class="input-group-addon">密　码</span>
                            <input type="password" class="form-control" id="password" placeholder="">
                        </div>
                    </div>
                    <div class="space"></div>
                    <div class="row">
                        <div class="col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2">
                            <button type="submit" class="btn btn-success btn-block" onclick="login();">登陆</button>
                        </div>
                    </div>

                </div>
                </form>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
    function login() {
        var username = $("#username").val();
        var password = $("#password").val();
        if (username.replace(/\s/g, '') == '') {
            alert("用户名不能为空");
            return;
        }
        if (password.replace(/\s/g, '') == '') {
            alert("密码不能为空");
            return;
        }
        var passwordCode = hex_md5(password);
        $.ajax({
            cache: true,
            type: "POST",
            url: "/adminLogin.do",
            data: {"username": username, "password": passwordCode},
            async: false,
            success: function (_data) {
                var data = $.parseJSON(_data);
//                alert(data);
                if (data.success) {
                    window.location.href = "/main.do";
                } else {
                    var _case = {1: "用户名不能为空", 2: "密码不能为空", 3: "该用户不存在", 4: "密码不正确", 5: "登陆失败", 6: "您的账号没有权限，请联系管理员"};
                    alert(_case[data.code])
                }
            }
        });
    }
</script>
</body>
</html>
