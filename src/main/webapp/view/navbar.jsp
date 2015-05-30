<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
  String path = request.getContextPath();
  String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<html>
<head>
    <base href="<%=basePath%>">
    <link rel="stylesheet" href="static/css/bootstrap.css"/>
    <link rel="stylesheet" href="static/css/uploadify.css"/>
    <script type="text/javascript" src="static/js/jquery-2.1.3.min.js"></script>
    <script type="text/javascript" src="static/js/jquery.uploadify.min.js"></script>
    <script type="text/javascript" src="static/js/bootstrap.js"></script>
    <style type="text/css">
      .accountInfo {
        margin-top: 10px;
      }
      .accountInfoIconImg {
        float: left;
      }
      .accountInfoIconImg img {
        width:30px;
        height:30px;
      }
      .accountInfoIconL {
        float: left;
        margin-top: 6px;
        margin-left: 20px;
      }
      .accountInfoIconR {
        float: left;
        margin: 6px 20px 0 7px;
      }
    </style>
</head>
<body>

    <nav class="navbar navbar-default">
      <div class="container-fluid">
        <div class="navbar-header">
          <a class="navbar-brand" href="#">
            <img alt="Brand" src="static/image/sys/logo.png" style="width:95px;margin-right:20px;margin-left: 20px;">
          </a>
        </div>
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="#">PinEnjoy</a>
        </div>
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
          <ul class="nav navbar-nav">
            <li class="active"><a href="#">首页 <span class="sr-only">(current)</span></a></li>
            <li><a href="#">推荐</a></li>
            <li class="dropdown">
              <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">更多 <span class="caret"></span></a>
              <ul class="dropdown-menu" role="menu">
                <li><a href="#">发现</a></li>
                <li><a href="#"></a></li>
                <li><a href="#">广场</a></li>
                <li class="divider"></li>
                <li><a href="#">关于</a></li>
              </ul>
            </li>
          </ul>
          <form class="navbar-form navbar-left" role="search" action="search" method="get">
            <div class="form-group">
              <input type="text" class="form-control" placeholder="Search" name="searchContent">
              <c:if test="${currentAccount != null }">
                <input hidden="hidden" type="text" value="${currentAccount.accountId }" name="accountId">
              </c:if>
            </div>
            <button type="submit" class="btn btn-default">搜索</button>
          </form>
          <ul class="nav navbar-nav navbar-right">
            <c:choose>
              <c:when test="${currentAccount != null }">
                <div class="navbar-header ">
                  <div class="accountInfo">
                    <div class="accountInfoIconImg">
                      <img alt="${currentAccount.accountNickname }" src="${currentAccount.accountThumb }">
                    </div>
                    <div class="accountInfoIconL">
                      <a href="home/${currentAccount.accountId }"><span class="glyphicon glyphicon-home" aria-hidden="true"></span></a>
                    </div>
                    <div class="accountInfoIconR">
                      <a href="#" data-toggle="modal" data-target="#editProfile"><span class="glyphicon glyphicon-cog" aria-hidden="true"></span></a>
                    </div>
                  </div>
                  <div style="clear: both;"></div>
                </div>
                <li class="dropdown">
                  <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">我的 <span class="caret"></span></a>
                  <ul class="dropdown-menu" role="menu">
                    <li><a href="#">---</a></li>
                    <li><a href="#">---</a></li>
                    <li><a href="#">---</a></li>
                    <li class="divider"></li>
                    <li><a href="logout">注销</a></li>
                  </ul>
                </li>
              </c:when>
              <c:otherwise>
                <li style="margin-right:15px;"><button type="button" class="btn btn-default navbar-btn" onclick="location.href='login'"> 登录</button></li>
                <li><button type="button" class="btn btn-default navbar-btn" onclick="location.href='register'"> 注册</button>
              </c:otherwise>
            </c:choose>
          </ul>
        </div>
      </div>
    </nav>

    <div class="modal fade" id="editProfile" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
            <h4 class="modal-title" id="myModalLabel">修改用户信息</h4>
            <input hidden="hidden" type="text" value="${currentAccount.accountNickname }" id="accountNicknameInfo">
          </div>
          <div class="modal-body">
            <div class="input-group">
              <span class="input-group-addon" id="basic-addon1">昵称</span>
              <input type="text" class="form-control" placeholder="用户名" aria-describedby="basic-addon1" id="newNickname">
            </div>
            <div class="form-group" id="thumbImageInfo">
              <label for="thumbImage">选择图片</label>
              <input type="file" id="thumbImage">
              <p class="help-block">请选择要上传的图片作为头像</p>
            </div>
            <div class="input-group">
              <span class="input-group-addon">邮箱</span>
              <input type="text" class="form-control" placeholder="邮箱" aria-describedby="basic-addon1" id="newEmail">
            </div>
            <div class="input-group">
              <span class="input-group-addon">密码</span>
              <input type="text" class="form-control" placeholder="密码" aria-describedby="basic-addon1" id="newPassword">
            </div>
            <div class="input-group">
              <label for="newSex" class="col-sm-2 control-label">性别</label>
              <div class="col-sm-10" id="newSex">
                <input type="radio" name="newSex" value="男">男
                <input type="radio" name="newSex" value="女">女
                <input type="radio" name="newSex" value="保密">保密
              </div>
            </div>
            <div class="input-group">
              <span class="input-group-addon">签名</span>
              <input type="text" class="form-control" placeholder="个人简介" aria-describedby="basic-addon1" id="newLabel">
            </div>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-primary" onclick="$('#thumbImage').uploadify('upload','*')">
                保存图像
            </button>
            <button type="button" class="btn btn-primary" id="toEditProfile">保存修改</button>
          </div>
        </div>
      </div>
    </div>

    <jsp:include page="uploadImage.jsp"/>

    <script type="text/javascript">
      var currentAccountNickname = $('#accountNicknameInfo').val();

      $('toEditProfile').click(function () {
        $.post('account/' + currentAccountNickname + '/editProfile', {
          'accountNickname' : $('#newNickname').val(),
          'accountEmail' : $('#newEmail').val(),
          'accountSex' : $('input[name="newSex"]:checked').val(),
          'accountPassword' : $('#newPassword').val(),
          'accountResume' : $('#newLabel').val()
        }, function (data) {
         alert(data);
        });
      });

      $(function() {
        $("#thumbImage").uploadify({
          'uploader' : '<%=basePath%>/account/' + currentAccountNickname + '/editThumb',
          'height' : 27,
          'width' : 50,
          'buttonText' : '头像',
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
           },
          'onUploadSuccess' : function(file, data, response) {
            alert(data + "----" + response);
          }
        });
      });
    </script>

</body>
</html>
