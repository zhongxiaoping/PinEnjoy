<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
  String path = request.getContextPath();
  String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<html>
<head>

    <link rel="stylesheet" href="../static/css/bootstrap.css"/>
    <script type="text/javascript" src="../static/js/jquery-2.1.3.min.js"></script>
    <script type="text/javascript" src="../static/js/bootstrap.js"></script>
</head>
<body>

    <nav class="navbar navbar-default">
      <div class="container-fluid">
        <div class="navbar-header">
          <c:choose>
            <c:when test="${previousPath != null }">
              <button type="button" class="btn btn-default btn-lg" style="height:50px;margin-right:100px;border:none;">
                <span></span> 返回
              </button>
            </c:when>
            <c:otherwise>
              <a class="navbar-brand" href="#">
                <img alt="Brand" src="static/image/sys/logo.png" style="width:95px;margin-right:20px;margin-left: 20px;">
              </a>
            </c:otherwise>
          </c:choose>

        </div>
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="#">Ping</a>
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
                <c:forEach var="cataloge" items="${cataloges }">
                  <li><a href="#">cataloge.catalogeName</a></li>
                </c:forEach>
                <li class="divider"></li>
                <li><a href="#">关于</a></li>
              </ul>
            </li>
          </ul>
          <form class="navbar-form navbar-left" role="search" action="search" method="get">
            <div class="form-group">
              <input type="text" class="form-control" placeholder="Search" name="searchContent">
            </div>
            <button type="submit" class="btn btn-default">搜索</button>
          </form>
          <ul class="nav navbar-nav navbar-right">
            <c:if test="${sumOfSearch != null }">
              <li><a href="#">找到约 ${sumOfSearch } 条结果 </a></li>
            </c:if>
            <c:choose>
            <c:when test="${currentAccount != null }">
              <div class="navbar-header">
                <a class="navbar-brand" href="home/${currentAccount.accountId }">
                  <img alt="${currentAccount.username }" src="${currentAccount.thumb }">
                </a>
              </div>
              <li class="dropdown">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">Dropdown <span class="caret"></span></a>
                <ul class="dropdown-menu" role="menu">
                  <li><a href="#">Action</a></li>
                  <li><a href="#">Another action</a></li>
                  <li><a href="#">Something else here</a></li>
                  <li class="divider"></li>
                  <li><a href="#">Separated link</a></li>
                </ul>
              </li>
            </c:when>
            <c:otherwise>
            <li style="margin-right:15px;"><button type="button" class="btn btn-default navbar-btn" onclick="location.href='login'"> 登录</button></li>
            <li><button type="button" class="btn btn-default navbar-btn" onclick="location.href='account/register'"> 注册</button>
              </c:otherwise>
              </c:choose>
          </ul>
        </div>
      </div>
    </nav>

</body>
</html>
