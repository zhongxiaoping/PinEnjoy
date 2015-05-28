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
  <link rel="stylesheet" href="static/css/uploadify.css"/>
  <script type="text/javascript" src="static/js/jquery-2.1.3.min.js"></script>
  <script type="text/javascript" src="static/js/jquery.validate.js"></script>
  <script type="text/javascript" src="static/js/messages_cn.js"></script>
  <script type="text/javascript" src="static/js/jquery.uploadify.min.js"></script>
</head>
<body>

    <script type="text/javascript">
      $(function() {
        $("#_thumbImage").uploadify({
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

            $('#_thumbImage').uploadify("settings", "formData", {
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
              alert("注册成功");
              location.href = "login";

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
            _thumbImage: {
              required: true
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

         $.validator.addMethod("stringCheck", function(value, element) {//字符验证
            return this.optional(element) || /^[\u0391-\uFFE5\w]+$/.test(value);
         }, "只能包括中文字、英文字母、数字和下划线");

         $.validator.addMethod("byteRangeLength", function(value, element, param) {//中文字两个字节
            var length = value.length;
            for (var i = 0; i < value.length; i++) {
              if (value.charCodeAt(i) > 127) {
                length++;
              }
            }
            return this.optional(element) || ( length >= param[0] && length <= param[1] );
         }, "请确保输入的值在4-15个字节之间(一个中文字算2个字节)");

      });
    </script>

</body>
</html>
