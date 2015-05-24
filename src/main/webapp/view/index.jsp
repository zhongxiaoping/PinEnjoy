<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
  String path = request.getContextPath();
  String basePath = request.getScheme() + "://"+request.getServerName()+":" + request.getServerPort() + path + "/";
%>
<html>
<head>
    <base href="<%=basePath%>">
    <title>Ping</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="shortcut icon" type="image/x-icon" href="static/image/sys/thumb.png"/>
    <link rel="stylesheet" href="static/css/flow.css"/>
    <script type="text/javascript" src="static/js/jquery-2.1.3.min.js"></script>
    <script type="text/javascript" src="static/js/jquery.raty.min.js"></script>
</head>
<body>

  <jsp:include page="navbar.jsp"/>

  <div class="content">
    <div class="wrap">
      <div id="main" role="main">
        <ul id="tiles">
          <c:forEach items="${currentImages }" var="image">
            <li onclick="location.href='image/${image.imageId}/detail';">
              <img src="${image.imageLocation }" width="200" height="200">
              <div class="post-info">
                <div class="post-basic-info">
                  <h3><a href="#">${image.imageTitle }</a></h3>
                  <span><a href="#"><label></label>${image.imageCatalogeName }</a></span>
                  <p>${image.imageDescription }</p>
                </div>
                <div class="post-info-rate-share">
                  <div id="function_rate"></div>
                  <div class="download" style="float:right;padding-right:7px;padding-bottom:5px;">
                    <a href="image/${image.imageId }/download"><span></span></a>
                  </div>
                </div>
              </div>
            </li>
          </c:forEach>
        </ul>
      </div>
    </div>
  </div>

  <jsp:include page="sidebar.jsp"></jsp:include>

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
    $('#function_rate').raty();
  </script>
</body>
</html>
