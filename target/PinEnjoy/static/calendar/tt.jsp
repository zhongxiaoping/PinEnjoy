<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 2015/5/24
  Time: 13:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
</head>
<body>
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
