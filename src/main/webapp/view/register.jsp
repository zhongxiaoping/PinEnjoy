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
    <script type="text/javascript" src="static/js/messages_cn.js"></script>
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
              <input type="text" class="form-control" id="_accountNickname" placeholder="用户名">
            </div>
            <input type="hidden" id="_sessionId" value="${pageContext.session.id}"/>
          </div>
          <div class="form-group">
            <label for="_thumb" class="col-sm-2 control-label">上传头像</label>
            <div class="col-sm-10">
              <input type="file" id="_thumb">
              <p class="help-block">选择图片作为你的头像</p>
            </div>
          </div>
          <div class="form-group">
            <label for="_accountPassword" class="col-sm-2 control-label">密码</label>
            <div class="col-sm-10">
              <input type="password" class="form-control" id="_accountPassword">
            </div>
          </div>
          <div class="form-group">
            <label for="_confirm_password" class="col-sm-2 control-label">确认密码</label>
            <div class="col-sm-10">
              <input type="password" class="form-control" id="_confirm_password" placeholder="确认密码">
            </div>
          </div>
          <div class="form-group">
            <label for="_accountEmail" class="col-sm-2 control-label">邮箱</label>
            <div class="col-sm-10">
              <input type="email" class="form-control" id="_accountEmail" placeholder="邮箱">
            </div>
          </div>
          <div class="form-group calendar">
            <label for="_accountBirthday" class="col-sm-2 control-label">出生日</label>
            <div class="col-sm-10">
              <input type="text" class="laydate-icon" id="_accountBirthday" value="1993-6-30">
            </div>
          </div>
          <div class="form-group">
            <label for="_accountSex" class="col-sm-2 control-label">性别</label>
            <div class="col-sm-10">
              <input type="radio" name="accountSex" id="_accountSex" value="男">男
              <input type="radio" name="accountSex" value="女">女
              <input type="radio" name="accountSex" value="保密">保密
            </div>
          </div>
          <div class="form-group">
            <label for="_accountResume" class="col-sm-2 control-label">自我介绍</label>
            <div class="col-sm-10">
              <textarea class="form-control" rows="3" id="_accountResume"></textarea>
            </div>
          </div>
          <div class="form-group" style="text-align: center;">
            <button type="button" class="btn btn-primary" onclick="$('#_thumb').uploadify('upload','*')">
              提交
            </button>
          </div>
        </form>
      </div>
    </div>

    <jsp:include page="bottom.jsp"/>

    <script type="text/javascript">
      !function() {
        laydate.skin('yahui');
        laydate({elem: '#_accountBirthday'});
      }();

      /*$('#_register').on('click', function () {
        var $btn = $(this).button('loading');
        $btn.button('reset')
      });*/

      $(function() {
        $("#_thumb").uploadify({
          'uploader' : 'register',
          'height' : 27,
          'width' : 50,
          'buttonText' : '浏 览',
          'buttonCursor' : 'hand',
          'auto' : false,
          'multi' : false,
          'method' : 'post',
          'swf' : 'static/js/uploadify.swf',
          'cancelImg' : 'static/image/sys/close.jpg',
          'fileTypeDesc' : 'jpg、png、gif、bmp',
          'fileTypeExts' : '*.jpg;*.png;*.gif;*.bmp;*.doc;*.txt',
          'fileSizeLimit' : '50MB',
          'fileObjName' : 'thumbFile',
          'progressData' : 'all',
          'preventCaching' : true,
          'timeoutuploadLimit' : 1,
          'removeCompleted' : true,
          'removeTimeout' : 3,
          'requeueErrors' : true,
          'successTimeout' : 30,
          'uploadLimit' : 999,
          'onUploadStart' : function(file) {
            var accountNickname = $('#_accountNickname').val(),
                accountEmail = $('#_accountEmail').val(),
                accountPassword = $('#_accountPassword').val(),
                jsessionid = $('#_sessionId').val(),
                accountSex = $("input[name='accountSex']:checked").val(),
                accountResume = $('#_accountResume').val(),
                accountBirthday = $('#_accountBirthday').val();
            alert(accountNickname);

            $('#_thumb').uploadify("settings", "formData", {
              'accountNickname' : accountNickname,
              'accountEmail': accountEmail,
              'jsessionid' : jsessionid,
              'accountSex' : accountSex,
              'accountResume': accountResume,
              'accountBirthday': accountBirthday,
              'accountPassword' : accountPassword
            });
          },
          'onUploadSuccess' : function(file, data, response) {
            //alert(file.name + " upload success !");
            alert(data + "----" + response);
            if (response == "success") {
              location.href = "login";
            }
          }
        });

        $.validator.setDefaults({
          submitHandler: function(form) {
            form.submit();
          }
        }),

        $("#_signup").validate({
          rules: {
            _accountNickname: {
              required: true,
              stringCheck: true,
              byteRangeLength: [4, 15]
            },
            _accountPassword: {
              required: true,
              minlength: 6,
              maxlength: 24
            },
            _confirm_password: {
              required: true,
              minlength: 5,
              equalTo: "#_accountPassword"
            },
            _accountEmail: {
              required: true,
              email: true
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
              e.html('').addClass("");
            }
          }
        });

        jQuery.validator.addMethod("stringCheck", function(value, element) {//字符验证
          return this.optional(element) || /^[\u0391-\uFFE5\w]+$/.test(value);
        }, "只能包括中文字、英文字母、数字和下划线");

        jQuery.validator.addMethod("byteRangeLength", function(value, element, param) {//中文字两个字节
          var length = value.length;
          for (var i = 0; i < value.length; i++) {
            if (value.charCodeAt(i) > 127){
              length++;
            }
          }
          return this.optional(element) || ( length >= param[0] && length <= param[1] );
        }, "请确保输入的值在4-15个字节之间(一个中文字算2个字节)");
      });
    </script>

</body>
</html>
