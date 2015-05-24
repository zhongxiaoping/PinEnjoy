<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%
  String path = request.getContextPath();
  String basePath = request.getScheme() + "://" + request.getServerName()+":" + request.getServerPort() + path + "/";
%>
<html>
<head>
    <base href="<%=basePath%>">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="shortcut icon" type="image/x-icon" href="static/image/sys/thumb.png"/>
    <script type="text/javascript" src="static/js/jquery-2.1.3.min.js"></script>
    <script type="text/javascript" src="static/js/jquery.validate.js"></script>
    <script type="text/javascript" src="static/js/messages_zh.js"></script>
    <link href="static/css/register.css" rel='stylesheet' type='text/css'/>
    <link href="static/css/reset.css" rel='stylesheet' type='text/css'/>
    <title>注册页</title>
    <script type="text/javascript">
      $(document).ready(function() {
        $.validator.setDefaults({
          submitHandler: function(form) {
            form.submit();
          }
        }),

        $("#signup").validate({
          rules: {
            username: {
              required: true,
              stringCheck: true,
              byteRangeLength: [4, 15]
            },
            password: {
              required: true,
              minlength: 6,
              maxlength: 24
            },
            confirm_password: {
              required: true,
              minlength: 5,
              equalTo: "#password"
            },
            email: {
              required: true,
              email: true
            },
            read: {
              required: true
            },
            messages: {
              read: {
                required: "请先阅读注册条约"
              }
            },
            errorElement: "em",//设置错误信息存放标签
            errorPlacement: function (error, element) {//指定错误信息位置
              if (element.is(':radio') || element.is(':checkbox')) {
                var eid = element.attr('name');
                error.appendTo(element.parent());
              } else {
                error.appendTo(element.closest("p"));
              }
            },
            focusInvalid: true,//设置验证触发事件
            success: function (e) {//设置验证成功提示格式
              e.html("&nbsp;").addClass("valid").text("可以");
            }
          }
        })
    });

    jQuery.validator.addMethod("stringCheck", function(value, element) {//字符验证
      return this.optional(element) || /^[\u0391-\uFFE5\w]+$/.test(value);
    }, "只能包括中文字、英文字母、数字和下划线");

    jQuery.validator.addMethod("byteRangeLength", function(value, element, param) {//中文字两个字节
      var length = value.length;
      for(var i = 0; i < value.length; i++){
        if(value.charCodeAt(i) > 127){
          length++;
        }
      }
      return this.optional(element) || ( length >= param[0] && length <= param[1] );
    }, "请确保输入的值在4-15个字节之间(一个中文字算2个字节)");
    </script>
</head>
<body>

  <jsp:useBean id="account" class="com.tianex.pinenjoy.domain.Account" scope="request" />

  <div class="content">
    <div class="main">
      <div class="user">
        <img src="static/image/sys/portrait.png">
      </div>
      <div class="login">
        <div class="inset">
          <form:form method="post" modelAttribute="account" id="signup">
            <p>
              <span><label for="username">用户名</label></span>
              <span><form:input path="accountNickname" id="username" name="username"/></span>
            </p>
            <p>
              <span><label for="password">密码</label></span>
              <span><form:password path="accountPassword" id="password" name="password"/></span>
            </p>
            <p>
              <span><label for="confirm_password">确认密码</label></span>
              <span><input type="password" id="confirm_password" name="confirm_password"/></span>
            </p>
            <p>
              <span><label for="email">邮箱</label></span>
              <span><form:input path="accountEmail" id="email" name="email"/></span>
            </p>
            <p>
              <label for="accountSex">性别：</label>
              <form:radiobutton path="accountSex" value="男"/>男
              <form:radiobutton path="accountSex" value="女"/>女
              <form:radiobutton path="accountSex" value="?"/>保密
            </p>
            <p>
              <label for="introduction">自我介绍</label>
              <form:textarea path="accountResume" id="introduction"/>
            </p>
            <p>
              <label for="read">已阅读用户手册</label>
              <input id="read" name="read" type="checkbox" />
            </p>
            <p>
              <input class="submit" type="submit" value="注册"/>
            </p>
          </form:form>
        </div>
      </div>
    </div>
  </div>

</body>
</html>
