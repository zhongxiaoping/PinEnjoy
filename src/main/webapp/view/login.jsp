<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
  String path = request.getContextPath();
  String basePath = request.getScheme() + "://"+request.getServerName()+":" + request.getServerPort() + path + "/";
%>
<html>
<head>
    <base href="<%=basePath%>">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="shortcut icon" type="image/x-icon" href="static/image/sys/thumb.png"/>
    <link rel="stylesheet" href="static/css/bootstrap.css"/>
    <script type="text/javascript" src="static/js/jquery-2.1.3.min.js"></script>
    <script type="text/javascript" src="static/js/bootstrap.js"></script>
    <title>登录页</title>
    <style type="text/css">
        .main {
            width:40%;
            margin-top: 90px;
            margin-bottom: 70px;
            margin-left: 400px;
        }
        .main ._content {
            text-align: center;
            padding-bottom: 30px;
        }
    </style>
</head>
<body>

    <jsp:include page="navbar.jsp"/>

    <div class="main">
        <div class="_content">
            <h2>登陆PinEnjoy</h2>
            <p>东半球最好的图片社交网站！</p>
        </div>
        <div>
            <form id="signup" class="form-horizontal" method="post" action="/login">
                <div class="form-group">
                    <label for="id" class="col-sm-2 control-label">用户名</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" id="id" placeholder="用户名">
                    </div>
                </div>
                <div class="form-group">
                    <label for="password" class="col-sm-2 control-label">密码</label>
                    <div class="col-sm-10">
                        <input type="password" class="form-control" id="password" placeholder="密码">
                    </div>
                </div>
                <div class="form-group" style="text-align: center;">
                    <button type="submit" class="btn btn-primary">
                        登陆
                    </button>
                </div>
            </form>
        </div>
    </div>

    <jsp:include page="bottom.jsp"/>

</body>
</html>
