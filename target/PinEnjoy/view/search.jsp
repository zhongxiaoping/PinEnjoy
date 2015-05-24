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
    <link rel="stylesheet" href="static/css/flow.css"/>
    <link rel="stylesheet" href="static/css/bootstrap.css"/>
    <script type="text/javascript" src="static/js/jquery-2.1.3.min.js"></script>
    <script type="text/javascript" src="static/js/bootstrap.js"></script>
    <title>搜索页</title>
</head>
<body>

    <nav class="navbar navbar-default">
      <div class="container-fluid">
        <div class="navbar-header">
          <button type="button" class="btn btn-default btn-lg" style="height:50px;margin-right:100px;border:none;">
            <span></span> 返回
          </button>
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
            <li class="active"><a href="#">Link <span class="sr-only">(current)</span></a></li>
            <li><a href="#">Link</a></li>
            <li class="dropdown">
              <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">更多 <span class="caret"></span></a>
              <ul class="dropdown-menu" role="menu">
                <li><a href="#">Action</a></li>
                <li><a href="#">Another action</a></li>
                <li><a href="#">Something else here</a></li>
                <li class="divider"></li>
                <li><a href="#">Separated link</a></li>
                <li class="divider"></li>
                <li><a href="#">One more separated link</a></li>
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
                <li><img src="currentAccount.thumb" alt="currentAccount.username" class="img-thumbnail"></li>
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
                <li><button type="button" class="btn btn-default"> 登录</button></li>
              </c:otherwise>
            </c:choose>


          </ul>
        </div>
      </div>
    </nav>

    <div class="content">
      <div class="wrap">
        <div id="main" role="main">
          <ul id="tiles">
            <c:forEach items="${imagesOfSearch }" var="image">
              <li onclick="location.href='image/${image.imageId}/detail';">
                <img src="${image.location }" width="200" height="200">
                <div class="post-info">
                  <div class="post-basic-info">
                    <h3><a href="#">${image.title }</a></h3>
                    <span><a href="#"><label></label>${image.cataloge }</a></span>
                    <p>${image.describe }</p>
                  </div>
                  <div class="post-info-rate-share">
                    <div class="rateit">
                      <span></span>
                    </div>
                    <div class="download">
                      <a href="image/${image.imageId }/download"><span></span></a>
                    </div>
                    <div class="clear"></div>
                  </div>
                </div>
              </li>
            </c:forEach>
          </ul>
        </div>
      </div>
    </div>

    <script src="static/js/jquery.imagesloaded.js"></script>
    <script src="static/js/jquery.wookmark.js"></script>
    <script type="text/javascript">
      $(function() {
        var $tiles = $('#tiles'),
                $handler = $('li', $tiles),
                $main = $('#main'),
                $window = $(window),
                $document = $(document),
                options = {
                  autoResize: true,
                  container: $main,
                  offset: 20,
                  itemWidth:280
                };
        function applyLayout() {
          $tiles.imagesLoaded(function() {
            if ($handler.wookmarkInstance) {
              $handler.wookmarkInstance.clear();
            }
            $handler = $('li', $tiles);
            $handler.wookmark(options);
          });
        }
        function onScroll() {
          var winHeight = window.innerHeight ? window.innerHeight : $window.height(),
                  closeToBottom = ($window.scrollTop() + winHeight > $document.height() - 100);
          if (closeToBottom) {
            var $items = $('li', $tiles),
                    $firstTen = $items.slice(0, 10);
            $tiles.append($firstTen.clone());

            applyLayout();
          }
        };
        applyLayout();
        $window.bind('scroll.wookmark', onScroll);
      });
    </script>

</body>
</html>
