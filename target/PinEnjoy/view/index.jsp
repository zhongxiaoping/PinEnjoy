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
    <link rel="stylesheet" href="static/css/flow.css"/>
    <script type="text/javascript" src="static/js/jquery-2.1.3.min.js"></script>
    <title>PinEnjoy</title>
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

    <button type="button" class="btn btn-default sidebar" data-toggle="modal" data-target="#_uploadImage">
        上传图片
    </button>

    <jsp:include page="uploadImage.jsp"/>

    <script type="text/javascript" src="static/js/jquery.imagesloaded.js"></script>
    <script type="text/javascript" src="static/js/jquery.wookmark.js"></script>
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

        function intoDetail(data) {
            location.href = "image/" + data + "/detail";
        }

        function onScroll() {
          var winHeight = window.innerHeight ? window.innerHeight : $window.height(),
              closeToBottom = ($window.scrollTop() + winHeight > $document.height() - 100);
          if(closeToBottom) {
            $.ajax({url:"index/asy", dataType:"json", success:function(data) {
              $.each(data, function(i, item) {
                $("#tiles").append(
                        "<li onclick='intoDetail(" + item.imageId +")'>" +
                        "<img src='" + item.imageLocation + "' width='200' height='200'>" +
                        "<div class='post-info'>" + "<div class='post-basic-info'>" +
                        "<h3><a href='#'>" + item.imageTitle + "</a></h3>" +
                        "<span><a href='#'><label></label>" + item.imageCatalogeName + "</a></span>" +
                        "<p>" + item.imageDescription + "</p>" + "</div>" +
                        "<div class='post-info-rate-share'>" + "<div id='function_rate'></div>" +
                        "<div class='download' style='float:right;padding-right:7px;padding-bottom:5px;'>" +
                        "<a href='image/" + item.imageId + "/download'><span></span></a>" +
                        "</div></div></div>");
                applyLayout();
              });
            }
            });
          }
        };
        applyLayout();
        $window.bind('scroll.wookmark', onScroll);
      });
    </script>

</body>
</html>
