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
    <link href="static/css/login.css" rel='stylesheet' type='text/css'/>
    <link href="static/css/reset.css" rel='stylesheet' type='text/css'/>
    <title>登录页</title>
</head>
<body>

    <div class="content">
      <div class="main">
        <div class="user">
          <img src="static/image/sys/portrait.png">
        </div>
        <div class="login">
          <div class="inset">
            <form action="login" method="post">
              <c:if test="${errorMsg }">
                <div>
                  <p>${errorMsg }</p>
                </div>
              </c:if>
              <div>
                <span><label>用户ID</label></span>
                <span><input type="text" class="textbox" placeholder="用户名或邮箱" name="id"></span>
              </div>
              <div>
                <span><label>密码</label></span>
                <span><input type="password" class="password" placeholder="密码" name="password"></span>
              </div>
              <div class="sign">
                <div class="submit">
                  <input type="submit" value="提交">
                </div>
				<span class="forget-pass">
				  <a href="register">还未注册？</a>
				</span>
                <div class="clear"></div>
              </div>
            </form>
          </div>
        </div>
      </div>
    </div>

</body>
</html>
