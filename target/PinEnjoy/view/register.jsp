<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
  String path = request.getContextPath();
  String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<html>
<head>
    <base href="<%=basePath%>">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="shortcut icon" type="image/x-icon" href="static/image/sys/thumb.png"/>
    <link rel="stylesheet" href="static/css/uploadify.css"/>
    <link rel="stylesheet" href="static/calendar/css/style.css"/>
    <link rel="stylesheet" href="static/css/bootstrap.css"/>
    <script type="text/javascript" src="static/js/jquery-2.1.3.min.js"></script>
    <script type="text/javascript" src="static/js/jquery.validate.js"></script>
    <script type="text/javascript" src="static/js/jquery.uploadify.min.js"></script>
    <script type="text/javascript" src="static/js/bootstrap.js"></script>
    <script type="text/javascript" src="static/calendar/laydate/laydate.js"></script>
    <title>注册页</title>
    <style type="text/css">
      .main {
        width:40%;
        margin-top: 45px;
      }
      .main .content {
        margin-bottom: 20px;
        text-align: center;
      }
      .calendar {
        text-align: center;
      }
    </style>
</head>
<body>

    <jsp:include page="navbar.jsp"/>

    <div class="main">
      <div class="content">
        <h2>加入PinEnjoy</h2>
        <p>东半球最好的图片社交网站！</p>
      </div>
      <div>
        <form id="_signup" class="form-horizontal">
          <div class="form-group">
            <label for="_accountNickname" class="col-sm-2 control-label">用户名</label>
            <div class="col-sm-10">
              <input type="text" class="form-control" id="_accountNickname" name="_accountNickname" placeholder="用户名">
            </div>
            <input type="hidden" id="_sessionId" value="${pageContext.session.id}"/>
          </div>
          <div class="form-group">
            <label for="_thumbImage" class="col-sm-2 control-label">上传头像</label>
            <div class="col-sm-10">
              <input type="file" id="_thumbImage" name="_thumbImage">
              <p class="help-block">选择图片作为你的头像</p>
            </div>
          </div>
          <div class="form-group">
            <label for="_accountPassword" class="col-sm-2 control-label">密码</label>
            <div class="col-sm-10">
              <input type="password" class="form-control" id="_accountPassword" name="_accountPassword">
            </div>
          </div>
          <div class="form-group">
            <label for="_confirm_password" class="col-sm-2 control-label">确认密码</label>
            <div class="col-sm-10">
              <input type="password" class="form-control" id="_confirm_password" name="_confirm_password" placeholder="确认密码">
            </div>
          </div>
          <div class="form-group">
            <label for="_accountEmail" class="col-sm-2 control-label">邮箱</label>
            <div class="col-sm-10">
              <input type="email" class="form-control" id="_accountEmail" name="_accountEmail" placeholder="邮箱">
            </div>
          </div>
          <div class="form-group calendar">
            <label for="_accountBirthday" class="col-sm-2 control-label">出生日</label>
            <div class="col-sm-10">
              <input type="text" class="laydate-icon" id="_accountBirthday" name="_accountBirthday" value="1993-6-30">
            </div>
          </div>
          <div class="form-group">
            <label for="_accountSex" class="col-sm-2 control-label">性别</label>
            <div class="col-sm-10" id="_accountSex">
              <input type="radio" name="accountSex" name="_accountSex" value="男">男
              <input type="radio" name="accountSex" name="_accountSex" value="女">女
              <input type="radio" name="accountSex" name="_accountSex" value="保密">保密
            </div>
          </div>
          <div class="form-group">
            <label for="_accountResume" class="col-sm-2 control-label">自我介绍</label>
            <div class="col-sm-10">
              <textarea class="form-control" rows="3" id="_accountResume" name="_accountResume"></textarea>
            </div>
          </div>
          <div class="form-group" style="text-align: center;">
            <button type="button" class="btn btn-primary" onclick="$('#_thumbImage').uploadify('upload','*')" id="_register">
              提交
            </button>
          </div>
        </form>
      </div>
    </div>

    <jsp:include page="common.jsp"/>
    <jsp:include page="bottom.jsp"/>

    <script type="text/javascript">
      $('#_register').on('click', function () {
        var $btn = $(this).button('注册中');
        $btn.button('reset')
      });

      !function() {
        laydate.skin('yahui');
        laydate({elem: '#_accountBirthday'});
      }();
    </script>

</body>
</html>
