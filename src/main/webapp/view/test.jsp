<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%
  String path = request.getContextPath();
  String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<html>
<head>
    <base href="<%=basePath%>">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="shortcut icon" type="image/x-icon" href="static/image/sys/thumb.png"/>
    <link rel="stylesheet" type="text/css" href="static/calendar/css/style.css"/>
    <script type="text/javascript" src="static/js/jquery-2.1.3.min.js"></script>
    <script type="text/javascript" src="static/calendar/laydate/laydate.js"></script>
    <title>注册页</title>
    <style type="text/css">


    </style>
</head>
<body>

    <jsp:useBean id="account" class="com.tianex.pinenjoy.domain.Account" scope="request"/>

    <div class="main">
        <div class="content">
          <form:form method="post" modelAttribute="account" class="form-horizontal" id="signup">
            <div class="form-group">
              <label for="accountNickname" class="col-sm-2 control-label">用户名</label>
              <div class="col-sm-10">
                <form:input path="accountNickname" class="form-control" id="accountNickname"/>
              </div>
            </div>
            <div class="form-group">
              <label for="accountEmail" class="col-sm-2 control-label">邮箱</label>
              <div class="col-sm-10">
                <form:input path="accountEmail" class="form-control" id="accountEmail"/>
              </div>
            </div>
            <div class="form-group">
              <label for="accountPassword" class="col-sm-2 control-label">密码</label>
              <div class="col-sm-10">
                <form:input path="accountPassword" class="form-control" id="accountPassword"/>
              </div>
            </div>
            <div class="form-group">
              <label for="confirm_password" class="col-sm-2 control-label">确认密码</label>
              <div class="col-sm-10">
                <input class="form-control" id="confirm_password"/>
              </div>
            </div>
            <div class="form-group">
              <label for="accountResume" class="col-sm-2 control-label">签名</label>
              <div class="col-sm-10">
                <form:textarea path="accountResume" class="form-control" id="accountResume"/>
              </div>
            </div>
            <div class="form-group">
              <div class="col-sm-offset-2 col-sm-10">
                <div class="checkbox">
                  <label>
                    <input type="checkbox"> 记住我？
                  </label>
                </div>
              </div>
            </div>
            <div class="form-group">
              <div class="col-sm-offset-2 col-sm-10">
                <button type="submit" class="btn btn-default">注册</button>
              </div>
            </div>
          </form:form>
        </div>
    </div>

    <!--效果html开始-->
    <div class="box">
      <div class="demo1">
        <h3>演示二（普通模式）</h3>
        <input class="laydate-icon" id="demo" value="2014-6-25更新">

    </div>
    <script>
      !function(){
        laydate.skin('molv');
        laydate({elem: '#demo'});
      }();

    </script>
    <!--效果html结束-->



</body>
</html>
